;;; +editor.el --- description -*- lexical-binding: t; -*-

(setq-default fill-column 70)

(setq-default whitespace-line-column 70)
(setq-default whitespace-style '(face indentation tabs tab-mark spaces space-mark newline newline-mark trailing lines-tail))

(def-package! anzu
  :config
  (setq anzu-cons-mode-line-p nil
        anzu-minimum-input-length 1
        anzu-search-threshold 250)
  (global-anzu-mode +1)

  (defun +doom-modeline*fix-anzu-count (positions here)
    (cl-loop for (start . end) in positions
             collect t into before
             when (and (>= here start) (<= here end))
             return (length before)
             finally return 0))
  (advice-add #'anzu--where-is-here :override #'+doom-modeline*fix-anzu-count)

  (mapc #'make-variable-buffer-local
        '(anzu--total-matched anzu--current-position anzu--state
          anzu--cached-count anzu--cached-positions anzu--last-command
          anzu--last-isearch-string anzu--overflow-p))

  (add-hook 'isearch-mode-end-hook #'anzu--reset-status t)
  (add-hook 'doom-escape-hook #'anzu--reset-status t)
  (add-hook 'iedit-mode-end-hook #'anzu--reset-status))

(defsubst +doom-modeline--private-anzu ()
  (when (and anzu--state (not iedit-mode))
    (propertize
     (let ((here anzu--current-position)
           (total anzu--total-matched))
       (cond ((eq anzu--state 'replace-query)
              (format " %d replace " total))
             ((eq anzu--state 'replace)
              (format " %d/%d " here total))
             (anzu--overflow-p
              (format " %s+ " total))
             (t
              (format " %s/%d " here total))))
     'face (if (active) 'doom-modeline-panel))))

(def-modeline-segment! private-anzu
  (let ((meta (concat (+doom-modeline--private-anzu))))
     (or (and (not (equal meta "")) meta)
         (if buffer-file-name " %I "))))

(def-package! iedit)

(add-hook   'find-file-hook #'whitespace-mode)
(add-hook 'before-save-hook #'whitespace-cleanup)

(provide '+editor)

;;; +editor.el ends here
