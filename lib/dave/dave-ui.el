(custom-set-faces
 '(default ((t (:inherit nil :height 140 :family "Iosevka SS08")))))

(load-theme 'modus-operandi)

(use-package winner
  :hook (prog-mode . (lambda () (winner-mode t))))

(provide 'dave-ui)
