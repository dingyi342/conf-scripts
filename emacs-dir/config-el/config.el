;; FILE: /home/syrinx_/.conf-scripts/emacs-dir/config-el/config.el
;; AUTHOR: syrinx_ (copyleft 2012)

;; COMMENT: user variables
(defvar user-home-directory "~/" "directory for user's home files.")
(defvar user-documents-directory (concat user-home-directory "documents/") "directory for user's document folder.")
(defvar user-full-name "syrinx" "username")
(defvar user-primary-email-address "syrinx.optimised@gmail.com" "email address for the user")

(defun display-startup-echo-area-message (&rest junk)
  "clear the message buffer initially."
  (message ""))

;; COMMENT: default variables
(setq cursor-in-non-selected-windows nil ;; turns off the empty cursor in non-focused frames 
      inhibit-startup-message t ;; turn off startup message
      inhibit-startup-echo-area-message t ;; turn off startup echo area message
      initial-scratch-message "" ;; turns off the scratch message
      completion-ignore-case t ;; ignore case in auto-completing text
      read-file-name-completion-ignore-case t ;; ignore case in filenames
      auto-compression-mode 1 ;; automatically parse an archive
      message-log-max 1000 ;; maximum number of lines to keep in the message log buffer
      show-trailing-whitespaces 1 ;; show trailing whitespace
      scroll-margin 0 ;; use smooth scrolling
      scroll-conservatively 100000 ;; 
      scroll-up-agressively 0 ;;
      scroll-down-agressively 0 ;;
      scroll-preserve-screen-position t ;; preserve screen position with C-v/M-v
      auto-save-interval 100 ;; change auto-save interval to 1000 keystrokes
      sentence-end-double-space 'nil ;; sentences end with a single space
      echo-keystrokes 0.1 ;; see what you are typing
      suggest-key-bindings nil) ;; do not show respective key-bindings

;; COMMENT: default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox-nightly")

;; COMMENT: auto-mode list

;; COMMENT: common lisp
(add-to-list 'auto-mode-alist '("stumpwmrc" . common-lisp-mode))

;; COMMENT: javascript
(add-to-list 'auto-mode-alist '("conkerorrc" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

;; COMMENT: sh scripts
(add-to-list 'auto-mode-alist '("xinit" . shell-script-mode))
(add-to-list 'auto-mode-alist '("zshrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '("rtorrentrc" . shell-script-mode))

;; COMMENT: css
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

;; COMMENT: latex
(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))

;; COMMENT: ruby
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile" . ruby-mode))

;; COMMENT: clojure
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; COMMENT: org-mode
(add-to-list 'auto-mode-alist '("README.md$" . org-mode))
(add-to-list 'auto-mode-alist '("README$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; COMMENT: python
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; COMMENT: selection
(delete-selection-mode 1) ;; delete selected region

;; COMMENT: slime/swank
(load (expand-file-name "~/quicklisp/slime-helper.el")) ;; TODO: find a better way to do this
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(require 'slime-scheme)

;; COMMENT: ido mode
(require 'ido)
(require 'ido-ubiquitous)

(ido-mode 'both) ;; turn on interactive mode
(ido-ubiquitous-mode t)

(setq ido-everywhere t ;; NOTE: set ido mode everywhere
      ido-create-new-buffer 'always ;; NOTE: create new buffers if file doesn't exist
      ido-max-prospects 8 ;; NOTE: no huge mini buffer
      ido-show-dot-for-dired t
      confirm-nonexistent-file-or-buffer nil)
      

;; COMMENT: ispell mode
(require 'ispell)
(setq ispell-alternate-dictionary "english")

;; COMMENT: tetris
(setq tetris-score-file (concat user-home-directory "tetris-scores"))

;; COMMENT: ibuffer
(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      `(("default"
	 ("Programming" ;; programming related buffers
	  (or (mode . c-mode)
	      (mode . clojure-mode)
	      (mode . css-mode)
	      (mode . ruby-mode)
	      (mode . c++-mode)
	      (mode . haskell-mode)
	      (mode . inferior-haskell-mode)
	      (mode . python-mode)
	      (mode . inferior-python-mode)
	      (mode . lisp-mode)
	      (mode . common-lisp-mode)
	      (mode . emacs-lisp-mode)
	      (mode . inferior-lisp-mode)
	      (mode . js-mode)
	      (mode . slime-mode)
	      (mode . inferior-slime-mode)
	      (mode . scheme-mode)
	      (mode . inferior-scheme-mode)
	      (mode . maxima-mode)
	      (mode . inferior-maxima-mode)
	      (name . "^\\*slime-events\\*$")))
	 ("Configs" ;; config related buffers
	  (or (mode . shell-script-mode)
	      (mode . conf-mode)))
	 ("Organisation" ;; org-mode related buffers
	  (or (mode . org-mode)
	      (mode . org-agenda-mode)
	      (mode . calendar-mode)))
	 ("ERC" ;; erc related buffers
	  (mode . erc-mode))
	 ("Dired" ;; dired related buffers
	  (or (mode . dired-mode)
	      (name . "^\\*Dired log\\*$")))
	 ("Mail and News" ;; mail (and news) related buffers
	  (or (mode . gnus-group-mode)
	      (mode . gnus-topic-mode)
	      (mode . gnus-browse-mode)
	      (mode . gnus-summary-mode)
	      (mode . gnus-article-mode)))
	 ("Version Control" ;; version control related buffers
	  (or (mode . diff-mode)
	      (mode . magit-status-mode)
	      (mode . magit-key-mode)
	      (mode . magit-log-edit-mode)
	      (mode . vc-mode)
	      (mode . vc-dir-mode)
	      (mode . vc-log-entry-mode)
	      (name . "^\\*magit-process\\*$")
	      (name . "^\\*magit-log-edit\\*$")))
	 ("Web Browsers" ;; w3m related buffers
	  (or (mode . w3m-mode)))
	 ("Shell" ;; shell related buffers
	  (or (mode . eshell-mode)
	      (mode . shell-mode)
	      (mode . term-mode)
	      (mode . locate-mode)))
	 ("Emacs Lisp Package Archiver" ;; elpa related buffers
	  (or (mode . package-menu-mode)
	      (name . "^\\*Package Info\\*$")))
	 ("Miscellaneous" ;; miscellaneous special buffers
	  (or (mode . Info-mode)
	      (mode . apropos-mode)
	      (mode . Help-Mode)
	      (mode . help-mode)
	      (mode . Man-mode)
	      (mode . woman-mode)
	      (mode . occur-mode)
	      (mode . customize-mode)
	      (mode . Custom-mode)
	      (mode . completion-list-mode)
	      (name . "\\*scratch\\*$")
	      (name . "\\*Messages\\*$")
	      (name . "\\*Keys\\*$")
	      (name . "\\*Disabled Command\\*$")
	      (name . "\\*Org PDF LaTeX Output\\*$"))))))

(setq ibuffer-show-empty-filter-groups nil ;; do not display empty groups
      ibuffer-default-sorting-mode 'major-mode ;; sort buffers by major-mode
      ibuffer-expert t ;; don't ask for confirmation
      ibuffer-shrink-to-minimum-size t
      ibuffer-always-show-last-buffer nil
      ibuffer-sorting-mode 'recency
      ibuffer-use-header-line t)

(add-hook 'ibuffer-mode-hook (lambda ()
			       (ibuffer-auto-mode 1) ;; automatically update buffer list
			       (ibuffer-switch-format) ;; NOTE: minimal ibuffer
			       (ibuffer-switch-to-saved-filter-groups "default")))

;; COMMENT: auto-complete mode
(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories (concat (expand-file-name user-emacs-directory) "ac-dict"))
  (setq ac-comphist-file (concat (expand-file-name user-emacs-directory) "ac-comphist.dat"))
  (ac-config-default))

(setq ac-auto-start 4 ;; NOTE: start auto-complete after four characters
      ac-ignore-case t ;; NOTE: always ignore case
      ac-auto-show-menu t) ;; NOTE: show menu automatically

(set-face-background 'ac-candidate-face "#2e3434")
(set-face-attribute 'ac-candidate-face "#eeeeec")
(set-face-background 'ac-selection-face "#6ac214")

(ac-flyspell-workaround) ;; NOTE: self explanatory

;; COMMENT: @matthew-ball wrote a nice hack for global AC
;; TODO: make this conditional?
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
		       (if (not (minibufferp (current-buffer)))
			   (auto-complete-mode 1))))

;; COMMENT: this is actually pretty annoying, so I'm turning it off for now.
;; (real-global-auto-complete-mode nil)

;; COMMENT: mini-buffer stuff
(fset 'yes-or-no-p 'y-or-n-p) ;; NOTE: change all "yes/no" questions to "y/n"

;; COMMENT: backups
(setq-default delete-old-versions t) ;; NOTE: delete file backups silently

(provide 'config)
