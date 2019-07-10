(define-module (system-configuration t430-gdm-gnome-419x)
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
 (host-name "t430")
 (timezone "America/Chicago")
 (locale "en_US.utf8")

 (keyboard-layout
  (keyboard-layout "us" "altgr-intl"))

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
	   (uuid "3b01685a-2e42-45b4-a738-a48797b53049"
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
 
 (packages
  (append
   (list (specification->package "nss-certs"))
   %base-packages))
 
 (services
  (append
   (list (service gnome-desktop-service-type)
	 (set-xorg-configuration
	  (xorg-configuration
	   (keyboard-layout keyboard-layout))))
   %desktop-services)))
