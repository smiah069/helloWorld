;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration. You should not put any user code in this function besides modifying the variable values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      spacemacs-default-company-backends '(company-dabbrev-code
                                                           company-gtags
                                                           company-etags
                                                           company-keywords
                                                           company-files
                                                           company-dabbrev
                                                           company-elm))
     (better-defaults :variables ;; Enhances the default commands of Emacs; Feature, M-q fill/unfill current paragraph
                      better-defaults-move-to-beginning-of-code-first t
                      better-defaults-move-to-end-of-code-first nil)
     c-c++
     colors
     chrome
     csv 
     emacs-lisp
     git  ;; adds extensive support for git to Spacemacs 
     github ;; adds support for GitHub
     ;;     helm
     html
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     latex
     markdown
     ;; themes-megapack ;; Choose themes using SPC T s; but sometimes create problems, when I customize font size or add another layer, ranger, for example
     (org :variables
          org-enable-github-support t)
     octave
     osx
     pandoc ;; before adding this layer, install pandoc using brew install pandoc first
     python
     (ranger :variables
             ranger-show-preview t
             ranger-show-hidden t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     smex 
     spell-checking
     sql  ;; SQL query 
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(yasnippet-snippets
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only
   )  ;; setq-default
  )  ;; End of (defun dotspacemacs/layers ()



(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil ;; t ;; Suruz's customization => change cursor color according to theme

   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"   ;; "Source Code Pro" 
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-SPC"; "M-m"  ;; Suruz's customization 
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t ;; nil;; Suruz's customization 
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;;;;; Suruz's customization
   ;;;;; Full screen or maximize screen at startup
   ;; dotspacemacs-fullscreen-at-startup t

   dotspacemacs-maximized-at-startup t

   )) ;; End of init() function 

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration executes.
 This function is mostly useful for variables that need to be set before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."


  ;;;;; Suruz's customization (set spacemacs background color)

  (setq-default
   ;; ... other configurations...
   ;;dotspacemacs-themes '(professional))  ;; See https://themegallery.robdor.com/ for all the themes 
  dotspacemacs-themes '(light-blue))  ;; See https://themegallery.robdor.com/ for all the themes 

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

                                        ; start package.el with emacs
  (require 'package)
                                        ; add MELPA repository list
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
                                        ; initialize package.el
  (package-initialize)


  (require 'dired-x) ;; useful to jump (or info) to the directory of the file your are editing kbd shortcut C-x C-j; I for info 

  (setq-default delete-by-moving-to-trash t) ;; delete files/folder to trash (instead of  deleting them permenently)

;;; Explore folder with TAB, C-TAB keys
  (use-package dired-subtree
    :ensure
    :after dired
    :config
    (setq dired-subtree-use-backgrounds nil)
    :bind (:map dired-mode-map
                ("<tab>" . dired-subtree-toggle)   ;; TAB
                ("<C-tab>" . dired-subtree-cycle)  ;; C-TAB
                ("<S-iso-lefttab>" . dired-subtree-remove))) ;; Shift-TAB


  ;; Type 'a' (or use command 'dired-find-alternate-file'), instead of RET key to reuse current buffer (i.e., instead of opening a child directory in a new buffer)
  ;; Note that the reuse buffer using 'dired-find-alternate-file' does not work when you use '^' to move up to the parent directory. If you want to reuse current buffer (i.e., buffer containing child directory) to move up to the parent directory by pressing '^' key, then add the following lines in the .emacs (Preferences.el) file

  (add-hook 'dired-mode-hook
            (lambda ()
              (define-key dired-mode-map (kbd "^")
                (lambda () (interactive) (find-alternate-file "..")))))

  ;; For file previews including images

  (use-package peep-dired
    :ensure
    :after dired
    :config
    (setq peep-dired-cleanup-on-disable t)
    (setq peep-dired-cleanup-eagerly t)
    (setq peep-dired-enable-on-directories nil)
    (setq peep-dired-ignored-extensions
          '("mkv" "webm" "mp4" "mp3" "ogg" "iso"))
    :bind (:map dired-mode-map
                ("P" . peep-dired)))


  ;;;;;;;; start yasnippet with emacs (obsolete for spacemacs) ;;;;;;;;;
  ; (require 'yasnippet) ;; in Spacemacs, yasnippet-snippets is included in dotspacemacs-additional-packages() function
  ; (yas-global-mode 1)

  (global-visual-line-mode 1)  ; 1 for on, 0 for off.


  (setq-default TeX-master nil)   ; working with Master file


  (setq ediff-split-window-function 'split-window-horizontally)

  (setq-default cursor-type 'box)

  ;; (require 'magit)

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
    (setq pdf-info-epdfinfo-program "/usr/local/Cellar/pdf-tools/HEAD-c510442/bin/epdfinfo"))
  (pdf-tools-install)


  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

;;;;;;; view generated PDF with `pdf-tools'.
  ;;(unless (assoc "PDF Tools" TeX-view-program-list-builtin)
  ;;  (add-to-list 'TeX-view-program-list-builtin
  ;;               '("PDF Tools" TeX-pdf-tools-sync-view)))
  ;; (add-to-list 'TeX-view-program-selection '
  ;;             (output-pdf "PDF Tools"))

  ;; Add PDF tools layer 
  (setq-default dotspacemacs-configuration-layers '(pdf))



;;;;;; Ido-mode enable

  (require 'ido)

  (ido-mode 1); enable ido-mode
  (setq ido-enable-flex-matching t); flexibly match names via fuzzy matching
  ;; (ido-everywhere 1); use ido-mode everywhere, in buffers and for finding files
  (setq ido-use-filename-at-point 'guess); for find-file-at-point
  (setq ido-use-url-at-point t); look for URLs at point
  (setq ffap-require-prefix t); get find-file-at-point with C-u C-x C-f

;;; In directory editor (dired) when a file is to be copied/renamed/moved to a different directory
;;; with key C/R then all directory choice will automatically appear in the minibuffer using
;;; ido-mode (rather than conventional way of changing directory). For that, first install
;;; ido-completing-read+ from melpha (M-x package-list-packages => search for ido-completing-read+,
;;; type i then x).
;;; After that, activate the following two lines. Now simply use C or R key to navigate to the directory
;;; you want and pres C-j to stop at a path and paste the file

;;;;(require 'ido-completing-read+)  ;; no need to activate this line if ido-completing-read+ is installed from melpha 
  ;;(ido-ubiquitous-mode 1)
  ;;
  (eval-after-load 'dired '(progn (mapatoms (lambda (symbol) (if (s-starts-with? "dired-do-" (symbol-name symbol))  (put symbol 'ido 'find-file))))))

  ;;(put 'dired-do-rename 'ido 'find-file);; No need works with key R (rename/move) only => this is not what we want


  (require 'ido-vertical-mode)
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)


  ;;;; Autocomplete for minibuffer's M-x commands (similar to ido-mode but it is M-x only)
  ;;(require 'smex) ; Not needed if you use package.el
  ;;  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.
  ;;(global-set-key (kbd "M-x") 'smex)
  ;;  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  ;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

  (require 'recentf)  ;; To access recently opened files
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)

  ;;(require 'amx)  ;; Newer version of smex
  ;;(amx-mode 1)


  ;;(blink-cursor-mode t) ;;;;;; blink cursor

  ;; Indentation
  (indent-guide-global-mode 1) ;; This minor mode highlights indentation levels via font-lock (very useful for programming)


  ;; Stopping the snippets warning when starting snippets with SPC i s
  (defvaralias 'helm-c-yas-space-match-any-greedy 'helm-yas-space-match-any-greedy "Temporary alias for Emacs27")

  ;; Editing emacs-lisp in org-mode for nice organization

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)))


  ;; Enable company mode (text completion framework) in all buffers
  (add-hook 'after-init-hook 'global-company-mode)
  )  ;; End of user-config() function 

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex --shell-escape")
 '(TeX-view-program-selection
   '((output-dvi "open")
     (output-pdf "PDF Tools")
     (output-html "open")))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(package-selected-packages
   '(unfill mwim company-org-roam org-roam emacsql-sqlite3 emacsql ox-gfm yasnippet-snippets peep-dired ibuffer-projectile ranger magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache pandoc-mode ox-pandoc ht csv-mode gmail-message-mode ham-mode html-to-markdown flymd edit-server sql-indent engine-mode yapfify smex pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc disaster cython-mode company-c-headers company-anaconda cmake-mode clang-format anaconda-mode pythonic zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme pdf-tools dired-subtree web-mode tagedit smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder rainbow-mode rainbow-identifiers pug-mode pbcopy osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup launchctl htmlize helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient emmet-mode company-web web-completion-data company-statistics company-auctex company color-identifiers-mode auto-yasnippet yasnippet auto-dictionary auctex-latexmk auctex ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(pdf-tools-handle-upgrades nil)
 '(send-mail-function 'mailclient-send-it)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "nil" :slant normal :weight normal :height 200 :width normal)))))
