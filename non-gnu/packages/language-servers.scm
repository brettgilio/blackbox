(define-module (non-gnu packages language-servers)
  #:use-module (srfi srfi-1)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages code)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages web)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages llvm))

;; Modified from https://github.com/trivialfis/guixpkgs
(define-public ccls
  (package
   (name "ccls")
   (version "0.20190314")
   (home-page "https://github.com/MaskRay/ccls")
   (source (origin
	    (method url-fetch)
	    (uri (string-append
		  "https://github.com/MaskRay/ccls/archive/"
		  version ".tar.gz"))
	    (sha256
             (base32
	      "1csvs4vvycjq2s28n34r8q9pfcn435718b92wnabn9b3lw1sdvxa"))
	    (file-name (string-append name "-" version ".tar.gz"))))
   (build-system cmake-build-system)
   (arguments
    `(#:configure-flags
      (list "-DUSE_SYSTEM_RAPIDJSON=ON"
	    (string-append "-DCMAKE_CXX_FLAGS='-isystem "
			   (assoc-ref %build-inputs "gcc-toolchain")
			   "/include/c++'"))
      #:tests? #f))
   (native-inputs
    `(("rapidjson" ,rapidjson)
      ("gcc-toolchain" ,gcc-toolchain-7)))
   (inputs
    `(("clang" ,clang)
      ("ncurses" ,ncurses)))
   (synopsis "C/C++/ObjC language server.")
   (description "C/C++/ObjC language server.")
   (license license:expat)))
