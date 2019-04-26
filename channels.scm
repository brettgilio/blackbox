(define-module (channels)
  #:use-module (guix channels))

(cons (channel
       (name 'guix-system)
       (url "https://git.sr.ht/~brettgilio/guix-channel"))
      %default-channels)
