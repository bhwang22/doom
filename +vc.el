;;; +vc.el --- description -*- lexical-binding: t; -*-

(def-package! magit-gitflow
  :init (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :after magit)

(provide '+vc)

;;; +vc.el ends here
