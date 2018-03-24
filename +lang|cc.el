;;; +lang|cc.el --- description -*- lexical-binding: t; -*-

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

(setq c-tab-always-indent t)

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

(provide '+lang|cc)

;;; +lang|cc.el ends here
