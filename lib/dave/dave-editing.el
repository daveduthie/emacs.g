(use-package hideshow
  :hook (prog-mode . hs-minor-mode))

(use-package evil
  :init (evil-mode)
  :config
  (evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
  (evil-set-initial-state 'deadgrep-mode 'emacs)
  (setq evil-undo-system 'undo-redo))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package paredit
  :hook (prog-mode . paredit-mode)
  ;; :config (electric-indent-mode -1)
  )

(use-package electric-pair
  :hook ((rustic-mode terraform-mode) . electric-pair-mode))

(use-package company
  :hook (prog-mode . company-mode))

(use-package yasnippet
  :init (yas-global-mode t))

(use-package vertico
  :init (vertico-mode))

(use-package consult
  :defer 2
  :init
  (evil-define-key 'normal 'global (kbd "<SPC> s p") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<SPC> s l") 'consult-line)
  (evil-define-key 'normal 'global (kbd ", e") 'consult-flymake)
  (evil-define-key 'normal 'global (kbd ", i") 'consult-imenu)
  (evil-define-key 'normal 'global (kbd "C-x r b") 'consult-bookmark))

(use-package embark
  :defer t
  :bind
  (("M-/" . embark-act)
   ("C-M-/" . embark-dwim)
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc.  You may adjust the Eldoc
  ;; strategy, if you want to see the documentation from multiple providers.
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package orderless
  :defer 2
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; TODO: move to a sanity lib
(use-package files
  :defer 5
  :config
  (setq backup-directory-alist
	`(("." . ,(concat user-emacs-directory "file-backups")))))

(use-package autorevert
  :hook (fundamental-mode . auto-revert-mode))

;; Allow narrowing to region
(put 'narrow-to-region 'disabled nil)

(use-package iedit
  :bind (("C-;". iedit-mode)))

(provide 'dave-editing)
