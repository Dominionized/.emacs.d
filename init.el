;;;; init.el -- dominionized's Emacs config
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; Rien à dire.
;;
;;; Code:

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(setq default-process-coding-system '(utf-8-dos . utf8-dos))
(prefer-coding-system 'utf-8)

(setq default-directory "~/code/")

(require 'server)
(if (not (server-running-p))
    (server-start))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; UI stuff
(set-face-attribute 'default nil :font "Consolas-10")
(setq default-frame-alist '((font . "Consolas-10")))
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (when (display-graphic-p frame)
              (menu-bar-mode -1)
              (tool-bar-mode -1)
              (scroll-bar-mode -1))))
(setq ring-bell-function 'ignore)


;; Smooth scrolling
(setq scroll-step 1)
(setq scroll-conservatively 1)

;; Relative line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Indent with 2 spaces everywhere
(custom-set-variables
  ;; Use 2 spaces everywhere
  '(tab-width 2)
  '(css-indent-offset 2)
  '(js2-basic-offset 2)

  '(indent-tabs-mode nil)
  '(org-startup-indented t))

;; Truncate lines
(custom-set-variables
 '(truncate-lines t))

;; show-paren by default
(add-hook 'prog-mode-hook 'show-paren-mode)

;; Remove default scratch message
(custom-set-variables
 '(initial-scratch-message nil))

;; Disable splash screen
(setq inhibit-startup-screen t)

;; EVIL-MODE
(use-package evil
  :ensure t
  :custom
  (evil-want-C-u-scroll t)
  (evil-shift-width 2)
  :config
  (progn
    (evil-mode t))
  :bind (:map evil-normal-state-map
              ("j" . evil-next-visual-line)
              ("k" . evil-previous-visual-line)))

;; EVIL-leader
(use-package evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config
  (progn
    (setq evil-leader/leader "SPC"
          evil-leader/in-all-states t)
    (evil-leader/set-key
      "TAB" 'alternate-buffer
      "gs" 'magit-status
      "bb" 'switch-to-buffer
      "bs" (lambda () (interactive) (switch-to-buffer "*scratch*"))
      "bd" 'kill-current-buffer
      "ff" 'counsel-find-file
      "p" 'projectile-command-map
      "wh" 'evil-window-left
      "wj" 'evil-window-down
      "wk" 'evil-window-up
      "wl" 'evil-window-right
      "ws" 'split-window-below
      "wv" 'split-window-right
      "sp" 'counsel-rg
      "oc" 'org-capture)))

; Vim keybindings everywhere
;; (use-package evil-collection :ensure t
;;   :custom (evil-collection-setup-minibuffer t)
;;   :init
;;   (evil-collection-init))

(use-package evil-nerd-commenter
  :ensure t
  :bind (:map evil-normal-state-map
         ("gc" . evilnc-comment-operator)))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Ivy
(use-package ivy
  :ensure t
  :config
  (setq ivy-count-format "")
  :custom
  (ivy-on-del-error-function 'ignore)
  :bind
  (:map ivy-minibuffer-map
        ("C-j" . 'ivy-next-line)
        ("C-k" . 'ivy-previous-line)))

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)))

;; COMPANY
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :bind
  (:map company-active-map
   ("C-j" . company-select-next)
   ("C-k" . company-select-previous)))

(use-package neotree
  :ensure t
  :bind
  (("<f5>" . neotree-toggle))
  :custom
  (projectile-switch-project-action 'neotree-projectile-action)
  (neotree-smart-open t)
  (neo-theme 'ascii)
  :config
  (progn
    ;; Rebind conflicting evil-mode keys
    (evil-define-key 'normal neotree-mode-map
      (kbd "TAB") 'neotree-enter
      (kbd "SPC") 'neotree-quick-look
      (kbd "q") 'neotree-hide
      (kbd "RET") 'neotree-enter
      (kbd "g") 'neotree-refresh
      (kbd "n") 'neotree-next-line
      (kbd "p") 'neotree-previous-line
      (kbd "A") 'neotree-stretch-toggle
      (kbd "H") 'neotree-hidden-file-toggle
      (kbd "s") 'neotree-enter-vertical-split
      (kbd "x") 'neotree-enter-horizontal-split)))

;; Org-mode config
(use-package org :ensure t
  :custom
  (org-startup-folded 'nofold)
  (org-default-notes-file "~/Sync/notes/life.org")
  (org-directory "~/Sync/notes")
  (org-agenda-files (list org-directory)))

;; FLYCHECK
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; MAGIT
(use-package magit
  :ensure t
  :config
  (use-package evil-magit
    :ensure t))

;; GOLDEN-RATIO
(use-package golden-ratio :ensure t
  :config
  (progn
    (golden-ratio-mode 1)
    (customize-set-variable
     'golden-ratio-extra-commands
     (append golden-ratio-extra-commands
             '(evil-window-left
               evil-window-right
               evil-window-up
               evil-window-down)))))

;; Writeroom-mode
(use-package writeroom-mode :ensure t)

;; PROJECTILE
(use-package projectile :ensure t
  :config
  (use-package ripgrep :ensure t)
  (projectile-mode t)
  :custom
  (projectile-enable-caching t)
  (projectile-completion-system 'ivy)
  (projectile-indexing-method 'alien)
  (projectile-generic-command "fd . -0"))

;; WHICH-KEY (got spoiled by spacemacs)
(use-package which-key
  :ensure t
  :config
  (progn
    (setq which-key-idle-delay 0.3)
    (which-key-mode)))

(use-package pug-mode :ensure t)
(use-package js2-mode :ensure t
  :mode "\\.js\\'")

(use-package tide
  :ensure t
  :config
  (add-hook 'typescript-mode-hook 'setup-tide-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package rainbow-delimiters
  :ensure t
  :hook
  ((prog-mode-hook . rainbow-delimiters-mode)))

(use-package clojure-mode :ensure t)
(use-package cider :ensure t)
(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :hook
  ((clojure-mode emacs-lisp-mode) . parinfer-mode)
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            ;; lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
            ;; paredit        ; Introduce some paredit commands.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))))   ; Yank behavior depend on mode.

(use-package elixir-mode :ensure t)
(use-package alchemist :ensure t)


(add-to-list 'load-path (expand-file-name "lilypond-mode" user-emacs-directory))

; Enable auto-indent and auto-pair
(electric-indent-mode t)
(use-package smartparens :ensure t
  :init
  (require 'smartparens-config))

;; (setq-default electric-indent-inhibit t)
;; ; Disable pairing of double quotes
;; (setq electric-pair-inhibit-predicate
;;       (lambda (c)
;;         (if (char-equal c ?\") t (electric-pair-default-inhibit c))))

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; THEMES
(use-package solarized-theme :ensure t
  :custom
  (solarized-high-contrast-mode-line t)
  (solarized-scale-org-headlines nil)
  (solarized-use-variable-pitch nil))

;; (use-package gruvbox-theme :ensure t)

(load-theme 'solarized-gruvbox-dark t)

;; FUNCTIONS
(defun alternate-buffer ()
  "Switch back and forth between current and last buffer in the current window."
  (interactive
    (switch-to-buffer (car (evil-alternate-buffer)))))

;; Stolen from Spacemacs
(defun vinegar/up-directory (&optional other-window)
  "Run Dired on parent directory of current directory."
  (interactive "P")
  (let* ((dir (dired-current-directory))
         (orig (current-buffer))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (kill-buffer orig)
          (dired up)
          (dired-goto-file dir)))))

(define-key evil-normal-state-map (kbd "-") 'dired-jump)
(define-key dired-mode-map (kbd "-") 'vinegar/up-directory)

;; Load custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
