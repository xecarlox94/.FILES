(setq
    inhibit-startup-message t
    history-length 25
    use-dialog-box nil
    visible-bell t)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(load-theme 'modus-vivendi t)

;;;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(recentf-mode 1)
(savehist-mode 1)
(global-display-line-numbers-mode 1)
(global-auto-revert-mode 1)
(global-auto-revert-non-file-buffers t)
