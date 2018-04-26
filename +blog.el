;;; +blog.el -*- lexical-binding: t; -*-

(def-package! org2jekyll
  :config
  (setq org2jekyll-blog-author "jwintz")
  (setq org2jekyll-source-directory (expand-file-name "~/Sites/jwintz.github.io/_org"))
  (setq org2jekyll-jekyll-directory (expand-file-name "~/Sites/jwintz.github.io/_site"))
  (setq org2jekyll-jekyll-drafts-dir "_drafts")
  (setq org2jekyll-jekyll-posts-dir "_posts")
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

(provide '+blog)

;;; +blog.el ends here
