;; FILE: ~/.conf-scripts/emacs-dir/config-el/mail.el
;; AUTHOR: 2012 copyleft syrinx

(setq gnus-select-method '(nnml ""))
(setq gnus-select-method '(nnimap "gmail" ;; COMMENT: imap settings
				  (nnimap-address "imap.gmail.com") ;; COMMENT: imap address
				  (nnimap-server-port 993) ;; COMMENT: imap port
				  (nnimap-stream ssl))) ;; COMMENT: enable ssl (required)

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "syrinx.optimised@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "localhost")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(provide 'mail)
