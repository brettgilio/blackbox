(defun module-dashboard//dashboard ()


  ;; IMPLEMENT CHANGING BANNER BY META-PKG ENVIRONMENT
  
  ;; (defvar guix-env-directory (getenv "GUIX_ENVIRONMENT"))

  ;; (expand-file-name guix-env-directory)

  ;; (if (expand-file-name guix-env-directory)
  ;;     (expand-file-name "artwork/logo.png" user-emacs-directory)
  ;;   nil)
  ;; (if (expand-file-name "bin/coqtop" guix-env-directory)
  ;;     (expand-file-name "artwork/coq_logo.png" user-emacs-directory)
  ;;   nil))

  
  (use-package dashboard
    :config (dashboard-setup-startup-hook))
  
  ;; REFORMAT ALL OF THE BELOW TO INCORPORATE INTO USE-PACKAGE
  (set-face-attribute 'dashboard-banner-logo-title nil :weight 'bold)
  (set-face-attribute 'dashboard-footer nil :weight 'semi-light :slant 'italic)
  
  (setq dashboard-banner-logo-title "Welcome to GNU Emacs!")
  (setq dashboard-init-info
	(format "[Init: %.2fs] [GC: %dx]"
		(float-time (time-subtract after-init-time before-init-time))
		gcs-done))
  (setq dashboard-startup-banner
	(expand-file-name "artwork/logo.png" user-emacs-directory))
  (setq dashboard-footer (emacs-version))
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
