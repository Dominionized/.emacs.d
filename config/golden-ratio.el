(use-package golden-ratio
  :ensure t
  :config
  (progn
    (golden-ratio-mode 1)
    (evil-leader/set-key
      "tg" (golden-ratio-mode))))
