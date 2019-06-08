(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'guix-channel)
       (url "https://git.sr.ht/~brettgilio/guix-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"0e6cee21a48294b81a5e57e00602728fe7f7075f")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
