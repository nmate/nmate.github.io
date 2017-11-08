(package-initialize)
;;*************************************
;; Basic settings
;;-------------------------------------
(show-paren-mode 1) 
(global-linum-mode 1)  ;display line numbers
(column-number-mode 1) ;display column numbers
(winner-mode 1)
(cua-selection-mode t)
(put 'upcase-region 'disabled nil)
(delete-selection-mode 1)
(setq ediff-diff-options "-w")
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; scroll more smoothly
(setq scroll-conservatively 3)

;;*************************************
;; Color themes - pick one
;;-------------------------------------
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/noctilux-theme")
;;(load-theme 'noctilux t)

;; warning: tango-2 is modified by me
(add-to-list 'custom-theme-load-path "~/.emacs.d/tango-2-theme")
(load-theme 'tango-2 t)

;;(load-theme 'material t)

;; smart-mode-line -> disables the default theme!
;;(setq sml/no-confirm-load-theme t)
;;(setq sml/theme 'dark)
;;(sml/setup)

;;*************************************
;; ECB
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/ecb-master")
(require 'ecb)
;;(require 'ecb-autoloads)

;;redifine jumping keys
(define-key ecb-mode-map (kbd "<M-left>") 'ecb-goto-window-directories)
(define-key ecb-mode-map (kbd "<M-right>") 'ecb-goto-window-edit1)

;; ECB binding:
;;(global-set-key (kbd "<M-left>") 'ecb-goto-window-methods)
;;(global-set-key (kbd "<M-right>") 'ecb-goto-window-edit1)


;;*************************************
;; Git mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/git")
(require 'git)
(require 'git-blame)

;;*************************************
;; cpy file mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/cpy-filename")
(require 'cpy-filename)

;;*************************************
;; Use GLOBAL for tagging
;;-------------------------------------
(defvar global-path "~/global-6.5.6")
;;(defvar global-exec "~/global-6.5.6/global/global")
(defvar global-dir (concat global-path "/global"))
(defvar global-exec (concat global-path "/global/global"))
;;(add-to-list 'load-path "~/global-6.5.6/")
(add-to-list 'load-path global-path)

;; put the binary into Emacs's path
;;(setenv "GTAGSGLOBAL" "~/global-6.5.6/global/global")
(setenv "GTAGSGLOBAL" global-exec)
(setq exec-path (append exec-path '("~/global-6.5.6/global/global")))
;;(setq exec-path (append exec-path global-exec))

;;(setenv "PATH" (concat (getenv "PATH") ":~/global-6.5.6/global"))
(setq exec-path (append exec-path '("~/global-6.5.6/global")))

;;(add-to-list 'load-path "~/.emacs.d/")
(autoload 'gtags-mode "gtags" "" t)
;;(require 'gtags)

;; -------------------------------------
;; In order to be able to jump between different projects
;; e.g.: root_dir_a and root_dir_b, this needs to be done:
;; 1.) put "export GTAGSLIBPATH=$HOME/.gtags/" into .bashrc
;; 2.) create a directory that stores symbolic links to projects
;;     mkdir ~/.gtags
;; 3.) create symlinks
;;     ln -s /home/USER/dpdk-2.2.0/ dpdk
;; 4.) generate there the tags
;;     gtags -c (c:compressed format)
;; -------------------------------------

;;*************************************
;; Use ggtags as a GLOBAL frontend
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/ggtags")
(setq ggtags-executable-directory "~/global-6.5.6/global/")
(require 'ggtags)

;;*************************************
;; Jump between header and source files
;;-------------------------------------
;; unset new line from C-o
(global-unset-key (kbd "C-o"))
(global-set-key  (kbd "C-o") 'ff-find-other-file)

;; specify search directories
(setq ff-search-directories '("." "../src/" "../inc" "../include"
                             "../../src/*/"
                             "../../include/*/"
                             "../../inc/*/"
                             "../../shared/*/"
                             "../../../src/*/*/"
                             "../../../include/*/*/" 
                            "../../../inc/*/*/"
                             "../../../shared/*/*/"))


;;*************************************
;; Shell mode customization
;;-------------------------------------
; make more of the last input visible
(setq comint-scroll-to-bottom-on-input t) 

;;*************************************
;; Highlight symbols
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/highlight-symbol")
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;;*************************************
;; Key bindings
;;-------------------------------------
(global-set-key "\C-cg"  'goto-line)
(global-set-key [f2]     'revert-buffer)

;;*************************************
;; TTCN-3 mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/ttcn-el-master")
(require 'ttcn3)
(setq auto-mode-alist (cons '("\\.ttcn$" . ttcn-3-mode) auto-mode-alist))


;;*************************************
;; Add MELPA repository 
;;-------------------------------------
;; (require 'package)
;; (add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)
;; (package-refresh-contents)

;;*************************************
;; Bootstrap `use-package'
;;-------------------------------------
;;(unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))

;;(eval-when-compile
;;  (require 'use-package))
;;(require 'diminish)
;;(require 'bind-key)

;;*************************************
;; Flycheck
;;-------------------------------------
;;(use-package flycheck
;;  :ensure t
;;  :init (global-flycheck-mode))


(add-hook 'ielm-mode-hook #'enable-paredit-mode)

;;*************************************
;; Elpy
;;-------------------------------------
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(ecb-layout-name "left3")
 '(ecb-options-version "2.40")
 '(gdb-non-stop-setting t)
 '(sml/theme (quote dark))
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(which-func ((t (:foreground "deep sky blue")))))
