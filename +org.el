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

(def-package! org-super-agenda
  :commands (org-super-agenda-mode)
  :config
  (setq org-super-agenda-groups
        '((:name "Log\n"
                 :log t)
          (:name "Schedule\n"
                 :time-grid t)
          (:name "Today\n"
                 :scheduled today)
          (:name "Habits\n"
                 :habit t)
          (:name "Due today\n"
                 :deadline today)
          (:name "Overdue\n"
                 :deadline past)
          (:name "Due soon\n"
                 :deadline future)
          (:name "Waiting\n"
                 :todo "WAIT"
                 :order 98)
          (:name "Scheduled earlier\n"
                 :scheduled past))))

(provide '+org)

;;; +org.el ends here
