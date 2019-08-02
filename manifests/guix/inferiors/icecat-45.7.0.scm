(use-modules (guix inferior) (guix channels)
	     (srfi srfi-1))

(define inferior-rev-icecat
  (list (channel
	 (name 'inferior-rev-icecat)
	 (url "https://git.savannah.gnu.org/git/guix.git")
	 (commit
	  "c9b631aef4976e77df4440bae51549ad6b0c44e9"))))

(define inferior
  (inferior-for-channels inferior-rev-icecat))

(packages->manifest
 (list
  (lookup-inferior-packages inferior "icecat")))

;; Bugged, fix me!
