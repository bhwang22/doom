;;; +lang!cpp.el -*- lexical-binding: t; -*-

(plist-put +pretty-code-symbols   :list "()")
(plist-put +pretty-code-symbols :vector "()")
(plist-put +pretty-code-symbols    :map "<>")
(plist-put +pretty-code-symbols   :hash "{}")

(set-pretty-symbols! 'c++-mode
  ;;Types
  :null "nullptr"
;;:null "NULL"
  :true "true"
  :false "false"
  :int "int"
  :float "float"
  :str "QString"
  :bool "bool"
  :list "QList"
  :map  "QMap"
  :hash "QHash"
  :vector "QVector"
  ;; Flow
  :not "!"
  :and "&&"
  :or "||"
  :for "for"
  :for "foreach"
  :return "return"
  :merge t)

(provide '+lang!cpp)

;;; +lang!cpp.el ends here
