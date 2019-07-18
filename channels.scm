(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'blackbox)
       (url "https://git.sr.ht/~brettgilio/blackbox-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"193d20f35186556a0344f216f8e70187132093df")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
