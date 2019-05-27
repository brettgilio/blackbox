(define-module (containers cgit))

(use-modules (gnu))
(use-service-modules networking ssh cgit)
(use-package-modules screen)

(operating-system
 (host-name "cgit")
 (timezone "America/Chicago")
 (locale "en_US.utf8")
 
 (bootloader (bootloader-configuration
	      (bootloader grub-bootloader)
	      (target "/dev/sdX")))
 (file-systems (cons (file-system
		      (device (file-system-label "my-root"))
		      (mount-point "/")
		      (type "ext4"))
		     %base-file-systems))
 
 (users (cons (user-account
	       (name "cgit")
	       (comment "cgit")
	       (group "users")
	       (supplementary-groups '("wheel"
				       "audio"
				       "video")))
	      %base-user-accounts))
 
 (packages (cons screen %base-packages))
 
 (services (append
	    (list (service dhcp-client-service-type)
		  (service openssh-service-type
			   (openssh-configuration
			    (port-number 2222)))
		  (service cgit-service-type))
	    %base-services)))
