;;; +ui.el --- description -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq doom-font (font-spec :family "Source Code Pro" :size 10))
(setq doom-variable-pitch-font (font-spec :family "Source Code Pro"))
(setq doom-unicode-font (font-spec :family "Source Code Pro"))
(setq doom-big-font (font-spec :family "Source Code Pro" :size 19))

(add-hook 'doom-init-theme-hook #'solaire-mode-swap-bg t)

(setq doom-theme 'doom-nord)

(def-package! resize-window
  :commands  (resize-window))

(provide '+ui)

;;; +ui.el ends here
