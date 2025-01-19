;; Don't show the splash screen
(setq inhibit-startup-message t)
;;(menu-bar-mode 0)
;;(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq ring-bell-function 'ignore)

;;set scroll
(setq redisplay-dont-pause t
  scroll-margin 10
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(set-fringe-mode 10)
(desktop-save-mode 1)
;;use trash need adjustment for mac
(setq delete-by-moving-to-trash t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;font
(set-face-attribute 'default nil :height 125)
(setq font-use-system-font t)

;;stop creating files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;cua
(cua-mode t)

;;ido
(ido-mode t)

;;pair
(electric-pair-mode 1)

;;pdf
;;(setq pdf-view-use-scaling nil)
(setq doc-view-resolution 300)

;;disable line number for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (dispalay-line-numbers-mode 0))))

;;full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(recentf-mode 1)
(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1)
(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq gloabal-auto-revert-non-file-buffers t)

;;startup screen
;;(when (get-buffer "*scratch*")
;;  (recentf-open-files))

;;dired config
(setq dired-listing-switches "-alh")
(setq ls-lisp-dirs-first t)
;;(setq ls-lisp-ignore-case t)

(when (>= emacs-major-version 28)
  (setq dired-kill-when-opening-new-dired-buffer t))

(when (< emacs-major-version 28)
  (progn
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file
    (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file ".."))) ; was dired-up-directory
    ))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/") 
("org" . "https://orgmode.org/elpa/") 
("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package) 
(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruber-darker-theme)

(use-package pdf-tools)

(use-package evil)

(use-package org)

(use-package magit)
(use-package git-gutter
  :init (global-git-gutter-mode +1))

;;smex
(use-package smex
:config (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package company
:init (company-mode)
:config (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
:init (which-key-mode) 
:diminish which-key-mode 
:config (setq which-key-idle-delay 0.3))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" default))
 '(package-selected-packages
   '(evil evil-mode git-gutter magit company smex pdf-tools gruber-darker-theme which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
