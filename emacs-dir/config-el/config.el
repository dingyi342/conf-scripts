;; FILE: /home/syrinx_/.conf-scripts/emacs-dir/config-el/config.el
;; AUTHOR: syrinx_ (copyleft 2012)

;; COMMENT: user variables
(defvar user-home-directory "~/" "directory for user's home files.")
(defvar user-documents-directory (concat user-home-directory "documents/") "directory for user's document folder.")
(defvar user-full-name "syrinx" "username")
(defvar user-email-address "syrinx.optimised@gmail.com" "email address for the user")

(defun display-startup-echo-area-message (&rest junk)
  "clear the message buffer initially."
  (message ""))

;; COMMENT: default variables
(setq inhibit-startup-message t ;; turn off startup message
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
      browse-url-generic-program "chromium")

;; COMMENT: auto-mode list
(add-to-list 'auto-mode-alist '("stumpwmrc" . common-lisp-mode))
(add-to-list 'auto-mode-alist '("conkerorrc" . javascript-mode))
(add-to-list 'auto-mode-alist '("xinit" . shell-script-mode))
(add-to-list 'auto-mode-alist '("zshrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '("rtorrentrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '("README$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; COMMENT: selection
(delete-selection-mode 1) ;; delete selected region

;; COMMENT: slime/swank
;; (load (expand-file-name "~/quicklisp/slime-helper.el")) ;; TODO: find a better way to do this
(setq inferior-lisp-program "sbcl")

;; COMMENT: ido mode
(require 'ido)
;;(require 'ido-ubiquitous)

(ido-mode 'both) ;; turn on interactive mode

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

(provide 'config)
