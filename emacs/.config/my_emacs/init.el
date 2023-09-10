
(setq inhibit-startup-message t)
(setq visible-bell t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(global-auto-revert-mode t)


(global-set-key [escape] 'keyboard-escape-quit)


(delete-selection-mode 1)
(electric-indent-mode -1)
(electric-pair-mode 1)

(set-face-attribute 'default nil :height 100)

(load-theme 'modus-vivendi t)

(setq vc-follow-symlinks t)


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



;; Elpaca

(defvar elpaca-installer-version 0.5)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))



;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

;;When installing a package which modifies a form used at the top-level
;;(e.g. a package which adds a use-package key word),
;;use `elpaca-wait' to block until that package has been installed/configured.
;;For example:
;;(use-package general :demand t)
;;(elpaca-wait)


;;Turns off elpaca-use-package-mode current declartion
;;Note this will cause the declaration to be interpreted immediately (not deferred).
;;Useful for configuring built-in emacs features.
(use-package emacs :elpaca nil :config (setq ring-bell-function #'ignore))

;; Don't install anything. Defer execution of BODY
;; (elpaca nil (message "deferred"))






;; No littering
;; (setq no-littering-etc-directory
      ;; (expand-file-name user-emacs-config))
;; (setq no-littering-var-directory
      ;; (expand-file-name "data/" user-emacs-directory))
;;
;; (use-package no-litering)









;; Expands to: (elpaca evil (use-package evil :demand t))
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
      "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
      "e r" '(eval-region :wk "Evaluate elisp in region"))

    (xecarlox/leader-keys
      "h"   '(:ignore t :wk "Help")
      "h v" '(describe-variable :wk "Describe variable")
      "h f" '(describe-function :wk "Describe function"))

    (xecarlox/leader-keys
	"t" '(:ignore t :wk "Toggle")
	"t l" '(display-line-numbers-mode :wk "Toggle line numbers")
	"t t" '(visual-line-mode :wk "Toggle truncated lines"))

    (xecarlox/leader-keys
	"f" '(:ignore t :wk "Font")
	"f +" '(text-scale-increase :wk "text scale increase")
	"f -" '(text-scale-decrease :wk "text scale decrease"))

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


;; rainbow package
(use-package rainbow-mode
  :hook
  ((org-mode prog-mode) . rainbow-mode))


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
