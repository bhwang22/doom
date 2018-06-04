;;; +behavior.el --- description -*- lexical-binding: t; -*-

(setq mac-option-modifier 'meta)

(map! :map (minibuffer-local-map
            minibuffer-local-ns-map
            minibuffer-local-completion-map
            minibuffer-local-must-match-map
            minibuffer-local-isearch-map
            read-expression-map)
      [escape] nil)

(add-to-list 'auto-mode-alist '("/[Mm]akefile\\'" . makefile-mode))

(def-package! command-log-mode
  :commands
  (clm/global-command-log-mode
   clm/open-command-log-buffer))

;;; +behavior.el ends here
