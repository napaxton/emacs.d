;;; init.el --- This is a basic emacs configuration aimed at social scientists using R/latex/markdown/git
;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________

;;; Commentary:
;; init.el is the first file that Emacs reads when it starts up. We
;; don't do much here, but we do tell it to load another file
;; "init-emacs.org", which is where we do most of our configuration.

;; A description on how to use this file and the corresponding org
;; file is given in the README document, which you should have
;; received along with this file. If not, you may find it on github:
;; https://github.com/jabranham/emacs-for-social-science


;;; Code:
(if (version< emacs-version "25.3")
    (error "Your Emacs is too old -- this config requires 25.3 or higher"))

;; package.el customization - here we set up how Emacs handles packages!
(require 'package)
(setq package-enable-at-startup nil)

;; Windows has issues using https:// instead of http:// so we want to
;; set the package locations to use the secure connection when they
;; can:
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq package-archives
          '(("melpa" . "http://melpa.org/packages/")
            ("elpa" . "http://elpa.gnu.org/packages/")))))
 ((or (string-equal system-type "gnu/linux") ; Linux
      (string-equal system-type "darwin")) ; & Mac OS X
  (progn
    (setq package-archives
          '(("melpa" . "https://melpa.org/packages/")
            ("elpa" . "https://elpa.gnu.org/packages/"))))))
(package-initialize)

;; Load the init-emacs.org file:
(org-babel-load-file (expand-file-name "init-emacs.org" user-emacs-directory))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(dired-clean-confirm-killing-deleted-buffers nil t)
 '(flymake-proc-compilation-prevents-syntax-check nil)
 '(flyspell-abbrev-p t)
 '(flyspell-issue-welcome-flag nil)
 '(flyspell-use-global-abbrev-table-p t)
 '(flyspell-use-meta-tab nil)
 '(org-M-RET-may-split-line nil)
 '(org-blank-before-new-entry (quote ((heading) (plain-list-item))))
 '(org-catch-invisible-edits (quote show-and-error))
 '(org-cycle-separator-lines 0)
 '(org-ellipsis "⬎")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . emacs))))
 '(org-fontify-quote-and-verse-blocks t)
 '(org-goto-interface (quote outline-path-completion))
 '(org-hide-emphasis-markers t)
 '(org-highlight-latex-and-related (quote (latex entities)))
 '(org-image-actual-width (quote (300)))
 '(org-imenu-depth 6)
 '(org-log-done (quote time))
 '(org-outline-path-complete-in-steps nil)
 '(org-pretty-entities t)
 '(org-preview-latex-default-process (quote imagemagick))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-use-outline-path (quote file))
 '(org-special-ctrl-a/e t)
 '(org-startup-with-inline-images t)
 '(org-support-shift-select t)
 '(org-tag-persistent-alist
   (quote
    (("jobs" . 106)
     (:startgroup)
     ("@work" . 119)
     ("@home" . 104)
     (:endgroup))))
 '(package-selected-packages
   (quote
    (restart-emacs quelpa wttrin no-littering ivy-bibtex ivy magit markdown-mode auctex ess use-package exec-path-from-shell company better-defaults)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:inherit default)))))
