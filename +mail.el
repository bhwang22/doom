;;; +mail.el --- description -*- lexical-binding: t; -*-

(defun +private/m4ue-reduce-header ()
  (interactive)
  (progn
    (goto-char (point-min))
    (kill-line)
    (kill-line)))

(def-modeline! mu4e
  (bar matches " %b " selection-info)
  ())

(add-hook! mu4e-main-mode
  (setq header-line-format (or (doom-modeline 'mu4e) mode-line-format)
        mode-line-format nil))

(add-hook! mu4e-headers-mode
  (setq header-line-format (or (doom-modeline 'mu4e) mode-line-format)
        mode-line-format nil))

(after! mu4e

  (setq mail-user-agent 'mu4e-user-agent)

  (setq mu4e-maildir (expand-file-name "~/Mail"))
  (setq mu4e-attachment-dir (expand-file-name "~/Mail/Attachements"))
  (setq mu4e-get-mail-command "mbsync --all --new --renew --delete --flags --pull --push --expunge --verbose")
  (setq mu4e-hide-index-messages nil)

  (setq message-kill-buffer-on-exit t)
  (setq message-send-mail-function 'message-send-mail-with-sendmail)

  (require 'mu4e-contrib)

  (setq mu4e-html2text-command 'mu4e-shr2text)
  (setq mu4e-use-fancy-chars t)

  (setq shr-color-visible-luminance-min 80)

  (setq smtpmail-stream-type 'starttls)
  (setq smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
  (setq smtpmail-smtp-server "smtp.inria.fr")
  (setq smtpmail-smtp-service 587)

  (setq sendmail-program "msmtp")

  (setq send-mail-function 'smtpmail-send-it)

  (set-email-account! "Inria"
    '((mu4e-sent-folder       . "/Inria/Sent")
      (mu4e-drafts-folder     . "/Inria/Drafts")
      (mu4e-trash-folder      . "/Inria/Trash")
      (user-full-name         . "Julien Wintz")
      (user-mail-address      . "julien.wintz@inria.fr")
      (smtpmail-smtp-user     . "jwintz")) t)

  (set-email-account! :email "iCloud"
    '((mu4e-sent-folder       . "/iCloud/Sent Messages")
      (mu4e-drafts-folder     . "/iCloud/Drafts")
      (mu4e-trash-folder      . "/iCloud/Trash")
      (user-full-name         . "Julien Wintz")
      (user-mail-address      . "julien.wintz@me.com")
      (smtpmail-smtp-user     . "julien.wintz")))

  (set-email-account! :email "Gmail"
    '((mu4e-sent-folder       . "/Gmail/Sent")
      (mu4e-drafts-folder     . "/Gmail/Drafts")
      (mu4e-trash-folder      . "/Gmail/Trash")
      (user-full-name         . "Julien Wintz")
      (user-mail-address      . "jwintz@gmail.com")
      (smtpmail-smtp-user     . "jwintz@gmail.com")))

  (add-hook 'mu4e-main-mode-hook '+private/m4ue-reduce-header)
  (add-hook 'mu4e-index-updated-hook '+private/force-mail-index)
  (add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime))

(def-package! mu4e-maildirs-extension
  :after mu4e
  :config
  (mu4e-maildirs-extension)
  (setq mu4e-maildirs-extension-action-text "\n    * [g] Update mail and database\n")
  (setq mu4e-maildirs-extension-maildir-expanded-prefix "")
  (setq mu4e-maildirs-extension-maildir-default-prefix "")
  (setq mu4e-maildirs-extension-title "  Inboxes"))

(provide '+mail)

;;; +mail.el ends here
