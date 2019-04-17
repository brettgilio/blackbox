(defun module-cobjc//load-lsp ()

  (use-package lsp-mode
    :commands lsp)

  (use-package lsp-ui
    :commands lsp-ui-mode)

  (use-package company-lsp
    :commands company-lsp)
  
  (use-package ccls
    :hook ((c-mode c++-mode objc-mode) .
	   (lambda ()
	     (require 'ccls)
	     (lsp)))))

(provide 'module-cobjc)
