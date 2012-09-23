;; FILE: /home/syrinx/conf-scripts/emacs-dir/config-el/irc.el
;; AUTHOR: syrinx (copyleft 2012)

(require 'erc-auth)

(defvar erc-insert-post-hook)

;; COMMENT: erc default settings
(erc-autojoin-mode t)
(erc-track-mode t)
(erc-match-mode t)
(erc-fill-mode 0)
(erc-fill-disable)
(erc-ring-mode t)
(erc-netsplit-mode t)
(erc-timestamp-mode t)
(erc-button-mode t)

;;(add-hook 'erc-after-connect '(lambda (SERVER NICK) (erc-message "PRIVMSG" "NickServ identify password")))

(setq erc-server "irc.freenode.net" ;; irc server to connect to
      erc-port 6667 ;; server port
      erc-timestamp-format "[%H:%M] " ;; timestamp format
      erc-fill-prefix "    " ;; dunno!
      erc-fill-column 90 ;; also dunno!
      erc-fill-mode 0 ;; dunno, as well
      erc-timestamp-right-column 61 ;; set timestamp to left?
      erc-track-showcount t ;; show erc activity on the modeline
      erc-timestamp-only-if-changed-flag nil ;; show timestamp for every line
      erc-insert-timestamp-function 'erc-insert-timestamp-left ;; move timestamp to left
      erc-kill-buffer-on-part t
      erc-kill-queries-on-quit t
      erc-kill-server-buffer-on-quit t
      erc-interpret-mirc-color t
      erc-mode-line-format "%t %a"
      erc-header-line-format nil
      header-line-format nil
      erc-max-buffer-size 20000
      erc-truncate-buffer-on-save t
      erc-input-line-position -1 ;; keep input line on bottom of frame NOTE: doesn't work?
      erc-prompt ;; COMMENT: makes input line echo #channel-name>
      (lambda () (if (and (boundp 'erc-default-recipients) (erc-default-target))
		(erc-propertize (concat (erc-default-target) ">") 'read-only t 'rear-nonsticky t 'front-nonsticky t)
	      (erc-propertize (concat "ERC>") 'read-only t 'rear-nonsticky t 'front-nonsticky t)))
      ;;erc-autojoin-channels-alist '((".*\\.freenode.net" "##club-ubuntu" "#beersnobs" "#archlinux-offtopic"))
      erc-join-buffer 'bury) ;; buries the server buffer

(defun erc-start-or-switch (&rest junk)
  "connect to erc, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667")
      (erc-track-switch-buffer 1)
    (erc :server erc-server :port erc-port :nick erc-nick :password erc-password)))

(provide 'irc)
