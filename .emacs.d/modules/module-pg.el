(defun module-pg//load-pg ()
  
  (use-package proof-site
    :load-path (lambda ()
		 (expand-file-name
		  "share/emacs/site-lisp/ProofGeneral/generic"
		  (or (getenv "GUIX_ENVIRONMENT")
		      (error "GUIX_ENVIRONMENT is not defined."))))
    :config (setq coq-compile-before-require t)
    :mode ("\\.v\\'" . coq-mode))

  (use-package company-coq
    :after (proof-site)
    :hook (coq-mode . company-coq-mode)))
  

(provide 'module-pg)
