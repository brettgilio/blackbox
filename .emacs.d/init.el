;; Disable all mouse-interactive interfaces early.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize)

;; Disable the splash-screen.
(setq inhibit-startup-message t)

;; Set path to modules, and `add-to-list'.
(setq modules-dir
      (expand-file-name "modules" user-emacs-directory))

(add-to-list 'load-path modules-dir)

;; Create custom.el file if it doesn't exist, and load it.
(let ((fn (expand-file-name "custom.el" user-emacs-directory)))
  (unless (file-exists-p fn)
    (with-temp-buffer
      (write-file fn)))
  (setq custom-file fn)
  (load custom-file))

;; Load use-package for loading.
(eval-when-compile
  (require 'use-package))

;; Regularly loaded modules.
(require 'module-appearance)

;; Lazily loaded modules.
(use-package module-pg
  :hook (after-init . module-pg//load-pg))

(use-package module-python
  :hook (after-init . module-python//load-lsp))
