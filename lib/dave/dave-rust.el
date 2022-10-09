(use-package rustic-mode
  :defer t
  :config
  (add-hook 'rustic-mode-hook (lambda () (electric-pair-mode t))))

(provide 'dave-rust)
