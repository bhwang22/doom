;;; +ui.el --- description -*- lexical-binding: t; -*-

(if (eq system-type 'darwin)
    (progn
      (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
      (add-to-list 'default-frame-alist '(ns-appearance . dark))))

(add-to-list 'custom-theme-load-path (expand-file-name "+themes/" doom-private-dir))

(setq ns-use-proxy-icon nil)

(setq doom-font (font-spec :family "Source Code Variable" :size 10))
(setq doom-variable-pitch-font (font-spec :family "Source Code Variable"))
(setq doom-unicode-font (font-spec :family "Source Code Variable"))
(setq doom-big-font (font-spec :family "Source Code Variable" :size 19))

(setq doom-theme 'doom-opera)

(unless (display-graphic-p)
  (setq doom-theme nil))

(after! posframe
  (add-variable-watcher
   'posframe--frame
   (lambda (_sym frame op _where)
     (when (and (eq op 'set) frame)
       (with-selected-frame frame
         (setq-local whitespace-style nil))))))

(defun doom*fix-whitespace-mode-in-childframes (orig-fn &rest args)
    (with-selected-frame (apply orig-fn args)
      (setq-local whitespace-style nil)
      (selected-frame)))

(advice-add #'company-box--make-frame :around #'doom*fix-whitespace-mode-in-childframes)
(advice-add #'posframe--create-posframe :around #'doom*fix-whitespace-mode-in-childframes)

(after! neotree
  (setq doom-neotree-enable-variable-pitch nil)
  (setq neo-autorefresh t))

(def-package! resize-window
  :commands  (resize-window))

(def-package! page-break-lines
  :config (turn-on-page-break-lines-mode))

(provide '+ui)

;;; +ui.el ends here
