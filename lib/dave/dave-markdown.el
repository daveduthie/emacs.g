(use-package markdown-mode
  :defer t
  :config
  (add-hook 'markdown-mode-hook
            (lambda () (setq indent-tabs-mode nil))))

(provide 'dave-markdown)
