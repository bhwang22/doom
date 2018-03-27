;;;  -*- lexical-binding: t; -*-

(after! twittering-mode
  (setq twittering-connection-type-order '(wget curl urllib-http native urllib-https))
  (setq twittering-initial-timeline-spec-string '("#DoomEmacs" ":home" ":mentions" ":direct_messages"))
  (setq twittering-icon-mode t)
  (setq twittering-use-icon-storage t)
  (setq twittering-icon-storage-file (concat doom-cache-dir "twittering-mode-icons.gz"))
  (setq twittering-convert-fix-size 12))

(provide '+twitter)

;;; +twitter.el ends here
