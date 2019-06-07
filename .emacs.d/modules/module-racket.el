(defun module-racket//load-rkt ()

  (use-package racket
    :hook (racket-mode . company-mode)
    :mode ("\\.rkt\\'" . racket-mode)))

(provide 'module-racket)
