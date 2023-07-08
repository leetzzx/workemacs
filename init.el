(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-14"))
(setq inhibit-splash-screen t)
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))
(require 'package)
(setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
                         ("melpa" . "http://1.15.88.122/melpa/")))

(setq package-selected-packages '(
				  use-package
				  which-key
				  doom-modeline
				  all-the-icons
				  all-the-icons-dired
				  yasnippet
				  yasnippet-snippets
				  company-posframe
				  posframe
				  swiper
				  company
				  eglot
				  async
				  monokai-theme
				  markdown-mode
				  counsel
				  dashboard
				  smartparens 
				  expand-region
				  python-mode
				  popwin
				  org-pomodoro
				  ))

;; use-package
(eval-when-compile (require 'use-package))
(eval-and-compile
  (setq use-package-always-defer t)
  (setq use-package-always-ensure t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  )

;; posframe
(use-package posframe)

;; monokai-theme
(use-package monokai-theme
  :defer nil
  :config
  (load-theme 'monokai t))


;; dashboard board
(use-package dashboard
  :defer nil
  :config
  (dashboard-setup-startup-hook)
  ;; 在这里添加其他配置选项
  )

;; expand-region
(use-package expand-region
  :bind (("C-=" . er/expand-region)))

;; yasnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet-snippets-20230314.2056/snippets")) ; 修改为你的代码片段目录
  (setq yas-indent-line 'fixed) ; 禁用 Yasnippet 的自动展开
  (define-key yas-minor-mode-map (kbd "C-c <tab>") 'yas-expand)
  (yas-global-mode 1))

;; smartparens
(use-package smartparens
  :defer nil
  :config
  (smartparens-global-mode t)
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil))

;; swiper
(use-package swiper
  :bind (("C-s" . swiper))
  )

;; counsel
(use-package counsel
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x b" . counsel-switch-buffer)
   ))

;; org
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/Org/daily-tasks.org" "~/Org/other-tasks.org" "~/Org/GTD.org"))
(defun open-my-init-file()
  (interactive)
  (find-file "~/Org/GTD.org"))
(global-set-key (kbd "<f7>") 'open-my-init-file)

;; which-key
(use-package which-key
  :init (which-key-mode))
;; doom-modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;; all-the-icons
(use-package all-the-icons)
;; all-the-icons-dired
(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))

;; eglot
(use-package eglot
  :ensure t)

;; company
(use-package company
  :defer nil
  :config
  (global-company-mode)
  ;; 配置补全延迟时间
  (setq company-idle-delay 0.2)
  ;; 配置补全弹出框延迟时间
  (setq company-tooltip-idle-delay 0.2)
  ;; 配置补全弹出框最大高度
  (setq company-tooltip-maximum-displayed 30)
  ;; 配置补全样式
  (setq company-selection-wrap-around t)
  ;;(setq company-show-numbers t)
  (setq company-tooltip-align-annotations t))

(global-set-key (kbd "C-c y") 'company-yasnippet)
(add-hook 'python-mode-hook 'eglot-ensure)
(require 'company-posframe)
(company-posframe-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons yasnippet-snippets jedi use-package lsp-mode))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


