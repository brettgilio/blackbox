;;; This file is part of Blackbox, a fork of GNU Guix.
;;;
;;; Original Guix Authors:
;;; Copyright © 2013, 2014, 2015, 2017 Ludovic Courtès <ludo@gnu.org>
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

(define-module (blackbox monads)
  #:use-module ((system syntax)
		#:select (syntax-local-binding))
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26))

;; Record type for monads manipulated at run time.
(define-record-type <monad>
  (make-monad bind return)
  monad?
  (bind monad-bind)
  (return monad-return)) ; TODO: Add 'plus' and 'zero'

(define-syntax define-monad
  (lambda (s)
    "Define the monad under NAME, with the given bind and return methods."
    (define prefix (string->symbol "% "))
    (define (make-rtd-name name)
      (datum->syntax name
		     (symbol-append prefix (syntax->datum name) '-rtd)))

    (syntax-case s (bind return)
      ((_ name (bind b) (return r))
       (with-syntax ((rtd (make-rtd-name #'name)))
	 #`(begin
	     (define rtd
	       ;; The record type, for use at run time.
	       (make-monad b r))

	     ;; Instantiate all the templates, specialized for this monad.
	     (template-directory instantiations name)

	     (define-syntax name
	       ;; An "inlined record", for use at expansion time. The
	       ;; goal is to allow 'bind' and 'return' to be resolved
	       ;; at expansion time, in the common case where the
	       ;; monad is accessed directly as NAME.
	       (lambda (s)
		 (syntax-case s (%bind %return)
		   ((_ %bind) #'b)
		   ((_ %return) #'r)
		   (_ #'rtd))))))))))
