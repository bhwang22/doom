;;; +completion.el --- description -*- lexical-binding: t; -*-

(after! company
  (setq company-idle-delay 0.2)
  (setq company-echo-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-flip-when-above t)
  (setq company-dabbrev-downcase nil)

  (eval-after-load 'company '(add-to-list 'company-backends 'company-elisp))
  (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
  (eval-after-load 'company '(add-to-list 'company-backends 'company-irony-c-headers))
  (eval-after-load 'company '(add-to-list 'company-backends 'company-cmake)))

;; (when (display-graphic-p)
;;   (def-package! company-box
;;     :hook (company-mode . company-box-mode)
;;     :init
;;     (setq company-box-icons-elisp
;;           (list
;;            (concat (all-the-icons-material "functions") " ")
;;            (concat (all-the-icons-material "check_circle") " ")
;;            (concat (all-the-icons-material "stars") " ")
;;            (concat (all-the-icons-material "format_paint") " ")))
;;     (setq company-box-icons-unknown (concat (all-the-icons-material "find_in_page") " "))
;;     (setq company-box-backends-colors nil)))

(after! irony
  (setq irony-cdb-search-directory-list (quote ("." "build" "build-conda"))))

;; (def-package! lsp-mode)

;; (def-package! lsp-ui
;;   :after lsp-mode
;;   :config
;;   (add-hook! 'lsp-mode-hook #'lsp-ui-mode))

;; (def-package! company-lsp
;;   :after lsp-mode
;;   :config
;;   (push 'company-lsp company-backends))

;; (def-package! cquery
;;   :hook (c-mode-common . +cc|init-cquery)
;;   :config
;;   (defun +cc|init-cquery ()
;;     (when (memq major-mode '(c-mode c++-mode))
;;       (lsp-cquery-enable)))
;;   (setq cquery-executable (executable-find "cquery")))

(provide '+completion)

;;; +completion.el ends here
