;;; autoload.el --- description -*- lexical-binding: t; -*-

;;;###autoload
(defun +private/duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;;;###autoload
(defun +private/clear-eshell ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

;;;###autoload
(defun +private/eshell-prompt ()
  (concat (propertize (buffer-name) 'face `(:foreground ,(doom-color'red)))
          " "
          (propertize (abbreviate-file-name (eshell/pwd)) 'face 'eshell-prompt)
          (propertize (+eshell--current-git-branch) 'face 'font-lock-function-name-face)
          (propertize " λ " 'face 'font-lock-constant-face)))

;;; autoload.el ends here
