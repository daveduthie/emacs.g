(use-package clojure-mode
  :defer t
  :config
  (setq clojure-toplevel-inside-comment-form t))

(use-package inf-clojure
  :defer t)

(use-package cider
  :defer t
  :config
  ;; TODO: can I set this in a cider keymap?
  (evil-define-key 'normal 'global (kbd "<SPC> r r") 'cider-ns-refresh)
  (setq markdown-indent-on-enter nil)
  (setq cider-xref-fn-depth 90))

;; Inspired by Ryan White's groundhog mode
(defun dd/eval-at-bookmark (&optional bookmark)
  (interactive (list (completing-read "Bookmark: " (mapcar 'car bookmark-alist))))
  (save-excursion
    (let ((return-buffer (current-buffer)))
      (bookmark-jump bookmark)
      (when (string= "yes" (completing-read "Eval this?" '("yes" "no")))
	(cider-eval-sexp-up-to-point))
      (switch-to-buffer return-buffer))))

(use-package zprint-format
  :commands (zprint-format-buffer
	     zprint-format-region
             zprint-format-on-save-mode))

(provide 'dave-clojure)
