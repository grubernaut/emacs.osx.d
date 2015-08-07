;;; init

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

(mapc 'require
      '(
	;;; Always bootstrap first
        init-bootstrap

	;; These all use the (quelpa) form.
        init-ack
        init-ansi
        init-anzu
        init-appearance
        init-completion
        init-crontab
        init-deft
        init-defuns
        init-docker
        init-expand-region
        init-flycheck
        init-groovy
        init-haskell
        init-ido
        init-js
        init-keymaps
        init-lua
        init-magit
        init-markdown
        init-modeline
        init-multiterm
        init-neo
        init-parens
        init-php
        init-powerline
        init-projectile
        init-puppet
        init-python
        init-ruby
        init-session
        init-settings
        init-snippets
        init-yaml
        init-web
        init-winnumbers
		 ))
(require 'server)
(unless (server-running-p)
  (server-start))
(setq custom-file "~/.emacs.d/init/init-custom.el")
(load custom-file)
(eval-after-load "go-mode"
  '(progn
     (setq gofmt-command "goimports")
     ;; Run Go in Current Buffer
     (define-key go-mode-map (kbd "C-x x") 'go-run)
     (add-hook 'before-save-hook #'gofmt-before-save)))
