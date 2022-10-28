(use-package rustic-mode
  :defer t
  :init
  (setq rustic-lsp-client 'eglot))

(use-package electric-pair
  :hook (rustic-mode . electric-pair-mode))

(provide 'dave-rust)
