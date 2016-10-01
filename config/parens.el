(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (progn
    (setq sp-highlight-pair-overlay nil))
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))
