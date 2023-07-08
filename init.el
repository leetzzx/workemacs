;; use-package
(eval-when-compile (require 'use-package))
(eval-and-compile
  (setq use-package-always-defer t)
  (setq use-package-always-ensure t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  )

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
				  company
				  company-jedi
				  yasnippet
				  yasnippet-snippets
				  swiper
				  monokai-theme
				  counsel
				  dashboard
				  smartparens 
				  expand-region
				  python-mode
				  popwin
				  ))


;; company
(use-package company
  :defer nil
  :config
  (setq company-idle-delay 0.2) ; 补全提示延迟时间
  (setq company-minimum-prefix-length 1) ; 最小前缀长度触发补全
  (global-set-key (kbd "C-c y") 'company-yasnippet)
  (global-company-mode 1) ; 全局启用Company补全模式
  (add-hook 'after-init-hook 'global-company-mode))

;; python 
(use-package company-jedi
  :config
  (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi))))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-yasnippet yasnippet-snippets jedi use-package company company-jedi lsp-mode))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
