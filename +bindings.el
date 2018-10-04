;;; +bindings.el --- description -*- lexical-binding: t; -*-

(global-set-key (kbd "C-c o") nil)

(map!

 "C-+" 'text-scale-increase
 "C--" 'text-scale-decrease

 "M-v" 'scroll-down-command
 "C-v" 'scroll-up-command

 "C-c d d" '+doom-dashboard/open
 "C-c d f" 'recentf-open-files
 "C-c d l" 'global-command-log-mode

 "C-c d p o" '+popup/other
 "C-c d p t" '+popup/toggle
 "C-c d p c" '+popup/close
 "C-c d p C" '+popup/close-all
 "C-c d p r" '+popup/raise
 "C-c d p R" '+popup/restore

 "C-c e e" 'iedit-mode
 "C-c e s" 'ff-find-other-file
 "C-c e m" 'make-header
 "C-c e c" 'make-box-comment
 "C-c e d" 'make-divider
 "C-c e r" 'make-revision
 "C-c e g" 'update-file-header
 "C-c e l" '+private/duplicate-line

 "C-c l c" '+private/clear-eshell
 "C-c l l" '+eshell/open-popup
 "C-c l n" '+eshell/switch-to-next
 "C-c l o" '+eshell/open
 "C-c l p" '+eshell/switch-to-previous
 "C-c l s" '+eshell/switch-to
 "C-c l r" '+private/eshell-history
 "C-c l 2" '+eshell/split-below
 "C-c l 3" '+eshell/split-right

 "C-c p f" 'projectile-find-file
 "C-c p p" 'projectile-switch-project

 "C-c w c" '+workspace/new
 "C-c w n" '+workspace/load-new
 "C-c w d" '+workspace/display
 "C-c w D" '+workspace/delete
 "C-c w l" 'persp-load-state-from-file
 "C-c w L" '+workspace/load-session
 "C-c w n" 'persp-next
 "C-c w p" 'persp-prev
 "C-c w r" '+workspace/rename
 "C-c w s" 'persp-save-state-to-file
 "C-c w S" '+workspace/save-session
 "C-c w ." '+workspace/switch-to
 "C-c w k" '+workspace/kill-session

 "<f10>" 'neotree-dir
 "<f12>" 'toggle-frame-fullscreen

 (:prefix "C-c v" "m" 'magit-status))

(which-key-add-key-based-replacements "C-c e"   "editor")
(which-key-add-key-based-replacements "C-c d"   "doom")
(which-key-add-key-based-replacements "C-c d p" "doom popups")
(which-key-add-key-based-replacements "C-c l"   "eshell")
(which-key-add-key-based-replacements "C-c m"   "mail")
(which-key-add-key-based-replacements "C-c o"   "org")
(which-key-add-key-based-replacements "C-c o a" "org agenda")
(which-key-add-key-based-replacements "C-c o e" "org export")
(which-key-add-key-based-replacements "C-c p"   "projects")
(which-key-add-key-based-replacements "C-c t"   "twitter")
(which-key-add-key-based-replacements "C-c v"   "versioning")
(which-key-add-key-based-replacements "C-c w"   "workspace")
(which-key-add-key-based-replacements "C-c !"   "checking")

(provide '+bindings)

;;; +bindings.el ends here
