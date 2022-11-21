(custom-set-faces
 '(default ((t (:inherit nil :height 140 :family "JetBrains Mono")))))

(use-package modus-themes
  :init (load-theme 'modus-operandi)
  :bind ("M-<f6>" . modus-themes-toggle))

(use-package winner
  :hook (prog-mode . (lambda () (winner-mode t))))

(use-package display-line-numbers
  :hook prog-mode)

(provide 'dave-ui)
