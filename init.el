;;---------------------------------------------------
;;basic configuration
;;---------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; delete excess backup versions silently
(setq delete-old-versions -1 )
;; use version control
(setq version-control t )
;; no backup files since we always in version controlled dir
(setq vc-make-backup-files nil )
;; don't ask for confirmation when opening symlinked file
(setq vc-follow-symlinks t )
;; inhibit useless and old-school startup screen
(setq inhibit-startup-screen t )
;; silent bell when you make a mistake
(setq ring-bell-function 'ignore )
;; use utf-8 by default
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )
;; sentence SHOULD end with only a point.
(setq sentence-end-double-space nil)
;; toggle wrapping text at the 72th character
(setq default-fill-column 72)
;; show welcome message in the scratch buffer 
(setq initial-scratch-message "Welcome in CCEmacs")

;;--------------------------------------------------
;;package manage
;;--------------------------------------------------
;;initial
;;avoid "bad request" error
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

;; tells emacs not to load any packages before starting up
(setq package-enable-at-startup nil)
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
;; initialize package -> index
(package-initialize)

;; loading package
;; Bootstrap `use-package'
;; unless it is already installed
;; updage packages archive
;; and install the most recent version of use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; import use-package
(require 'use-package)


;;---------------------------------
;; Theme install doom themes
;;---------------------------------
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))


;;----------------------------
;;VIM mode
;;----------------------------
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

;;---------------------------
;; key binding
;;--------------------------

;; config needed packages
;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Custom keybinding
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  ;; "/"   '(counsel-rg :which-key "ripgrep")
  ;; You'll need counsel package for this
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  "pf"  '(helm-find-file :which-key "find files")
  ;; Buffers
  "bb"  '(helm-buffers-list :which-key "buffers list")
  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")
  ;; Others
  "at"  '(ansi-term :which-key "open terminal")
  ))
;;=================end of my config=========================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil which-key avy general use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
