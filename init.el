;config
(defun editconfig () (interactive) (find-file-existing user-init-file))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

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
(recentf-mode 1)
(setq custom-safe-themes t)
(set-frame-font "monospace 12" nil t)

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
 'vertico
 'marginalia
 'orderless
 'consult
 'embark
 'embark-consult
 'wgrep
 'corfu
 'which-key
 'gruber-darker-theme
 'doom-themes
 'doom-modeline
 )

;(require 'gruber-darker-theme)
;(load-theme 'gruber-darker t)
;(load-theme 'modus-operandi t)
(require 'doom-themes)
(load-theme 'doom-one t)
(require 'doom-modeline)
(setq doom-modeline-icon nil)
(doom-modeline-mode t)

(require 'which-key)
(require 'magit)

(require 'yasnippet)
(yas-global-mode 1)

(require 'vertico)
(setq vertico-cycle t)
(setq vertico-resize nil)
(vertico-mode 1)

(require 'marginalia)
(marginalia-mode 1)

(require 'orderless)
(setq completion-styles '(orderless basic))

(require 'consult)
;; A recursive grep
(global-set-key (kbd "M-s M-g") #'consult-grep)
;; Search for file names recursively
(global-set-key (kbd "M-s M-f") #'consult-find)
;; Search through the outline (headings) of the file
(global-set-key (kbd "M-s M-o") #'consult-outline)
;; Search the current buffer
(global-set-key (kbd "M-s M-l") #'consult-line)
;; Switch to another buffer, or bookmarked file, or recently opened file
(global-set-key (kbd "M-s M-b") #'consult-buffer)

(require 'embark)
(require 'embark-consult)
;; Invoke Embark actions
(global-set-key (kbd "C-.") #'embark-act)
;; Minibuffer-specific bindings
(with-eval-after-load 'embark
;; Act on the current minibuffer candidate and collect results
(define-key minibuffer-local-map (kbd "C-c C-c") #'embark-collect)
;; Export Embark collect buffer
(define-key minibuffer-local-map (kbd "C-c C-e") #'embark-export))

(require 'wgrep)
;; wgrep bindings for grep-mode
(with-eval-after-load 'grep
;; Enter wgrep mode to edit the grep buffer
(define-key grep-mode-map (kbd "e") #'wgrep-change-to-wgrep-mode)
(define-key grep-mode-map (kbd "C-x C-q") #'wgrep-change-to-wgrep-mode)
;; Finish editing and apply changes
(define-key grep-mode-map (kbd "C-c C-c") #'wgrep-finish-edit))

(require 'corfu)
(with-eval-after-load 'corfu
(define-key corfu-map (kbd "<tab>") #'corfu-complete))
(setq tab-always-indent 'complete)
(setq corfu-preview-current nil)
(setq corfu-min-width 20)
(setq corfu-popupinfo-delay '(1.25 . 0.5))
(corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'
;; Sort by input history (no need to modify `corfu-sort-function').
(with-eval-after-load 'savehist
(corfu-history-mode 1)
(add-to-list 'savehist-additional-variables 'corfu-history))
(global-corfu-mode)

