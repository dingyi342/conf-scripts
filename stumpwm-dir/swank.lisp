;; FILE: /home/syrinx/conf-scripts/stumpwm-dir/swank.lisp
;; AUTHOR: Brandon Betances (Copyleft 2016)
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


;; Load swank
(in-package :stumpwm)

;; Load swank
(ql:quickload :swank)

(let ((server-running nil)
      (first-time t))
  (defcommand swank () ()
    "Toggle the swank server on/off."
    (if server-running
	(progn
	  (swank:stop-server 4005)
	  (echo-string
	   (current-screen)
	   "stopping swank.")
	  (setf server-running nil))
	(progn
	  (swank:create-server :port 4005
			       :style swank:*communication-style*
			       :dont-close t)
	  (if first-time
	      (echo-string
	       (current-screen)
	       "Re-starting swank.")
	      (setf first-time nil))
	  (setf server-running t)))))

(swank)
