(use-package terraform-mode
  :config
  (company-terraform-init)
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(provide 'dave-terraform)
