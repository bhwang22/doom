;;;  -*- lexical-binding: t; -*-

(after! url-http
  :config
  (setq url-gateway-method 'tls))

(def-package! org-caldav
  :config
  (setq plstore-cache-passphrase-for-symmetric-encryption t)
  (setq org-caldav-url "https://zimbra.inria.fr/dav")
  (setq org-caldav-calendar-id "julien.wintz@inria.fr/Calendar")
  (setq org-caldav-inbox (expand-file-name "~/Org/calendar.org"))
  (setq org-icalendar-timezone "Europe/Paris")
  (setq org-caldav-save-directory (expand-file-name doom-cache-dir))
  :commands org-caldav-sync)

(after! org
  (setq org-capture-templates
        '(("t" "Inbox" entry (file+headline "~/Org/inbox.org" "Inbox")
           "* TODO %?\n  %i\n  %a"))))

(after! org
  (doom-themes-set-faces 'doom-nord
    (org-property-value :foreground (doom-color 'teal))))

(provide '+org)

;;; +org.el ends here
