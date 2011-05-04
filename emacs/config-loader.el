;; Loads custom configurations

(if (eq window-system 'w32) 
    (require 'windows-init))

(require 'bindings-init)

(require 'functions-init)

(require 'modes-init)

(require 'ergoemacs-init)

;(require 'go-mode-load)

;(require 'orgmode-init)

;(require 'dark-face)
