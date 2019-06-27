(defun module-tex//auctex ()

  ;; https://nasseralkmim.github.io/notes/2016/08/21/my-latex-environment/
  
  (use-package tex-site
    :mode ("\\.tex\\'" . latex-mode)
    :config
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)
    (add-hook 'LaTeX-mode-hook
	      (lambda ()
		(company-mode)
		(setq TeX-PDF-mode t)
		(setq TeX-source-correlate-mode 'synctex)
		(setq TeX-source-correlate-start-server t)))

    ;; Update PDF buffers after successful LaTeX runs
    (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
	      #'TeX-revert-document-buffer)

    ;; PDF Tools with AucTeX
    (add-hook 'LaTeX-mode-hook 'pdf-tools-install)

    (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
	  TeX-source-correlate-start-server t)
    (setq TeX-view-program-list '(("pdf-tools"
				   "TeX-pdf-tools-sync-view")))))

(provide 'module-tex)

;; UNFINISHED!
