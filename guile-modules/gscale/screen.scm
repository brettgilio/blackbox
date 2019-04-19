(define-module (guile-modules gscale screen)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 receive)
  #:use-module (newt)
  #:export (screen-columns
	    screen-rows
	    set-screen-size!))

(define screen-columns (make-parameter 0))
(define screen-rows (make-parameter 0))

(define (set-screen-size!)
  "Set the parameters 'screen-columns' and 'screen-rows' to the
number of columns and rows respectively of the current terminal
session."
  (receive (columns rows)
      (screen-size)
    (screen-columns columns)
    (screen-rows rows)))
