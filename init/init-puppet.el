(provide 'init-puppet)

(quelpa 'puppet-mode)
(quelpa 'flymake-puppet)

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet code." t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(require 'flymake-puppet)
(add-hook 'puppet-mode-hook (lambda () (flymake-puppet-load)))
