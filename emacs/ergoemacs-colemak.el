;-*- coding: utf-8 -*-
;; ergonomic_keybinding_colemak.el -- A ergonomic keybinding for colemak keyboard.

;; Copyright © 2007, 2008 by Xah Lee

;; Author: Xah Lee ( http://xahlee.org/ ); 
;; Colemak remapping: Ivan Haralamov ( postivan@gmail.com )
;; Keywords: qwerty, dvorak, colemak, keybinding, ergonomic

;; You can redistribute this program and/or modify it under the terms
;; of the GNU General Public License as published by the Free Software
;; Foundation; either version 2, or (at your option) any later
;; version.

;;; DESCRIPTION

;; This keybinding set puts the most frequently used emacs keyboard
;; shortcuts into the most easy-to-type spots.
;;
;; For complete detail, see: 
;; http://xahlee.org/emacs/ergonomic_emacs_keybinding.html

;;; INSTALL

;; Place this file in your favorite directory, such as “~/emacs/”.
;; Then, place the following code in your emacs init file (the "~/.emacs"):
;; (load-file "~/emacs/ergonomic_keybinding_qwerty.el")
;; ; or 
;; (load-file "~/emacs/ergonomic_keybinding_dvorak.el")
;; Then, restart emacs.

;;; History:

;-*- coding: utf-8 -*-

;; version 4.3.6 2009-06-16 Merged changes from Ergoemacs Qwerty 4.3.6 into Ergoemacs Colemak 4.1.7, by Graham Poulter.

;; version 4.1.7, 2008-12-10 Made compact-uncompact-block to work on text selection if there's one.

;; version 4.1.6, 2008-12-09. Added select-text-in-quote.

;; version 4.1.5, 2008-10-21. Added extend-selection by Nikolaj Schumacher.

;; version 4.1.4, 2008-10-20. Fixed close-current-buffer: sometimes when closing a buffer not associated with a file, it'll prompt whether to kill instead of whether to save.

;; version 4.1.3, 2008-10-18. Fixed minor bug in toggle-letter-case. It now works non-english letters such as éÉ and single letter word “a teapot” or words starting with a number “1st timer”. Thanks to Andreas Politz and Nikolaj Schumacher. • next-frame-command is renamed to switch-to-next-frame. Similar for previous-frame-command.

;; version 4.1.2, 2008-10-16. Removed C-x h for mark-whole-buffer. (use Ctrl+a instead) Improved compact-uncompact-block and shrink-whitespaces.

;; version 4.1.1, 2008-10-07. Removed unfill-paragraph and unfill-region because they are defined in ourcomments-util.el bundled with emacs 22, also because they are not used in this file now (compact-uncompact-block replaced most of their functionality).

;; version 4.1, 2008-10-06. Added keys for previous-user-buffer, next-user-buffer, next-frame-command, previous-frame-command, query-replace and query-replace-regexp, move-cursor-to-next-pane, move-cursor-to-previous-pane, split-window-horizontally, toggle-letter-case. Combined delete-blank-lines and just-one-space to shrink-whitespaces. Moved delete-window to be with delete-other-window.

;; version 4.0.1, 2008-09-23. Fixed C-o in dired mode.

;; version 4, 2008-09-21. Unbind almost all Meta-‹key› and Ctrl-‹key› space bindings. Added about 11 commands, such as next-user-buffer, close-current-buffer etc.

;; version 3.6, 2008-09-18. Reclaimed keybindings in text-mode.

;; version 3.5, 2008-09-16. Reclaimed keybindings in ibuffer.

;; version 3.4, 2008-09-06. Fixed key bindings in the Meta-‹key› space in about 10 modes.

;; version 3.3, 2008-09-05. Fixed cua-mode-hook by setting symbol property 'CUA to nil, so that a bunch of no-select-* functions kludge is no longer needed. Thanks to Lennart Borgman.

;; version 3.2, 2008-09-02. Moved cua fix functions to modern_operations.el. The functinos are: no-select-cua-scroll-down, no-select-cua-scroll-up, no-select-backward-paragraph, no-select-forward-paragraph, no-select-beginning-of-buffer, no-select-end-of-buffer, no-select-move-end-of-line.

;; version 3.1, 2008-09-02. Added just-one-space, delete-blank-lines. Added fill-paragraph, unfill-paragraph. Added comment-dwim.

;; version 3, 2008-08-31. Added isearch. Added redo, kill-line-backward, shell-command. Added bug fix for cua-mode. Now, commands with Shift keys won't go into a selection mode.

;; version 2, 2008-08-29. Somewhat major change. Positions for undo, cut, copy, paste, paste previous, has been moved. Added delete-char, delete-backward-char, kill-word, backward-kill-word. Removed the now redundant binding of kill-word and backward-kill-word using the backspace key. Removed the other-frame binding.

;; version 1.1, 2007-12-18. changed keycode to consistantly use kbd syntax. Fixed a scroll-up and scroll-down mixup.

;; version 1.0, 2007-08-01. first version.


;;; Code:

;; --------------------------------------------------
;;; UNBIND DEFAULT KEYS

;-*- coding: utf-8 -*-
(global-unset-key (kbd "M-1")) ; digit-argument
(global-unset-key (kbd "M-2")) ; digit-argument
(global-unset-key (kbd "M-3")) ; digit-argument
(global-unset-key (kbd "M-4")) ; digit-argument
(global-unset-key (kbd "M-5")) ; digit-argument
(global-unset-key (kbd "M-6")) ; digit-argument
(global-unset-key (kbd "M-7")) ; digit-argument
(global-unset-key (kbd "M-8")) ; digit-argument
(global-unset-key (kbd "M-9")) ; digit-argument
(global-unset-key (kbd "M-0")) ; digit-argument

(global-unset-key (kbd "M-a")) ; backward-sentence
(global-unset-key (kbd "M-b")) ; backward-word
(global-unset-key (kbd "M-c")) ; capitalize-word
(global-unset-key (kbd "M-d")) ; kill-word
(global-unset-key (kbd "M-e")) ; forward-sentence
(global-unset-key (kbd "M-f")) ; forward-word
(global-unset-key (kbd "M-g")) ; (prefix)
(global-unset-key (kbd "M-h")) ; mark-paragraph
(global-unset-key (kbd "M-i")) ; tab-to-tab-stop
(global-unset-key (kbd "M-j")) ; indent-new-comment-line
(global-unset-key (kbd "M-k")) ; kill-sentence
(global-unset-key (kbd "M-l")) ; downcase-word
(global-unset-key (kbd "M-m")) ; back-to-indentation
(global-unset-key (kbd "M-n")) ; nil
(global-unset-key (kbd "M-o")) ; nil
(global-unset-key (kbd "M-p")) ; nil
(global-unset-key (kbd "M-q")) ; fill-paragraph
(global-unset-key (kbd "M-r")) ; move-to-window-line
(global-unset-key (kbd "M-s")) ; nil
(global-unset-key (kbd "M-t")) ; transpose-words
(global-unset-key (kbd "M-u")) ; upcase-word
(global-unset-key (kbd "M-v")) ; scroll-down
(global-unset-key (kbd "M-w")) ; kill-ring-save
(global-unset-key (kbd "M-x")) ; execute-extended-command
(global-unset-key (kbd "M-y")) ; yank-pop
(global-unset-key (kbd "M-z")) ; zap-to-char

(global-unset-key (kbd "M-\\")) ; delete-horizontal-space
(global-unset-key (kbd "M-@")) ; mark-word
(global-unset-key (kbd "M--")) ; negative-argument
(global-unset-key (kbd "M-<")) ; beginning-of-buffer
(global-unset-key (kbd "M->")) ; end-of-buffer

(global-unset-key (kbd "C-1")) ; digit-argument
(global-unset-key (kbd "C-2")) ; digit-argument
(global-unset-key (kbd "C-3")) ; digit-argument
(global-unset-key (kbd "C-4")) ; digit-argument
(global-unset-key (kbd "C-5")) ; digit-argument
(global-unset-key (kbd "C-6")) ; digit-argument
(global-unset-key (kbd "C-7")) ; digit-argument
(global-unset-key (kbd "C-8")) ; digit-argument
(global-unset-key (kbd "C-9")) ; digit-argument
(global-unset-key (kbd "C-0")) ; digit-argument

(global-unset-key (kbd "C-a")) ; move-beginning-of-line
(global-unset-key (kbd "C-b")) ; backward-char
;(global-unset-key (kbd "C-c")) ; (prefix)
(global-unset-key (kbd "C-d")) ; delete-char
(global-unset-key (kbd "C-e")) ; move-end-of-line
(global-unset-key (kbd "C-f")) ; forward-char
;(global-unset-key (kbd "C-g")) ; keyboard-quit
;(global-unset-key (kbd "C-h")) ; (prefix)
;(global-unset-key (kbd "C-i")) ; indent-for-tab-command; this is tab key
(global-unset-key (kbd "C-j")) ; newline-and-indent
(global-unset-key (kbd "C-k")) ; kill-line
(global-unset-key (kbd "C-l")) ; recenter
;(global-unset-key (kbd "C-m")) ; newline-and-indent; This is the Return key
(global-unset-key (kbd "C-n")) ; next-line
(global-unset-key (kbd "C-o")) ; open-line
(global-unset-key (kbd "C-p")) ; previous-line
;(global-unset-key (kbd "C-q")) ; quote-insert
(global-unset-key (kbd "C-r")) ; isearch-backward
(global-unset-key (kbd "C-s")) ; isearch-forward
(global-unset-key (kbd "C-t")) ; transpose-chars
;(global-unset-key (kbd "C-u")) ; universal-argument
(global-unset-key (kbd "C-v")) ; scroll-up
(global-unset-key (kbd "C-w")) ; kill-region
;(global-unset-key (kbd "C-x")) ; (prefix)
(global-unset-key (kbd "C-y")) ; yank
(global-unset-key (kbd "C-z")) ; iconify-or-deiconify-frame

(global-unset-key (kbd "C-/")) ; undo
(global-unset-key (kbd "C-_")) ; undo
(global-unset-key (kbd "C-<backspace>")) ; backward-kill-word

(global-unset-key (kbd "C-<prior>")) ; scroll-right
(global-unset-key (kbd "C-<next>")) ; scroll-left

(global-unset-key (kbd "C-x h")) ; mark-whole-buffer

(global-unset-key (kbd "C-x C-f")) ; find-file
(global-unset-key (kbd "C-x d")) ; dired
(global-unset-key (kbd "C-x C-d")) ; list-directory

(global-unset-key (kbd "C-x C-s")) ; save-buffer

(global-unset-key (kbd "C-x 0")) ; delete-window
(global-unset-key (kbd "C-x 1")) ; delete-other-windows
(global-unset-key (kbd "C-x o")) ; other-windows

(global-unset-key (kbd "C-x 5 0")) ; delete-frame
(global-unset-key (kbd "C-x 5 2")) ; make-frame-command

(global-unset-key (kbd "C-x 2")) ; split-window-vertically
(global-unset-key (kbd "C-x C-w")) ; write-file


;;; --------------------------------------------------
;;; CURSOR MOVEMENTS

;; Single char cursor movement
(global-set-key (kbd "M-n") 'backward-char)
(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-u") 'previous-line)
(global-set-key (kbd "M-e") 'next-line)

;; Move by word
(global-set-key (kbd "M-l") 'backward-word)
(global-set-key (kbd "M-y") 'forward-word) ; was (prefix)

;; Move by paragraph
(global-set-key (kbd "M-L") 'backward-paragraph)
(global-set-key (kbd "M-Y") 'forward-paragraph)

;; Move to beginning/ending of line
(global-set-key (kbd "M-h") 'move-beginning-of-line)
(global-set-key (kbd "M-H") 'move-end-of-line)

;; Move by screen (page up/down)
(global-set-key (kbd "M-U") 'scroll-down)
(global-set-key (kbd "M-E") 'scroll-up)

;; Move to beginning/ending of file
(global-set-key (kbd "M-N") 'beginning-of-buffer)
(global-set-key (kbd "M-I") 'end-of-buffer)

;; isearch
(global-set-key (kbd "M-o") 'isearch-forward)
(global-set-key (kbd "M-O") 'isearch-backward)

(global-set-key (kbd "M-;") 'recenter)


;;; MAJOR EDITING COMMANDS

;; Delete previous/next char.
(global-set-key (kbd "M-s") 'delete-backward-char)
(global-set-key (kbd "M-t") 'delete-char)

; Delete previous/next word.
(global-set-key (kbd "M-f") 'backward-kill-word)
(global-set-key (kbd "M-p") 'kill-word)

; Copy Cut Paste, Paste previous
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-V") 'yank-pop)

; Undo and redo
(global-set-key (kbd "M-Z") 'redo)
(global-set-key (kbd "M-z") 'undo)

; Kill line
(global-set-key (kbd "M-d") 'kill-line)
(global-set-key (kbd "M-D") 'kill-line-backward)

;;; Textual Transformation

(global-set-key (kbd "M-S-SPC") 'mark-paragraph)
(global-set-key (kbd "M-w") 'shrink-whitespaces)
(global-set-key (kbd "M-'") 'comment-dwim)
(global-set-key (kbd "M-/") 'toggle-letter-case)

; keyword completion, because Alt+Tab is used by OS
(global-set-key (kbd "M-g") 'call-keyword-completion) 

; Hard-wrap/un-hard-wrap paragraph
(global-set-key (kbd "M-q") 'compact-uncompact-block)


;;; EMACS'S SPECIAL COMMANDS

; Mark point.
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "M-a") 'execute-extended-command)
(global-set-key (kbd "M-A") 'shell-command)

;;; WINDOW SPLITING
(global-set-key (kbd "M-r") 'move-cursor-next-pane)
(global-set-key (kbd "M-R") 'move-cursor-previous-pane)

;;; --------------------------------------------------
;;; STANDARD SHORTCUTS

;-*- coding: utf-8 -*-

(setq mac-pass-command-to-system nil) ; so that Cmd+H won't activate Hide Current App and Cmd+Shift+q won't logout user.

(global-set-key (kbd "C-n") 'new-empty-buffer) ; Open New File
(global-set-key (kbd "C-o") 'find-file) ; Open
(global-set-key (kbd "C-w") 'close-current-buffer) ; Close
(global-set-key (kbd "C-s") 'save-buffer) ; Save
(global-set-key (kbd "C-S-n") 'write-file) ; Save As.
(global-set-key (kbd "C-p") 'print-buffer) ; Print
(global-set-key (kbd "C-a") 'mark-whole-buffer) ; Select All

(global-set-key (kbd "<delete>") 'delete-char) ; the Del key for forward delete. Needed if C-d is set to nil.

(global-set-key (kbd "M-~") 'switch-to-previous-frame)
(global-set-key (kbd "M-`") 'switch-to-next-frame)

(global-set-key (kbd "C-<left>") 'previous-user-buffer)
(global-set-key (kbd "C-<right>") 'next-user-buffer)

(global-set-key (kbd "C-S-<left>") 'previous-emacs-buffer)
(global-set-key (kbd "C-S-<right>") 'next-emacs-buffer)

(global-set-key (kbd "M-5") 'query-replace)
(global-set-key (kbd "M-%") 'query-replace-regexp)

(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-!") 'delete-window)

(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-@") 'split-window-horizontally)

(global-set-key (kbd "M-8") 'extend-selection)
(global-set-key (kbd "M-*") 'select-text-in-quote)

(add-hook 'w3m-mode-hook
 (lambda ()
  (define-key w3m-mode-map (kbd "<up>") 'previous-line) ; was w3m-previous-anchor. Use Shift+Tab.
  (define-key w3m-mode-map (kbd "<down>") 'next-line) ; was w3m-next-anchor. Use Tab.
  (define-key w3m-mode-map (kbd "<left>") 'backward-char) ; was w3m-view-previous-page. Use B.
  (define-key w3m-mode-map (kbd "<right>") 'forward-char) ; was w3m-view-this-url. Use Enter.
))


(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "C-o") 'find-file) ; was dired-display-file
 ))


;;; --------------------------------------------------
;;; RECLAIM SOME BINDINGS

;; isearch
(add-hook 'isearch-mode-hook
 (lambda ()
 (define-key isearch-mode-map (kbd "M-o") 'isearch-repeat-forward)
 (define-key isearch-mode-map (kbd "M-O") 'isearch-repeat-backward)

 (define-key isearch-mode-map (kbd "M-p") 'recenter) ; was isearch-ring-retreat
 (define-key isearch-mode-map (kbd "M-n") 'nil) ; was isearch-ring-advance
 (define-key isearch-mode-map (kbd "<f11>") 'isearch-ring-retreat)
 (define-key isearch-mode-map (kbd "<f12>") 'isearch-ring-advance)

 (define-key isearch-mode-map (kbd "M-y") 'nil) ; was isearch-yank-kill

 (define-key isearch-mode-map (kbd "M-c") 'kill-ring-save) ; was isearch-toggle-case-fold
 (define-key isearch-mode-map (kbd "M-r") 'kill-word) ; was isearch-toggle-regexp
 (define-key isearch-mode-map (kbd "M-e") 'backward-kill-word) ; was isearch-edit-string
 )
)

;; reclaim some bindings used in minibuffer
(define-key minibuffer-local-map (kbd "M-p") 'recenter) ; was previous-history-element. Use ↑ key or f11.
(define-key minibuffer-local-map (kbd "M-n") 'nil) ; was next-history-element. Use ↓ key or f12.
(define-key minibuffer-local-map (kbd "M-r") 'kill-word) ; was previous-matching-history-element.
(define-key minibuffer-local-map (kbd "M-s") 'other-window) ; was nest-matching-history-element

(define-key minibuffer-local-map (kbd "<f11>") 'previous-history-element)
(define-key minibuffer-local-map (kbd "<f12>") 'next-history-element)
(define-key minibuffer-local-map (kbd "S-<f11>") 'previous-matching-history-element)
(define-key minibuffer-local-map (kbd "S-<f12>") 'next-matching-history-element)

;; reclaim some binding used by shell mode and shell-command.
;; the shell mode and associated mode and commands use keys in comint-mode-map.
(add-hook 'comint-mode-hook
 (lambda ()
   (define-key comint-mode-map (kbd "M-p") 'recenter) ; was comint-previous-input. Use Ctrl+↑ or f11
   (define-key comint-mode-map (kbd "M-n") 'nil) ; was comint-next-input. Use Ctrl+↓ or f12
   (define-key comint-mode-map (kbd "M-r") 'kill-word) ; was comint-previous-matching-input.
   (define-key comint-mode-map (kbd "M-s") 'other-window) ; was comint-next-matching-input.

   (define-key comint-mode-map (kbd "<f11>") 'comint-previous-input)
   (define-key comint-mode-map (kbd "<f12>") 'comint-next-input)
   (define-key comint-mode-map (kbd "S-<f11>") 'comint-previous-matching-input)
   (define-key comint-mode-map (kbd "S-<f12>") 'comint-next-matching-input)
))

(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "C-n") 'new-empty-buffer) ; was dired-next-line
  (define-key dired-mode-map (kbd "M-o") 'forward-word) ; was dired-omit-mode
 ))

(add-hook 'Info-mode-hook
 (lambda ()
 (define-key Info-mode-map (kbd "M-n") 'nil) ; was clone-buffer
 (define-key Info-mode-map (kbd "M-s") 'other-window) ; was Info-search; just press “s” instead for isearch-forward
 )
)

(add-hook 'text-mode-hook
 (lambda ()
 (define-key text-mode-map (kbd "M-s") 'other-window) ; was center-line
 (define-key text-mode-map (kbd "M-S") 'nil) ; was center-paragraph
 )
)

;; prevent cua-mode from going into selection mode when commands with Shift key is used.
(add-hook 'cua-mode-hook
 (lambda ()
    (put 'cua-scroll-down 'CUA nil)
    (put 'cua-scroll-up 'CUA nil)
    (put 'backward-paragraph 'CUA nil)
    (put 'forward-paragraph 'CUA nil)
    (put 'beginning-of-buffer 'CUA nil)
    (put 'end-of-buffer 'CUA nil)
    (put 'move-end-of-line 'CUA nil)
   )
 )


;; reclaim some binding used by ibuffer.el
(add-hook 'ibuffer-mode-hook
 (lambda ()
   (define-key ibuffer-mode-map (kbd "M-m") 'kill-line) ; was ibuffer-jump-to-buffer. Use “j” instead.
   (define-key ibuffer-mode-map (kbd "M-;") 'recenter) ; was ibuffer-backward-filter-group Use “←” instead.
   (define-key ibuffer-mode-map (kbd "M-k") 'nil) ; was ibuffer-forward-filter-group. Use “→” instead.
   (define-key ibuffer-mode-map (kbd "M-n") 'backward-char) ; was ibuffer-jump-to-filter-group.
   (define-key ibuffer-mode-map (kbd "M-y") 'forward-word) ; was ibuffer-visit-buffer-1-window
))

(add-hook 'html-mode-hook
 (lambda ()
 (define-key html-mode-map (kbd "M-s") 'other-window)
 )
)

(add-hook 'nxml-mode-hook
 (lambda ()
 (define-key nxml-mode-map (kbd "M-h") 'move-beginning-of-line) ; was nxml-mark-paragraph
 (define-key nxml-mode-map (kbd "C-M-SPC") 'nxml-mark-paragraph)
 )
)

(add-hook 'w3m-mode-hook
 (lambda ()
  (define-key w3m-mode-map (kbd "M-a") 'execute-extended-command) ; was w3m-bookmark-add-this-url
  (define-key w3m-mode-map (kbd "M-m") 'kill-line)
  (define-key w3m-mode-map (kbd "M-n") 'nil) ; was w3m-copy-buffer
  (define-key w3m-mode-map (kbd "M-l") 'forward-char) ; was w3m-horizontal-recenter

  (define-key w3m-mode-map (kbd "M-i") 'previous-line) ; was w3m-save-image
  (define-key w3m-mode-map (kbd "M-k") 'next-line) ; was w3m-cookie
))

(add-hook 'rcirc-mode-hook
 (lambda ()
  (define-key rcirc-mode-map (kbd "M-;") 'recenter) ; was rcirc-insert-prev-input
  (define-key rcirc-mode-map (kbd "M-k") 'nil) ; was rcirc-insert-next-input
  (define-key rcirc-mode-map (kbd "<f11>") 'rcirc-insert-next-input)
  (define-key rcirc-mode-map (kbd "<f12>") 'rcirc-insert-prev-input)
 ))

(add-hook 'awk-mode-hook
 (lambda ()
  (define-key awk-mode-map (kbd "M-a") 'execute-extended-command) ; was c-beginning-of-statement
  (define-key awk-mode-map (kbd "M-e") 'backward-kill-word) ; was c-end-of-statement
 ))

;; nothing to fix: c-mode, c++-mode, java, sh, js, perl, php, python

;;; --------------------------------------------------
;;; FUNCTIONS

;-*- coding: utf-8 -*-

(require 'redo "redo.elc" t) ; for redo shortcut

(delete-selection-mode t) ; turn on text selection highlighting and make typing override selected text (Note: when delete-selection-mode is on, then transient-mark-mode is automatically on too.)

(defun call-keyword-completion ()
  "Call the command that has keyboard shortcut M-TAB."
  (interactive)
  (call-interactively (key-binding (kbd "M-TAB")))
)

(defun describe-major-mode ()
  "Show inline doc for current major-mode."
  ;; code by Kevin Rodgers. 2009-02-25
  (interactive)
  (describe-function major-mode))

(defun copy-all ()
  "Put the whole buffer content into the kill-ring.
If narrow-to-region is in effect, then copy that region only."
  (interactive)
  (kill-ring-save (point-min) (point-max))
  (message "Buffer content copied")
  )

(defun cut-all ()
  "Cut the whole buffer content into the kill-ring.
If narrow-to-region is in effect, then cut that region only."
  (interactive)
  (kill-region (point-min) (point-max))
  (message "Buffer content cut")
  )

;;; TEXT SELECTION RELATED

(defun select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters are paired characters: ()[]<>«»“”‘’「」, including \"\"."
 (interactive)
 (let (b1 b2)
   (skip-chars-backward "^<>(“{[「«\"‘")
   (setq b1 (point))
   (skip-chars-forward "^<>)”}]」»\"’")
   (setq b2 (point))
   (set-mark b1)
   )
 )

;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun semnav-up (arg)
  (interactive "p")
  (when (nth 3 (syntax-ppss))
    (if (> arg 0)
        (progn
          (skip-syntax-forward "^\"")
          (goto-char (1+ (point)))
          (decf arg))
      (skip-syntax-backward "^\"")
      (goto-char (1- (point)))
      (incf arg)))
  (up-list arg))

;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun extend-selection (arg &optional incremental)
  "Select the current word.
Subsequent calls expands the selection to larger semantic unit."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (or (and transient-mark-mode mark-active)
                         (eq last-command this-command))))
  (if incremental
      (progn
        (semnav-up (- arg))
        (forward-sexp)
        (mark-sexp -1))
    (if (> arg 1)
        (extend-selection (1- arg) t)
      (if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
          (goto-char (match-end 0))
        (unless (memq (char-before) '(?\) ?\"))
          (forward-sexp)))
      (mark-sexp -1))))

;;; TEXT TRANSFORMATION RELATED

(defun kill-line-backward ()
  "Kill text between the beginning of the line to the cursor position.
If there's no text, delete the previous line ending."
  (interactive)
  (if (looking-back "\n")
      (delete-char -1)
    (kill-line 0)
    )
  )

(defun move-cursor-next-pane ()
  "Move cursor to the next pane."
  (interactive)
  (other-window 1)
  )

(defun move-cursor-previous-pane ()
  "Move cursor to the previous pane."
  (interactive)
  (other-window -1)
  )

(defun compact-uncompact-block ()
  "Remove or add line endings on the current block of text.
This is similar to a toggle for fill-paragraph and unfill-paragraph
When there is a text selection, act on the region.

When in text mode, a paragraph is considerd a block. When in programing
language mode, the block defined by between empty lines.

Todo: The programing language behavior is currently not done.
Right now, the code uses fill* functions, so does not work or work well
in programing lang modes. A proper implementation to compact is replacing
EOL chars by space when the EOL char is not inside string.
"
  (interactive)

  ;; This command symbol has a property “'stateIsCompact-p”, the
  ;; possible values are t and nil. This property is used to easily
  ;; determine whether to compact or uncompact, when this command is
  ;; called again

  (let (bds currentLineCharCount currentStateIsCompact
            (bigFillColumnVal 4333999) (deactivate-mark nil))

    (save-excursion
      ;; currentLineCharCount is used to determine whether current state
      ;; is compact or not, when the command is run for the first time
      (setq currentLineCharCount
            (progn
              (setq bds (bounds-of-thing-at-point 'line))
              (length (buffer-substring-no-properties (car bds) (cdr bds)))    
              ;; Note: 'line includes eol if it is not buffer's last line
              )
            )

      ;; Determine whether the text is currently compact.  when the last
      ;; command is this, then symbol property easily tells, but when
      ;; this command is used fresh, right now we use num of chars of
      ;; the cursor line as a way to define current compatness state
      (setq currentStateIsCompact
            (if (eq last-command this-command)
                (get this-command 'stateIsCompact-p)
              (if (> currentLineCharCount fill-column) t nil)
              )
            )

      (if (and transient-mark-mode mark-active)
          (if currentStateIsCompact
              (fill-region (region-beginning) (region-end))
            (let ((fill-column bigFillColumnVal))
              (fill-region (region-beginning) (region-end)))
            )
        (if currentStateIsCompact
            (fill-paragraph nil)
          (let ((fill-column bigFillColumnVal))
            (fill-paragraph nil))
          )
        )

      (put this-command 'stateIsCompact-p (if currentStateIsCompact
                                              nil t)) ) ) )


(defun shrink-whitespaces ()
  "Remove white spaces around cursor to just one or none.
If current line contains non-white space chars, then shrink any whitespace char surrounding cursor to just one space.
If current line does not contain non-white space chars, then remove blank lines to just one."
  (interactive)
  (let (
        cursor-point
        line-has-meat-p  ; current line contains non-white space chars
        spaceTabNeighbor-p
        whitespace-begin whitespace-end
        space-or-tab-begin space-or-tab-end
        line-begin-pos line-end-pos
        )
    (save-excursion
      ;; todo: might consider whitespace as defined by syntax table, and also consider whitespace chars in unicode if syntax table doesn't already considered it.
      (setq cursor-point (point))

      (setq spaceTabNeighbor-p (if (or (looking-at " \\|\t") (looking-back " \\|\t")) t nil) )
      (move-beginning-of-line 1) (setq line-begin-pos (point) )
      (move-end-of-line 1) (setq line-end-pos (point) )
      ;;       (re-search-backward "\n$") (setq line-begin-pos (point) )
      ;;       (re-search-forward "\n$") (setq line-end-pos (point) )
      (setq line-has-meat-p (if (< 0 (count-matches "[[:graph:]]" line-begin-pos line-end-pos)) t nil) )
      (goto-char cursor-point)

      (skip-chars-backward "\t ")
      (setq space-or-tab-begin (point))

      (skip-chars-backward "\t \n")
      (setq whitespace-begin (point))

      (goto-char cursor-point)      (skip-chars-forward "\t ")
      (setq space-or-tab-end (point))
      (skip-chars-forward "\t \n")
      (setq whitespace-end (point))
      )


    (if line-has-meat-p
        (progn 
          (when spaceTabNeighbor-p
            (delete-region space-or-tab-begin space-or-tab-end)
            (insert " "))
          )

      (progn
;;         (delete-region whitespace-begin whitespace-end)
;;         (insert "\n")
        (delete-blank-lines)
        )
      ;; todo: possibly code my own delete-blank-lines here for better efficiency, because delete-blank-lines seems complex.
      )
    )
  )

(defun toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Toggles from 3 cases: UPPER CASE, lower case, Title Case,
in that cyclic order."
(interactive)
(let (pos1 pos2 (deactivate-mark nil) (case-fold-search nil))
  (if (and transient-mark-mode mark-active)
      (setq pos1 (region-beginning)
            pos2 (region-end))
    (setq pos1 (car (bounds-of-thing-at-point 'word))
          pos2 (cdr (bounds-of-thing-at-point 'word))))

  (when (not (eq last-command this-command))
    (save-excursion
      (goto-char pos1)
      (cond
       ((looking-at "[[:lower:]][[:lower:]]") (put this-command 'state "all lower"))
       ((looking-at "[[:upper:]][[:upper:]]") (put this-command 'state "all caps") )
       ((looking-at "[[:upper:]][[:lower:]]") (put this-command 'state "init caps") )
       (t (put this-command 'state "all lower") )
       )
      )
    )

  (cond
   ((string= "all lower" (get this-command 'state))
    (upcase-initials-region pos1 pos2) (put this-command 'state "init caps"))
   ((string= "init caps" (get this-command 'state))
    (upcase-region pos1 pos2) (put this-command 'state "all caps"))
   ((string= "all caps" (get this-command 'state))
    (downcase-region pos1 pos2) (put this-command 'state "all lower"))
   )
)
)

;;; FRAME

(defun switch-to-next-frame ()
  "Select the next frame on current display, and raise it."
  (interactive)
  (other-frame 1)
  )

(defun switch-to-previous-frame ()
  "Select the previous frame on current display, and raise it."
  (interactive)
  (other-frame -1)
  )

;;; BUFFER RELATED

(defun next-user-buffer ()
  "Switch to the next user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer in cyclic order.\n
Emacs buffers are those starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer in cyclic order.\n
Emacs buffers are those starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun new-empty-buffer ()
  "Opens a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))
;; note: emacs won't offer to save a buffer that's
;; not associated with a file,
;; even if buffer-modified-p is true.
;; One work around is to define your own my-kill-buffer function
;; that wraps around kill-buffer, and check on the buffer modification
;; status to offer save
;; This custome kill buffer is close-current-buffer.


(defvar recently-closed-buffers (cons nil nil) "A list of recently closed buffers. The max number to track is controlled by the variable recently-closed-buffers-max.")
(defvar recently-closed-buffers-max 10 "The maximum length for recently-closed-buffers.")

(defun close-current-buffer ()
"Close the current buffer.

Similar to (kill-buffer (current-buffer)) with the following addition:

• prompt user to save if the buffer has been modified even if the buffer is not associated with a file.
• make sure the buffer shown after closing is a user buffer.
• if the buffer is a file, add the path to the list recently-closed-buffers.

A emacs buffer is one who's name starts with *.
Else it is a user buffer."
 (interactive)
 (let (emacsBuff-p isEmacsBufferAfter)
   (if (string-match "^*" (buffer-name))
       (setq emacsBuff-p t)
     (setq emacsBuff-p nil))

   ;; offer to save buffers that are non-empty and modified, even for non-file visiting buffer. (because kill-buffer does not offer to save buffers that are not associated with files)
   (when (and (buffer-modified-p)
              (not emacsBuff-p)
              (not (string-equal major-mode "dired-mode"))
              (if (equal (buffer-file-name) nil) 
                  (if (string-equal "" (save-restriction (widen) (buffer-string))) nil t)
                t
                )
              )
     (if (y-or-n-p
            (concat "Buffer " (buffer-name) " modified; Do you want to save?"))
       (save-buffer)
       (set-buffer-modified-p nil)))

   ;; save to a list of closed buffer
   (when (not (equal buffer-file-name nil))
     (setq recently-closed-buffers
           (cons (cons (buffer-name) (buffer-file-name)) recently-closed-buffers))
     (when (> (length recently-closed-buffers) recently-closed-buffers-max)
           (setq recently-closed-buffers (butlast recently-closed-buffers 1))
           )
     )

   ;; close
   (kill-buffer (current-buffer))

   ;; if emacs buffer, switch to a user buffer
   (if (string-match "^*" (buffer-name))
       (setq isEmacsBufferAfter t)
     (setq isEmacsBufferAfter nil))
   (when isEmacsBufferAfter
     (previous-user-buffer)
     )
   )
 )

;; GRAHAM'S MODIFICATIONS

; With only the left-alt key, M-d on Colemak (M-g on QWERTY) is hard to do.
(global-set-key (kbd "M-k") 'kill-line) ;was M-d
(global-set-key (kbd "M-K") 'kill-line-backward) ;was M-D

; Indenting newline (was C-j), because C-m is plain newline
(global-set-key (kbd "M-m") 'newline-and-indent)

; Make plain old fill-paragraph available again (M-q does/undoes it)
(global-set-key (kbd "M-Q") 'fill-paragraph)

; Exit isearch without inconvenient C-g
(add-hook 'isearch-mode-hook
 (lambda ()
 (define-key isearch-mode-map (kbd "M-b") 'isearch-abort)
 )
)
