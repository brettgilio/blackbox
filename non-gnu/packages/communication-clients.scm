(define-module (non-gnu packages communication-clients)
  #:use-module (gnu packages)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gperf)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))

(define-public telegram-tdlib
  (let ((commit "a9608ca379e1582552d7a123912aa9d68c2bb1ca")
	(revision "1"))
    (package
     (name "telegram-tdlib")
     (version (git-version "1.3.0" revision commit))
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/tdlib/td.git")
		    (commit commit)))
	      (sha256
	       (base32
		"0sjy4l0dr9599k0alinhqlprr5yw6jkdns873a0kig1nwcyzvsyi"))
	      (file-name (git-file-name name version))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #f))
     (native-inputs
      `(("openssl" ,openssl)
	("zlib" ,zlib)
	("gperf" ,gperf)))
     (home-page "https://github.com/tdlib/td")
     (synopsis "")
     (description "")
     (license license:boost1.0))))
