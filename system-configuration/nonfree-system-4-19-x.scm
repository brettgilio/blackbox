(define-module (system-configuration nonfree-system-4-19-x)
  #:use-module (gnu)
  #:use-module (gnu system nss)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xorg)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (srfi srfi-1))

(use-service-modules desktop xorg)
(use-package-modules certs gnome)

(define (linux-nonfree-urls version)
  "Return a list of URLs for Linux-Nonfree VERSION."
  (list (string-append
         "https://www.kernel.org/pub/linux/kernel/v4.x/"
         "linux-" version ".tar.xz")))

(define-public linux-nonfree-4.19
  (let* ((version "4.19.48"))
    (package
     (inherit linux-libre)
     (name "linux-nonfree")
     (version version)
     (source (origin
	      (method url-fetch)
	      (uri (linux-nonfree-urls version))
	      (sha256
	       (base32
		"1ylkd30hg2skfxl12g45lqm48b732faf41d68513i3nc217xpl01"))))
     (synopsis "Mainline Linux kernel, nonfree binary blobs included.")
     (description "Linux is a kernel.")
     (home-page "http://kernel.org/")
     (license license:gpl2))))

(define-public iwlwifi-firmware-nonfree
  (package
   (name "iwlwifi-firmware-nonfree")
   (version "711d3297bac870af42088a467459a0634c1970ca")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git")
		  (commit version)))
	    (sha256
	     (base32
	      "0dbnib2gh8kajyys3pps99lp5s4k6b26v2jmbq2x3vbl9fa1xgda"))))
   (build-system trivial-build-system)
   (arguments
    `(#:modules ((guix build utils))
      #:builder (begin
		  (use-modules (guix build utils))
		  (let ((source (assoc-ref %build-inputs "source"))
			(fw-dir (string-append %output "/lib/firmware")))
		    (mkdir-p fw-dir)
		    (for-each (lambda (file)
				(copy-file file
					   (string-append fw-dir "/"
							  (basename file))))
			      (find-files source "iwlwifi-.*\\.ucode$|LICENCE\\.iwlwifi_firmware$"))
		    #t))))
   (home-page "https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi")
   (synopsis "Non-free firmware for Intel wifi chips")
   (description "Non-free firmware for Intel wifi chips")
   (license (license:non-copyleft "http://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=blob_plain;f=LICENCE.iwlwifi_firmware;hb=HEAD"))))

(operating-system
 (host-name "guixsd")
 (timezone "America/Chicago")
 (locale "en_US.utf8")

 (kernel linux-nonfree-4.19)

 (firmware (cons*
	    iwlwifi-firmware-nonfree
	    %base-firmware))
 
 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (target "/boot/efi")))
 
 (file-systems (cons (file-system
                      (device (file-system-label "my-root"))
                      (mount-point "/")
                      (type "ext4"))
                     %base-file-systems))
 
 (users (cons (user-account
               (name "brettg")
               (comment "Brett Gilio")
               (group "users")
               (supplementary-groups '("wheel" "netdev"
                                       "audio" "video"))
               (home-directory "/home/brettg"))
              %base-user-accounts))
 
 (packages (cons* nss-certs         ;for HTTPS access
                  gvfs              ;for user mounts
		  stumpwm
		  xauth
		  xterm
		  xrdb
		  xsetroot
		  xrandr
		  guile-2.2
		  guile-newt
		  python
                  %base-packages))
 
 (services (cons* (service slim-service-type
			   (slim-configuration
			    (default-user ""))) ; Change SLiM Theme
		  (remove (lambda (service)
			    (eq? (service-kind service)
				 gdm-service-type))
			  %desktop-services)))
 
 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
