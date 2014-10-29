;; extra starter kit packages
(starter-kit-load "js")
(starter-kit-load "lisp")
(starter-kit-load "misc-recommended")
(starter-kit-load "org")
(starter-kit-load "ruby")

;; projectile
(projectile-global-mode)

;; path
;; add brew path
(add-to-list 'exec-path "/usr/local/bin")

;; fonts
;;(dynamic-fonts-setup)
(set-face-attribute 'default nil :font "-*-Inconsolata-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; whitespace
(global-whitespace-mode)

;; tramp
(setq tramp-default-method "ssh")
;; colors
;; (require 'color-theme)
;; (if window-system
;;     (color-theme-blackboard))
(load-theme 'tango-dark)

;; package repos
;; (add-to-list 'package-archives '("org-odt-repo" . "http://repo.or.cz/w/org-mode/org-jambu.git/blob_plain/HEAD:/packages/"))

;; behavioral stuff

(setq ns-pop-up-frames 'nil)

;; path
;; (if (not (getenv "TERM_PROGRAM"))
;;       (let ((path (shell-command-to-string
;;               "/usr/local/bin/fish -c \"printf %s \\\"\\\$PATH\\\"\"")))
;;         (setenv "PATH" path)
;;         (setq exec-path (append (split-string path ":") exec-path))
;;         ))

; code templates
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")

;; xml format
(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
  )
)

;; tabs & spaces
(defun 4x4-spaces ()
  "Setting to use spaces for tabs at a width of 4"
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq c-basic-offset 4))
(defun 2x2-spaces ()
  "Setting to use spaces for tabs at a width of 2"
  (interactive)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq c-basic-offset 2))

(defun 4x4-tabs ()
  "Setting to use tabs at a width of 4"
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (setq c-basic-offset 4))

(setq nxml-indent 4)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Ediff
(setq ediff-diff-options "-w")

(defun ron-js-hook ()
  "My JS settings"
  (whitespace-mode)
  )


(add-hook 'cperl-mode-hook 'ron-perl-hook)
(add-hook 'php-mode-hook 'ron-php-hook)
(add-hook 'js-mode-hook 'ron-js-hook)

;; Obj-c stuff
(defun ron-objc-hook ()
  "My Objective-C settings"
  (c-set-style "BSD")
  (4x4-tabs)
  (local-set-key (kbd "RET") 'newline-and-indent)
  )

(add-hook 'objc-mode-hook 'ron-objc-hook)


;; lisp stuff


;; Modes
(when (fboundp 'winner-mode)
  (winner-mode 1))
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; (load "nxhtml/autostart.el")

(setq auto-mode-alist
      (append
       '(
         ("\\.jstemplate$" . smarty-html-mumamo)
         ) auto-mode-alist))

(setq warning-minimum-level :error)

;; MAGIT

(require 'magit)
;; (require 'magit-flow)

;; find file in project
;; why...?
;;(require 'find-file-in-project)

;; GLOBAL BINDINGS

(fset 'triple-screen
   "\C-x1\C-x3\C-x3\C-x+")
(fset 'twin-screen
   "\C-x1\C-x3\C-x+")
(fset 'triple-u-screen
      "\C-x1\C-x2\C-x3\C-u15\C-x^")

;; org
(setq org-clock-idle-time 5)
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files (list (concat org-directory "/work.org")
                             (concat org-directory "/home.org")
                             (concat org-directory "/someday.org")
                             org-default-notes-file))
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))

(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "NEW" "IN PROGRESS" "|" "FIXED" "DECLINED")
        (sequence "|" "CANCELED")))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(add-hook 'text-mode-hook 'turn-on-orgtbl)

;; buffer window toggling
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-\M-j"  'bs-cycle-next)
(global-set-key "\M-j"     'bs-cycle-previous)
(global-set-key "\M-o"     'other-window)

;; start emacs server
(server-start)
