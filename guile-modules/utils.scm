;;; Adapted from https://github.com/alezost/guile-config/blob/master/modules/al/utils.scm

(define-module (guile-modules utils)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-11)
  #:use-module (srfi srfi-26)
  #:export (with-no-output
            define-delayed
            memoize
            push!
            set-locale
            mapconcat
            comma-separated
            build-file-name
            min-string
            replace
            split
            split-path))

(define-syntax-rule (define-delayed name expression)
  "Define NAME thunk that will evaluate EXPRESSION, remember and return
its value on a first call and will return this value on subsequent
calls."
  (define name
    (let ((value (delay expression)))
      (lambda () (force value)))))

(define (memoize proc)
  "Return a memoizing version of PROC."
  (let ((cache (make-hash-table)))
    (lambda args
      (let ((results (hash-ref cache args)))
        (if results
            (apply values results)
            (let ((results (call-with-values
                               (lambda () (apply proc args))
                             list)))
              (hash-set! cache args results)
              (apply values results)))))))

(define-syntax-rule (push! elt lst)
  "Add ELT to LST."
  (set! lst (cons elt lst)))

(define-syntax-rule (with-no-output body ...)
  "Do not display any output while running BODY."
  (let ((null (%make-void-port "w")))
    (parameterize ((current-output-port  null)
                   (current-error-port   null)
                   (current-warning-port null))
      body ...)))

(define* (set-locale #:optional (locale ""))
  "Call (setlocale LC_ALL LOCALE) and ignore errors."
  (catch #t
    (lambda _ (setlocale LC_ALL locale))
    (lambda (_ . args)
      (apply display-error #f (current-error-port) args))))

(define* (mapconcat proc lst #:optional (separator ""))
  "Apply PROC to each element of LST and concatenate the result strings
into a single string using SEPARATOR."
  (match lst
    (() "")
    ((elt . rest)
     (fold (lambda (elt res)
             (string-append res separator (proc elt)))
           (proc elt)
           rest))))

(define (comma-separated . strings)
  "Return string by concatenating STRINGS with commas."
  (mapconcat identity strings ","))

(define (build-file-name . file-parts)
  "Return file name by concatenating FILE-PARTS with slashes."
  (mapconcat identity file-parts "/"))

(define (min-string . strings)
  "Like 'min' but performed on STRINGS.
Return #f if STRINGS are not specified."
  (reduce (lambda (cur min)
            (if (string< cur min) cur min))
          #f
          strings))

(define (replace pred new lst)
  "Replace element of LST matching PRED with NEW element."
  (cons new (remove pred lst)))

(define (split lst elt)
  "Return two values, a list containing the elements of the list LST
that appear before the first occurence of the object ELT and a list
containing the elements after ELT."
  (let-values (((head tail)
                (break (cut string=? elt <>) lst)))
    (values head
            (match tail
              (() '())
              ((_ rest ...) rest)))))

(define* (split-path #:optional (path (getenv "PATH")) (separator #\:))
  "Split PATH string into a list of substrings with SEPARATOR."
  (string-tokenize path (char-set-complement (char-set separator))))
