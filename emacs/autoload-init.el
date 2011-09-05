(provide 'autoload-init)

;; nXML on Linux (already enabled in EmacsW32)
(if (not (eq window-system 'w32)) (progn
  (if (load "rng-auto" t)
    (autoload 'nxml-mode "nxml-mode" "Load nxml-mode")
    (add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\|html\\)$" . nxml-mode))
)))

;; Find-file-in-project (looks for .emacs-project)
(if (not (eq window-system 'w32)) 
    (require 'find-file-in-project nil t))

;; CSS
(autoload 'css-mode "css-mode-simple" "Load css-mode")
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

;; JavaScript
(autoload 'javascript-mode "javascript" "Load javascript-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

;; Python (often already enabled)
(autoload 'python-mode "python" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Relax-NG Compact (RNC) mode
(autoload 'rnc-mode "rnc-mode")
(add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))

;; RST (ReStructured Text). Use .. -*- mode: rst -*- )
;(autoload 'rst-mode "rst" "Load rst-mode")
;(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
;; add these to rst.el compile-command to handle file names with spaces
;;; (concat "\"" bufname "\"")
;;; (concat "\"" outname extension "\""))

;; Ruby
(autoload 'ruby-mode "ruby-mode" "Load ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-hook 'ruby-mode-hook 'turn-on-font-lock)

