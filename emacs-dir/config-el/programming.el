;; ;;; COMMENT: common lisp programming
;; (setq inferior-lisp-program "/usr/bin/sbcl")

;; ;; (add-hook 'lisp-mode-hook '(lambda ()
;; ;; 			     ;; (slime-mode t)
;; ;; 			     (turn-on-general-programming-mode)))

;; (add-hook 'inferior-lisp-mode-hook '(lambda () ((inferior-slime-mode t))))

;; ;;; COMMENT: slime/swank
;; ;; IMPORTANT: requires `quicklisp' and (ql:quickload "quicklisp-slime-helper")
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/swank-loader.lisp") ;; TODO: this is not an ideal setup

;; (require 'slime-autoloads)

;; (slime-setup '(slime-fancy
;; 	       slime-tramp
;; 	       slime-banner
;; 	       slime-compiler-notes-tree
;; 	       slime-package-fu
;; 	       slime-indentation
;; 	       slime-repl
;; 	       slime-editing-commands
;; 	       slime-fancy-inspector
;; 	       slime-fontifying-fu
;; 	       slime-fuzzy
;; 	       slime-mdot-fu
;; 	       slime-scratch
;; 	       slime-xref-browser
;; 	       slime-asdf
;; 	       ;; slime-autodoc
;; 	       ;; slime-indentation-fu
;; 	       slime-references
;; 	       slime-sbcl-exts))

;; (setq slime-net-coding-system 'utf-8-unix
;;       slime-complete-symbol*-fancy t
;;       slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; (provide 'programming)
