(use-package rustic-mode
  :defer t
  :config
  (setq rustic-lsp-client 'eglot))

(use-package electric-pair
  :hook (rustic-mode . electric-pair-mode))

(provide 'dave-rust)
