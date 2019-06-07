(defun module-readers//load-readers ()

  (use-package pdf-tools
    :magic ("%PDF" . pdf-view-mode)
    :config (pdf-tools-install :no-query))

  (use-package webpaste
    :config (setq webpaste-provider-priority '("ix.io"))
    :bind (("C-c C-p C-b" . webpaste-paste-buffer)
	   ("C-c C-p C-r" . webpaste-paste-region)))

  ;; Make into USE-PACKAGE
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))



(provide 'module-readers)
