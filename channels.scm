(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'blackbox)
       (url "https://git.sr.ht/~brettgilio/blackbox-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"87850c05a208f7b4213f632f3f79b59e76880724")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
