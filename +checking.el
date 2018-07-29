;;;  -*- lexical-binding: t; -*-

(after! flycheck

  ;; (when (fboundp 'fringe-mode)
  ;;   (setq flycheck-indication-mode 'right-fringe))

  ;; (when (fboundp 'define-fringe-bitmap)
  ;;   (define-fringe-bitmap '+checking|flycheck-fringe-indicator
  ;;     (vector #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b01110
  ;;             #b11111
  ;;             #b11111
  ;;             #b11111
  ;;             #b01110
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000
  ;;             #b00000)))

  (flycheck-define-error-level 'error
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap '+checking|flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-error)

  (flycheck-define-error-level 'warning
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap '+checking|flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-warning)

  (flycheck-define-error-level 'info
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap '+checking|lycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-info)

  (custom-set-faces
   '(flycheck-error   ((t (:foreground "#C16069" :underline nil))))
   '(flycheck-info    ((t (:foreground "#A2BF8A" :underline nil))))
   '(flycheck-warning ((t (:foreground "#ECCC87" :underline nil)))))

  ;; (add-hook     'c-mode-hook (lambda () (set-fringe-mode (set (make-local-variable 'fringe-mode) '(2 . 8)))))
  ;; (add-hook   'c++-mode-hook (lambda () (set-fringe-mode (set (make-local-variable 'fringe-mode) '(2 . 8)))))
  ;; (add-hook 'elisp-mode-hook (lambda () (set-fringe-mode (set (make-local-variable 'fringe-mode) '(2 . 8)))))

  (remove-hook 'flycheck-mode-hook #'+syntax-checker-popup-mode))

(provide '+checking)

;;; +checking.el ends here
