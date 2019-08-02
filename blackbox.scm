;;; This file is part of Blackbox, a fork of GNU Guix.
;;;
;;; Original Guix Authors:
;;; Copyright © 2012, 2014 Ludovic Courtès <ludo@gnu.org>
;;;
;;; Blackbox Authors:
;;; Copyright © 2019 Brett Gilio <brettg@posteo.net>
;;;
;;; Blackbox is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; Blackbox is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Blackbox.  If not, see <http://www.gnu.org/licenses/>.

(define-module (blackbox))

;; The composite module that re-exports everything from the public modules.

(eval-when (eval load compile)
  (begin
    (define %public-modules
      '()) ; fill

    (for-each (let ((i (module-public-interface (current-module))))
		(lambda (m)
		  (module-use! i (resolve-interface `(blackbox ,m)))))
	      %public-modules)))

;;; blackbox.scm ends here
