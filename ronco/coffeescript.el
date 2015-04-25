(setq coffee-tab-width 2)

;; (setq coffee-args-compile '("-c" "-m")) ;; generating sourcemap
;; (add-hook 'coffee-after-compile-hook 'sourcemap-goto-corresponding-point)

;; If you want to remove sourcemap file after jumping corresponding point
;; (defun my/coffee-after-compile-hook (props)
;;   (sourcemap-goto-corresponding-point props)
;;   (delete-file (plist-get props :sourcemap)))
;; (add-hook 'coffee-after-compile-hook 'my/coffee-after-compile-hook)
