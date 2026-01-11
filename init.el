;config
(defun editconfig () (interactive) (find-file-existing user-init-file))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(set-fringe-mode 10)
(setq use-short-answers t)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode)
(savehist-mode 1)
(save-place-mode 1)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq use-dialog-box nil)

(setq initial-scratch-message ";scratch\n")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun ensure-package-installed (&rest packages)
  "Install PACKAGES unless already installed."
  (mapc
   (lambda (pkg)
     (unless (package-installed-p pkg)
       (package-install pkg)))
   packages))

(ensure-package-installed
 'magit
 'yasnippet
 'company
 'helm
 'which-key
 'projectile
 'gruber-darker-theme
 )

(setq custom-safe-themes t)

;(require 'gruber-darker-theme)
;(load-theme 'gruber-darker t)
(load-theme 'modus-operandi t)

(require 'which-key)
(require 'magit)

(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)

(require 'yasnippet)
(yas-global-mode 1)

(require 'company)
(setq company-idle-delay 0.2)
(global-company-mode 1)

(require 'projectile)
(projectile-mode +1)
