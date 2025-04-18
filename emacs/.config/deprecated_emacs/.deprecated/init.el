
;; (use-package no-littering)


(setq inhibit-startup-message t)
(setq visible-bell t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq scroll-step 1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(global-auto-revert-mode t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)

(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)

;; cut startup time
;; (server-start)
;; add a if statement to fix error



(setq
    backup-directory-alist '(("." . "~/.cache/emacs/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
)


(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))

(global-set-key [escape] 'keyboard-escape-quit)


(delete-selection-mode 1)
(electric-indent-mode -1)
(electric-pair-mode 1)

(set-face-attribute 'default nil :height 100)

(load-theme 'modus-vivendi t)

;; (setq vc-follow-symlinks nil)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; emacs startup reporting
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


;; Straight - Package Manager

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq package-enable-at-startup nil)


;; Evil Mode
(use-package evil
    :init
    (setq evil-want-integration t
          evil-want-keybinding nil
          evil-vsplit-window-right nil
          evil-split-window-below nil)
    (evil-mode))



(use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))


;; General Keybindings

(use-package general
  :config
    (general-evil-setup)
    (general-create-definer xecarlox/leader-keys
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix "SPC"
  :global-prefix "M-SPC")

  (xecarlox/leader-keys
    ". f"       '(find-file :wk "Find file")
    ". r"     '(counsel-recentf :wk "find recent files")
    )

  (xecarlox/leader-keys
    "c"     '(:ignore t :wk "config")
    "c e"   '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Edit emacs config")
    "c l"   '((lambda () (interactive) (load-file user-init-file)) :wk "Reload emacs config")
    )

  (xecarlox/leader-keys
    "b"   '(:ignore t          :wk "buffer")
    "b b"  '(switch-to-buffer  :wk "Switch buffer")
    "b i"  '(ibuffer           :wk "Ibuffer")
    "b k"  '(kill-this-buffer  :wk "Kill this buffer")
    "b n"  '(next-buffer       :wk "Next buffer")
    "b p"  '(previous-buffer   :wk "Previous buffer")
    "b r"  '(revert-buffer     :wk "Reload buffer"))


  (xecarlox/leader-keys
    "h"   '(:ignore t :wk "Help")
    "h v" '(describe-variable :wk "Describe variable")
    "h f" '(describe-function :wk "Describe function"))

  (xecarlox/leader-keys
    "t" '(:ignore t :wk "terminal")
    "t e" '(eshell :wk "Eshell")
    "t v" '(vterm-toggle :wk "Toggle VTerm"))

  (xecarlox/leader-keys
    "w"   '(:ignore t :wk "Window")
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w H" '(evil-window-split :wk "Horizontal window split")
    "w V" '(evil-window-vsplit :wk "Vertical window split")

    "w h" '(evil-window-left :wk "Move to window left")
    "w l" '(evil-window-right :wk "Move to window right")
    "w k" '(evil-window-up :wk "Move to window up")
    "w j" '(evil-window-down :wk "Move to window down")
    "w w" '(evil-window-next :wk "Move to next window"))
)


;; which-key package
(use-package which-key
  :init
    (which-key-mode 1)
  :config
    (setq
      which-key-side-window-location 'bottom
      which-key-sort-order #'which-key-key-order-alpha
      which-key-sort-uppercase-first nil
      which-key-add-column-padding 1
      which-key-max-display-columns nil
      which-key-min-display-lines 3
      which-key-side-window-slot -10
      which-key-side-window-max-height 0.25
      which-key-idle-delay 0.8
      which-key-max-description-length 25
      which-key-allow-imprecise-window-fit t
      which-key-separator " → " ))


;; install rainbow package
;; install rainbow-delimiters


;; install all-the-icons



;; Ivy package
(use-package counsel
  :after ivy
  :config (counsel-mode))

;; install ivy-rich


(use-package ivy
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))





;; terminals


(use-package eshell-syntax-highlighting
  :after esh-mode
  :config
    (eshell-syntax-highlighting-global-mode +1))


(setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
      eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "ssh" "zsh"))


(use-package vterm
    :config
    (setq shell-file-name "/bin/sh"
	vterm-max-scrollback 5000))


(use-package vterm-toggle
  :after vterm
  :config
    (setq vterm-toggle-fullscreen-p nil)
    (setq vterm-toggle-scope 'project)
    (add-to-list 'display-buffer-alist
		'((lambda (buffer-or-name _)
			(let ((buffer (get-buffer buffer-or-name)))
			(with-current-buffer buffer
			    (or (equal major-mode 'vterm-mode)
				(string-prefix-p vterm-buffer-name (buffer-name buffer))))))
		    (display-buffer-reuse-window display-buffer-at-bottom)
		    ;;(disay-buffer-reuse-window display-buffer-in-direction)
		    ;;display-buffer-in-direction/direction/dedicated is added in emacs27
		    ;;(direction . bottom)
		    ;;(dedicated . t) ;dedicated is supported in emacs27
		    (reusable-frames . visible)
		    (window-height . 0.3))))


(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook))

(setq
  dashboard-banner-logo-title "Welcome, Sir"
  dashboard-center-content t
  dashboard-vertically-center-content t
  ;; dashboard-show-shortcuts nil
)

(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))


;; configure ORG mode

(use-package org
    :straight (:type built-in)
    :init
	(setq org-directory "~/Documents/org")
	(setq org-agenda-files (list org-directory))
    :custom
	(org-startup-indented t)
	(org-startup-folded 'content)
	(org-agenda-start-on-weekday nil)
	(setq org-highest-priority ?A)
	(setq org-lowest-priority ?C)
	(setq org-highest-priority ?A)
)


(use-package evil-org
  :after org
  :hook ((org-mode . evil-org-mode)
	 (org-agenda-mode . evil-org-mode))
  :config
    (evil-org-mode)
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))


(setq org-agenda-time-grid
      '((daily today)
        (800 830 900 930 1000 1030 1100 1130 1200 1230 1300 1330 1400 1430 1500 1530 1600 1630 1700 1730 1800)
        "......" "----------------"))

(setq org-agenda-include-deadlines t
    org-agenda-compact-blocks t
    org-agenda-skip-scheduled-if-done t
    org-agenda-skip-deadline-if-done t
    org-agenda-skip-deadline-prewarning-if-scheduled t
    org-agenda-block-separator #x2501
    org-agenda-start-day nil
    org-agenda-overriding-header ""
    org-agenda-start-on-weekday nil)

(setq-default org-enforce-todo-dependencies t)

(setq org-agenda-custom-commands
    '(
	("z" "Week" ((agenda "")))
			    ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))))

	("p" . "Priorities")
	("pa" "A items" tags-todo "+PRIORITY=\"A\"")
	("pb" "B items" tags-todo "+PRIORITY=\"B\"")
	("pc" "C items" tags-todo "+PRIORITY=\"C\"")
))



(setq org-todo-keywords
    '((sequence
	"TODO(t)" "PROJECT(p)" "LEARNING(l)"
	"|"
	"HOLD(h)" "SCRAPPED(s)" "FINISHED(f)" )))



;; (use-package org-roam
  ;; :ensure t
  ;; :custom
  ;; (org-roam-directory (file-truename "~/Documents/roam"))
  ;; :bind (("C-c n l" . org-roam-buffer-toggle)
         ;; ("C-c n f" . org-roam-node-find)
         ;; ("C-c n g" . org-roam-graph)
         ;; ("C-c n i" . org-roam-node-insert)
         ;; ("C-c n c" . org-roam-capture)
         ;; ("C-c n j" . org-roam-dailies-capture-today))
  ;; :config
  ;; (setq
    ;; org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))
    ;; find-file-visit-truename t
    ;; )

  ;; (org-roam-db-autosync-mode)
;; )

