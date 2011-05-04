;; Loads custom configurations

(if (eq window-system 'w32) 
    (require 'windows-init))

(require 'autoload-init)
(require 'custom-init)
(require 'ergoemacs-init)
(require 'functions-init)
(require 'keybindings-init)
(require 'orgmode-init)
