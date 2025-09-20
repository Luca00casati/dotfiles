(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t t)

(require 'package)

;; use MELPA to package archives
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")))

;; Initialize the package system
(package-initialize)

;; Refresh package list if needed
(unless package-archive-contents
  (package-refresh-contents))
;;(package-refresh-contents)

;;helper
(defun usep (pkg)
(unless (package-installed-p pkg)
  (package-install pkg)))

;;theme
(usep 'gruber-darker-theme)
(load-theme 'gruber-darker)

(setq auto-save-default nil)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq use-dialog-box nil)

(setq initial-scratch-message ";scratch\n")

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(savehist-mode 1)
(save-place-mode 1)

;;packages
(usep 'company)
(add-hook 'after-init-hook 'global-company-mode)

(usep 'which-key)

(usep 'counsel)
(usep 'swiper)
(usep 'ivy)

(setq ivy-use-virtual-buffers t
      ivy-count-format "%d/%d "
      ivy-initial-input nil
      ivy-wrap t
      ivy-height 15)

(ivy-mode)

(setq swiper-isearch-full-regex nil)
(setq counsel-M-x-initial-input "^")

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(usep 'magit)
