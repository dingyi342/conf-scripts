;; copyleft 2012 syrinx

;; COMMENT: package management
(autoload 'package "package" "GNU Emacs lisp package management." t)

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(provide 'packages)
