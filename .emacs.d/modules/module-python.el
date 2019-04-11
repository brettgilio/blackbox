(defun module-python//load-lsp ()
  (use-package lsp-mode
    :hook (python-mode . lsp)))

(provide 'module-python)
