(use-package recentf
  :defer 5
  :init (recentf-mode 1))

(use-package eglot
  :hook ((clojure-mode rust-mode terraform-mode) . eglot-ensure)
  :config
  (evil-define-key 'normal 'global (kbd ",a") 'eglot-code-actions)
  (evil-define-key 'normal 'global (kbd ",r") 'eglot-rename)
  (setq eglot-confirm-server-initiated-edits nil)
  (setq eglot-connect-timeout 60)
  (setq eglot-sync-connect 0)
  (setq eglot-autoshutdown t))

(use-package dumb-jump
  :defer 1
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read))

(use-package project
  :defer 3
  :config
  (evil-define-key 'normal 'global (kbd "<SPC> <SPC>") 'project-find-file))


(defun dd/tab-name ()
  (if-let ((project-dir (caddr (project-current))))
      (file-name-nondirectory
       (directory-file-name
	(file-name-directory project-dir)))
    (buffer-name)))

(use-package tab-bar
  :defer 1
  :bind (("M-]" . tab-bar-switch-to-next-tab)
	 ("M-[" . tab-bar-switch-to-prev-tab))
  :init (tab-bar-mode t)
  :config (setq tab-bar-tab-name-function 'dd/tab-name))

(use-package xref
  :defer 5
  :config
  (evil-define-key 'normal 'global (kbd "gr") 'xref-find-references)
  (evil-define-key 'normal 'global (kbd "gd") 'xref-find-definitions))

(use-package ibuffer-project
  :defer t
  :init
  (add-hook 'ibuffer-hook
            (lambda () (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups)))))

(use-package window-number
  :hook prog-mode
  :config (window-number-meta-mode)
  :bind (("C-x o" . window-number-switch)))


(add-to-list 'load-path (expand-file-name "lib/dirvish/extensions"
					  user-emacs-directory))

(use-package dirvish-collapse :defer 5)
(use-package dirvish-emerge :defer 5)
(use-package dirvish-fd :defer 5)
(use-package dirvish-history :defer 5)
(use-package dirvish-icons :defer 5)
(use-package dirvish-ls :defer 5)
(use-package dirvish-narrow :defer 5)
(use-package dirvish-peek :defer 5)
(use-package dirvish-quick-access :defer 5)
(use-package dirvish-side :defer 5)
(use-package dirvish-subtree :defer 5)
(use-package dirvish-vc :defer 5)
(use-package dirvish-yank :defer 5)

(use-package dirvish
  :after (dirvish-peek)
  :defer 5
  :init
  (dirvish-override-dired-mode)
  :config
  (dirvish-peek-mode)
  (dirvish-side-follow-mode)
  (setq insert-directory-program "gls")
  (setq dirvish-attributes
	'(vc-state file-size git-msg subtree-state all-the-icons collapse file-time))
  (setq dirvish-mode-line-format '(:left (sort symlink) :right (vc-info yank index)))
  (setq dirvish-header-line-height '(25 . 35))
  (setq dirvish-side-width 38)
  (setq dirvish-header-line-format '(:left (path) :right (free-space)))
  (setq dired-listing-switches
	"-l --almost-all --human-readable --group-directories-first --no-group")
  ;; https://github.com/alexluigit/dirvish/issues/179#issuecomment-1445044352
  (advice-add 'dirvish-dired-noselect-a
              :before-until
              (defun dd/dirvish-dired-noselect-on-lists (&rest args)
		(and (listp (cadr args))
                     (apply (car args) (cdr args)))))
  (bind-keys ("C-c f" . dirvish-fd)
             :map 'dirvish-mode-map
             ;; left click for expand/collapse dir or open file
             ("<mouse-1>" . dirvish-subtree-toggle-or-open)
             ;; middle click for opening file / entering dir in other window
             ("<mouse-2>" . dired-mouse-find-file-other-window)
             ;; right click for opening file / entering dir
             ("<mouse-3>" . dired-mouse-find-file)
             ([remap dired-sort-toggle-or-edit] . dirvish-quicksort)
             ([remap dired-do-redisplay] . dirvish-ls-switches-menu)
             ([remap dired-do-copy] . dirvish-yank-menu)
	     ("d"   . dired-display-file)
             ("?"   . dirvish-dispatch)
             ("q"   . dirvish-quit)
             ("a"   . dirvish-quick-access)
             ("f"   . dirvish-file-info-menu)
             ("x"   . dired-do-delete)
             ("X"   . dired-do-flagged-delete)
             ("y"   . dirvish-yank-menu)
             ("s"   . dirvish-quicksort)
             ("TAB" . dirvish-subtree-toggle)
             ("M-t" . dirvish-layout-toggle)
             ("M-b" . dirvish-history-go-backward)
             ("M-f" . dirvish-history-go-forward)
             ("M-n" . dirvish-narrow)
             ("M-m" . dirvish-mark-menu)
             ("M-s" . dirvish-setup-menu)
             ("M-e" . dirvish-emerge-menu)))

(provide 'dave-navigation)
