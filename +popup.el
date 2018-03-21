;;; +popup.el --- description -*- lexical-binding: t; -*-

(setq which-key-popup-type 'custom
      which-key-custom-popup-max-dimensions-function (lambda (_) (which-key--side-window-max-dimensions))
      which-key-custom-hide-popup-function #'which-key--hide-buffer-side-window
      which-key-custom-show-popup-function
      (lambda (act-popup-dim)
        (cl-letf (((symbol-function 'display-buffer-in-side-window)
                   (lambda (buffer alist)
                     (push '(vslot . -9999) alist)
                     (+popup-display-buffer buffer alist))))
          (which-key--show-buffer-side-window act-popup-dim))))

(provide '+popup)

;;; +popup.el ends here
