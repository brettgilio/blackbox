(defun module-readers//load-readers ()

  (use-package pdf-tools
    :magic ("%PDF" . pdf-view-mode)
    :config (pdf-tools-install :no-query)))

(provide 'module-readers)
