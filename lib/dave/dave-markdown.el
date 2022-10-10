(use-package markdown-mode
  :config
  (add-hook 'markdown-mode-hook
            (lambda () (setq indent-tabs-mode nil))))

(provide 'dave-markdown)
