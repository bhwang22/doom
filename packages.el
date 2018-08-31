;;; packages.el --- description -*- no-byte-compile: t; -*-

(package! anzu)
(package! bash-completion :recipe (:fetcher github :repo "szermatt/emacs-bash-completion" :files ("bash-completion.el")))
(package! flycheck-popup-tip :disable t)
(package! flycheck-posframe :disable t)
(package! iedit)
(package! ivy-posframe :disable t)
(package! ivy-rtags :disable t)
(package! magit-gitflow)
(package! page-break-lines)
(package! resize-window)
(package! rtags :disable t)
(package! qml-mode)
(package! xterm-color)

(provide 'packages)

;;; packages.el ends here
