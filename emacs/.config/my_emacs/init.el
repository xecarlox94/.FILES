
(setq inhibit-startup-message t)
(setq visible-bell t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(global-auto-revert-mode t)


;; cut startup time
;; (server-start)
;; add a if statement to fix error


(global-set-key [escape] 'keyboard-escape-quit)


(delete-selection-mode 1)
(electric-indent-mode -1)
(electric-pair-mode 1)

(set-face-attribute 'default nil :height 100)

(load-theme 'modus-vivendi t)

(setq vc-follow-symlinks t)

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


;; cleaning emacs config folder

;; (setq user-emacs-config (expand-file-name "~/.config/emacs/"))

;;(setq user-emacs-directory (expand-file-name "~/.cache/emacs/")
      ;;url-history-file (expand-file-name "url/history" user-emacs-directory))
;;
;;(setq custom-file
      ;;(if (boundp 'server-socket-dir)
          ;;(expand-file-name "custom.el" server-socket-dir)
        ;;(expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
;;(load custom-file t)
;;
;; (setq no-littering-etc-directory
      ;; (expand-file-name user-emacs-config))
;; (setq no-littering-var-directory
      ;; (expand-file-name "data/" user-emacs-directory))
;;
;; (use-package no-litering)




;; Straight - Package Manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
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



;; Evil Mode
(use-package evil
    :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vsplit-window-right nil)
    (setq evil-split-window-below nil)
    (evil-mode))



(use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))

(use-package evil-tutor)



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
      "."       '(find-file :wk "Find file")
      "c e"     '((lambda () (interactive) (find-file "~/.config/my_emacs/init.el")) :wk "Edit emacs config")
      "c l"     '((lambda () (interactive) (load-file user-init-file)) :wk "Reload emacs config")
      "f r"     '(counsel-recentf :wk "find recent files")
      "TAB TAB" '(comment-line :wk "Comment lines"))

    (xecarlox/leader-keys
      "b"   '(:ignore t          :wk "buffer")
      "b b"  '(switch-to-buffer  :wk "Switch buffer")
      "b i"  '(ibuffer           :wk "Ibuffer")
      "b k"  '(kill-this-buffer  :wk "Kill this buffer")
      "b n"  '(next-buffer       :wk "Next buffer")
      "b p"  '(previous-buffer   :wk "Previous buffer")
      "b r"  '(revert-buffer     :wk "Reload buffer"))

    (xecarlox/leader-keys
      "e" '(:ignore t :wk "Evaluate")
      "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
      "e d" '(eval-defun :wk "Evaluate defun containing or after point")
      "e e" '(eval-expression :wk "Evaluate elisp expression")
      "e h" '(counsel-esh-history :wk "Eshell history")
      "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
      "e r" '(eval-region :wk "Evaluate elisp in region")
      "e s" '(eshell :wk "Eshell")
    )

    (xecarlox/leader-keys
      "h"   '(:ignore t :wk "Help")
      "h v" '(describe-variable :wk "Describe variable")
      "h f" '(describe-function :wk "Describe function"))

    (xecarlox/leader-keys
	"t" '(:ignore t :wk "Toggle")
	"t l" '(display-line-numbers-mode :wk "Toggle line numbers")
	"t t" '(visual-line-mode :wk "Toggle truncated lines")
	"t v" '(vterm-toggle :wk "Toggle VTerm")
    )

    (xecarlox/leader-keys
	"f" '(:ignore t :wk "Font")
	"f +" '(text-scale-increase :wk "text scale increase")
	"f -" '(text-scale-decrease :wk "text scale decrease"))

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


(use-package sudo-edit
  :config
  (xecarlox/leader-keys
    "s" '(:ignore t :wk "Sudo")
    "s f" '(sudo-edit-find-file :wk "Sudo find file")
    "s e" '(sudo-edit-find-file :wk "Sudo edit file")
    )
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
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.8
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit t
	  which-key-separator " → " ))


;; ;; rainbow package
;; (use-package rainbow-mode
  ;; :hook
  ;; ((org-mode prog-mode) . rainbow-mode))


;; Icons packages
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))


(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))


;; Ivy package
(use-package counsel
  :after ivy
  :config (counsel-mode))



(use-package ivy
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))


(use-package all-the-icons-ivy-rich
  :ensure t
  :init
  (all-the-icons-ivy-rich-mode 1))



(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
  :after counsel
  :config
  (setq ivy-format-function #'ivy-format-function-line))




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
