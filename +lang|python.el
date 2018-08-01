;;; +lang|python.el --- description -*- lexical-binding: t; -*-

(after! conda
  (setq conda-anaconda-home "~/.conda"))

(def-package! company-jedi
  :config
  (set-company-backend! 'python-mode 'company-jedi))

(provide '+lang|python)

;;; +lang|python.el ends here
