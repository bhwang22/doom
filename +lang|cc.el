;;; +lang|cc.el --- description -*- lexical-binding: t; -*-

(after! cc-mode
  (setq-default c-basic-offset 4)
  (setq-default tab-width 4)
  (setq-default c-tab-always-indent t)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-always-indent t))

(setq cc-other-file-alist
      '(("\\.c\\'"   (".h"))
        ("\\.C\\'"   (".h" ".hpp" ".hxx"))
        ("\\.cc\\'"  (".h" ".hpp" ".hxx"))
        ("\\.cpp\\'" (".h" ".hpp" ".hxx"))
        ("\\.cxx\\'" (".h" ".hpp" ".hxx"))
        ("\\.tpp\\'" (".h" ".hpp" ".hxx"))
        ("\\.tcc\\'" (".h" ".hpp" ".hxx"))
        ("\\.h\\'"   (".tpp" ".cpp" ".cxx" ".tcc" ".cc" ".C" ".c" ".hxx" ".hpp"))
        ("\\.hpp\\'" (".tpp" ".cpp" ".cxx" ".tcc" ".cc" ".C" ".c" ".h"))
        ("\\.hxx\\'" (".tpp" ".cpp" ".cxx" ".tcc" ".cc" ".C" ".c" ".h"))))

(def-package! lsp-mode)

(def-package! lsp-ui
  :after lsp-mode
  :config
  (add-hook! 'lsp-mode-hook #'lsp-ui-mode))

(def-package! company-lsp
  :after lsp-mode
  :config
  (push 'company-lsp company-backends))

(def-package! cquery
  :after lsp-mode
  :config
  (require 'cquery)
  (setq cquery-executable "/usr/local/bin/cquery")
  (add-hook! cc-mode #'lsp-cquery-enable))

(provide '+lang|cc)

;;; +lang|cc.el ends here
