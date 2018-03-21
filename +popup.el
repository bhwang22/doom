;;; +popup.el --- description -*- lexical-binding: t; -*-

(set! :popup "^ \\*which-key" '((size . +popup-shrink-to-fit) (vslot . 9999)))

(advice-add #'display-buffer-in-side-window :override #'+popup-display-buffer)

(provide '+popup)

;;; +popup.el ends here
