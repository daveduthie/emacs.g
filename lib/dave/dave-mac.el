(when (equal system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

;; (use-package exec-path-from-shell)
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

(provide 'dave-mac)
