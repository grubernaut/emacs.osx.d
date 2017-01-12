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
    (insert "#"issue" - "desc" (https://github.com/hashicorp/terraform/issues/"issue") [/]")
    (insert "\n\t- [ ] Write Code")
    (insert "\n\t- [ ] Write Tests")
    (insert "\n\t- [ ] Submit PR")
    (insert "\n\t- [ ] Merge PR")
    (org-update-statistics-cookies 'ALL)
    (outline-previous-heading)
    (org-cycle)
    ))

(defun grub/org-sort-todo ()
  (interactive)
  (beginning-of-buffer)
  (org-sort-entries nil ?f #'grub/org-sort-key)
  (org-global-cycle)
  )

(defun todo-to-int (todo)
  (first (-non-nil
          (mapcar (lambda (keywords)
                    (let ((todo-seq
                           (-map (lambda (x) (first (split-string  x "(")))
                                 (rest keywords))))
                      (cl-position-if (lambda (x) (string= x todo)) todo-seq)))
                  org-todo-keywords))))

(defun grub/org-sort-key ()
  (let* ((todo-max (apply #'max (mapcar #'length org-todo-keywords)))
         (todo (org-entry-get (point) "TODO"))
         (todo-int (if todo (todo-to-int todo) todo-max))
         (priority (org-entry-get (point) "PRIORITY"))
         (priority-int (if priority (string-to-char priority) org-default-priority)))
    (format "%03d %03d" todo-int priority-int)
    ))
