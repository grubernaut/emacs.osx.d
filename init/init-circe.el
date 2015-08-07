(provide 'init-circe)

(quelpa 'circe)

(load-file "~/.private.el")

(setq circe-network-options
      `(("freenode"
         :nick "grubernaut"
         :channels ("#kitchenci" "#puppet" "#hangops")
         :nickserv-password ,freenode-password
         )))

(setq circe-reduce-lurker-spam t)

(eval-after-load "circe"
  '(progn
     (require 'lui-irc-colors)
     (add-to-list 'lui-pre-output-hook 'lui-irc-colors)))
