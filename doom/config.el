;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Kyle Yasuda"
      user-mail-address "ksyasuda@umich.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "FiraCode Nerd Font" :size 14))
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



(setq python-prettify-symbols-alist
  '(("lambda"  . ?λ)
    ("and" . ?∧)
    ("or" . ?∨)
    ("in" . ?∈)
    ("for" . ?∀)
    ("def" . ?ƒ)
    ("int" . ?ℤ)
    ("not" . ?¬)))

(setq prettify-symbols-alist
  '(("lambda"  . ?λ)
    ("&&" . ?∧)
    ("||" . ?∨)
    ("in" . ?∈)
    ("for" . ?∀)
    ("function" . ?ƒ)
    ("int" . ?ℤ)
    ("not" . ?¬)))


(use-package! wakatime-mode :ensure t)
(global-wakatime-mode)


(use-package! fira-code-mode
  :hook prog-mode)

;;; LSP
(use-package! lsp
  :init
  (setq lsp-pyls-plugins-pylint-enabled t)
  (setq lsp-pyls-plugins-autopep8-enabled t)
  (setq lsp-pyls-plugins-yapf-enabled t)
  (setq lsp-pyls-plugins-pyflakes-enabled t)
)

(lsp-ui-mode)


(use-package! lsp-mode
  :commands lsp
  :hook
  (sh-mode . 'lsp))

(setq lsp-enable-folding t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


;; (setq python-shell-interpreter "ipython"
;;         python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True")

(setf (lsp-session-folders-blacklist (lsp-session)) nil)
(lsp--persist-session (lsp-session))

(advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))

;;; all the icons

(add-load-path! (expand-file-name "~/Downloads/all-the-icons-dired"))
(load "all-the-icons-dired.el")
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :config
  (add-to-list 'all-the-icons-icon-alist
               '("\\.mkv" all-the-icons-faicon "film"
                 :face all-the-icons-blue))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.srt" all-the-icons-octicon "file-text"
                 :v-adjust 0.0 :face all-the-icons-dcyan))

  ;; Turn off all-the-icons-dired-mode before wdired-mode
  ;; TODO: disable icons just before save, not during wdired-mode
  (defadvice wdired-change-to-wdired-mode (before turn-off-icons activate)
    (all-the-icons-dired-mode -1))
  (defadvice wdired-change-to-dired-mode (after turn-on-icons activate)
    (all-the-icons-dired-mode 1)))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;;; peep dired
(use-package! peep-dired
  :ensure t
  :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
  :bind (:map dired-mode-map
              ("P" . peep-dired)))


;;; company tabnine

(use-package! company-tabnine)

(after! company
    (setq +lsp-company-backends '(company-tabnine :separate company-capf company-yasnippet company-shell))
    (setq company-show-quick-access t)
    (setq company-idle-delay 0)
    (define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)
)

(require 'company-tabnine)

;;; lsp jedi

(use-package! lsp-jedi)
  ; :config
  ; (with-eval-after-load "lsp-mode"
  ;   ;; (add-to-list 'lsp-disabled-clients 'pyls)
  ;   (add-to-list 'lsp-enabled-clients 'jedi)
  ;   (add-to-list 'lsp-enabled-clients 'lsp)))

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;;; enacs application framework
(use-package eaf
  :load-path "~/Downloads/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser))


(require 'eaf-system-monitor)
(require 'eaf-pdf-viewer)
(require 'eaf-terminal)
(require 'eaf-music-player)
(require 'eaf-browser)
(require 'eaf-jupyter)
(require 'eaf-file-browser)
(require 'eaf-markdown-previewer)
(require 'eaf-image-viewer)
(require 'eaf-file-manager)
(require 'eaf-airshare)
(require 'eaf-org-previewer)
(require 'eaf-file-sender)
(require 'eaf-video-player)

(require 'eaf-evil)


(define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))


;;; gif screencast

(with-eval-after-load 'gif-screencast
  (define-key gif-screencast-mode-map (kbd "<f8>") 'gif-screencast-toggle-pause))

(global-set-key (kbd "<f9>") 'gif-screencast-start-or-stop)


;;; HOOKS


(add-hook 'python-mode 'python-pylint)
; (add-hook 'sh-mode-hook 'flycheck-mode)

; enable bash language server
;(setq lsp-auto-configure nil)

(add-hook 'org-mode-hook #'org-bullets-mode)
(add-hook 'before-save-hook 'py-isort-before-save)


;;; SQL MODE


(defun my-sql-save-history-hook ()
    (let ((lval 'sql-input-ring-file-name)
          (rval 'sql-product))
      (if (symbol-value rval)
          (let ((filename 
                 (concat "~/.emacs.d/sql/"
                         (symbol-name (symbol-value rval))
                         "-history.sql")))
            (set (make-local-variable lval) filename))
        (error
         (format "SQL history will not be saved because %s is nil"
                 (symbol-name rval))))))
 
  (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

  (defun upcase-sql-keywords ()
    (interactive)
    (save-excursion
      (dolist (keywords sql-mode-postgres-font-lock-keywords)
        (goto-char (point-min))
        (while (re-search-forward (car keywords) nil t)
          (goto-char (+ 1 (match-beginning 0)))
          (when (eql font-lock-keyword-face (face-at-point))
            (backward-char)
            (upcase-word 1)
            (forward-char))))))

  ; (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook 'upercase-sql-keywords')


;;; VARIABLES
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq rainbow-delimiters-mode t)
(setq rainbow-mode t)
(setq confirm-kill-emacs nil)
(setq prettify-symbols-mode nil)
(setq global-prettify-symbols-mode nil)
(setq browse-url-browser-function 'browse-url-firefox)


(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(setq jedi:environment-virtualenv ["source", "./env/bin/activate"])
(setq jedi:key-complete ["Tab"])
(setq format-all-debug nil)

(setq lsp-ui-doc-position 'bottom)
(setq lsp-ui-doc-alignment 'window)
(setq lsp-ui-doc-max-height 25)
(setq lsp-ui-doc-max-width 350)
(setq lsp-ui-doc-mode t)
(setq lsp-ui-peek-mode t)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-doc-delay 0.25)
(setq company-quickhelp-delay 0.5)
(setq lsp-jedi-python-library-directories '(/usr .env/lib/))

(setq eaf-terminal-font-size 12)
(setq lsp-treemacs-sync-mode 1)

(after! 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;;; KEYBINDINGS

(map! :leader
      (:prefix ("o" . "+open")
      :desc "Launch lsp-ui-imenu"
      "i" #'lsp-ui-imenu))

(map! :leader
      (:prefix ("c" . "+code")
      :desc "LSP Peek"
      (:prefix ("p" . "+peek")
       :desc "Find references"
       "r" #'lsp-ui-peek-find-references)))

(map! :leader
      (:prefix ("c" . "+code")
       :desc "Peek definition of thing under the cursor"
       (:prefix ("p" . "+peek")
        :desc "Find definitions"
        "d" #'lsp-ui-peek-find-definitions)))

(map! :leader
       :desc "nohls"
       "s c" #'evil-ex-nohighlight)

(map! :leader
      :desc "Restart LSP server"
      "c R" #'lsp-workspace-restart)

(map! :leader
      :desc "Search web"
      "o w" #'eaf-open-browser-with-history)

(map! :leader
      :desc "Open link under cursor in browser"
      "o l" #'eaf-open-url-at-point)
