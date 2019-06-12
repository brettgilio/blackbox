(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'guix-channel)
       (url "https://git.sr.ht/~brettgilio/guix-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"948ecc27dd33d6c9bd77e06c82b49e5a1139868b")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
