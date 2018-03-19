;;; +mail.el --- description -*- lexical-binding: t; -*-

(after! mu4e

  (setq mu4e-maildir (expand-file-name "~/Mail"))

  (setq mu4e-bookmarks
        `(("\\\\Inbox" "Inbox" ?i)
          ("\\\\Draft" "Drafts" ?d)
          ("flag:unread AND \\\\Inbox" "Unread messages" ?u)
          ("flag:flagged" "Starred messages" ?s)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)))

  (setq smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.inria.fr"
        smtpmail-smtp-server "smtp.inria.fr"
        smtpmail-smtp-service 587)

  (set! :email "GMail"
    '((mu4e-sent-folder       . "/GMail/Sent Mail")
      (mu4e-drafts-folder     . "/GMail/Drafts")
      (mu4e-trash-folder      . "/GMail/Trash")
      (mu4e-refile-folder     . "/GMail/All Mail")
      (smtpmail-smtp-user     . "jwintz")
      (user-mail-address      . "jwintz@gmail.com")
      (mu4e-compose-signature . "\n\n  - ju")))

  (set! :email "Inria"
    '((mu4e-sent-folder       . "/Inria/Sent Mail")
      (mu4e-drafts-folder     . "/Inria/Drafts")
      (mu4e-trash-folder      . "/Inria/Trash")
      (mu4e-refile-folder     . "/Inria/All Mail")
      (smtpmail-smtp-user     . "julien.wintz@inria.fr")
      (user-mail-address      . "julien.wintz@inria.fr")
      (mu4e-compose-signature . "\n\n  - ju")) t)

    (set! :email "iCloud"
    '((mu4e-sent-folder       . "/iCloud/Sent Mail")
      (mu4e-drafts-folder     . "/iCloud/Drafts")
      (mu4e-trash-folder      . "/iCloud/Trash")
      (mu4e-refile-folder     . "/iCloud/All Mail")
      (smtpmail-smtp-user     . "julien.wintz@me.com")
      (user-mail-address      . "julien.wintz@me.com")
      (mu4e-compose-signature . "\n\n  - ju")) t))

(provide '+mail)

;;; +mail.el ends here
