(defun module-lilypond//init ()
  
  (use-package lilypond-mode
    :load-path (lambda ()
		 (expand-file-name
		  "share/emacs/site-lisp"
		  (or (getenv "GUIX_ENVIRONMENT")
		      (error "GUIX_ENVIRONMENT is not defined."))))
    :config
    (autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
    (add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
    (add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
    (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))))


(provide 'module-lilypond)
