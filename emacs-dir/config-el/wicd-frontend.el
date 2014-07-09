;; ;; FILE: /home/syrinx_/.conf-scripts/emacs-dir/config-el/wicd-frontend.el
;; ;; AUTHOR: syrinx_ (copyleft 2012)

;; NOTE: put on hold for a while, wicd sucks.

;; (eval-when-compile (require 'cl))
;; (defconst wicd-frontend-version "0.1" "Version of the `wicd-frontend' install.")
;; (defconst wicd-frontend-mode-name "The `wicd-frontend' mode name.")
;; (defconst wicd-frontend-buffer-name (concat "*" wicd-frontend-mode-name "*" "The `wicd-frontend' buffer name.")
;; (defvar wicd-frontend-mode-hook nil "Run hook when entering `wicd-frontend' mode")

;; (defun wicd-frontend (&rest ignore) "Switch to `wicd-frontend' buffer and start mode."
;;   (interactive)
;;   (save-excursion (switch-to-buffer wicd-frontend-buffer-name)
;; 		  (when (not (eq major-mode 'wicd-frontend-mode))
;; 		  (wicd-frontend-mode))))

;; (defun wicd-frontend-mode (&rest ignore) "Major mode for interfacing with `wicd'."
;;   (kill-all-local-variables)
;;   (setq truncate-lines t)
;;   (wicd-frontend-buffer-setup)
;;   (use-local-map wicd-frontend-mode-map)
;;   (toggle-read-only))

;; (defun wicd-frontend-buffer-setup (&rest ignore) 

;; )

;; (provide 'wicd-frontend)
