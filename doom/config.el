;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Kyle Yasuda"
      user-mail-address "the.sudacode@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "JetBrains Mono Nerd Font" :size 12.0))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;-------;;
;; VTERM ;;
;;-------;;
(after! vterm
  (set-popup-rule! "*doom:vterm-popup:main" :size 0.45 :vslot -4 :select t :quit nil :ttl 0 :side 'right)
)

;;----------;;
;; WAKATIME ;;
;;----------;;
(use-package! wakatime-mode :ensure t)
(global-wakatime-mode)

;;-----------;;
;; FIRA CODE ;;
;;-----------;;
;; (use-package! fira-code-mode
;;   :hook prog-mode)

;;---------------;;
;; ALL THE ICONS ;;
;;---------------;;
(add-load-path! (expand-file-name "~/Downloads/all-the-icons-dired"))
(load "all-the-icons-dired.el")
(use-package! all-the-icons-dired
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

;;-----------;;
;; VARIABLES ;;
;;-----------;;
;; :set relativenumber
(setq display-line-numbers-type 'relative)
(setq rainbow-delimiters-mode t)
(setq confirm-kill-emacs nil)
(setq browse-url-browser-function 'browse-url-firefox)
(setq prettify-symbols-mode nil)
(setq +pretty-code-enabled-modes nil)
(setq prettify-symbols-mode nil)
(setq global-prettify-symbols-mode nil)
(setq lsp-diagnostic-package :none)
(setq shfmt-arguments '("-i" "0" "-ci" "-sr"))

;; (setq lsp-ui-doc-position 'bottom)
;; (setq lsp-ui-doc-alignment 'window)
;; (setq lsp-ui-doc-max-height 25)
;; (setq lsp-ui-doc-max-width 350)
;; (setq lsp-ui-doc-mode t)
;; (setq lsp-ui-peek-mode t)
;; (setq lsp-ui-peek-enable t)
;; (setq lsp-ui-doc-delay 0.25)

;; (setq eaf-terminal-font-size 12)
;; (setq lsp-treemacs-sync-mode 1)

;;--------;;
;; HOOKS  ;;
;;--------;;
(add-hook 'org-mode-hook #'org-bullets-mode)
(add-hook 'before-save-hook 'py-isort-before-save)
(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred
(add-hook 'sh-mode-hook 'shfmt-on-save-mode 'flycheck-mode)

;;--------;;
;; AFTER  ;;
;;--------;;
(after! 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;;--------------;;
;; KEYBINDINGS  ;;
;;--------------;;
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

(map! :leader
      :desc "Toggle hlline for current buffer"
      "t h" #'display-fill-column-indicator-mode)
