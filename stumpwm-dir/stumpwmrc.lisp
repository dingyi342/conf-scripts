
;; FILE: ~/.stumpwmrc
;; AUTHOR: syrinx copyleft 2012


;; COMMENT: package scope
(in-package :stumpwm)

;; COMMENT: defaults
(setf *default-package* :stumpwm
      *mouse-focus-policy* :click)

;; COMMENT: keybindings
(set-prefix-key (kbd "C-w"))
(define-key *root-map* (kbd "C-c") "exec urxvt")
(define-key *root-map* (kbd "C-b") "exec chromium")
(define-key *root-map* (kbd "L") "exec slimlock")
(define-key *root-map* (kbd "E") "exec ekiga")
(define-key *root-map* (kbd "M-w") "exec conkeror")
;; COMMENT: appearance
(setf *window-border-style* :thin)
(setf *focus-color* "#222222")
(set-font "-*-dejavu sans mono-*-r-normal-*-10-*-*-*-*-*-iso8859-*")

;; (load "/usr/share/emacs/site-lisp/slime/swank-loader.lisp")
;; ;;(load "/home/syrinx_/quicklisp/dists/quicklisp/software/slime-20120208-cvs/swank-loader.lisp")

;; (require 'swank)
;; (swank:create-server)

;; (swank-loader:init)
;; (defvar *swank-p* nil)

;; (defcommand swank () ()
;;   "Starts a swank server on port 4005 and notifies the user."
;;   (setf *top-level-error-action* :break)
;;   (if *swank-p*
;;       (message "Swank server already running.")
;;     (progn
;;       (swank:create-server :port 4005
;;                            :style swank:*communication-style*
;;                            :dont-close t)
;;       (setf *swank-p* t)
;;       (message "Starting swank (port 4005)."))))
