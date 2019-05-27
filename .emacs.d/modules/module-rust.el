(defun module-rust//load-lsp ()

  (use-package lsp-mode
    :hook (rust-mode . lsp)))

(provide 'module-rust)
