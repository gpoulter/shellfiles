;; Initialise Ergoemacs bindings
(provide 'ergoemacs-init)

(if (not (boundp 'move-beginning-of-line)) (defalias 'move-beginning-of-line 'beginning-of-line))
(if (not (boundp 'move-end-of-line)) (defalias 'move-end-of-line 'end-of-line))
(defun ergo-colemak () (load "ergoemacs-colemak" t))
(defun ergo-qwerty () (load "ergoemacs-qwerty" t))
