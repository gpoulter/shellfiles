;; Load custom emacs configurations

;; custom-set-variables is in custom-init -- remove from .emacs
;; Add these two lines to .emacs:
; (setq load-path (cons "~/.conf/emacs" load-path))
; (load "config-loader" t)


(if (eq window-system 'w32) 
    (require 'windows-init))

(require 'autoload-init)
(require 'custom-init)
(require 'ergoemacs-init)
(require 'functions-init)
(require 'keybindings-init)
(require 'orgmode-init)
