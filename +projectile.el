;;; +projectile.el --- description -*- lexical-binding: t; -*-

(setq counsel-projectile-switch-project-action #'counsel-projectile-switch-project-action)

(remove-hook 'projectile-after-switch-project-hook #'+workspaces|switch-to-project)

;;; +projectile.el ends here
