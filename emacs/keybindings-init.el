(provide 'keybindings-init)

;; Linux bindings of some EmacsW32 features
(if (not (eq window-system 'w32)) (progn

 ;; Better frame title (an option in EmacsW32)
 (setq frame-title-format (concat  "%b - emacs@" system-name))

 ;; Emacs server (already done in EmacsW32)
 (add-hook 'after-init-hook 'server-start)

 ;; ido-mode (imitate EmacsW32)
 (if (boundp 'ido-mode) (ido-mode))

 ;; Move window to current desktop with emacsclient (requires wmctrl)
 (if (file-executable-p "/usr/bin/wmctrl")
 (add-hook 'server-switch-hook
   (lambda ()
     (call-process
       "wmctrl" nil nil nil "-i" "-R"
       (frame-parameter nil 'outer-window-id)))))

))

; FFAP bindings (Find File At Point)
(if (boundp 'ffap-bindings) (ffap-bindings))

;; Alias the yes-or-no function to accept 'y' instead of 'yes'
(fset 'yes-or-no-p 'y-or-n-p)

;; Alias longlines-mode
(defalias 'll 'longlines-mode)

;; Handy removal of trailing whitespace
(defalias 'dtw 'delete-trailing-whitespace)

;; Enable case-changing and disable transpose
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'transpose-words 'disabled t)
(put 'transpose-chars 'disabled t)

;; Convenience keybindings
(global-set-key [(control c)(q)] 'auto-fill-mode) ;; Toggle auto-fill
(global-set-key [(control c)(control d)] 'shell) ;; Start a shell
(global-set-key [(control x)(control b)] 'ibuffer) ;; Good buffer menu
(global-set-key [(control x)(control g)] 'goto-line) ;; Goto line
(global-set-key [(control .)] 'kill-this-buffer) ;; Kill buffer quick
(global-set-key [(control c)(f)] 'ido-find-file) ;; Ido file
(global-set-key [(control tab)] 'ido-switch-buffer) ;; C-Tab same as C-x b
