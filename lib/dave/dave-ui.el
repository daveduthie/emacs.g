(custom-set-faces
 '(default ((t (:inherit nil :height 140 :family "Iosevka SS08")))))

(use-package doom-themes)

(use-package winner
  :hook prog-mode)

(use-package display-line-numbers
  :hook prog-mode)

;; (use-package pixel-scroll
;;   :init (pixel-scroll-precision-mode t))

(provide 'dave-ui)
