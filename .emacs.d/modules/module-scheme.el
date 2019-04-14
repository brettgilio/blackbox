(defun module-scheme//load-scheme ()

  ;; For not-loaded manifests.
  (use-package scheme-mode
    :mode (("\\.scmx\\'" . scheme-mode)))

  
(setq geiser-guile-load-init-file-p t))
	   

(provide 'module-scheme)
