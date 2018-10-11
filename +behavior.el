;;; +behavior.el --- description -*- lexical-binding: t; -*-

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

(map! :map (minibuffer-local-map
            minibuffer-local-ns-map
            minibuffer-local-completion-map
            minibuffer-local-must-match-map
            minibuffer-local-isearch-map
            read-expression-map)
      [escape] nil)

(add-to-list 'auto-mode-alist '("/[Mm]akefile\\'" . makefile-mode))

;;; +behavior.el ends here
