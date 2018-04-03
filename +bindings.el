;;; +bindings.el --- description -*- lexical-binding: t; -*-

(map!
 "C-+" 'text-scale-increase
 "C--" 'text-scale-decrease

 "A-C-a" 'sp-beginning-of-sexp
 "A-C-e" 'sp-end-of-sexp
 "A-C-f" 'sp-forward-sexp
 "A-C-b" 'sp-backward-sexp
 "A-C-d" 'sp-splice-sexp

 "C-c d d" '+doom-dashboard/open
 "C-c d f" 'recentf-open-files
 "C-c d n" 'neotree-toggle

 "C-c e s" 'ff-find-other-file
 "C-c e m" 'make-header
 "C-c e c" 'make-box-comment
 "C-c e d" 'make-divider
 "C-c e r" 'make-revision
 "C-c e g" 'update-file-header
 "C-c e l" '+private/duplicate-line

 "C-c l c" '+private/clear-eshell
 "C-c l l" '+eshell/open-popup
 "C-c l n" '+eshell/next
 "C-c l p" '+eshell/previous
 "C-c l s" '+eshell/switch

 "C-c o s" 'org-caldav-sync

 "C-c p p" 'projectile-switch-open-project

 "C-c t t" '=twitter

 "C-c w n" '+workspace/load-new
 "C-c w d" '+workspace/display
 "C-c w l" '+workspace/load
 "C-c w L" '+workspace/load-session
 "C-c w n" 'persp-next
 "C-c w p" 'persp-prev
 "C-c w s" '+workspace/save
 "C-c w S" '+workspace/save-session
 "C-c w ." '+workspace/switch-to
 "C-c w k" '+workspace/kill-session

 (:prefix "C-c v" "m" 'magit-status))

(which-key-add-key-based-replacements "C-c e" "editor")
(which-key-add-key-based-replacements "C-c d" "doom")
(which-key-add-key-based-replacements "C-c l" "eshell")
(which-key-add-key-based-replacements "C-c o" "org")
(which-key-add-key-based-replacements "C-c p" "projects")
(which-key-add-key-based-replacements "C-c t" "twitter")
(which-key-add-key-based-replacements "C-c v" "versionning")
(which-key-add-key-based-replacements "C-c w" "workspace")
(which-key-add-key-based-replacements "C-c !" "checking")

(provide '+bindings)

;;; +bindings.el ends here
