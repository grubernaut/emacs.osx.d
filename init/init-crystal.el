(provide 'init-crystal)

(quelpa '(crystal-mode :url "git://github.com/jpellerin/emacs-crystal-mode.git" :fetcher git))
(autoload 'crystal-mode "crystal-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.cr\\'" . crystal-mode))
