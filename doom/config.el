;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "nam7v3"
      user-mail-address "nam7v3@gmail.com")

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
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

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

(setq doom-leader-alt-key "M-m"
      tab-width 2
      delete-active-region t
      set-mark-command-repeat-pop t
      doom-font (font-spec :family "Hack Nerd Font" :size 17)
      doom-modeline-icon nil)

(delete-selection-mode 1)

(load! "function.el")

(after! cc-mode
  (setq-default c-basic-offset 2))

(after! proced
  (setq proced-auto-update-interval 1)
  (add-hook! proced-mode-hook 'proced-toggle-auto-update))

(after! projectile
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map))

;; Maybe if I feel like vim
(after! evil
  (defalias 'evil-insert-state 'evil-emacs-state)
  ;; Function
  (defun my/evil-keyboard-quit ()
    "Keyboard quit in evil mode"
    (interactive)
    (if (evil-mode) (evil-escape))
    (keyboard-quit))

  (map! :ni "C-e" 'end-of-line
        :ni "C-n" 'next-line-or-history-element
        :ni "C-p" 'previous-line-or-history-element
        :e "C-g" 'my/evil-keyboard-quit
        :ni "C-y" 'yank
        :i "C-d" 'delete-char
        :i "C-w" 'kill-region
        :nvo "L" 'evil-end-of-line
        :nvo "H" 'evil-first-non-blank))

(after! eglot
  (map! :map (eglot-mode-map)
        "C-h ." 'eldoc-doc-buffer
        "C-c =" 'eglot-format
        "C-c a" 'eglot-code-actions
        "C-c r" 'eglot-rename))

(after! multiple-cursors
  (map! "C-z" 'mc/mark-next-like-this
        "C-M-z" 'mc/mark-previous-like-this
        "C-c m a" 'mc/mark-all-like-this
        "C-c m l" 'mc/edit-lines))

(after! flycheck
  (map! :map flycheck-mode-map flycheck-keymap-prefix nil)
  (map! "C-c e" flycheck-command-map))

(after! ivy
  (map! :map (ivy-minibuffer-map)
      "M-RET" 'ivy-immediate-done))

(after! vertico
  (map! :map (vertico-map)
        "C-n" 'next-line-or-history-element
        "C-p" 'previous-line-or-history-element))

(map! :map (minibuffer-mode-map)
      "C-k" 'kill-line
      "C-p" 'previous-history-element
      "C-n" 'next-history-element)

(map! :map (indent-rigidly-map)
      "S-<left>" nil
      "S-<right>" nil
      "<left>" nil
      "<right>" nil
      "TAB" 'indent-rigidly-right-to-tab-stop
      "<backtab>" 'indent-rigidly-left-to-tab-stop
      "f" 'indent-rigidly-right
      "b" 'indent-rigidly-left)

;; Search and Replace
(map!
 "C-o" 'newline-and-indent
 "C-s" 'isearch-forward-regexp
 "C-r" 'isearch-backward-regexp
 "M-s s" 'isearch-forward
 "M-s r" 'isearch-backward
 "M-%" 'query-replace-regexp
 "C-M-%" 'query-replace
 ;; Editing
 "M-SPC" 'er/expand-region
 "M-S-SPC" 'er/contract-region
 "C-x C-o" 'fixup-whitespace-or-delete-blank-lines
 "C-x C-b" 'ibuffer
 ;; Buffer
 "C-x x k" 'kill-buffer-and-window
 ;; Useful
 "M-o" 'other-window)
