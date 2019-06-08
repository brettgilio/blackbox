(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'guix-channel)
       (url "https://git.sr.ht/~brettgilio/guix-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"c6de5afe5c5da34513ea43b041fead30f28f57d4")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
