(define-module (system-configuration oryx-system-4-19-x)
  #:use-module (gnu)
  #:use-module (gnu system nss)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xorg)
  #:use-module (non-gnu packages lisp-extend)
  #:use-module (non-gnu packages linux-extend)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (srfi srfi-1))

(use-service-modules desktop xorg)
(use-package-modules certs gnome)

(operating-system
 (host-name "oryx")
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
		  stumpwm-system
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
