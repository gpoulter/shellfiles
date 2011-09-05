;; Load custom emacs configurations

;; Add these lines to .emacs:
;(add-to-list 'load-path user-emacs-directory)
;(add-to-list 'load-path "~/.conf/emacs/")
;(load "config-loader" t)

;; custom-set-variables here, remove any from .emacs
(require 'custom-init)

(require 'autoload-init)
(require 'ergoemacs-init)
(require 'functions-init)
(require 'keybindings-init)
;;(require 'orgmode-init)

(if (eq window-system 'w32) (require 'windows-init))

