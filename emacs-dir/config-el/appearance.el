;; FILE: /home/syrinx/conf-scripts/emacs-dir/config-el/appearance.el
;; AUTHOR: Brandon Betances (Copyleft 2016)

;; COMMENT: appearance settings
(require 'color-theme)
;; (require 'zenburn))
(require 'color-theme-tangotango)
(color-theme-tangotango)
;;(set-face-attribute 'default nil :font "terminus") ;; NOTE: change font size
(set-default-font "Terminus-12")
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;; NOTE: hide the menu bar
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; NOTE: hide the tool bar
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; NOTE: hide the scroll bar
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode -1)) ;; NOTE: turn off blinking cursor
(when (fboundp 'tooltip-mode) (tooltip-mode -1)) ;; NOTE: turn off tooltips
(when (fboundp 'fringe-mode) (set-fringe-mode '(1 . 0))) ;; NOTE: turn off the fringe

;; COMMENT: visual lines
;; (global-visual-line-mode t)

;; COMMENT: show matching parenthesis
(show-paren-mode t)
(setq show-paren-style 'parenthesis
      show-paren-delay 0.0)

;; COMMENT: mode line stuff
(setq line-number-mode 1 ;; NOTE: turn on line numbers in the mode line
      size-indication-mode t) ;; NOTE: show file size in mode line

;;(display-time-mode t) ;; NOTE: display time in the mode line
(display-battery-mode t) ;; NOTE: battery status in the mode line 

;; COMMENT: code folding
(autoload 'hs-minor-mode "hideshow" "fold code with emacs." t)
(setq hs-hide-comments nil) ;; NOTE: hide comments when you do `hs-hide-all'
(setq hs-isearch-open 't)

;; COMMENT: diminish mode
(require 'diminish) ;; NOTE: clean up the mode line

(eval-after-load "flyspell" '(diminish 'flyspell-mode ""))
(eval-after-load "simple" '(diminish 'visual-line-mode ""))
;;(eval-after-load "simple" '(diminish 'global-visual-line-mode ""))
(eval-after-load "abbrev" '(diminish 'abbrev-mode ""))

(provide 'appearance)
