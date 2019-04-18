(define-module (non-gnu packages coq-extend)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages coq)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages texinfo)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system ocaml)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((srfi srfi-1) #:hide (zip)))

;; Stop tracking tags, and track master instead
(define-public proof-general
  (let ((commit "612eac576472f405fc64af98d1f1c5a13cd5fb0a")
        (revision "2"))
    (package
     (name "proof-general")
     (version (git-version "4.4" revision commit))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ProofGeneral/PG.git")
                    (commit commit)))
              (sha256
               (base32
                "09r7fk62v0plgjlzlq8a4qrj2cmah518jick396k15b6jqb7kgm3"))
              (file-name (git-file-name name version))))
     (build-system gnu-build-system)
     (native-inputs
      `(("which" ,which)
	("emacs" ,emacs-minimal)
	("texinfo" ,texinfo)))
     (inputs
      `(("host-emacs" ,emacs)
	("perl" ,perl)
	("coq" ,coq)))
     (arguments
      `(#:tests? #f  ; no check target
	#:make-flags (list (string-append "PREFIX=" %output)
                           (string-append "DEST_PREFIX=" %output))
	#:phases
	(modify-phases %standard-phases
		       (delete 'configure))))
     (home-page "http://proofgeneral.inf.ed.ac.uk/")
     (synopsis "Generic front-end for proof assistants based on Emacs")
     (description
      "Proof General is a major mode to turn Emacs into an interactive proof
assistant to write formal mathematical proofs using a variety of theorem
provers.")
     (license license:gpl2+))))
  
