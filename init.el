(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)

;; use MELPA to package archives
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")))

;; Initialize the package system
(package-initialize)

;; Refresh package list if needed
(unless package-archive-contents
  (package-refresh-contents))

;;helper
(defun usep (pkg)
(unless (package-installed-p pkg)
  (package-install pkg)))

(usep 'gruber-darker-theme)

(setq auto-save-default nil)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)

(setq initial-scratch-message ";scratch\n")

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(savehist-mode 1)
(save-place-mode 1)
