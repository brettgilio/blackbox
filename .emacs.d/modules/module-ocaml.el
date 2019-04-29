(defun module-ocaml//load-merlin ()

  (use-package merlin
    :after (tuareg)
    :config (setq merlin-command
		  (lambda ()
		    (expand-file-name
		     "bin/ocamlmerlin"
		     (or (getenv "GUIX_ENVIRONMENT")
			 (error "GUIX_ENVIRONMENT is not defined."))))))

  (use-package tuareg
    :mode ("\\.ml\\'" . tuareg-mode)
    :hook ((tuareg-mode . merlin-mode)
	   (tuareg-mode . company-mode))
    :defer t))

;; Implement merlin-company support
;; https://github.com/ocaml/merlin/blob/master/emacs/merlin-company.el

(provide 'module-ocaml)
