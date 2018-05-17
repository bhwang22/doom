;;;  -*- lexical-binding: t; -*-

(after! flycheck
  (remove-hook 'flycheck-mode-hook #'+syntax-checker-popup-mode))

(provide '+checking)

;;; +checking.el ends here
