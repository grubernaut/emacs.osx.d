(provide 'init-expand-region)

(quelpa 'expand-region)

(global-set-key (kbd "<M-up>") 'er/expand-region)
(global-set-key (kbd "<M-down>") 'er/contract-region)
