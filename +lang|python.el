;;; +lang|python.el --- description -*- lexical-binding: t; -*-

(after! conda
  (setq conda-anaconda-home "~/.conda")
  (advice-remove 'anaconda-mode-bootstrap #'+python*anaconda-mode-bootstrap-in-remote-environments))

(provide '+lang|python)

;;; +lang|python.el ends here
