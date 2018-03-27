;;;  -*- lexical-binding: t; -*-

(setq compilation-environment '("TERM=xterm-256color"))

(ansi-color-for-comint-mode-on)

(add-hook 'compilation-start-hook
  (lambda (proc)
    (when (eq (process-filter proc) 'compilation-filter)
      (set-process-filter
       proc
       (lambda (proc string)
         (funcall 'compilation-filter proc
                  (xterm-color-filter string)))))))

(provide '+compilation)

;;; +compilation.el ends here
