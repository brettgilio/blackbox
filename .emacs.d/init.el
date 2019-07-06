;;; init.el --- user initialization file -*- lexical-binding: t -*-

;; Disable all mouse-interactive interfaces early.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No stale bytecode.
(setq load-prefer-newer t)

;; Initialize packages
(package-initialize)

;; Establish auto-compiled bytecode.
;; FIX ME: Currently not functioning.
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)
(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)

;; Set path to modules, and `add-to-list'.
(setq modules-dir
      (expand-file-name "modules" user-emacs-directory))

(setq themes-dir
      (expand-file-name "doom-themes" user-emacs-directory))

(add-to-list 'load-path modules-dir)
(add-to-list 'load-path themes-dir)

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
(require 'module-mail)
(require 'module-helm)
(require 'module-dashboard)
(require 'module-org)
(require 'module-optimizations)

;; Aliased function modules.
(require 'module-irc)
(require 'module-custom)
;(require 'module-snippets)

;; Lazily loaded modules.
(use-package module-pg
  :hook (after-init . module-pg//load-pg))

(use-package module-python
  :hook (after-init . module-python//load-lsp))

(use-package module-readers
  :hook (after-init . module-readers//load-readers))

(use-package module-scheme
  :hook (after-init . module-scheme//load-scheme))

(use-package module-ocaml
  :hook (after-init . module-ocaml//load-merlin))

(use-package module-cobjc
  :hook (after-init . module-cobjc//load-lsp))

(use-package module-hy
  :hook (after-init . module-hy//load-hy))

(use-package module-haskell
  :hook (after-init . module-haskell//load-lsp))

(use-package module-rust
  :hook (after-init . module-rust//load-lsp))

(use-package module-racket
  :hook (after-init . module-racket//load-rkt))

(use-package module-tex
  :hook (after-init . module-tex//auctex))

(use-package module-lilypond
  :hook (after-init . module-lilypond//init))
