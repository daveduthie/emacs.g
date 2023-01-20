(custom-set-faces
 '(default ((t (:inherit nil :height 140 :family "Iosevka SS08")))))

(use-package modus-themes
  :init (load-theme 'modus-operandi)
  :bind ("M-<f6>" . modus-themes-toggle))

(use-package doom-themes
  ;; :init (load-theme 'doom-nord 'no-confirm)
  )

(use-package winner
  :hook prog-mode)

(use-package display-line-numbers
  :hook prog-mode)

(provide 'dave-ui)
