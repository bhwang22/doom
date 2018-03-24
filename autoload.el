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

;;; autoload.el ends here
