;; FILE: /home/syrinx_/.conf-scripts/emacs-dir/config-el/appearance.el
;; AUTHOR:  syrinx_ (copyleft 2012)

;; COMMENT: appearance settings
(when (eq window-system 'x)
  (require 'color-theme)
  ;; (require 'zenburn))
  (require 'color-theme-tangotango)
  (color-theme-tangotango)
  (set-face-attribute 'default nil :height 80)) ;; NOTE change font size

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;; NOTE: hide the menu bar
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; NOTE: hide the tool bar
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; NOTE: hide the scroll bar
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode -1)) ;; NOTE: turn off blinking cursor
(when (fboundp 'tooltip-mode) (tooltip-mode -1)) ;; NOTE: turn off tooltips
(when (fboundp 'fringe-mode) (set-fringe-mode '(1 . 0))) ;; NOTE: turn off the fringe

;; COMMENT: visual lines
(global-visual-line-mode t)

;; COMMENT: show matching parenthesis
(show-paren-mode t)
(setq show-paren-style 'parenthesis
      show-paren-delay 0.0)

;; COMMENT: mode line stuff
(setq line-number-mode 1 ;; NOTE: turn on line numbers in the mode line
      size-indication-mode t) ;; NOTE: show file size in mode line

(display-time-mode t) ;; NOTE: display time in the mode line
(display-battery-mode t) ;; NOTE: battery status in the mode line 

(provide 'appearance)
