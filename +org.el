;;;  -*- lexical-binding: t; -*-

(def-package! org-caldav
  :config
  (setq plstore-cache-passphrase-for-symmetric-encryption t)
  (setq org-caldav-url "https://zimbra.inria.fr/dav")
  (setq org-caldav-calendar-id "julien.wintz@inria.fr/Calendar")
  (setq org-caldav-inbox (expand-file-name "~/Org/calendar.org"))
  (setq org-caldav-files org-agenda-files)
  (setq org-icalendar-timezone "Europe/Paris"))

(provide '+org)

;;; +org.el ends here
