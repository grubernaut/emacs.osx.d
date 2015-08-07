(provide 'init-go)

(quelpa 'go-mode)
(quelpa 'go-eldoc)
(quelpa 'go-errcheck)
(quelpa 'gotest)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
