;; FILE: emacs-dir/config-el/keybindings.el
;; AUTHOR: 2012 copyleft syrinx

;; COMMENT: global keybindings

;; COMMENT: function keys
;;(global-set-key (kbd "<f1>") ')
(global-set-key (kbd "<f2>") 'gnus) ;; start gnus
(global-set-key (kbd "<f3>") 'erc-start-or-switch) ;; NOTE: start or switch to erc
(global-set-key (kbd "<f4>") 'eval-buffer) ;; NOTE: evaluates the current buffer

(global-set-key (kbd "<f5>") 'magit-status)  ;; NOTE: calls magit status
;;(global-set-key (kbd "<f6>") 'function)  ;; does nothing
;;(global-set-key (kbd "<f7>") 'function)  ;; does nothing
;;(global-set-key (kbd "<f8>") 'function)  ;; does nothing

(global-set-key (kbd "<f9>") 'package-install) ;; NOTE: prompts to install a package
;;(global-set-key (kbd "<f10>") ') ;; does nothing
(global-set-key (kbd "<f11>") 'show-custom-comment-tag)  ;; does nothing
(global-set-key (kbd "<f12>") 'linum-mode) ;; NOTE: toggles line numbers

;; COMMENT: ibuffer mode
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; NOTE: opens ibuffer

;; COMMENT: ido mode
(global-set-key (kbd "C-c i") 'ido-mode) ;; NOTE: turn on ido mode

;; COMMENT: gist
(global-set-key (kbd "C-x g b") 'gist-buffer) ;; NOTE: send the buffer to gist
(global-set-key (kbd "C-x g r") 'gist-region) ;; NOTE: send the region to gist
;;(global-set-key (kbd "C-x C-g") '(lambda () (interactive) (gist-region-or-buffer))) 
;; ERROR: send region to gist (BROKEN)

(global-set-key (kbd "C-c c c") 'insert-custom-comment-tag) ;; NOTE: insert a custom comment tag
(global-set-key (kbd "C-c c s") 'show-custom-comment-tag) ;; NOTE: show custom comment tags
(global-set-key (kbd "C-c c h") 'insert-custom-header-text) ;; NOTE: insert custom header text for a source code dot file

(provide 'keybindings)
