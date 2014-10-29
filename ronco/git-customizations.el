(require 'magit)
(require 'git-gutter)
(define-key global-map "\C-xg" 'magit-status)
(global-git-gutter-mode +1)
