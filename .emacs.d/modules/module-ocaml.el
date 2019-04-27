(defun module-ocaml//load-merlin ()

  (use-package merlin
    :config (setq merlin-command
		  (lambda ()
		    (expand-file-name
		     "bin/ocamlmerlin"
		     (or (getenv "GUIX_ENVIRONMENT")
			 (error "GUIX_ENVIRONMENT is not defined.")))))
    :defer t)

  (use-package tuareg
    :after (merlin)
    :mode ("\\.ml\\'" . tuareg-mode)
    :hook ((tuareg-mode . merlin-mode))))

;; Implement merlin-company support
;; https://github.com/ocaml/merlin/blob/master/emacs/merlin-company.el

(provide 'module-ocaml)
