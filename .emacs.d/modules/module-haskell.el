(defun module-haskell//load-lsp ()

  (use-package lsp-mode
    :commands lsp)

  (use-package lsp-ui
    :commands lsp-ui-mode)

  (use-package company-lsp
    :commands company-lsp)
  
  (use-package lsp-haskell
    :hook ((haskell-mode) .
	   (lambda ()
	     (require 'lsp-haskell)
	     (lsp)))
    :defer t))

(provide 'module-haskell)
