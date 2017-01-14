(provide 'init-flycheck)

(quelpa 'flycheck)
(add-hook 'sh-mode-hook 'flycheck-mode)
(add-hook 'json-mode-hook 'flycheck-mode)
(add-hook 'nxml-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'lisp-interaction-mode-hook 'flycheck-mode)
(add-hook 'js3-mode-hook 'flycheck-mode)
(add-hook 'enh-ruby-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(setq flycheck-indication-mode 'left-fringe)
(setq flycheck-highlighting-mode 'symbols)

;(eval-after-load 'flycheck
;  '(progn
;     (set-face-attribute 'flycheck-error nil :background "pink")
;     (set-face-attribute 'flycheck-warning nil :foreground "orange")
;     (set-face-attribute 'flycheck-info nil :foreground "cyan")))
