(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'company)
  (package-install 'company))

(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(unless (package-installed-p 'clojure-cheatsheet)
  (package-install 'clojure-cheatsheet))

(unless (package-installed-p 'project-explorer)
  (package-install 'project-explorer))

(unless (package-installed-p 'rainbow-mode)
  (package-install 'rainbow-mode))
(define-globalized-minor-mode global-rainbow-mode
  rainbow-mode rainbow-mode)
(global-rainbow-mode 1)

;; cider config
(setq nrepl-hide-special-buffers t)
(setq cider-show-error-buffer 'except-in-repl)
(add-hook 'clojure-mode-hook 'cider-mode)


(show-paren-mode 1)

;; on OSX when launched from gui we need to get shell env
(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; when running shell scroll with output
(setq comint-scroll-show-maximum-output t)


;;
;; APPEARANCE
;;
(set-default-font "Inconsolata-12")

(unless (package-installed-p 'molokai-theme)
  (package-install 'molokai-theme))

(unless (package-installed-p 'noctilux-theme)
  (package-install 'noctilux-theme))

(unless (package-installed-p 'hc-zenburn-theme)
  (package-install 'hc-zenburn-theme))

(load-theme 'noctilux t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; switch off annoying beeps
(setq ring-bell-function #'ignore)
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
(setq ns-function-modifier 'hyper)



;;;;;;;;;;;;;;;;;;;;;;;;
;; keybinding management

;; Set right alt key to be S super - not valid at the moment
;; (setq mac-right-option-modifier ‘super)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; autocomplete
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)
