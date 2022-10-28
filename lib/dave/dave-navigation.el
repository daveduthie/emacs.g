(use-package eglot
  :hook ((clojure-mode rust-mode) . eglot-ensure)
  :config
  (evil-define-key 'normal 'global (kbd ",a") 'eglot-code-actions)
  (evil-define-key 'normal 'global (kbd ",r") 'eglot-rename)
  (setq eglot-confirm-server-initiated-edits nil)
  (setq eglot-connect-timeout 60))

(use-package project
  :config
  (evil-define-key 'normal 'global (kbd "<SPC> <SPC>") 'project-find-file))

(use-package xref
  :defer 3
  :config
  (evil-define-key 'normal 'global (kbd "gr") 'xref-find-references))

(use-package ibuffer-project
  :defer t
  :init
  (add-hook 'ibuffer-hook
            (lambda () (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups)))))


(provide 'dave-navigation)
