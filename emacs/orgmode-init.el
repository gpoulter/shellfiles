(provide 'orgmode-init)

;; See http://www.newartisans.com/blog_files/org.mode.day.planner.php

;; EmacsW32 does not have org-install
(if (not (eq window-system 'w32)) (require 'org-install))

;; Set path to organiser files 
(setq org-directory (concat "~/" (if (eq window-system 'w32) "My Documents/") "Regular/ToDo/"))

;; Calendar mode (M-x calendar)
(require 'calendar)

;; Remember Mode Configuration
(setq org-default-notes-file (concat org-directory "/Notes.org"))
(org-remember-insinuate)

;; Replace the default isearch-backward-regexp with remember function
(define-key global-map [(control meta r)] 'org-remember)

;; Recognise .org files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(defun org-previous-heading ()
  "Hide current subtree, then go to the previous one and show it."
  (interactive) (hide-subtree) (outline-previous-visible-heading 1) (show-children) (show-entry))

(defun org-next-heading ()
  "Hide current subtree, then go to the next one and show it."
  (interactive) (hide-subtree) (outline-next-visible-heading 1) (show-children) (show-entry))

(defun org-show-two-levels ()
  "Show just two levels"
  (interactive) 
  (if org-odd-levels-only (org-shifttab 3) (org-shifttab 2)))

;; Global bindings to access the organiser
(global-set-key [(control c)(l)] 'org-store-link)
(global-set-key [(control c)(a)] 'org-agenda)
(global-set-key [(control c)(b)] 'org-iswitchb)
(define-key org-mode-map [(control c)(backtab)] 'org-show-two-levels)

;; Better bindings for outline navigation on EmacsW32 and Linux
(if (eq window-system 'w32)
  (progn
    (define-key org-mode-map [(control meta up)] 'org-previous-heading)
    (define-key org-mode-map [(control meta down)] 'org-next-heading)
    (define-key org-mode-map [(control meta left)] 'hide-subtree)
    (define-key org-mode-map [(control meta right)] 'show-subtree))
  (progn
    (define-key org-mode-map [(super meta up)] 'org-previous-heading)
    (define-key org-mode-map [(super meta down)] 'org-next-heading)
    (define-key org-mode-map [(super meta left)] 'hide-subtree)
    (define-key org-mode-map [(super meta right)] 'show-subtree))
)

(define-key org-mode-map [(control c)(z)] 'org-force-cycle-archived)

;; Enable font-lock mode for org buffers
(add-hook 'org-mode-hook 'turn-on-font-lock)

