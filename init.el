;;; init.el --- description -*- lexical-binding: t; -*-

(doom! :feature
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       services          ; TODO managing external services & code builders
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       syntax-checker    ; tasing you for every semicolon you forget
       version-control   ; remember, remember that commit in November
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       company           ; the ultimate code completion backend
       ivy               ; a search engine for love and life

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-modeline     ; a snazzy Atom-inspired mode-line
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       evil-goggles      ; display visual hints when editing in evil
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       nav-flash         ; blink the current line after jumping
       posframe          ; use child frames where possible (Emacs 26+ only)
       window-select     ; visually switch windows

       :tools
       dired             ; making dired pretty [functional]
       electric-indent   ; smarter, keyword-based electric-indent
       eshell            ; a consistent, cross-platform shell (WIP)
       gist              ; interacting with github gists
       imenu             ; an imenu sidebar and searchable code index
       impatient-mode    ; show off code over HTTP
       make              ; run make tasks from Emacs
       magit             ;
       neotree           ; a project drawer, like NERDTree for vim
       pdf               ; pdf enhancements
       rgb               ; creating color strings
       rotate-text       ; cycle region at point between text candidates
       term              ; terminals in Emacs
       tmux              ; an API for interacting with tmux
       upload            ; map local to remote projects via ssh/ftp

       :lang
       assembly          ; assembly for fun or debugging
       cc                ; C/C++/Obj-C madness
       crystal           ; ruby at the speed of c
       clojure           ; java with a lisp
       csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       erlang            ; an elegant language for a more civilized age
       elixir            ; erlang done right
       elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ess               ; emacs speaks statistics
       go                ; the hipster dialect
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       julia             ; a better, faster MATLAB
       latex             ; writing papers in Emacs has never been so fun
       lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present         ; Emacs for presentations
        +publish)        ; Emacs+Org as a static site generator
       perl              ; write code no one else can comprehend
       python            ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       scala             ; java, but good
       sh                ; she sells (ba|z)sh shells on the C xor
       swift             ; who asked for emoji variables?
       typescript        ; javascript, but better
       web               ; the tubes

       :app
       email             ; emacs as an email client
       (write            ; emacs as a word processor (latex + org + markdown)
        +wordnut         ; wordnet (wn) search
        +langtool)       ; a proofreader (grammar/style check) for Emacs
       twitter

       :config
       (default +bindings +snippets))

(provide 'init)

;;; init.el ends here
