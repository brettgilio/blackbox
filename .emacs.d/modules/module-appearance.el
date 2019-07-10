(defun module-appearance//default-theme (&optional _frame)
  (set-face-attribute 'default nil
		      :family "Source Code Pro"
		      :height 140
		      :weight 'regular)
  
  (display-time-mode)
  (global-hl-line-mode 1)

  (require 'doom-themes)
  (load-theme 'doom-city-lights t)
  
  (defun module-appearance//default-theme//doom-modeline-daemon (_frame)
    "`doom-modeline' strangely does not handle well under a daemonized Emacs."
    (setq doom-modeline-icon t)
    (setq doom-modeline-height 35))
  
  (use-package doom-modeline
    :hook ((after-init . doom-modeline-mode)
	   (after-make-frame-functions . module-appearance//default-theme//doom-modeline-daemon)))
  
  (use-package display-line-numbers
    :hook (prog-mode . display-line-numbers-mode))

  (use-package fancy-battery
    :hook (after-init . fancy-battery-mode)))

(module-appearance//default-theme)


(provide 'module-appearance)
