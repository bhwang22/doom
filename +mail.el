;;; +mail.el --- description -*- lexical-binding: t; -*-

(after! mu4e

  (setq user-mail-address "julien.wintz@inria.fr")
  (setq user-full-name "Julien Wintz")

  (setq mu4e-maildir (expand-file-name "~/Mail"))
  (setq mu4e-view-show-addresses t)
  (setq mu4e-compose-dont-reply-to-self t)
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-view-show-images t)
  (setq mu4e-index-cleanup nil)
  (setq mu4e-update-interval 30)
  (setq mu4e-headers-visible-lines 16)
  (setq mu4e-hide-index-messages nil)
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-drafts-folder "/Mu/Drafts")
  (setq mu4e-sent-folder "/Mu/Sent")
  (setq mu4e-trash-folder "/Mu/Trash")
  (setq mu4e-attachment-dir "~/Downloads")
  (setq mu4e-headers-auto-update t)
  (setq mu4e-maildir-shortcuts
        '(("/Inria/Inbox" .  ?i)
          ("/Gmail/Inbox" .  ?g)
          ("/iCloud/Inbox" . ?c)))

  (setq mu4e-use-fancy-chars t)

  (setq mu4e-headers-has-child-prefix '("+" . ""))
  (setq mu4e-headers-empty-parent-prefix '("-" . ""))
  (setq mu4e-headers-first-child-prefix '("-" . ""))
  (setq mu4e-headers-duplicate-prefix '("-" . ""))
  (setq mu4e-headers-default-prefix '("-" . ""))

  (setq mu4e-headers-draft-mark '("-" . ""))
  (setq mu4e-headers-flagged-mark '("-" . ""))
  (setq mu4e-headers-new-mark '("-" . ""))
  (setq mu4e-headers-passed-mark '("-" . ""))
  (setq mu4e-headers-replied-mark '("-" . ""))
  (setq mu4e-headers-seen-mark '("-" . ""))
  (setq mu4e-headers-trashed-mark '("-" . ""))
  (setq mu4e-headers-attach-mark '("-" . ""))
  (setq mu4e-headers-encrypted-mark '("-" . ""))
  (setq mu4e-headers-signed-mark '("-" . ""))
  (setq mu4e-headers-unread-mark '("-" . ""))


  (setq smtpmail-stream-type 'starttls)

  (setq sendmail-program "msmtp")

  (setq message-kill-buffer-on-exit t)
  (setq message-send-mail-function 'message-send-mail-with-sendmail)
  (setq message-sendmail-extra-arguments '("--read-envelope-from"))
  (setq message-sendmail-f-is-evil 't))

(after! mu4e-maildirs-extension
    :ensure t
    :config
    (setq mu4e-maildirs-extension-title nil)
    (setq mu4e-maildirs-extension-use-bookmarks t)
    (setq mu4e-maildirs-extension-ignored-regex "^*~*")
    (setq mu4e-maildirs-extension-buffer-name "*Mail*")
    (setq mu4e-maildirs-extension-insert-before-str "\n\t[c] Compose a message")
    (setq mu4e-maildirs-extension-action-text "\t[g] Update mail and index\n")
    (setq mu4e-maildirs-extension-maildir-expanded-prefix "")
    (setq mu4e-maildirs-extension-maildir-default-prefix "")
    (mu4e-maildirs-extension))

(provide '+mail)

;;; +mail.el ends here
