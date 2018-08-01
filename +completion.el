;;; +completion.el --- description -*- lexical-binding: t; -*-

(after! company
  (setq company-idle-delay 0.2)
  (setq company-echo-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-flip-when-above t)
  (setq company-dabbrev-downcase nil))

(provide '+completion)

;;; +completion.el ends here
