(setq
    inhibit-startup-message t
    history-length 25
    use-dialog-box nil
    visible-bell t)



(require 'package)
(setq 'package-archives '(("melpa" . "http://melpa.org/packages")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)



;;;; 23:00

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;;;;(load-theme 'modus-vivendi t)
(set-frame-parameter (selected-frame) 'alpha '(70 70))
(add-to-list 'default-frame-alist '(alpha 70 70))



;;;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

(recentf-mode 1)
(savehist-mode 1)
(global-display-line-numbers-mode 1)
(global-auto-revert-mode 1)
(global-auto-revert-non-file-buffers t)
