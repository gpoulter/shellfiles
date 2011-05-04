(provide 'windows-init)

;; Bind windows copy and paste if they were disabled
(global-set-key [(shift delete)]   'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)]   'clipboard-yank)

;; Set UTF-8 as default encoding
(require 'un-define "un-define" t)
(set-buffer-file-coding-system 'utf-8 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Use aspell instead of ispell on windows
(setq-default ispell-program-name "C:/Program Files/Aspell/bin/aspell.exe")
(setq-default ispell-dictionary "british")

;; Compile to HTML for reStructuredText (rst.el)
;(setcdr (assq 'html rst-compile-toolsets)
;        '("python C:/Python26/Scripts/rst2html.py" ".html" nil))
;(setcdr (assq 'html rst-compile-toolsets)
;        '("rst2html" ".html" "--stylesheet=/home/graham/.voidspace.css"))
