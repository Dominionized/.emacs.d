;;;; init.el -- dominionized's Emacs config
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; Rien à dire.
;;
;;; Code:

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(prefer-coding-system 'utf-8)

;; Font
(set-face-attribute 'default nil :font "Consolas-11")

;; Smooth scrolling
(setq scroll-step 1)
(setq scroll-conservatively 1)

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

;; Remove default scratch message
(custom-set-variables
 '(initial-scratch-message nil))

;; EVIL-MODE
(use-package evil
  :ensure t
  :custom
  (evil-want-C-u-scroll t)
  (evil-shift-width 2)
  :config
  (progn
    (evil-mode t)))

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
      "bd" 'evil-delete-buffer
      "ff" 'counsel-find-file
      "p" 'projectile-command-map
      "wh" 'evil-window-left
      "wj" 'evil-window-down
      "wk" 'evil-window-up
      "wl" 'evil-window-right
      "ws" 'split-window-below
      "wv" 'split-window-right
      "sp" 'counsel-rg)))

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
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
   ("C-j" . company-select-next)
   ("C-k" . company-select-previous)))

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

;; PROJECTILE
(use-package projectile :ensure t
  :config
  (use-package ripgrep :ensure t)
  (projectile-mode t)
  :custom
  (projectile-enable-caching t)
  (projectile-completion-system 'ivy)
  (projectile-indexing-method 'alien))

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

; Enable auto-indent and auto-pair
(electric-indent-mode t)
(electric-pair-mode t)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; THEMES
(use-package solarized-theme :ensure t
  :custom
  (solarized-high-contrast-mode-line 1)
  (solarized-high-contrast-mode-line t)
  (solarized-scale-org-headlines nil)
  (solarized-use-variable-pitch nil))

(use-package gruvbox-theme :ensure t)
(load-theme 'gruvbox t)

;; UI tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; FUNCTIONS
(defun alternate-buffer ()
  "Switch back and forth between current and last buffer in the current window."
  (interactive)
    (switch-to-buffer (car (evil-alternate-buffer))))

;; Load custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load other config
(cl-loop for file in (directory-files (concat user-emacs-directory "config/") t)
         when (string-match "\\.el$" file)
         do (condition-case ex
             (load file)
         ('error (with-current-buffer "*scratch*"
                    (insert (format "[INIT ERROR]\n%s\n%s\n\n" file ex))))))

(provide 'init)
;;; init.el ends here
