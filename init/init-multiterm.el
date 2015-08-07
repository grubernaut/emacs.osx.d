;;; init-multiterm

(provide 'init-multiterm)

(quelpa 'multi-term)

(require 'multi-term)

;; Run ZSH instead of bash
(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))
