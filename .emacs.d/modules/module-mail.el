(defun module-mail//load-mu ()

  (setq mu4e-sent-folder "/Posteo/Sent"
	mu4e-drafts-folder "/Posteo/Drafts"
	user-mail-address "brettg@posteo.net"
	smtpmail-default-smtp-server "posteo.de"
	smtpmail-smtp-server "posteo.de"
	smtpmail-smtp-service 587)
  
  (setq mu4e-headers-include-related nil))

(module-mail//load-mu)


(provide 'module-mail)
