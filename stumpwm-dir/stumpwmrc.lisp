;; FILE: ~/.stumpwmrc
;; AUTHOR: syrinx copyleft 2012

(in-package :stumpwm)
;;(load "stumpwm/contrib/battery.lisp")
;;(load "stumpwm-cmus/src/stumpwm-cmus.lisp")

;; COMMENT: defaults
(setf *default-package* :stumpwm
      *startup-message* "welcome to stumpwm, go fuck yourself."
      *shell-program* "/bin/bash" ;; NOTE: set the default shell
      *mouse-focus-policy* :click)

;; COMMENT: useful functions
(defun concat (&rest strings)
  "concatenates strings, like the Unix command 'cat'."
  (apply 'concatenate 'string strings))

;; COMMENT: default applications

(defvar *terminal* "urxvt" "set the default terminal emulator.")
(defvar *editor* "emacsclient -c -n" "set the default editor.")
(defvar *system-monitor* "htop" "set the default system monitor.")
(defvar *audio-player* "cmus" "set the default audio player.")
(defvar *video-player* "vlc" "set the default video player.")
(setf *browser* "firefox-nightly") ;; NOTE: sets the default browser.

;; COMMENT: fonts, colors, and styling
(set-font "-*-dejavu sans mono-*-r-*-*-10-*-*-*-*-*-iso8859-1")
;; FIX: needs more research
(setf *window-border-style* :NONE ;; NOTE: sets the border style
      *normal-border-width* 0) ;; NOTE: sets the border width
(set-focus-color "black")
(set-unfocus-color "black")
(set-msg-border-width 0)
(set-frame-outline-width 0)

;; COMMENT: prefix key
(set-prefix-key (kbd "s-e")) ;; NOTE: sets the prefix key to Super+e

;; COMMENT: keybindings
(defmacro defkey-root (key cmd)
  `(define-key *root-map* (kbd, key), cmd))

(defmacro defkeys-root (&rest keys)
  (let ((ks (mapcar #'(lambda (k) (cons 'defkey-root k)) keys)))
    `(progn ,@ks)))

(defmacro defkey-top (key cmd)
  `(define-key *top-map* (kbd, key), cmd))

(defmacro defkeys-top (&rest keys)
  (let ((ks (mapcar #'(lambda (k) (cons 'defkey-top k)) keys)))
    `(progn ,@ks)))


(defkeys-root
  ("s-e" "run-editor") ;; NOTE: run-or-raise emacs
  ("s-r" "reinit") ;; NOTE: reload stumpwm and config
  ("s-t" "exec urxvt") ;; NOTE: run a terminal
  ("s-b" "run-browser") ;; NOTE: run-or-raise the browser
  ("s-a" "run-audio-player") ;; NOTE: run-or-raise the audio player ;; ERROR: runs, but does not raise.
  ("s-v" "run-video-player") ;; NOTE: run-or-raise the video player
  ("s-h" "run-system-monitor") ;; NOTE: run-or-raise the system monitor
  ("s-s" "swank") ;; NOTE: starts the swank server
  ("b" "battery") ;; NOTE: battery status
  ("M-i" "cmus-info") ;; COMMENT: cmus info
  ("M-p" "cmus-send play") ;; COMMENT: start cmus playback
  ("M-P" "cmus-send pause") ;; COMMENT: pause cmus playback
  ("M-s" "cmus-send stop") ;; COMMENT: stop cmus playback
  ("M-<" "cmus-send prev") ;; COMMENT: play previous song in cmus
  ("M->" "cmus-send next") ;; COMMENT: play next song in cmus
  ("M-f" "cmus-send shuffle") ;; COMMENT: toggle cmus shuffle
  ("M-r" "cmus-send repeat") ;; COMMENT: toggle cmus repeat
  ("M-c" "cmus-send clear")) ;; COMMENT: cmus clear playlist 

;; COMMENT: run application
(defun run-app (cmd prop &optional args)
  "run an instance of `cmd' with property `prop' (and any optional `args')"
  (if (null args)
      (run-or-raise cmd prop)
    (run-or-raise (concat cmd " " args) prop)))

(defun run-terminal-app (cmd ttl &optional args)
  "run an inistance of `cmd' with property `title' (and any optional `args') in `*terminal*' titled `ttl'."
  (if (null args)
      (run-app (concat *terminal* " -t \"" ttl "\" -e \"" cmd "\"") (list :title ttl))
    (run-app (concat *terminal* " -t \"" ttl "\" -e \"" cmd " " args "\"") (list :title ttl))))

;; COMMENT: battery status
(defcommand battery () () "battery status"
  (echo-string (current-screen) (run-shell-command "acpi" t)))
(defcommand run-editor () () "run an instance of `*editor*' with property `:instance'."
  (run-app *editor* (list :instance *editor*)))
(defcommand run-browser () () "run an instance of `*browser*' with property `:instance'."
  (run-app *browser* (list :instance *browser*)))

;; IMPORTANT: I commented this out because I don't want to run-or-raise terminals, I use multiple terminals at once quite often.
;; IMPORTANT: for now, "exec urxvt" will work just fine.
;; (defcommand run-terminal () () "run an instance of `*terminal*' with property `:instance'."
;;   (run-app *terminal* (list :instance *terminal*)))

(defcommand run-video-player () () "run an instance of `*video-player*' with the property `:instance'."
  (run-app *video-player* (list :instance *video-player*)))
(defcommand run-system-monitor () () "run an instance of `*system-monitor*' with property `:instance'."
  (run-terminal-app *system-monitor* *system-monitor*))
(defcommand run-audio-player () () "run an instance of `*audio-player*' with the property `:instance'."
  (run-terminal-app *audio-player* *audio-player*))

;; COMMENT: groups

(setf (group-name (first (screen-groups (current-screen)))) "emacs") ;; NOTE: rename default group to "emacs"

(run-commands "gnewbg browser" ;; NOTE: create browser group
	      "gnewbg terminals") ;; NOTE: create terminal group

;; COMMENT: window placement ;; FIX: doesn't work. look into chu's method.
;; (frame-preference-rule "emacs" 'i "emacs")
;; (frame-preference-rule "browser" 'i "browser")
;; (frame-preference-rule "terminals" 'i "terminal")
;; (frame-preference-rule "music" 'i "cmus")

;; COMMENT: user commands
(defcommand reinit () () "reload the stumpwm config." (run-commands "reload" "loadrc"))

;; COMMENT: swank server

;;(require 'swank)
;;(defcommand swank () ()
;; (setf stumpwm:*top-level-error-action* :break)
;; (swank:create-server :port 4005
;;		       :style swank:*communication-style*
;;		       :dont-close t)
;; (echo-string (current-screen)
;;	       "starting the swank server..."))

;; COMMENT: run emacs on startup ;; FIX: run emacs --daemon
;; (run-editor)
