;; For downloading packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;; My own variables
(menu-bar-mode -1) 
(tool-bar-mode nil)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)  ; Display numbers on lines
(windmove-default-keybindings)        ; thing for moving around windows
(setq-default  cursor-type 'bar)


;; Doom themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-atom") 
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'doom-one-light t))
    ('dark (load-theme 'doom-one t))))

;; (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)


;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode)
  :custom
  ;; (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon nil)
  (doom-modeline-icon (display-graphic-p))
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-flycheck-icon t)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-height 30))

(use-package nyan-mode
  :init (nyan-mode))

(use-package fancy-battery
  :init (fancy-battery-mode)
  :config (setq fancy-battery-show-percentage t))


;; All the icons
(use-package all-the-icons
  :ensure t)


;; Treemacs
(use-package treemacs
  :ensure t)

(use-package helm
  :ensure t
  :init (helm-mode t)
  :config
  (global-set-key (kbd "M-x") 'helm-M-x))


;; Better dired
(use-package dirvish
  :ensure t
  :init (dirvish-override-dired-mode))


;; Lsp 
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
	 (swift-mode . lsp)
	 (web-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :config (lsp-treemacs-sync-mode 1)
  :commands lsp)

(use-package company					        
  :ensure t						        
  :config (add-hook 'after-init-hook 'global-company-mode))  

(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

;; optional if you want which-key integration
(use-package which-key
   :config
   (which-key-mode))


(use-package pdf-tools
  :ensure t)


;; Rust
(use-package rust-mode
  :ensure t
  :config
  (setq rust-format-on-save t)
  (define-key rust-mode-map (kbd "C-c C-c") 'rust-run))


;; Markdown and org-mode
(use-package markdown-mode
  :ensure t)
  ;; :config (setq markdown-css-paths '("~/.emacs.d/custom-md-css/default.css")))

;; For converting markdown and org files to pdf
(use-package pandoc-mode
  :ensure t)

;; Preview for org files
(use-package org-preview-html
  :ensure t)

;; Preview for markdown
;; (use-package grip-mode
;;  :ensure t
;;  :config (setq grip-preview-use-webkit t))


;; Packages for web development
(use-package web-mode
  :ensure t)

(use-package emmet-mode
  :ensure t)

(use-package js2-mode
  :ensure t)
