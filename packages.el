;;; packages.el --- description -*- no-byte-compile: t; -*-

(package! bash-completion :recipe (:fetcher github :repo "szermatt/emacs-bash-completion" :files ("bash-completion.el")))
(package! exec-path-from-shell :disable t)
(package! flycheck-popup-tip :disable t)
(package! iedit)
(package! page-break-lines)
(package! resize-window)
(package! rtags :disable t)
(package! xterm-color)

(provide 'packages)

;;; packages.el ends here
