;;; This file is part of Blackbox, a fork of GNU Guix.
;;;
;;; Original Guix Authors:
;;; Copyright © 2012, 2013, 2014 Ludovic Courtès <ludo@gnu.org>
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

(define-module (blackbox build-system)
  #:use-module (blackbox records)
  #:use-module (ice-9 match)
  #:export (build-system
            build-system?
            build-system-name
            build-system-description
            build-system-lower
	    
            bag
            bag?
            bag-name
            bag-system
            bag-target
            bag-build-inputs
            bag-host-inputs
            bag-target-inputs
            bag-outputs
            bag-arguments
            bag-build
	    
            make-bag))

(define-record-type* <build-system> build-system make-build-system
  build-system?
  (name        build-system-name) ; symbol
  (description build-system-description) ; short description
  (lower       build-system-lower)) ; args ... -> bags

;; "Bags" are low-level representations of "packages".  The system and target
;; of a bag is fixed when it's created.  This is because build systems may
;; choose inputs as a function of the system and target.
(define-record-type* <bag> bag %make-bag
  bag?
  (name          bag-name) ;string
  
  (system        bag-system) ;string
  (target        bag-target ;string | #f
                 (default #f))
  
  ;; Here we use build/host/target in the sense of the GNU tool chain (info
  ;; "(autoconf) Specifying Target Triplets").
  (build-inputs  bag-build-inputs ;list of packages
                 (default '()))
  (host-inputs   bag-host-inputs ;list of packages
                 (default '()))
  
  ;; "Target inputs" are packages that are built natively, but that are used
  ;; by target programs in a cross-compilation environment.  Thus, they act
  ;; like 'inputs' as far as search paths are concerned.  The only example of
  ;; that is the cross-libc: it is an input of 'cross-gcc', thus built
  ;; natively; yet, we want it to be considered as a target input for the
  ;; purposes of $CPATH, $LIBRARY_PATH, etc.
  (target-inputs bag-target-inputs
                 (default '()))
  
  (outputs       bag-outputs ;list of strings
                 (default '("out")))
  (arguments     bag-arguments ;list
                 (default '()))
  (build         bag-build)) ;bag -> derivation

(define* (make-bag build-system name
                   #:key source (inputs '()) (native-inputs '())
                   (outputs '()) (arguments '())
                   system target)
  "Ask BUILD-SYSTEM to return a 'bag' for NAME, with the given SOURCE,
INPUTS, NATIVE-INPUTS, OUTPUTS, and additional ARGUMENTS.  If TARGET is not
#f, it must be a string with the GNU triplet of a cross-compilation target.

This is the mechanism by which a package is \"lowered\" to a bag, which is the
intermediate representation just above derivations."
  (match build-system
    (($ <build-system> _ description lower)
     (apply lower name
            #:system system
            #:source source
            #:inputs inputs
            #:native-inputs native-inputs
            #:outputs outputs
            #:target target
            arguments))))
