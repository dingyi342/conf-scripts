;; FILE: /home/syrinx/conf-scripts/emacs-dir/config-el/time.el
;; AUTHOR: Brandon Betances (Copyleft 2013)

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

;; COMMENT: custom time functions

;; COMMENT: time format
(defvar current-date-time-format "%d%m%y.%H%M" "Formate of date to insert with
`insert-current-date-time' function.")

;; COMMENT: insert datetime info
(defun insert-current-date-time ()
  "Insert the current datetime into the current buffer.
Uses `current-date-time-format' for the formatting of the datetime."
  (interactive)
  (insert (format-time-string current-date-time-format (current-time)))
)

(provide 'time)
