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

(def-package! org2jekyll
  :defer t
  :commands
  (org2jekyll-create-draft org2jekyll-publish org2jekyll-list-posts)
  :config
  (setq org2jekyll-blog-author "jwintz")
  (setq org2jekyll-source-directory (expand-file-name "~/Sites/jwintz.github.io/"))
  (setq org2jekyll-jekyll-directory (expand-file-name "~/Sites/jwintz.github.io/"))
  (setq org2jekyll-jekyll-drafts-dir "_drafts/")
  (setq org2jekyll-jekyll-posts-dir "_posts/")
  (setq org-publish-project-alist
    `(("default"
       :base-directory ,(org2jekyll-input-directory)
       :base-extension "org"
       :publishing-directory ,(org2jekyll-output-directory)
       :publishing-function org-html-publish-to-html
       :headline-levels 4
       :section-numbers nil
       :with-toc nil
       :html-preamble t
       :recursive t
       :make-index t
       :html-extension "html"
       :body-only t)
      ("post"
       :base-directory ,(org2jekyll-input-directory)
       :base-extension "org"
       :publishing-directory ,(org2jekyll-output-directory org2jekyll-jekyll-posts-dir)
       :publishing-function org-html-publish-to-html
       :headline-levels 4
       :section-numbers nil
       :with-toc nil
       :html-preamble t
       :recursive t
       :make-index t
       :html-extension "html"
       :body-only t)
      ("home"
       :base-directory ,(org2jekyll-input-directory)
       :base-extension "org"
       :publishing-directory ,(org2jekyll-output-directory)
       :publishing-function org-html-publish-to-html
       :headline-levels 4
       :section-numbers nil
       :with-toc nil
       :html-preamble t
       :recursive t
       :make-index t
       :html-extension "html"
       :body-only t)
      ("page"
       :base-directory ,(org2jekyll-input-directory)
       :base-extension "org"
       :publishing-directory ,(org2jekyll-output-directory)
       :publishing-function org-html-publish-to-html
       :headline-levels 4
       :section-numbers nil
       :with-toc nil
       :html-preamble t
       :recursive t
       :make-index t
       :html-extension "html"
       :body-only t)
      ("img"
       :base-directory ,(org2jekyll-input-directory "img")
       :base-extension "jpg\\|png"
       :publishing-directory ,(org2jekyll-output-directory "img")
       :publishing-function org-publish-attachment
       :recursive t)
      ("js"
       :base-directory ,(org2jekyll-input-directory "js")
       :base-extension "js"
       :publishing-directory ,(org2jekyll-output-directory "js")
       :publishing-function org-publish-attachment
       :recursive t)
      ("css"
       :base-directory ,(org2jekyll-input-directory "css")
       :base-extension "css\\|el"
       :publishing-directory ,(org2jekyll-output-directory "css")
       :publishing-function org-publish-attachment
       :recursive t)
      ("web" :components ("img" "js" "css")))))

(defun org-custom-link-img-follow (path)
  (org-open-file-with-emacs
   (format "/Users/jwintz/Sites/jwintz.github.io/img/%s" path)))

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"/img/%s\" alt=\"%s\"/>" path desc))))

(after! org
  (org-link-set-parameters "img" :follow 'org-custom-link-img-follow :export 'org-custom-link-img-export))

(after! org
  (setq org-capture-templates
        '(("t" "Inbox" entry (file+headline "~/Org/inbox.org" "Inbox")
           "* TODO %?\n  %i\n  %a"))))

(defun org-agenda-cts ()
  (and (eq major-mode 'org-agenda-mode)
       (let ((args (get-text-property
                    (min (1- (point-max)) (point))
                    'org-last-args)))
         (nth 2 args))))

(provide '+org)

;;; +org.el ends here
