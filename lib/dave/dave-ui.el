(custom-set-faces
 '(default ((t (:inherit nil :height 140 :family "JetBrains Mono")))))

;; (load-theme 'modus-operandi)
(load-theme 'modus-vivendi)

(use-package winner
  :hook (prog-mode . (lambda () (winner-mode t))))

(provide 'dave-ui)
