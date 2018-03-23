;;; +editor.el --- description -*- lexical-binding: t; -*-

(setq-default whitespace-style '(face indentation tabs tab-mark spaces space-mark newline newline-mark trailing lines-tail))
(setq whitespace-line-column 80)
(add-hook   'find-file-hook #'whitespace-mode)
(add-hook 'before-save-hook #'whitespace-cleanup)

(provide '+editor)

;;; +editor.el ends here
