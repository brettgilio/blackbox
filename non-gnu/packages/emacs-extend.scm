(define-module (non-gnu packages emacs-extend)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages wordnet)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public emacs-font-lock+
  (let ((commit "f2c1ddcd4c9d581bd32be88fad026b49f98b6541")
        (revision "0"))
    (package
     (name "emacs-font-lock+")
     (version (git-version "208" revision commit))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacsmirror/font-lock-plus.git")
                    (commit commit)))
              (sha256
               (base32
                "17kqvmh3k2lvkarqra3v9nzm66l7dc72fh48crypc8f8qma9sncl"))
              (file-name (git-file-name name version))))
     (build-system emacs-build-system)
     (home-page "https://github.com/emacsmirror/font-lock-plus")
     (synopsis "")
     (description "")
     (license #f))))

;; The Guix-master build lacks proper reference to `emacs-font-lock+'
;; XXX: https://github.com/domtronn/all-the-icons.el/issues/105
(define-public emacs-all-the-icons-channel
  (let ((commit "f996fafa5b2ea072d0ad1df9cd98acc75820f530")
        (revision "1"))
    (package
     (name "emacs-all-the-icons")
     (version (git-version "3.2.0" revision commit))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/domtronn/all-the-icons.el.git")
                    (commit commit)))
              (sha256
               (base32
                "0yc07xppgv78l56v7qwqp4sf3p44znkv5l0vlvwg8x1dciksxgqw"))
              (file-name (git-file-name name version))))
     (build-system emacs-build-system)
     (arguments
      `(#:include '("\\.el$" "^data/" "^fonts/")
	;; Compiling "test/" fails with "Symbol’s value as variable is void:
	;; all-the-icons--root-code".  Ignoring tests.
	#:exclude '("^test/")
	#:tests? #f))
     (propagated-inputs
      `(("f" ,emacs-f)
	("memoize" ,emacs-memoize)
	("emacs-font-lock+" ,emacs-font-lock+)))
     (home-page "https://github.com/domtronn/all-the-icons.el")
     (synopsis "Collect icon fonts and propertize them within Emacs")
     (description "All-the-icons is a utility package to collect various icon
fonts and propertize them within Emacs.  Icon fonts allow you to propertize
and format icons the same way you would normal text.  This enables things such
as better scaling of and anti aliasing of the icons.")
     ;; Package is released under Expat license.  Elisp files are licensed
     ;; under GPL3+.  Fonts come with various licenses: Expat for
     ;; "all-the-icons.ttf" and "file-icons.ttf", Apache License 2.0 for
     ;; "material-design-icons.ttf", and SIL OFL 1.1 for "fontawesome.ttf",
     ;; "ocitcons.ttf" and "weathericons.ttf".
     (license
      (list license:expat license:gpl3+ license:silofl1.1 license:asl2.0)))))

      
