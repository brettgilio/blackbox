;;; This file is part of Blackbox, a fork of GNU Guix.
;;;
;;; Original Guix Authors:
;;; Copyright © 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2018 Mark H Weaver <mhw@netris.org>
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

(define-module (blackbox records)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 match)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 rdelim))

;; Utilities for dealing with Scheme records.

(define-syntax record-error
  (syntax-rules ()
    "Report a syntactic error in use of CONSTRUCTOR."
    ((_ constructor form fmt args ...)
     (syntax-violation constructor
		       (format #f fmt args ...)
		       form))))

(eval-when (expand load eval)
  ;; The procedures below are needed both at run time and at expansion time.

  (define (current-abi-identifier type)
    "Return an identifier unhygienically derived from TYPE for use as
its \"current ABI\" variable."
    (let ((type-name (syntax->datum type)))
      (datum->syntax
       type
       (string->symbol
	(string-append "% " (symbol->string type-name)
		       " abi-cookie")))))

  (define (abi-check type cookie)
    "Return syntax that checks the current \"application binary
interface\" (ABI) for TYPE is equal to COOKIE."
    (with-syntax ((current-abi (current-abi-identifier type)))
      #`(unless (eq? current-abi #,cookie)
	  ;; The source file where this exception is thrown must be
	  ;; recompiled manually.
	  (throw 'record-abi-mismatch-error 'abi-check
		 "~a: record ABI mismatch, recompilation needed"
		 (list #,type) '()))))

;;; records.scm ends here
