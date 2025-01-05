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
(when (get-buffer "*scratch*")
  (recentf-open-files))

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

(defun my-dired-init ()
  (interactive)

  (define-key dired-mode-map (kbd ",") #'dired-prev-dirline)
  (define-key dired-mode-map (kbd ".") #'dired-next-dirline)

  (define-key dired-mode-map (kbd "1") #'dired-do-shell-command)
  (define-key dired-mode-map (kbd "6") #'dired-up-directory)
  (define-key dired-mode-map (kbd "9") #'dired-hide-details-mode)

  (define-key dired-mode-map (kbd "b") #'dired-do-byte-compile)

  (define-key dired-mode-map (kbd "`") #'dired-flag-backup-files)

  (define-key dired-mode-map (kbd "e") nil)
  (define-key dired-mode-map (kbd "e c") #'dired-do-copy)
  (define-key dired-mode-map (kbd "e d") #'dired-do-delete)
  (define-key dired-mode-map (kbd "e g") #'dired-mark-files-containing-regexp)
  (define-key dired-mode-map (kbd "e h") #'dired-hide-details-mode)
  (define-key dired-mode-map (kbd "e m") #'dired-mark-files-regexp)
  (define-key dired-mode-map (kbd "e n") #'dired-create-directory)
  (define-key dired-mode-map (kbd "e r") #'dired-do-rename)
  (define-key dired-mode-map (kbd "e u") #'dired-unmark-all-marks)
  ;;
  )

(progn
  (require 'dired )
  (add-hook 'dired-mode-hook #'my-dired-init))

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
;;do manualy
;;(setq use-package-always-ensure t)

;;(use-package modus-themes)
(use-package gruber-darker-theme :ensure t)

(use-package pdf-tools :ensure t)

;;smex
(use-package smex
:ensure t
:config (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;;(use-package beacon
;;:ensure t
;;:init (beacon-mode 1))

;;dont work well with color scheme
;;(use-package rainbow-delimiters :ensure t)

(use-package company
:ensure t
:init (company-mode)
:config (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
:ensure t
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
   '(company rainbow-delimiters beacon smex pdf-tools gruber-darker-theme which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
