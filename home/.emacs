(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)


(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'clojure-cheatsheet)
  (package-install 'clojure-cheatsheet))

(unless (package-installed-p 'project-explorer)
  (package-install 'project-explorer))

;; on OSX when launched from gui we need to get shell env
(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; when running shell scroll with output
(setq comint-scroll-show-maximum-output t)

(set-default-font "Inconsolata-12")

(unless (package-installed-p 'molokai-theme)
  (package-install 'molokai-theme))


(unless (package-installed-p 'hc-zenburn-theme)
  (package-install 'hc-zenburn-theme))
(load-theme 'hc-zenburn t)



;; switch off annoying beeps
(setq ring-bell-function #'ignore)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
(setq ns-function-modifier 'hyper)



;;;;;;;;;;;;;;;;;;;;;;;;
;; keybinding management

;; Set right alt key to be S super - not valid at the moment
;; (setq mac-right-option-modifier ‘super)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)


