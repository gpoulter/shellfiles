(provide 'functions-init)

;;;; Scroll Functions

(defun scroll-down-one ()
  "Scroll viewport down one line."
  (interactive) (scroll-down 1))

(defun scroll-up-one ()
  "Scroll viewport up one line."
  (interactive) (scroll-up 1))

(defun scroll-up-half () "Scroll viewport up half a page."
  (interactive) (scroll-up (/ (window-height) 2)))

(defun scroll-down-half ()  "Scroll viewport down half a page."
  (interactive) (scroll-down (/ (window-height) 2)))

(defun move-line-down ()
  "Move the current line down (just like in org-mode)"
  (interactive)
  (let ((col (current-column)))
    (save-excursion (next-line) (transpose-lines 1))
    (next-line)
    (move-to-column col)))

(defun move-line-up ()
  "Move the current line up (just like in org-mode)"
  (interactive)
  (let ((col (current-column)))
    (save-excursion (next-line) (transpose-lines -1))
    (move-to-column col)))

;;;; Additional Functions

(defun remove-hard-wrap () 
  "Opposite of fill-paragraph: single long line."
  (interactive) (let ((fill-column 90002000)) (fill-paragraph nil)))

(defun remove-hard-wrap-region () 
   "Opposite of fill-region: each paragraph becomes one line."
  (interactive) (let ((fill-column 90002000)) (fill-region (point) (mark))))

(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")
  (save-excursion (let ((count 0)) 
    (goto-char beginning)
    (while (and (< (point) end) 
      (re-search-forward "\\w+\\W*" end t))
      (setq count (1+ count))) 
    (cond ((zerop count) 
      (message "The region does NOT have any words."))
      ((= 1 count) (message "The region has 1 word."))
      (t (message "The region has %d words." count))))))

(defun sort-words-in-lines (start end)
  "Sort the words in a line"
   (interactive "r")
   (message "Sorting words in line ... ")
   (goto-char start)
   (beginning-of-line)
   (while (< (setq start (point)) end)
      (let ((words (sort (split-string (buffer-substring start (line-end-position)))
                         (function string-lessp))))
        (delete-region start (line-end-position))
        (dolist (word words ) (insert word " ")))
      (beginning-of-line) (forward-line 1))) 

(defun xsteve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
  (find-file
  (ido-completing-read "Recentf open: "
    (mapcar (lambda (path)
     (replace-regexp-in-string home "~" path))
     recentf-list) nil t))))

(defun insert-datetime ()
  "Insert the date and time according to `insert-date-format'."
  (interactive "*")
  (insert (format-time-string insert-datetime-format (current-time))))
(setq insert-datetime-format "[%Y-%m-%d %a %H:%M]")

(defun insert-date ()
  "Insert the day of week and date according to `insert-weekdate-format'."
  (interactive "*")
  (insert (format-time-string insert-date-format (current-time))))
(setq insert-date-format "[%Y-%m-%d %a]")

(defun insert-isodate ()
  "Insert date and time in ISO format"
  (interactive "*")
  (insert (format-time-string "%Y-%m-%dT%R%z")))

(defun fontlock-redhat-fix ()
 "Font-lock work-around for RedHat"
  (font-lock-mode)
  (turn-on-font-lock))

;; KEYBINDINGS FOR ABOVE

;; Line moving commands just like org-mode
(global-set-key [(meta down)] 'move-line-down)
(global-set-key [(meta up)] 'move-line-up)

;; Linux scroll commands for ergoemacs-colemak 
(global-set-key [(super shift n)] 'scroll-down-one)
(global-set-key [(super shift i)] 'scroll-up-one)
(global-set-key [(super shift u)] 'scroll-down-half)
(global-set-key [(super shift e)] 'scroll-up-half)

;; Function keybindings
(global-set-key [(control x)(meta w)] 'remove-hard-wrap-region)
(global-set-key [(control x)(meta c)] 'count-words-region)

;; Recentf bindings
(global-set-key [(meta f12)] 'recentf-open-files) ;; List of recent files
(global-set-key [(f12)] 'xsteve-ido-choose-from-recentf)

;; Date bindings
(global-set-key [(control c)(d)] 'insert-date)
(global-set-key [(control c)(meta d)] 'insert-datetime)

