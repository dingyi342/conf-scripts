;; FILE: ~/.conf-scripts/emacs-dir/config-el/mail.el
;; AUTHOR: 2012 copyleft syrinx

;; IMPORTANT: authentication info is stored in ~/.authinfo
;; NOTE: gnus will automatically make this file, so make it so
(autoload 'gnus "gnus" "Read mail and news with GNU Emacs." t)

(setq user-email-address "syrinx.optimised@gmail.com" ;; NOTE: set primary email address
      mail-aliases t ;; NOTE: enable mail aliases
      auth-source-save-behavior nil
      gnus-inhibit-startup-message t
      gnus-agent-expire-all t ;; NOTE: uncache unread articles
      gnus-agent-article-alist-save-format 2 ;; NOTE: compress cache
      mail-personal-alias-file "~/.mailrc" ;; NOTE: mail aliases
      message-from-style 'angles ;; NOTE: specifies how the "From" header appears
      read-mail-command 'gnus
      message-send-mail-function 'smtpmail-send-it ;; NOTE: for gnus
      send-mail-function 'smtpmail-send-it) ;; NOTE: NOT for gnus

(setq gnus-select-method '(nnml "")
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\(\\|$\\)\\|^[\"]\"[#'()]"
      gnus-invalid-group-regexp "[:`'\"]\\|^$"
      gnus-permanently-visible-groups "mail"
      gnus-thread-hide-subtree t
      gnus-fetch-old-headers t
      gnus-thread-ignore-subject t
      gnus-always-read-dribble-file t ;; NOTE: no dribble
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject ;; NOTE: threads
      gnus-posting-styles '((".*" (name "Brandon Betances"))
			    ("gmail" (address "syrinx.optimised@gmail.com"))))

;; COMMENT: folders ;; FIX: these should be variables
(setq custom-mail-dir (expand-file-name "~/Mail"))
(setq custom-news-dir (expand-file-name "~/News"))

(setq gnus-check-new-newsgroups nil ;; NOTE: don't check for new groups
      gnus-save-newsrc-file nil ;; NOTE: don't write `.newsrc' file
      gnus-read-newsrc-file nil ;; NOTE: don't read it, either
      gnus-interactive-exit nil
      gnus-save-killed-list nil) ;; NOTE: don't save a list of killed groups to startup file

(setq message-kill-buffer-on-exit t) ;; NOTE: kill the mail buffer after sending message

;; COMMENT: visible headers
(setq gnus-visible-headers
      (concat "^From:\\|^Subject:\\|^Newsgroups:"
	      "\\|^Organization:"
	      "\\|^To:\\|^Cc:\\|^Date:"))

(setq imap-ssl-program "openssl s_client -tls1 -connect %s:%p" ;; NOTE: set ssl
      imap-log t ;; NOTE: log the imap session
      imap-store-password t ;; NOTE: store session password
      gnus-secondary-select-methods
      '((nnimap "gmail" ;; NOTE: gmail login
		(nnimap-address "imap.gmail.com")
		(nnimap-server-port 993)
		(nnimap-authenticator login)
		(nnimap-expunge-on-close 'never)
		(nnimap-stream ssl))))

;; COMMENT: smtp setup
(require 'smtpmail)

(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "syrinx.optimised@gmail.com" nil)))

(setq mail-host-address "gnus-emacs") ;; NOTE: sets mail host, not that it matters
;; COMMENT: html display
(setq mm-text-html-renderer 'w3m)
(setq mm-inline-text-html-with-images t)
(setq mm-inline-text-html-with-w3m-keymap nil)

;; COMMENT: rss config
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode) ;; NOTE: topic mode - tree view is always active

(provide 'mail)
