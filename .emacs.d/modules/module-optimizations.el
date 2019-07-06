(defun module-optimizations//default ()
  
  ;; Backup & Auto-save files to single dir
  (setq backups-dir
	(expand-file-name "backups" user-emacs-directory))
  
  (setq backup-directory-alist
	`((".*" . ,backups-dir)))
  
  (setq auto-save-file-name-transforms
	`((".*" ,backups-dir t))))


(module-optimizations//default)

(provide 'module-optimizations)
