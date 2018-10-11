;;; +lang!cpp.el -*- lexical-binding: t; -*-

(set-pretty-symbols! `c++-mode
  ;; Functional
  :def "void "
  ;; Types
  :null "nullptr"
  :true "true" :false "false"
  :int "int" :float "float"
  :str "std::string" "QString"
  :bool "bool"
  ;; Flow
  :not "!"
  :and "&&" :or "||"
  :for "for"
  :return "return")

(provide '+lang!cpp)

;;; +lang!c.el ends here
