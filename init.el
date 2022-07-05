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
(xterm-mouse-mode t)
(ns-toggle-toolbar)
(setq-default cursor-type 'bar)


;; Doom themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (load-theme 'doom-Iosvkem t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-atom") 
  (doom-themes-treemacs-config)
  (doom-themes-org-config))


;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode)
  :custom
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon nil)
  (doom-modeline-icon (display-graphic-p))
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-flycheck-icon t)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-height 30))


;; All the icons
(use-package all-the-icons
  :ensure t)


;; Treemacs
(require 'treemacs)


;; Lsp 
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
	 (swift-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :config (lsp-treemacs-sync-mode 1)
  :commands lsp)
(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode))
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))


;; Rust
(require 'rust-mode)


;; Swift
(require 'swift-mode)


;; Markdown
(require 'markdown-mode)
