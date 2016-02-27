;; ~/.Emacs
;; AUTHOR: 2016 copyleft syrinx

(add-to-list 'load-path (concat (expand-file-name user-emacs-directory) "hacks")) ;; add "~/.emacs.d/" to user load path
(add-to-list 'load-path (concat (expand-file-name user-emacs-directory) "config-el")) ;; add "~/.emacs.d/config-el" to user load-path
(add-to-list 'load-path (concat (expand-file-name user-emacs-directory) "custom-modes"))
;;(add-to-list 'load-path (concat (expand-file-name user-emacs-directory) "apt-el")) ;; add "~/.emacs.d/apt-el" to user load-path

(let ((default-directory (concat (expand-file-name user-emacs-directory) "elpa/"))) (normal-top-level-add-subdirs-to-load-path))
(require 'appearance)
(require 'mail)
(require 'irc)
(require 'keybindings)
(require 'packages)
(require 'web)
(require 'time)
;;(require 'programming)
(require 'config)
;;(require 'proxy)
(require 'user-config)

;;; COMMENT: start emacs server
;; NOTE: don't need this anymore, using emacs --daemon now
;; (require 'server)
;; (when (and (functionp 'server-running-p) (not (server-running-p))) ;; don't start the server unless we know it isn't running
;;   ;; (server-mode t) ;; enter server mode
;;   (server-start))
