(provide 'init-go)

(quelpa 'go-mode)
(quelpa 'go-eldoc)
(quelpa 'go-errcheck)
(quelpa 'gotest)
; for gopath, and goroot
(quelpa 'exec-path-from-shell)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-copy-env "GOROOT")

; Go-test keybindings for great profit
(define-key go-mode-map (kbd "C-x f") 'go-test-current-file)
(define-key go-mode-map (kbd "C-x t") 'go-test-current-test)
(define-key go-mode-map (kbd "C-x p") 'go-test-current-project)
(define-key go-mode-map (kbd "C-x x") 'go-run)
