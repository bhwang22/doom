;;; +lang|python.el --- description -*- lexical-binding: t; -*-

;;; Requirements: $ conda install jedi sexpdata epc

(after! conda
  (setq conda-anaconda-home "~/.conda")
  (eval-after-load "jedi"
    '(setq jedi:server-command (list "~/.conda/envs/gnomon/bin/python" jedi:server-script))))

(provide '+lang|python)

;;; +lang|python.el ends here
