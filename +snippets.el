;;; +snippets.el --- description -*- lexical-binding: t; -*-

(after! yasnippet
  (setq yas-snippet-dirs '("~/.doom.d/+snippets"))
  (map!
    "<tab>" yas-maybe-expand))

(provide '+snippets)

;;; +snippets.el ends here
