;; FILE: /home/syrinx/conf-scripts/emacs-dir/config-el/keybindings.el
;; AUTHOR: Brandon Betances (Copyleft 2012)

;; LICENSE:
;;  This program is free software; you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation; either version 2 of the License, or
;;  (at your option) any later version.

;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.

;;  You should have received a copy of the GNU General Public License
;;  along with this program; if not, write to the Free Software
;;  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


;; COMMENT: global keybindings

;; COMMENT: function keys
;;(global-set-key (kbd "<f1>") ')
(global-set-key (kbd "<f2>") 'gnus) ;; start gnus
(global-set-key (kbd "<f3>") 'erc-start-or-switch) ;; NOTE: start or switch to erc
(global-set-key (kbd "<f4>") 'eval-buffer) ;; NOTE: evaluates the current buffer

(global-set-key (kbd "<f5>") 'magit-status)  ;; NOTE: calls magit status
(global-set-key (kbd "<f6>") 'shell)  ;; NOTE: invokes a shell
(global-set-key (kbd "<f7>") 'connect-disconnect-slime)  ;; does nothing
(global-set-key (kbd "<f8>") 'flyspell-mode)  ;; NOTE: run ispell at point
(global-set-key (kbd "C-S-<f8>") 'ispell-word) ;; NOTE: enable flyspell for buffer
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word) ;; NOTE: check last word highlighted
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word) ;; NOTE: check next word highlighted

(global-set-key (kbd "<f9>") 'package-install) ;; NOTE: prompts to install a package
(global-set-key (kbd "<f10>") 'w3m) ;; NOTE: execute emacs-w3m
(global-set-key (kbd "<f11>") 'show-custom-comment-tag)  ;; does nothing
(global-set-key (kbd "<f12>") 'linum-mode) ;; NOTE: toggles line numbers

;;(global-set-key (kbd "M-<tab>") 'other-window) ;; NOTE: meh, this is useless

;; COMMENT: ibuffer mode
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; NOTE: opens ibuffer

;; COMMENT: ido mode
(global-set-key (kbd "C-c i") 'ido-mode) ;; NOTE: turn on ido mode

;; COMMENT: gist
;; NOTE: don't need the first two anymore
;; (global-set-key (kbd "C-x g b") 'gist-buffer) ;; NOTE: send the buffer to gist
;; (global-set-key (kbd "C-x g r") 'gist-region) ;; NOTE: send the region to gist
(global-set-key (kbd "C-x C-g") '(lambda () (interactive) (gist-region-or-buffer))) 

;; COMMENT: @matthew-ball custom comments keybindings
(global-set-key (kbd "C-c c c") 'insert-custom-comment-tag) ;; NOTE: insert a custom comment tag
(global-set-key (kbd "C-c c s") 'show-custom-comment-tag) ;; NOTE: show custom comment tags
(global-set-key (kbd "C-c c h") 'insert-custom-header-text) ;; NOTE: insert custom header text for a source code dot file
(global-set-key (kbd "C-c c l") 'insert-license) ;; NOTE: insert the GPL license from lisp-license.txt at point

;; COMMENT: w3m keybindings
(global-set-key (kbd "C-c C-q") 'w3m-delete-buffer) ;; ;; NOTE: close current w3m buffer

;; COMMENT: pacman-mode keybindings
(global-set-key (kbd "C-c C-p") 'pacman) ;; NOTE: run pacman frontend

;; COMMENT: this function sets C-c C-m to query someone.
;; FIX: this doesn't work, channel-members is probably part of some module.
;; (define-key erc-mode-map (kbd "C-c C-q")
;;   (lambda (nick)
;;     (interactive (list (completing-read "Nick: " channel-members)))
;;     (erc-cmd-QUERY nick)))

;; COMMENT: this function basically does the same thing as `flyspell-check-previous-highlighted-word', but forward instead of backwards.
(defun flyspell-check-next-highlighted-word ()
  "spell check the next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

;; COMMENT: this function is a toggle switch for a slime connection.
(defun connect-disconnect-slime (&rest junk)
  "toggle function for slime"
  (interactive)
  (if (get-buffer "*slime-repl sbcl*")
      (progn
	(slime-disconnect)
	(kill-buffer "*slime-repl sbcl*"))
    (slime-connect "127.0.0.1" "4005")))

(provide 'keybindings)
