(provide 'init-ido)

(quelpa 'ido-vertical-mode)
(quelpa 'ido-ubiquitous)
(quelpa 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; (quelpa 'ido-hacks)
;; (quelpa '(flx :repo "mbriggs/flx" :fetcher github))
(quelpa '(flx :repo "lewang/flx" :fetcher github :branch "fix-ido-not-narrowing"))

(require 'ido)
;; (require 'ido-hacks)


;;; flx
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(setq flx-ido-threshhold 500)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
;; set gc threshold to 20mb
(setq gc-cons-threshold 20000000)


(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
            (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-p") 'ido-prev-match)
            (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)))


(require 'ido-ubiquitous)
(ido-vertical-mode 1)
(ido-mode t)
;; (ido-hacks-mode 1)
(ido-ubiquitous-initialize)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)
