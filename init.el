;;; init


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

(mapc 'require
      '(
	;;; Always bootstrap first
        init-bootstrap

	;; These all use the (quelpa) form.
        init-ack
        init-anzu
        init-appearance
        init-completion
        init-crontab
        init-deft
        init-defuns
        init-docker
        init-expand-region
        init-flycheck
        init-go
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
        init-org
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
        init-tf
        init-yaml
        init-web
        init-winnumbers
		 ))
(require 'server)
(unless (server-running-p)
  (server-start))
(setq custom-file "~/.emacs.d/init/init-custom.el")
(load custom-file)
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(eval-after-load "go-mode"
  '(progn
     (setq gofmt-command "goimports")))
;     (add-hook 'before-save-hook 'gofmt-before-save)

(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "C-x RET") 'grub/org-new-tf-issue)
     (define-key org-mode-map (kbd "C-x k") 'grub/org-sort-todo)))
