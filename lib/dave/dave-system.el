(use-package envrc-mode
  :defer 3)

(use-package exec-path-from-shell
  :defer 1
  :init
  (setq exec-path-from-shell-arguments nil) ; don't use an interactive shell (i.e. load only .zshenv)
  (when (or (memq window-system '(mac ns x))
	    (daemonp))
    (exec-path-from-shell-initialize)))

(provide 'dave-system)
