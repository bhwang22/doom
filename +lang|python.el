;;; +lang|cc.el --- description -*- lexical-binding: t; -*-

(after! conda
  (setq conda-anaconda-home "~/.conda")
  (eval-after-load "jedi"
    '(setq jedi:server-command (list "~/.conda/envs/gnomon/bin/python" jedi:server-script))))

(provide '+lang|python)

;;; +lang|cc.el ends here
