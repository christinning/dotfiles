(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Check if we're on Emacs 24.4 or newer, if so, use the pinned package feature
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
                '((cider              . "melpa-stable")
                  (clojure-mode       . "melpa-stable")
                  (company            . "melpa-stable")
                  (rainbow-delimiters . "melpa-stable")
                  ;; "unstable" package
                  )))

(setq required-package-list '(
			      cider
			      clojure-mode
			      rainbow-delimiters
			      paredit
			      company
			      clojure-cheatsheet
			      project-explorer
			      rainbow-mode
			      column-marker
			      exec-path-from-shell
			      noctilux-theme))

(package-initialize)
(defun install-required-packages (package-list)
  (when (>= emacs-major-version 24)
    (package-refresh-contents)
    (mapc (lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
          package-list)))

(install-required-packages required-package-list)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(require 'clojure-mode)
(define-key clojure-mode-map (kbd "C-c C-s") 'clojure-cheatsheet)


(define-globalized-minor-mode global-rainbow-mode
  rainbow-mode rainbow-mode)
(global-rainbow-mode 1)

(add-hook 'cider-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'emacs-lisp-mode-hook  (lambda () (interactive) (column-marker-1 80)))

;; cider config
(setq nrepl-hide-special-buffers t)
(setq cider-show-error-buffer nil)
(setq cider-auto-select-error-buffer nil)
(add-hook 'clojure-mode-hook 'cider-mode)


;; on OSX when launched from gui we need to get shell env
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; when running shell scroll with output
(setq comint-scroll-show-maximum-output t)


;;
;; APPEARANCE
;;
(set-default-font "Inconsolata-14")
(load-theme 'noctilux t)

;; Set faces after theme load or they are overwritten
(require 'paren)
(set-face-background 'show-paren-match "#cccc67")
(set-face-foreground 'show-paren-match "#303030")
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; switch off annoying beeps
(setq ring-bell-function #'ignore)
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
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(setq company-idle-delay 0.2)
(setq company-auto-complete nil)

