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
  :commands org-caldav-sync)

(provide '+org)

;;; +org.el ends here
