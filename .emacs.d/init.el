;; Don't show the splash screen
(setq inhibit-startup-message t)
;;(menu-bar-mode 0)
;;(tool-bar-mode 0)
(scroll-bar-mode 0)
;;(tab-bar-mode 1)
(setq ring-bell-function 'ignore)

(add-to-list 'load-path "~/.emacs.d/load/")

;;set scroll
(setq redisplay-dont-pause t
  scroll-margin 10
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Disable line numbers for some modes
  (dolist (mode '(org-mode-hook
                  term-mode-hook
                  shell-mode-hook
                  eshell-mode-hook
                  vterm-mode-hook
                  compilation-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(set-fringe-mode 10)
(desktop-save-mode 1)
;;use trash need adjustment for mac
(setq delete-by-moving-to-trash t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; repeat motion
(global-set-key (kbd "C-.") 'repeat)

;;font
(set-face-attribute 'default nil :height 125)
(setq font-use-system-font t)

;;stop creating files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;ido
(ido-mode t)

;;pair
(electric-pair-mode 1)

;;pdf
;;(setq pdf-view-use-scaling nil)
(setq doc-view-resolution 300)

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
(setq dired-listing-switches "-alh --group-directories-first")

;;(setq ls-lisp-ignore-case t)
(setq dired-kill-when-opening-new-dired-buffer t)

(setq package-archives '(
("melpa" . "https://melpa.org/packages/") 
("org" . "https://orgmode.org/elpa/") 
))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(setq use-package-always-ensure t)

(use-package gruber-darker-theme)

;;(use-package pdf-tools)

(use-package evil)
  ;;:init (evil-mode 1))
(if (not evil-mode) (cua-mode t))

(use-package org)

(use-package rust-mode)

;;lang-mode
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[ch]\\(pp\\)?\\'" . simpc-mode))


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
:config (setq company-idle-delay 0.1
        company-minimum-prefix-length 1)
  :hook (after-init . global-company-mode))

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
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(package-selected-packages
   '()))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
