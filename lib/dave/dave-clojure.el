(use-package inf-clojure
  :defer t)

(use-package zprint-format
  :commands (zprint-format-buffer
	     zprint-format-region
             zprint-format-on-save-mode))

(provide 'dave-clojure)
