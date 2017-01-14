(provide 'init-magit)

(quelpa 'magit)
(quelpa 'yagist)
(quelpa 'diff-hl)
(quelpa 'git-gutter)

(global-set-key (kbd "<f1>") 'magit-status)
(global-diff-hl-mode +1)

(global-git-gutter-mode +1)
(git-gutter:linum-setup)

(defun magit-cursor-fix ()
  (beginning-of-buffer)
  (when (looking-at "#")
    (forward-line 2)))
(add-hook 'git-commit-mode-hook 'magit-cursor-fix)
