(provide 'init-org)

; spell check
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

; auto-load org-mode
(setq auto-mode-alist
      (cons '("\\.org" . org-mode)auto-mode-alist))

(setq org-directory "~/org")
(setq org-todo-keywords
      '((sequence "TODO"
                  "WRITE"
                  "REVIEW"
                  "PENDING" "|"
                  "DIFFERED"
                  "DELEGATED"
                  "DONE")))

(setq org-log-done 'time)

(defun grub/org-new-tf-issue ()
  (interactive)
  (let ((issue (read-string "Enter Github Issue: "))
        (desc (read-string "Enter Description: ")))
    (org-insert-todo-heading-respect-content)
    (insert " #"issue" - "desc" (https://github.com/hashicorp/terraform/issues/"issue") [/]")
    (insert "\n\t- [ ] Write Code")
    (insert "\n\t- [ ] Write Tests")
    (insert "\n\t- [ ] Submit PR")
    (insert "\n\t- [ ] Merge PR")
    (org-update-statistics-cookies 'ALL)
    (outline-previous-heading)
    (org-cycle)
  ))

(eval-after-load "org-mode"
  '(progn
     (define-key org-mode-map (kbd "C-x RET") 'grub/org-new-tf-issue)))
