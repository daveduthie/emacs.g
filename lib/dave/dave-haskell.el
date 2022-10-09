(use-package haskell-mode
  :defer t
  :init
  (setq haskell-mode-hook
	'(capitalized-words-mode flyspell-prog-mode interactive-haskell-mode)))

(provide 'dave-haskell)
