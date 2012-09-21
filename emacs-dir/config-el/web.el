;; FILE: /home/syrinx/conf-scripts/emacs-dir/config-el/w3m.el
;; AUTHOR: syrinx (copyleft 2012)

(require 'w3m-load)
(require 'w3m-search)
;;(require 'mime-w3m)

;; COMMENT: w3m settings
(setq w3m-home-page "https://duckduckgo.com" ;; COMMENT: sets homepage for w3m
      w3m-key-binding 'info) ;; COMMENT: use info style keybindings

;; COMMENT: w3m-search settings
;; (add-to-list 'w3m-search-engine-alist
;; 	     '("emacs-wiki" "http://www.emacswiki.org/cgi-bin/wiki.pl?search=%s"))

(provide 'web)
