(define-module (channels)
  #:use-module (guix channels))

(list (channel
       (name 'blackbox)
       (url "https://git.sr.ht/~brettgilio/blackbox-channel"))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"76b96720e20f109138c7fca027c9f0deb2b40d26"))
      (channel
       (name 'guix-hm)
       (url "https://framagit.org/tyreunom/guix-home-manager.git")
       (commit
	"35e30a169c2328657a4d402b3c1ad5ac0efff3d2")))

;; Manually manage mainline guix commits
;; LOG: http://git.savannah.gnu.org/cgit/guix.git/log/
;; LOG: https://framagit.org/tyreunom/guix-home-manager/
