(defun module-custom//load-guix-env ()
  (dired (getenv "GUIX_ENVIRONMENT")))

(defalias 'exec-guix-env
  (lambda ()
    (interactive)
    (module-custom//load-guix-env)))

(provide 'module-custom)
