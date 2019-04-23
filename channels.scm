(define-module (channels)
  #:use-module (guix channels)
  #:use-module (newt))

(cons (channel
       (name 'guix-system)
       (url "https://git.sr.ht/~brettgilio/guix-system"))
      %default-channels)
