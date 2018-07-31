;;; +modeline.el --- description -*- lexical-binding: t; -*-

(require 'cl-lib)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Options
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcustom +private/modeline-mode-line-height
  +modeline-height
  :type 'integer
  :group 'mode-line)

(defcustom +private/modeline-slant-function '+private/modeline-slant
  :type 'function
  :group 'mode-line)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Core
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun +private/modeline-replace-element (plain wrapped &optional reverse)
  (when reverse
    (cl-rotatef plain wrapped))
  (let ((format (cl-subst wrapped plain
                          (default-value 'mode-line-format)
                          :test #'equal)))
    (if (eq format (default-value 'mode-line-format))
        (message "Cannot find %s and use %s in its place" plain wrapped)
      (setq-default mode-line-format format))))

(defun +private/modeline-tab (string &optional width direction)
  (+private/modeline-wrap string width direction 'tab))

(defun +private/modeline-ribbon (string &optional width direction face-active face-inactive)
  "Return STRING as a ribbon.

STRING is padded with at least one space on either side.  If
optional WIDTH is non-nil, then it has to be an integer and
specifies how much padding is added.

DIRECTION specifies the direction of the slant and defaults
to `up'.  The other valid value is `down'.

FACE-ACTIVE and FACE-INACTIVE specify the faces to be used when
the window is active respectively inactive.  If these faces are
not specified, then faces based on `default', `mode-line' and
`mode-line-active' are generated and used."
  (+private/modeline-wrap string width direction 'ribbon face-active face-inactive))

(defun +private/modeline-wrap (string &optional width direction type face-active face-inactive)
  (unless type
    (setq type 'tab))
  (unless direction
    (setq direction 'down))
  (let* ((base  (if (+private/modeline-window-active-p)
                    (or face-active 'mode-line)
                  (or face-inactive 'mode-line-inactive)))
         (outer (face-attribute base :background))
         (line  (face-attribute base :underline))
         (line  (if (eq line 'unspecified) outer line))
         (inner (if (eq type 'ribbon)
                    (face-attribute base :underline)
                  (face-attribute 'default :background)))
         (slant (if (eq direction 'down)
                    (list outer line inner)
                  (list inner line outer)))
         (face  (if (eq direction 'down)
                    (list :overline (and (eq type 'ribbon) line)
                          :underline line
                          :background inner)
                  (list :overline line
                        :underline (and (or (eq type 'ribbon)
                                            (not (window-at-side-p nil 'bottom)))
                                        line)
                        :background inner)))
         (pad   (max (- (or width 0) (length string)) 2)))
    (setq string
          (concat (make-string (ceiling pad 2) ?\s)
                  (substring string 0)
                  (make-string (floor pad 2) ?\s)))
    (add-face-text-property 0 (length string) face nil string)
    (list
     (propertize " " 'face face 'display
                 (apply +private/modeline-slant-function
                        (if (eq direction 'down) 'down 'up)
                        slant))
     string
     (propertize " " 'face face 'display
                 (apply +private/modeline-slant-function
                        (pcase (list type direction)
                          (`(tab    down) (cons 'up   slant))
                          (`(tab    up)   (cons 'down slant))
                          (`(ribbon down) (cons 'down (reverse slant)))
                          (`(ribbon up)   (cons 'up   (reverse slant)))))))))

(defvar +private/modeline--cache nil)

(defun +private/modeline-slant (direction c1 c2 c3 &optional height)
  (unless height
    (setq height +private/modeline-mode-line-height))
  (unless (cl-evenp height)
    (cl-incf height))
  (let ((key (list direction c1 c2 c3 height)))
    (or (cdr (assoc key +private/modeline--cache))
        (let* ((width (/ height 2))
               (image
                (create-image
                 (format "/* XPM */ static char * image[] = {
 \"%s %s 3 1\",\n \"0 c %s\",\n \"1 c %s\",\n \"2 c %s\",%s\n};"
                         width height c1 c2 c3
                         (cl-loop
                          for i from 1 to height concat
                          (format " \"%s\",\n"
                                  (let* ((x (/ i 2))
                                         (a (make-string x ?0))
                                         (b (make-string 1 ?1))
                                         (c (make-string
                                             (max 0 (- width x)) ?2)))
                                    (if (eq direction 'down)
                                        (concat a b c)
                                      (concat c b a))))))
                 'xpm t :ascent 'center)))
          (push (cons key image) +private/modeline--cache)
          image))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elements
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar +private/modeline-mode-line-buffer-identification
  '(:eval (+private/modeline-tab (format-mode-line (propertized-buffer-identification "%b"))
                     20 'down)))
(put '+private/modeline-mode-line-buffer-identification 'risky-local-variable t)
(make-variable-buffer-local '+private/modeline-mode-line-buffer-identification)

;;;###autoload
(defun +private/modeline-replace-mode-line-buffer-identification (&optional reverse)
  (interactive "P")
  (+private/modeline-replace-element '+modeline-buffer-id '+private/modeline-mode-line-buffer-identification reverse))

(defvar +private/modeline--default-mode-line-buffer-identification
  mode-line-buffer-identification)

(defvar +private/modeline-vc-mode
  ;;'(:eval (+private/modeline-ribbon (substring vc-mode 1) nil 'up))
  '(:eval (+private/modeline-tab (substring vc-mode 1) nil 'up)))
(put '+private/modeline-vc-mode 'risky-local-variable t)
(make-variable-buffer-local '+private/modeline-vc-mode)

;;;###autoload
(defun +private/modeline-replace-vc-mode (&optional reverse)
  (interactive "P")
  (+private/modeline-replace-element '+modeline-vc-mode '+private/modeline-vc-mode reverse))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Active window
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar +private/modeline--active-window (frame-selected-window))

(defun +private/modeline-window-active-p ()
  (eq (selected-window) +private/modeline--active-window))

(defun +private/modeline--set-active-window (&rest _)
  (let ((win (frame-selected-window)))
    (unless (minibuffer-window-active-p win)
      (setq +private/modeline--active-window win))))

(add-hook 'after-make-frame-functions       '+private/modeline--set-active-window)
(add-hook 'window-configuration-change-hook '+private/modeline--set-active-window)
(add-hook 'focus-in-hook                    '+private/modeline--set-active-window)
(advice-add 'select-window :after           '+private/modeline--set-active-window)
(advice-add 'select-frame :after            '+private/modeline--set-active-window)
(advice-add 'delete-frame :after            '+private/modeline--set-active-window)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kludges
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(advice-add 'resize-temp-buffer-window :before 'redisplay)

(declare-function color-srgb-to-xyz "color" (red green blue))
(declare-function color-rgb-to-hex "color" (red green blue &optional
                                                digits-per-component))

(defun +private/modeline-slant-apple-rgb (direction c1 c2 c3 &optional height)
  (require (quote color))
  (cl-flet ((cnv (color)
                 (pcase-let*
                     ((`(,r ,g ,b) (color-name-to-rgb color))
                      (`(,x ,y ,z) (color-srgb-to-xyz r g b))
                      (r (expt (+ (*  3.2404542 x)
                                  (* -1.5371385 y)
                                  (* -0.4985314 z))
                               (/ 1.8)))
                      (g (expt (+ (* -0.9692660 x)
                                  (*  1.8760108 y)
                                  (*  0.0415560 z))
                               (/ 1.8)))
                      (b (expt (+ (*  0.0556434 x)
                                  (* -0.2040259 y)
                                  (*  1.0572252 z))
                               (/ 1.8))))
                   (color-rgb-to-hex r g b))))
    (+private/modeline-slant direction (cnv c1) (cnv c2) (cnv c3) height)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! anzu
  (+private/modeline-replace-mode-line-buffer-identification))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide '+modeline)

;;; +modeline.el ends here
