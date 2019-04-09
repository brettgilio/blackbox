(define-module (system-configuration libre-system-4-19-x)
  #:use-module (gnu)
  #:use-module (gnu system nss)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xorg))

(use-service-modules desktop)
(use-package-modules certs gnome)

(operating-system
 (host-name "guixsd")
 (timezone "America/Chicago")
 (locale "en_US.utf8")

 (kernel linux-libre-4.19)
 
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
		  xterm
                  %base-packages))
 
 (services (cons* %desktop-services))
 
 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
