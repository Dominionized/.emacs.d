(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#f4eedb" "#cc1f24" "#778c00" "#a67c00" "#007ec4" "#c42475" "#11948b" "#88999b"])
 '(beacon-color "#c82829")
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#11948b")
 '(cua-normal-cursor-color "#596e76")
 '(cua-overwrite-cursor-color "#a67c00")
 '(cua-read-only-cursor-color "#778c00")
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "14f13fee1792f44c448df33e3d3a03ce9adbf1b47da8be490f604ac7ae6659b9" "6bf841f77d5eb01455d82ae436e3e25277daaef4ee855a3572589dad1b3ac4b3" "0ecfd25c7f4b32b4703dfbbad3c0cb865aeb17efb0b694624a604ed89550ee8d" "9271c0ad73ef29af016032376d36e8aed4e89eff17908c0b578c33e54dfa1da1" default)))
 '(evil-shift-width 2)
 '(evil-want-C-u-scroll t)
 '(fci-rule-color "#f4eedb")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote light))
 '(golden-ratio-extra-commands
   (quote
    (windmove-left windmove-right windmove-down windmove-up evil-window-left evil-window-right evil-window-up evil-window-down)))
 '(highlight-changes-colors (quote ("#c42475" "#5e65b6")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fffce9" 0.25)
    (quote
     ("#a67c00" "#11948b" "#cc1f24" "#5e65b6" "#778c00" "#bb3e06" "#007ec4"))))
 '(highlight-symbol-foreground-color "#5d737a")
 '(highlight-tail-colors
   (quote
    (("#f4eedb" . 0)
     ("#a8b84b" . 20)
     ("#66c1b3" . 30)
     ("#6fa5e7" . 50)
     ("#d6a549" . 60)
     ("#ed6e3e" . 70)
     ("#f46495" . 85)
     ("#f4eedb" . 100))))
 '(hl-bg-colors
   (quote
    ("#d6a549" "#ed6e3e" "#ff6243" "#f46495" "#837bdf" "#6fa5e7" "#66c1b3" "#a8b84b")))
 '(hl-fg-colors
   (quote
    ("#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9")))
 '(hl-paren-colors (quote ("#11948b" "#a67c00" "#007ec4" "#5e65b6" "#778c00")))
 '(indent-tabs-mode nil)
 '(initial-scratch-message nil)
 '(ivy-mode t)
 '(ivy-on-del-error-function (quote ignore))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(magit-diff-use-overlays nil)
 '(magit-git-executable "C:\\Program Files\\Git\\bin\\git.exe")
 '(neo-theme (quote ascii))
 '(neotree-smart-open t t)
 '(nrepl-message-colors
   (quote
    ("#cc1f24" "#bb3e06" "#a67c00" "#4f6600" "#a8b84b" "#005797" "#11948b" "#c42475" "#5e65b6")))
 '(org-agenda-files (quote ("~/Sync/notes")))
 '(org-default-notes-file "~/Sync/notes/life.org")
 '(org-directory "~/Sync/notes")
 '(org-startup-folded (quote nofold))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (smartparens alchemist elixir-mode neotree color-theme-sanityinc-solarized sanityinc-solarized-theme color-theme-sanityinc-tomorrow rainbow-delimiters rainbow-relimiters parinfer writeroom-mode org-mode evil-surround ag cider clojure-mode tide company counsel ivy golden-ratio js2-mode helm-projectile projectile solarized-theme evil-magit which-key magit evil-leader helm evil-visual-mark-mode)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#1d2021")))
 '(pos-tip-background-color "#f4eedb")
 '(pos-tip-foreground-color "#5d737a")
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-generic-command "fd . -0")
 '(projectile-indexing-method (quote alien))
 '(projectile-switch-project-action (quote neotree-projectile-action))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#778c00" "#596e76" 0.2))
 '(solarized-high-contrast-mode-line t)
 '(solarized-scale-org-headlines nil)
 '(solarized-use-variable-pitch nil)
 '(tab-width 2)
 '(term-default-bg-color "#fffce9")
 '(term-default-fg-color "#596e76")
 '(truncate-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc1f24")
     (40 . "#bbbc5a0718b8")
     (60 . "#b1ce6c680f6e")
     (80 . "#a67c00")
     (100 . "#980682770000")
     (120 . "#905f85330000")
     (140 . "#887187c90000")
     (160 . "#802a8a3b0000")
     (180 . "#778c00")
     (200 . "#69798ef83f8d")
     (220 . "#5f5f904353a2")
     (240 . "#51b991a0669e")
     (260 . "#3d7893107927")
     (280 . "#11948b")
     (300 . "#1b098bd9a288")
     (320 . "#1963876fadf3")
     (340 . "#129882fbb95b")
     (360 . "#007ec4"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fffce9" "#f4eedb" "#990001" "#cc1f24" "#4f6600" "#778c00" "#785700" "#a67c00" "#005797" "#007ec4" "#93004d" "#c42475" "#006d68" "#11948b" "#596e76" "#88999b")))
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#f4eedb" "#cc1f24" "#778c00" "#a67c00" "#007ec4" "#c42475" "#11948b" "#002b37"])
 '(xterm-color-names-bright
   ["#fffce9" "#bb3e06" "#98a6a6" "#88999b" "#596e76" "#5e65b6" "#5d737a" "#00212b"]))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
