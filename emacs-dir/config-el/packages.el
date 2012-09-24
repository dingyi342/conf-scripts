;; FILE: /home/syrinx/conf-scripts/emacs-dir/config-el/packages.el
;; AUTHOR: syrinx (copyleft 2012)

;; IMPORTANT: for now, the following packages need to be installed manually to work properly.
;; IMPORTANT: i'll include links to make installing them easier (updated: Sun Sep 23 2012)

;; NOTE: package.el ;; SOURCE: https://github.com/technomancy/package.el
;; NOTE: emacs-w3m ;; SOURCE: http://emacs-w3m.namazu.org/emacs-w3m-1.4.4.tar.gz
;; NOTE: gh ;; SOURCE: https://github.com/sigma/gh.el
;; NOTE: pcache ;; SOURCE: https://github.com/sigma/pcache
;; NOTE: logito ;; SOURCE: https://github.com/sigma/logito
;; NOTE: gist.el ;; SOURCE: https://github.com/defunkt/gist.el

;; COMMENT: package management
(autoload 'package "package" "GNU Emacs lisp package management." t)

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

;; NOTE: good point, @chu, what IS the reason for this distinction?
;; FIX: store `core-packages' and `user-packages' in an external source:
;; - a variable in `init.el' (or `config.el') and `user.el', respectively.
(defvar core-packages nil "core packages to be installed through elpa.")
(defvar user-packages nil "user packages to be installed through elpa.")
(defvar list-packages nil "packages to be installed through elpa.")

;; FIX: this will be revisited, because clearly this way sucks. but whatever works,
;; for now.
(setq core-packages (list 'diminish 'color-theme 'ido-ubiquitous)) ;; NOTE: core stuff
(setq user-packages (list 'emms 'magit))

(setq list-packages (append core-packages user-packages)) ;; NOTE: adds `core-packages' and `user-packages' together

(defun emacs-custom-elpa-package-install (&rest junk)
  "install all required packages from elpa.

NOTE: this only needs to be called the first time emacs is run under this setup."
  (interactive)
  (dolist (package list-packages)
    (message "package %s" (symbol-name package))
    (unless (or (member package package-activated-list) (functionp package))
      (message "installing %s" (symbol-name package))
      (package-install package)
      (message "package %s installed" (symbol-name package)))))

(defun run-initial-setup (&rest junk)
  "update package archives and install custom packages.

NOTE: this only needs to be called the first time emacs is run under this setup."
  (unless package-archive-contents ;; NOTE: if the package-archive-contents are out of date
    (package-refresh-contents)) ;; NOTE: ... check to make sure package archives are updated
  (emacs-custom-elpa-package-install)) ;; NOTE: ... else install custom packages

(provide 'packages)
