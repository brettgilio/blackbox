(defun module-dashboard//dashboard ()
  
  (use-package dashboard
    :config (dashboard-setup-startup-hook))

  ;; REFORMAT ALL OF THE BELOW TO INCORPORATE INTO USE-PACKAGE
  (set-face-attribute 'dashboard-banner-logo-title nil :weight 'bold)
  (setq dashboard-banner-logo-title "Welcome to GNU Emacs!")
  (setq dashboard-init-info
	(format "[Init: %.2fs] [GC: %dx]"
		(float-time (time-subtract after-init-time before-init-time))
		gcs-done))
  (setq dashboard-startup-banner
	(expand-file-name "artwork/logo.png" user-emacs-directory))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (setq dashboard-set-init-info t)
  (setq dashboard-items '((recents . 8)
			  (agenda . 5)))

  ;; Recent files
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25))

(module-dashboard//dashboard)

(provide 'module-dashboard)
