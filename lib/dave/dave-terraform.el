(use-package terraform-mode
  :defer t
  :config
  (company-terraform-init)
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(provide 'dave-terraform)
