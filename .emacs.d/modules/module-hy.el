(defun module-hy//load-hy ()
  
  (use-package hy-mode
    :init (require 'comint)
    :mode ("\\.hy\\'" . hy-mode)
    :config (with-eval-after-load 'company-mode
	      (add-to-list 'company-backends #'company-hy))))


(provide 'module-hy)
