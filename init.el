(setq inhibit-startup-message t)
(menu-bar-mode -1)  
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;;melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(which-key-mode)
;;(electric-pair-mode 1)
(global-hl-line-mode 1)
(savehist-mode 1)
(save-place-mode 1)

(setq auto-save-default nil)
(setq backup-directory-alist '(("." . "~/.config/emacs/backup")))

