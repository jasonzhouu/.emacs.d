;; this is the setting of emacs, but it will not take effect just by changing this file, but by execute command at the end of it

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
;; function "package-initialize" controls variable "load-path", which is list of directories of emacs packages.
(package-initialize)



;; -----------------------------------------------------------------------------
;; personal configuration of           jason zhou                start
;; -----------------------------------------------------------------------------

;; https://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
;; https://emacs.stackexchange.com/questions/352/how-to-override-major-mode-bindings/360#360
;; deft: nv on emacs
;; with bind-key 3rd party package, major mode key-binding can be overriden easily

;; bind key to magit
(global-set-key (kbd "C-x g") 'magit-status)

;; use `company-mode` in all buffers
(add-hook 'after-init-hook 'global-company-mode)

(bind-key* "M-n" 'deft)
(setq deft-use-filename-as-title nil)
;; use the filter string as new file's name
(setq deft-use-filter-string-for-filename 1)
;; Default file extension of newly created files
(setq deft-default-extension "md")
;; Prefix titles in new Markdown files with required number of hash marks
(setq deft-markdown-mode-title-level 1)
;; set default loading file path
;; (setq deft-directory "/Users/yushengzhou/Library/Mobile Documents/27N4MQEA55~pro~writer/Documents/notes")
(setq deft-directory "~/Nutstore Files/notes")

;; deft.el:239 将子目录纳入检索范围
(setq deft-recursive t)
;; save file interval
(setq deft-auto-save-interval 0)


;; 解决 emacs.app 输入中文时光标跳动的问题
(setq redisplay-dont-pause nil)

;; change font size to 200，只在图形界面下有效
(set-face-attribute 'default nil :height 200)

;; hide tool bar
;; https://www.emacswiki.org/emacs/ToolBar
(tool-bar-mode -1)

;; hide menu bar in both CLI and GUI mode 显示 menu
;; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode 1)

;; evoke undo tree mode in all buffers 开启undo tree mode
(global-undo-tree-mode 1)

;; show line number in all buffers 显示行号
(global-linum-mode 1)

(global-visual-line-mode 1)

;; menu->file->open recent
(require 'recentf)
(recentf-mode t)
(setq rencentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; close scroll bar
(scroll-bar-mode 1)

;; auto indent
;; (electric-indent-mode -1)

;; close "GNU Emacs" welcoming page when emacs is opened
(setq inhibit-splash-screen 1)

;; make the scratch empty initially
(setq initial-scratch-message nil)

;; 光标类型
;; (setq-default cursor-type 'bar)
(setq-default cursor-type t)

;; 光标不闪 blink
;; https://www.emacswiki.org/emacs/NonBlinkingCursor
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Cursor-Display.html
(blink-cursor-mode 0)
;; default tab-width is 8
;; (setq tab-width 4)


;; don't make backup files which file name is ended with ~
(setq make-backup-files nil)

;; if edit while selection, character selected will be deleted
(delete-selection-mode 1)

;; full screen when open emacs.app
(setq initial-frame-alist (quote ((fullscreen . maximized))))


;; when emacs-lisp-mode is activated, show-paren-mode is activated automatically
;; add-hook link these two mode
;; show-paren-mode is used two highlight parentheses pair when cursor is on parentheses
;; it can also be enabled by menu->options->highlight matching parentheses
;; emacs-lisp-mode is not activated just when editing .el file, but also in scratch and org mode
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;; highlight current editing line 将光标所在行高亮
(global-hl-line-mode 0)

;; highlight code in orgmode
(setq org-src-fontify-natively 1)

;; -----------------------------------------------------------------------------
;; personal configuration of               jason zhou              end
;; -----------------------------------------------------------------------------


;; define a function, and add it to meta-x
(defun open-personal-configuration()
  (interactive)

  ;; "find-file" is the function that "ctrl-x ctrl-f" linked to
  (find-file "~/.emacs.d/init.el"))

;; transfer 'global-set-key' two parameter: keybinding and function
(global-set-key (kbd "<f3>") 'open-personal-configuration)

(defun open-home-directory()
  (interactive)
  (find-file "~/"))
(global-set-key (kbd "<f1>") 'open-home-directory)
(defun open-notes-directory()
  (interactive)
  (find-file "~/notes/"))
(global-set-key (kbd "<f2>") 'open-notes-directory)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(deft-use-filename-as-title t t)
 '(fci-rule-color "#3C3D37")
 '(global-undo-tree-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.emacs-china.org/gnu/")
     ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
 '(package-selected-packages
   (quote
    (company go-mode magit bind-key markdown-mode undo-tree deft)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function (quote mailclient-send-it))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
;; (Custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
