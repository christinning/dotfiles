
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))


(set-default-font "Inconsolata-12")

(load-theme 'zenburn t)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)





(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)


