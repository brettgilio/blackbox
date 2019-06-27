(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'blackbox)
       (url "https://git.sr.ht/~brettgilio/blackbox-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"c30d117822a8ca26cd8c06c0a3974955bef68eac")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
