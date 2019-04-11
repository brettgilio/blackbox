(defun module-pg//load-pg ()
(load (concat
       (getenv "GUIX_ENVIRONMENT")
       "/share/emacs/site-lisp"
       "/ProofGeneral/generic/proof-site.el")))

(provide 'module-pg)
