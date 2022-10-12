;; TODO: separate out clojure config

(use-package hideshow
  :hook (prog-mode . hs-minor-mode))

(use-package evil
  :init (evil-mode)
  :config
  (evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
  (evil-set-initial-state 'deadgrep-mode 'emacs))

(use-package paredit
  :hook (prog-mode . paredit-mode))

(use-package xref
  :defer 3
  :config
  (evil-define-key 'normal 'global (kbd "gr") 'xref-find-references))

(use-package company
  :hook (prog-mode . company-mode))

(use-package eglot
  :hook ((clojure-mode rust-mode) . eglot-ensure)
  :config
  (evil-define-key 'normal 'global (kbd ",a") 'eglot-code-actions)
  (evil-define-key 'normal 'global (kbd ",r") 'eglot-rename))

(use-package yasnippet
  :init (yas-global-mode t))

(use-package vertico
  :init (vertico-mode))

(use-package consult
  :defer 1
  :init
  (evil-define-key 'normal 'global (kbd "<SPC> s p") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<SPC> s l") 'consult-line)
  (evil-define-key 'normal 'global (kbd ", e") 'consult-flymake)
  (evil-define-key 'normal 'global (kbd ", i") 'consult-imenu))

(use-package orderless
  :defer 2
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package files
  :config
  (setq backup-directory-alist
	`(("." . ,(concat user-emacs-directory "file-backups")))))

(provide 'dave-editing)
