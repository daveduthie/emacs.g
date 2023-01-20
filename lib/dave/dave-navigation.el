(use-package eglot
  :hook ((clojure-mode rust-mode) . eglot-ensure)
  :config
  (evil-define-key 'normal 'global (kbd ",a") 'eglot-code-actions)
  (evil-define-key 'normal 'global (kbd ",r") 'eglot-rename)
  (setq eglot-confirm-server-initiated-edits nil)
  (setq eglot-connect-timeout 60)
  (setq eglot-sync-connect 0))

(use-package project
  :config
  (evil-define-key 'normal 'global (kbd "<SPC> <SPC>") 'project-find-file))


(defun dd/tab-name ()
  (if-let ((project-dir (caddr (project-current))))
      (file-name-nondirectory
       (directory-file-name
	(file-name-directory project-dir)))
    (buffer-name)))

(use-package tab-bar
  :bind (("M-]" . tab-bar-switch-to-next-tab)
	 ("M-[" . tab-bar-switch-to-prev-tab))
  :init (tab-bar-mode t)
  :config (setq tab-bar-tab-name-function 'dd/tab-name))

(use-package xref
  :defer 3
  :config
  (evil-define-key 'normal 'global (kbd "gr") 'xref-find-references)
  (evil-define-key 'normal 'global (kbd "gd") 'xref-find-definitions))

(use-package ibuffer-project
  :defer t
  :init
  (add-hook 'ibuffer-hook
            (lambda () (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups)))))

(provide 'dave-navigation)
