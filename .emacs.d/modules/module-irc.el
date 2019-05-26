(defun module-irc//load-erc ()
  (interactive)
  
  (require 'erc-services)
  (erc-services-mode 1)
  
  (setq erc-prompt-for-nickserv-password t)
  (setq erc-autojoin-timing 'ident)
  
  (erc :server "irc.freenode.net"
       :port 6667
       :nick "brettgilio")

  (setq erc-autojoin-channels-alist
  	'(("freenode.net"
  	   "#emacs"
  	   "##dependent"
  	   "#scheme"
  	   "#guile"
  	   "#guix"
  	   "#idris"
	   "#coq"))))

(provide 'module-irc)
