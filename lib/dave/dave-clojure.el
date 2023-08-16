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

;;;; Portal integration
;; https://cljdoc.org/d/djblue/portal/0.37.1/doc/editors/emacs

;; def portal to the dev namespace to allow dereferencing via @dev/portal
(defun portal.api/open ()
  (interactive)
  (cider-nrepl-sync-request:eval
    "(do (ns dev) (def portal ((requiring-resolve 'portal.api/open))) (add-tap (requiring-resolve 'portal.api/submit)))"))

(defun portal.api/clear ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/clear)"))

(defun portal.api/close ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/close)"))

;;;; Sync deps

(defun dd/sync-deps-aliases (aliases)
  (apply #'concat
	 "[ "
	 (append (mapcar (lambda (x) (concat ":" x " ")) (split-string aliases " "))
		 '("]"))))

(defun dd/sync-deps (&optional aliases)
  (interactive (list (completing-read "Aliases: " nil)))
  (message
   (cider-nrepl-sync-request:eval
    (format "((requiring-resolve 'clojure.repl.deps/sync-deps) %s)"
	    (dd/sync-deps-aliases aliases)))))

(evil-define-key 'normal 'clojure-mode-map (kbd "<SPC> t p o") #'portal.api/open)
(evil-define-key 'normal 'clojure-mode-map (kbd "<SPC> t p c") #'portal.api/clear)
(evil-define-key 'normal 'clojure-mode-map (kbd "<SPC> t p q") #'portal.api/close)

(provide 'dave-clojure)
