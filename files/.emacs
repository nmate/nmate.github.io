(package-initialize)
(elpy-enable)
;; temporarily disable automatic project root selection
;; this is due to the placement project where several 
;; git submodules exist
(setq elpy-project-root nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(ecb-layout-name "left3")
 '(ecb-options-version "2.40")
 '(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint.py")
 '(flycheck-gcc-include-path nil)
 '(gdb-non-stop-setting t)
 '(package-selected-packages
   (quote
    (eglot yaml-mode markdown-mode company-irony-c-headers company-irony irony multiple-cursors magit json-mode projectile rtags company move-text use-package smart-mode-line-powerline-theme paredit flycheck elpy)))
 '(safe-local-variable-values
   (quote
    ((flycheck-gcc-include-path . "/home/emtinag/mgw/bgf_appl_v/redundancy"))))
 '(sml/theme (quote powerline))
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/folder ((t (:inherit sml/global :background "grey17" :foreground "dark gray" :weight normal))))
 '(which-func ((t (:foreground "deep sky blue")))))

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
(scroll-bar-mode -1)
(tool-bar-mode -1)
(ido-mode 1)

;; WinMove
(global-set-key [C-left] 'windmove-left)   ; move to left window
(global-set-key [C-right] 'windmove-right) ; move to right window
(global-set-key [C-up] 'windmove-up)       ; move to upper window
(global-set-key [C-down] 'windmove-down)   ; move to lower window

;; scroll more smoothly
(setq scroll-conservatively 3)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; enable move-text with default bindings
(move-text-default-bindings)


;; get rid of automatic indention:
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
;; if indented RETURN is needed press C-j

;;*************************************
;; Color themes - pick one
;;-------------------------------------
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/noctilux-theme")
;;(load-theme 'noctilux t)

;; warning: tango-2 is modified by me
(add-to-list 'custom-theme-load-path "~/.emacs.d/tango-2-theme")
(load-theme 'tango-2 t)


;;*************************************
;; Org-mode shift + select
;;-------------------------------------
(setq org-support-shift-select 'always)

;;*************************************
;; ECB
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/ecb-master")
(require 'ecb)
(setq ecb-tip-of-the-day nil)

;;*************************************
;; Git mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/git")
(require 'git)
(require 'git-blame)

;; protobuf 
(add-to-list 'load-path "~/.emacs.d/protobuf")
(require 'protobuf-mode)
(setq auto-mode-alist  (cons '(".proto$" . protobuf-mode) auto-mode-alist)) 

;;*************************************
; Go mode customizations
;;-------------------------------------;
(add-hook 'go-mode-hook
  (lambda ()
    (setq-default)
    (setq tab-width 8)
    (setq standard-indent 8)
    (setq indent-tabs-mode nil)
    (eglot-ensure)
    ))

;**
; Eldoc customizations: used by eglot
;-----------------------------------------
(setq eldoc-echo-area-use-multiline-p nil)

;;*************************************
;; cpy file mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/cpy-filename")
(require 'cpy-filename)

;;*************************************
;; GO mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/go-mode.el")
(require 'go-mode)

;;*************************************
;; find files quickly in repo
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/quick-repo-find")
(require 'quick-repo-find)
(global-set-key "\C-cr"  'quick-repo-find)

;; (add-to-list 'load-path "~/.emacs.d/quick-cn-repo-find")
;; (require 'quick-cn-repo-find)
;; (global-set-key "\C-cn"  'quick-cn-repo-find)

;;*************************************
;; Use GLOBAL for tagging
;;-------------------------------------
(defvar global-path "~/global-6.6.2")
;;(defvar global-exec "~/global-6.5.6/global/global")
(defvar global-dir (concat global-path "/global"))
(defvar global-exec (concat global-path "/global/global"))
;;(add-to-list 'load-path "~/global-6.5.6/")
(add-to-list 'load-path global-path)

;; put the binary into Emacs's path
;;(setenv "GTAGSGLOBAL" "~/global-6.5.6/global/global")
(setenv "GTAGSGLOBAL" global-exec)
(setq exec-path (append exec-path '("~/global-6.6.2/global/global")))
;;(setq exec-path (append exec-path global-exec))

;;(setenv "PATH" (concat (getenv "PATH") ":~/global-6.5.6/global"))
(setq exec-path (append exec-path '("~/global-6.6.2/global")))

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
;;     ln -s /home/emtinag/dpdk-2.2.0/ dpdk
;; 4.) generate there the tags
;;     gtags -c (c:compressed format)
;; -------------------------------------

;;*************************************
;; Use ggtags as a GLOBAL frontend
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/ggtags")
(setq ggtags-executable-directory "~/global-6.6.2/global/")
(require 'ggtags)

;; automatically switch ggtags on when C/C++
(add-hook 'c-mode-common-hook
       (lambda ()
       (when (derived-mode-p 'c-mode 'c++-mode)
       (ggtags-mode 1))))

;;*************************************
;; Jump between header and source files
;;-------------------------------------
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

;; unset new line from C-o
(global-unset-key (kbd "C-o"))
(global-set-key  (kbd "C-o") 'ff-find-other-file)


;;*************************************
;; Shell mode customization
;;-------------------------------------
; make more of the last input visible
(setq comint-scroll-to-bottom-on-input t) 

;;*************************************
;; Multiple cursors
;;-------------------------------------
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;(global-set-key (kbd "C->") 'mc/mark-next-like-this-word)

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
(global-set-key "\C-co" 'find-file-other-window)
(global-set-key [f2]     'revert-buffer)

;; Window resizing shortcuts
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; ModeLine
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/smart-mode-line-powerline-theme-20160705.1738"))
(require 'smart-mode-line)
;;(setq sml/theme 'dark)
(sml/setup)

;;*************************************
;; TTCN-3 mode
;;-------------------------------------
(add-to-list 'load-path "~/.emacs.d/ttcn-el-master")
(require 'ttcn3)
(setq auto-mode-alist (cons '("\\.ttcn$" . ttcn-3-mode) auto-mode-alist))


;;*************************************
;; Add MELPA repository 
;;-------------------------------------
(require 'package)
(add-to-list 'package-archives
            '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

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
(use-package flycheck
 :ensure t
 :init (global-flycheck-mode))
;; 
;;((c++-mode . ((flycheck-gcc-include-path . ("../inc")))))
;;  ((c++-mode . ((flycheck-gcc-include-path . ("/home/<user>/<project>/include")))))
;; ("../../inc/*/") "../../../inc/*/*/"

;; (eval-after-load 'flycheck
;;   '(progn
;;      (require 'flycheck-google-cpplint)
;;      ;; Add Google C++ Style checker.
;;      ;; In default, syntax checked by Clang and Cppcheck.
;;      (flycheck-add-next-checker 'c/c++-cppcheck
;;                                 '(warning . c/c++-googlelint))))



(add-hook 'ielm-mode-hook #'enable-paredit-mode)

;;*************************************
;; RTAGS
;; req-package mar eleve vmi kiterjesztese a require-nek...
;;-------------------------------------
;; (req-package rtags
;;   :config
;;   (progn
;;     (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
;;     (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

;;     (define-key c-mode-base-map (kbd "M-m") 'rtags-find-symbol-at-point)
;;     (define-key c-mode-base-map (kbd "M-n") 'rtags-find-references-at-point)
;;     (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
;;     (rtags-enable-standard-keybindings)

;;     (setq rtags-use-helm t)

;;     ;; Shutdown rdm when leaving emacs.
;;     (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
;;     ))


;;*************************************
;; Elpy
;;-------------------------------------
(require 'package)
(add-to-list 'package-archives
            '("elpy" . "https://jorgenschaefer.github.io/packages/"))

