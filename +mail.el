;;; +mail.el --- description -*- lexical-binding: t; -*-

(after! mu4e

  (setq mu4e-maildir (expand-file-name "~/Mail"))
  (setq mu4e-attachment-dir (expand-file-name "~/Mail/Attachements"))

  (require 'mu4e-contrib)

  (setq mu4e-html2text-command 'mu4e-shr2text)
  (setq mu4e-use-fancy-chars t)
  (setq shr-color-visible-luminance-min 80)

  (setq mu4e-bookmarks
        `(("maildir:/Inbox/" "Inbox" ?i)
          ("maildir:/Drafts/" "Drafts" ?d)
          ("flag:unread AND maildir:/Inbox/" "Unread messages" ?u)
          ("flag:flagged" "Starred messages" ?s)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)))

  (setq smtpmail-stream-type 'starttls)
  (setq smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
  (setq sendmail-program "msmtp")

  (setq send-mail-function 'smtpmail-send-it)

  (setq smtpmail-smtp-server "smtp.inria.fr")
  (setq smtpmail-smtp-service 587)

  (set! :email "Inria"
    '((mu4e-sent-folder       . "/Inria/Sent")
      (mu4e-drafts-folder     . "/Inria/Drafts")
      (mu4e-trash-folder      . "/Inria/Trash")
      (mu4e-refile-folder     . "/Inria/All Mail")
      (user-full-name         . "Julien Wintz")
      (user-mail-address      . "julien.wintz@inria.fr")
      (smtpmail-smtp-user     . "jwintz")) t)

  (set! :email "iCloud"
    '((mu4e-sent-folder       . "/iCloud/Sent")
      (mu4e-drafts-folder     . "/iCloud/Drafts")
      (mu4e-trash-folder      . "/iCloud/Trash")
      (mu4e-refile-folder     . "/iCloud/All Mail")
      (user-full-name         . "Julien Wintz")
      (user-mail-address      . "julien.wintz@me.com")
      (smtpmail-smtp-user     . "julien.wintz")))

    (set! :email "GMail"
      '((mu4e-sent-folder     . "/GMail/Sent")
        (mu4e-drafts-folder   . "/GMail/Drafts")
        (mu4e-trash-folder    . "/GMail/Trash")
        (mu4e-refile-folder   . "/GMail/All Mail")
        (user-full-name       . "Julien Wintz")
        (user-mail-address    . "jwintz@gmail.com")
        (smtpmail-smtp-user   . "jwintz@gmail.com"))))

(after! mu4e-maildirs-extension
  (setq mu4e-maildirs-extension-insert-before-str "Bookmarks")
  (setq mu4e-maildirs-extension-maildir-expanded-prefix "")
  (setq mu4e-maildirs-extension-maildir-default-prefix "")
  (mu4e-maildirs-extension))

(provide '+mail)

;;; +mail.el ends here
