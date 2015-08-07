(provide 'init-ruby)

(quelpa 'rbenv)
(require 'rbenv)
(global-rbenv-mode +1)
(rbenv-use-global)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(quelpa 'rspec-mode)
(quelpa 'ruby-refactor)
(quelpa 'enh-ruby-mode)
(quelpa 'rails-log-mode)
(quelpa 'rubocop)
(quelpa 'rbenv)
(quelpa 'inf-ruby)

(eval-after-load "rspec-mode"
  '(progn
     (setq rspec-use-rake-flag nil)
     (setq rspec-spec-command "rspec")
     (setq rspec-use-spring-when-possible t)))

(eval-after-load "enh-ruby-mode"
  '(progn
     '(enh-ruby-deep-indent-paren nil)
     ))
