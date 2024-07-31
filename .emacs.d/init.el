;;; init.el -- summary
;;; Commentary:

;;; Code:

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Enable Ido mode
(ido-mode)

;; Smex
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ;; This is your old M-x.
	 ("C-c C-c M-x" . execute-extended-command)))

;; Disable Emacs Backup
(setq-default make-backup-files nil)

;; Enable line number in programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; Display line number in relative style
(setq display-line-numbers 'relative)

;; FONT
(add-to-list 'default-frame-alist
	     '(font . "Jetbrains Mono-13"))

;; Disable menu bar
(menu-bar-mode -1)
;; Disable tools bar
(tool-bar-mode -1)
;; Disable scroll bar
(scroll-bar-mode -1)

;; Theme
;;(use-package nimbus-theme
;;  :ensure t
;;  :config
;;  (load-theme 'nimbus t))

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t)
  ;;(load-theme 'doom-tokyo-night t)
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" default))
 '(package-selected-packages
   '(company lsp-pyright php-mode solarized-theme flycheck-eglot flycheck fly-check doom-themes nimbus-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; FlyCheck
(use-package flycheck
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

;; Languages

;; PHP
(use-package php-mode
  :ensure t)

;; Typescript
(use-package typescript-mode
  :ensure t)

;; LSP mode
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq-default lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (php-mode typescript-mode javascript-mode python-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred)

;; LSP UI to get better ui to work with lsp mode
(use-package lsp-ui :commands lsp-ui-mode)

;; DAP debugger work fine with LSP-MODE
;; TODO: Enable only if you needed
;;(use-package dap-mode)

;; Python LSP with lsp-pyright
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

;; Autocompletion with company
(use-package company
  :ensure t
  :init
  (global-company-mode))


;;; Init.el ends here
