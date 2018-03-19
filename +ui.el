;;; +ui.el --- description -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq doom-font (font-spec :family "Source Code Pro" :size 10))
(setq doom-variable-pitch-font (font-spec :family "Source Code Pro"))
(setq doom-unicode-font (font-spec :family "Source Code Pro"))
(setq doom-big-font (font-spec :family "Source Code Pro" :size 19))

(setq doom-theme 'doom-nord)

(after! doom-themes
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(after! solaire-mode
  (solaire-mode-swap-bg))

(after! neotree
  (setq neo-mode-line-type 'none)
  (setq neo-theme 'icons)
  (setq neo-window-width 35)
  (setq neo-autorefresh t)
  (setq neo-smart-open t)
  (setq neo-dont-be-alone t)
  (setq neo-force-change-root t))

(def-package! resize-window
  :commands  (resize-window))

(provide '+ui)

;;; +ui.el ends here
