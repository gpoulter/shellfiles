;; Loads custom configurations

(if (eq window-system 'w32) 
    (require 'windows-init))

(require 'bindings-init)
(require 'functions-init)
(require 'autoload-init)
(require 'ergoemacs-init)
(require 'orgmode-init)
(require 'custom-init)
