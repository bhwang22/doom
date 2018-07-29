;;; +hydras.el --- description -*- lexical-binding: t; -*-

(defhydra +private/hydra-help (:exit t)
  "
  Describe        ^^Keys                    ^^Search
 ╭───────────────────────────────────────────────────────────────╯
  _f_unction        _k_eybinding              _a_propros
  _p_ackage         _w_here-is                _d_oc strings
  _m_ode            _b_: show all bindings    _s_: info by symbol
  _v_ariable
  "
  ("b" describe-bindings nil)
  ("c" describe-key-briefly nil)
  ("k" describe-key nil)
  ("w" where-is nil)

  ("a" apropos-command nil)
  ("d" apropos-documentation nil)
  ("s" info-lookup-symbol nil)

  ("f" describe-function nil)
  ("p" describe-package nil)
  ("m" describe-mode nil)
  ("v" describe-variable nil)
  ("y" describe-syntax nil))

;;; +hydras.el ends here
