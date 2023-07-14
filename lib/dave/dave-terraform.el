(use-package terraform-mode
  :defer t
  :config
  (company-terraform-init)
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 '(terraform-mode . ("terraform-ls" "serve")))))

(provide 'dave-terraform)
