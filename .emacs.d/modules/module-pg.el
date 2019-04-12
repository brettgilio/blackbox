(defun module-pg//load-pg ()
  
  (use-package proof-site
    :load-path (lambda ()
		 (expand-file-name
		  "share/emacs/site-lisp/ProofGeneral/generic"
		  (or (getenv "GUIX_ENVIRONMENT")
		      (error "GUIX_ENVIRONMENT is not defined."))))))
  

(provide 'module-pg)
