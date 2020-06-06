;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)


;;;;;;;;;;;;;;;;;;;;; Suruz's customization
  
; start package.el with emacs
(require 'package)
; add MELPA repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
(require 'auto-complete-auctex)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)



;;;;;;;;;;;; Auto complete in text mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(defun text-mode-hook-setup ()
  ;; make `company-backends' local is critcal
  ;; or else, you will have completion in every major mode, that's very annoying!
  (make-local-variable 'company-backends)

  ;; company-ispell is the plugin to complete words
  (add-to-list 'company-backends 'company-ispell)

  ;; OPTIONAL, if `company-ispell-dictionary' is nil, `ispell-complete-word-dict' is used
  ;;  but I prefer hard code the dictionary path. That's more portable.
  (setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt")))


(global-visual-line-mode 1)  ; 1 for on, 0 for off.



(setq-default TeX-master nil)   ; working with Master file

;;; Magit's Ediff's spit window layout configuation
(setq ediff-split-window-function 'split-window-horizontally)

;;;; Aquamacs cursor setup  
(setq-default cursor-type 'box)


;;;; Autocomplete for minibuffer's M-x commands 
(require 'smex) ; Not needed if you use package.el
  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; Install epdfinfo via 'brew install pdf-tools' and then install the
;;; pdf-tools elisp via the use-package below. To upgrade the epdfinfo
;;; server, just do 'brew upgrade pdf-tools' prior to upgrading to newest
;;; pdf-tools package using Emacs package system. If things get messed
;;; up, just do 'brew uninstall pdf-tools', wipe out the elpa
;;; pdf-tools package and reinstall both as at the start.

;;; Install epdfinfo via 'brew install pdf-tools' and then install the
;;; pdf-tools elisp via the use-package below. To upgrade the epdfinfo
;;; server, just do 'brew upgrade pdf-tools' prior to upgrading to newest
;;; pdf-tools package using Emacs package system. If things get messed
;;; up, just do 'brew uninstall pdf-tools', wipe out the elpa
;;; pdf-tools package and reinstall both as at the start.


(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

(require 'use-package)

(use-package pdf-tools
  :ensure t
  :config
  (custom-set-variables
    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
(pdf-tools-install)


(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)


;; view generated PDF with `pdf-tools'.
(unless (assoc "PDF Tools" TeX-view-program-list-builtin)
  (add-to-list 'TeX-view-program-list-builtin
               '("PDF Tools" TeX-pdf-tools-sync-view)))
(add-to-list 'TeX-view-program-selection
             '(output-pdf "PDF Tools"))



;;;;;; Ido-mode enable

(require 'ido)
(ido-mode t)
