(use-package clojure-mode
  :defer t
  :config
  (setq clojure-toplevel-inside-comment-form t))

(use-package inf-clojure
  :defer t)

(use-package cider
  :defer t
  :config
  (setq cider-xref-fn-depth 90))

(use-package zprint-format
  :commands (zprint-format-buffer
	     zprint-format-region
             zprint-format-on-save-mode))

(provide 'dave-clojure)
