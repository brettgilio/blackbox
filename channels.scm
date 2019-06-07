(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'guix-channel)
       (url "https://git.sr.ht/~brettgilio/guix-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"8190e1edafac77606026f414a5951bde759bd26e")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
