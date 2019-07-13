(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'blackbox)
       (url "https://git.sr.ht/~brettgilio/blackbox-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"2516ba81bef1f1ed6847a9611740b6ab30fb5582")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
