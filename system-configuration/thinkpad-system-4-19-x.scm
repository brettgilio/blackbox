(define-module (system-configuration thinkpad-system-4-19-x)
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
  #:use-module (non-guix services xorg-extend)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))

(use-service-modules desktop xorg)
(use-package-modules certs gnome)

(define %default-substitute-urls-modified
  ;; Default list of substituters.  This is *not* the list baked in
  ;; 'guix-daemon', but it is used by 'guix-service-type' and and a couple of
  ;; clients ('guix build --log-file' uses it.)
       '("https://ci.guix.gnu.org"
	 "http://192.168.1.2:8080"))

(define %desktop-services-modified
  (modify-services %desktop-services
		   (guix-service-type config =>
				      (guix-configuration
				       (inherit config)
				       (substitute-urls %default-substitute-urls-modified)))))

(operating-system
 (host-name "thinkpad")
 (timezone "America/Chicago")
 (locale "en_US.utf8")

 (kernel linux-nonfree-4.19)

 (firmware (cons*
	    iwlwifi-firmware-nonfree
	    %base-firmware))
 
 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (target "/boot/efi")))
 
 (swap-devices (list "/dev/sda2"))
 
 (file-systems
  (cons* (file-system
	  (mount-point "/boot/efi")
	  (device (uuid "FB76-0AC2" 'fat32))
	  (type "vfat"))
	 (file-system
	  (mount-point "/")
	  (device
	   (uuid "2d6a2494-f34c-4c0c-885f-7305586dfec7"
		 'ext4))
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
			    (theme %default-slim-theme-modified)
			    (theme-name %default-slim-theme-name-modified)))
		  (remove (lambda (service)
			    (eq? (service-kind service)
				 gdm-service-type))
			  %desktop-services-modified)))
 
 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
