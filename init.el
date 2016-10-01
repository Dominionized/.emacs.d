;; PACKAGES
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; Indent with 2 spaces everywhere
(custom-set-variables
  ;; Use 2 spaces everywhere
  '(evil-shift-width 2)

  '(indent-tabs-mode nil)
  '(org-startup-indented t))

;; Truncate lines
(custom-set-variables
 '(truncate-lines t))

;; EVIL-MODE
(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-want-C-u-scroll t))
  :config
  (progn
    (evil-mode t)
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
          "g" 'magit-status
          "bb" 'switch-to-buffer
          "bs" (lambda () (interactive) (switch-to-buffer "*scratch*"))
          "bd" 'evil-delete-buffer
          "ff" 'counsel-find-file
          "pp" 'projectile-switch-project)))))

;; HELM
;; (use-package helm
;;   :ensure t
;;   :init
;;   (require 'helm-config)
;;   :config
;;   (helm-mode 1)
;;   :bind
;;   (("M-x" . helm-M-x)
;;    ("C-x C-f" . helm-find-files)
;;    ("C-p" . helm-projectile)
;;    :map helm-map
;;    ("C-j" . helm-next-line)
;;    ("C-k" . helm-previous-line)
;;    :map helm-find-files-map
;;    ("C-h" . helm-find-files-up-one-level)
;;    ("<tab>" . helm-execute-persistent-action)
;;    ("C-l" . helm-execute-persistent-action)))

;; ;; Make helm always display at the bottom
;; (add-to-list 'display-buffer-alist
;;                     `(,(rx bos "*helm" (* not-newline) "*" eos)
;;                          (display-buffer-in-side-window)
;;                          (inhibit-same-window . t)
;;                          (window-height . 0.4)))

;; Ivy
(use-package ivy
  :ensure t
  :config
  (setq ivy-count-format "")
  :bind
  (:map ivy-minibuffer-map
   ("C-j" . ivy-next-line)
   ("C-k" . ivy-previous-line)))

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)))

;; MAGIT
(use-package magit
  :ensure t
  :config
  (use-package evil-magit
    :ensure t))

;; PROJECTILE
(use-package projectile :ensure t)
(use-package helm-projectile :ensure t
  :config
  (define-key evil-normal-state-map "\C-p" 'helm-projectile))

;; WHICH-KEY (got spoiled by spacemacs)
(use-package which-key
  :ensure t
  :config
  (progn
    (setq which-key-idle-delay 0.3)
    (which-key-mode)))

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; THEMES
(use-package solarized-theme :ensure t
  :init
  (progn
    (setq solarized-high-contrast-mode-line 1))
  :config
  (custom-set-variables
    '(solarized-high-contrast-mode-line t)
    '(solarized-scale-org-headlines nil)
    '(solarized-use-variable-pitch nil)))
(load-theme 'solarized-light t)

;; UI tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; FUNCTIONS
(defun alternate-buffer ()
  "Switch back and forth between current and last buffer in the
current window."
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
