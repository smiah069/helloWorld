# myEmacs Configuration

*See myEmacsSetup/aquamacs/Preferences.el file*



**Disclaimer**

*This document is very messy at this point! I started putting things here since I started learning latex back in 2008. Of course, many things have changed and some information placed here is obsolete!!.  Hopefully, I will find some time down the road to delete some obsolete information/instructions and  make this document tidy for other users. It comes with no warranty and you can try some instructions placed here at your own risk!*

## Installing Emacs

* You can install emacs in macOS  using terminal by running the command: *brew cask install emacs*
* New bees may want to install [Aquamacs](http://aquamacs.org/) available for  macOS only 
* For windows, you can download emacs from this [link](https://www.gnu.org/software/emacs/download.html**


## Installing Spacemacs

- A new way of experiencing emacs
- You will need to install Emacs first. Please checkout [spacemacs](https://github.com/syl20bnr/spacemacs) link 

For macOS installation: run the following commands: 

>
> $ brew tap d12frosted/emacs-plus
>
> $ brew install emacs-plus@27 --HEAD
>
> $ ln -s /usr/local/opt/emacs-plus@27/Emacs.app /Applications
>

The above commands will install emacs27 in the directory /usr/local/Cellar/emacs-plus@27/HEAD-229995b/ directory, and then place the *Emacs.app* in the *Applications/* folder 

- Latex,html, git, osx,  packages can be  installed as layers under *dotspacemacs-configuration-layers* (see the .spacemacs file, for example**. 

 Now can you run *Emacs.app* or (run the command *emacs* from the terminal) to open Emacs editor with spacemacs configuration. You should see Spacemacs logo in your Emacs editor when you luch Emacs for the first time. You may choose Emacs editor (I chose for myself as I've experience with Emacs) or Vim editor style and the rest you choose the recommended options provided by Spacemacs. 
 
Spacemacs will install many packages by itself. In case, you see some errors, just close the *Emacs* window and restarting it will resolve the errors most likely. 


For PDF tools, you will need to install pdf-tools using brew from the terminal (see the pdf-tools section below). 

All the user configurations in emacs-lisp are to be written in the following functions

> (defun dotspacemacs/user-config ()
> ;;;; Add your own configurations here .... 
>
> )

Note that the *pdf* layer is added (for my case) under the user-config() function (see *(setq-default dotspacemacs-configuration-layers '(pdf))** in my .spacemacs file** 

**Key bindings:**

~~~
Note that *SPC* key in spacemacs vim editor is equivalent to *M-m* in spacemacs emacs editor (which I'm using as I've experience with Emacs editor) 
~~~

However, I find it a little bit inconvenient to type M-m. Therefore, I changed it *M-SPC* by updating the  line  to 
>
> dotspacemacs-emacs-leader-key "M-SPC" ; Previously it was "M-m" 
>
in the *.spacemacs* file 



**Spell Checker**

Emacs includes Flyspell, therefore, you do  not need explicitly install flyspell. However, flyspell needs a spell checking tool (Emacs will generate an error *Error enabling Flyspell mode ...*).For that you will need to install a spell checking tool. I installed *aspell** using homebrew by running the command: 

>
> brew install aspell 
>

In case the aspell doesn't work, then run *brew install ispell*

**Dictionary**

You can find the  definition of a word in dictionary in spacemacs through *define-word*, which is a GNU emacs package that lets you see the definition of a word or a phrase  at a point. This package is normally pre-installed. 

- You can run *M-x define-word* and then type the word that you want to be defined by the dictionary. 
- Or can you define a word right under your cursor using Key bindings in Spacemacs: *SPC x w d***  

**Installing fonts**

The default font for spacemacs is "Source Code Pro". However, you will need to install this font family so that spacemacs can find them. For that, run: 
>
> brew tap homebrew/cask-fonts && brew cask install font-source-code-pro
>

I've installed Ubuntu font family as well. To install Ubuntu font family, run: 
>
> brew tap homebrew/cask-fonts && brew cask install font-ubuntu
>

In my *.spacemacs* file, I've the following configuration as I want to use "Ubuntu Mono" fonts: 

~~~
   dotspacemacs-default-font '("Ubuntu Mono"   ;; "Source Code Pro" 
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
~~~


## Configuring emacs DIRectory EDitor (dired)

The default dired editor in emacs doesn't group directory and sort files in alphabetical order when *M-x dired* is executed. In Linux emacs adding the following line:
>
> (setq dired-listing-switches "-aBhl  --group-directories-first")
>
in the *.emacs* file should solve the problem. However, adding the above lines in the *Aquamacs Preferences.el*  file  in macOS will given an error; something like: "Listing directory failed but 'access-file' worked" or "No such program *gls*  ... " To solve this problem macOS, to the following:
* Install *coreutils*; one can use *brew install coreutils* in the terminal to install the *coreutils* package
* Add the following two lines 
>
>(setq insert-directory-program "gls" dired-use-ls-dired t)
>
>(setq dired-listing-switches "-aBhl  --group-directories-first")
>

in the Preferences.el and save

Then run *M-x eval-buffer*  or restart Aquamacs to have this new dired feature in effect. 

[See dired reference card](https://www.gnu.org/software/emacs/refcards/pdf/dired-ref.pdf) for list of dired opeations and keyboard shortcut

**Find file from dired**

Example: Find all files with prefix "Pref" in directory "~/Preferences/". Enter the following:
~~~
M-x find-name-dired
~/Preferences
Pref*
~~~
Enjoy...


* Add *(require 'dired-x)* in the *.emacs* file to take advantage of *C-x C-j* (jume to the directory of the file you are editing) and I (for information of file/folder), *C-x C-q* to make the directory editor **(Editable!)** and *C-c C-c* to switch back to the **normal (uneditable)** directory editor


**dired-subtree Package**

* Use TAB  key to expand current directory,
* Use C-TAB  key once  expand current directory, twice to expand the directory recursively, thrice to contract
* Use SHIFT-TAB key to contract the subtree when the point is inside that subtree

To take advantage of dired-subtree package with the above options: 
Add the following lines in the *.emacs* or *Preferences.el* file

~~~
(use-package dired-subtree
  :ensure
  :after dired
  :config
  
  (setq dired-subtree-use-backgrounds nil)
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle)
              ("<C-tab>" . dired-subtree-cycle)
              ("<S-iso-lefttab>" . dired-subtree-remove)))
~~~

**Copy/Paste/ Rename in Dired using ido-mode**

In directory editor (dired) when a file is to be copied/renamed/moved to a different directory
 with key C/R then all directory choice will automatically appear in the minibuffer using
 ido-mode (rather than conventional way of changing directory). For that,

* First install *ido-completing-read+* from melpha (M-x package-list-packages => search for*ido-completing-read+*, type *i* then *x*).
* After that, add the following two lines in the *.emacs* (Preferences.el) file

~~~
;;(require 'ido-completing-read+)  ;; no need to activate this line if ido-completing-read+ is installed from melpha 
(ido-ubiquitous-mode 1)
(eval-after-load 'dired '(progn (mapatoms (lambda (symbol) (if (s-starts-with? "dired-do-" (symbol-name symbol))  (put symbol 'ido 'find-file))))))
~~~
* Now simply use *C* or *R* key to navigate to the directory
you want and pres *C-j* to stop at a path and paste the file


**Reusing current buffer in dired when exploring directories**

In directory editor, visiting a new (child) directory under the cursor by pressing RET key normally opens in a new buffer, which could be annoying for someone.

*To avoid opening child directory in a new buffer, press **a** (instead of RET key) or use command *dired-find-alternate-file* to kill the current buffer and replace it with the contents of the subdirectory

* However,  the reuse buffer using 'dired-find-alternate-file' does not work when you use *'^'* to move up to the parent directory. If you want to reuse the  current buffer (i.e., buffer containing child directory) to **move up to the parent directory** by pressing *'^'* key, then add the following lines in the *.emacs (Preferences.el)* file:
>
>(add-hook 'dired-mode-hook
>          (lambda ()
>            (define-key dired-mode-map (kbd "^")
>                        (lambda () (interactive) (find-alternate-file "..")))))
>

## Installing AucTeX for emacs for  improved Latex Editor (for macOS)


1. M-x package-list-packages
1. Search for auctex and install it

Emac customization file .emacs is located (in my windows laptop) at the following directory: c:/Users/smiah-admin.JOB340LAP/AppData/Roaming/

**Some basic emacs command and keyboard shortcut**

s => Command (Windows) key 

1. Force indentation: C-q < TAB Key >
2. Toggle word wrap: M-x toggle-word-wrap
3. Toggle word wrap in Visual line mode (preferred): M-x global-visual-line-mode. To set it permanently, open .emacs file and insert the following line and save:

(global-visual-line-mode 1) ; 1 for on, 0 for off.

If C-a and C-e makes your cursor go to the beginning of a paragraph and end of a paragraph, then just turn of visual line mode by M-x visual-line-mode and then hit enter

1. Word wrap in Aquamacs: a) **Options ► Line Wrapping ► Word wrap b** Options ► Line Wrapping ► Adopt as default c) Options ► Save options**
2. M-x delete-file => deletes file
3. M-x delete-directory => deletes directory
4. M -x make-directory _dirname =>_ This command creates a directory named dirname
5. C-x d => open current directory
6. C-x C-v RET => refresh buffer (for docView type g)
7. Shift ^ => go to previous parent directory
8. C-x [ => beginning of the document
9. C-x ] => end of the document
10. C-Delete => deletes a word forward
11. C-Backspace => deletes a word backward
12. C-Shift-Backspace => deletes the entire line regardless of cursor position in the line
13. C-0 C-k => kills from point to the start of the line
14. C-up/down arrow => paragraph up/down
15. Next/previous buffer => C-x right arrow/left arrow
16. C-x o => To switch to another buffer in the split windows
17. C-x 5 o => To switch to another emacs window (frame)
18. C-x PLUS leftArrow (C-x PLUS rightArrow ) => switch between buffers.
1. Command+Shift+{ => switch between tabbed buffers (macOS)


- Switch to text mode: M-x text mode


**I (interactive) do (ido) mode**

* ido-mode is useful to find files from a directory. It shows all the subdirectories under a directory automatically. To make use of ido-mode, type
>
>M-x ido-mode
>

To activate ido-mode when starting emacs, write

>
>(require 'ido)
>(ido-mode t)

in the *.emacs* or *Preferences.el* file and the run *M-x eval-buffer* to take its effect without restarting emacs


* **smex** package is useful to have auto-complete commands in the minibuffer. See [this link](https://github.com/nonsequitur/smex) for details. To install this package, run

	- *M-x package-list-packages*
	- Search *smex*, then type i then x, then follow the instructions 

**ido vertical mode**
This mode makes ido-mode display vertically (very convenient). First install ido-vertical-mode from the melpha packages usng *M-x package-list-packages* and then fine *ido-vertical-mode* then install it by typing  *i* then *x* . After that add the following lines in the .emacs (Preferences file)

~~~
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
~~~

**Installing pdf-tools**
*pdf-tools* is an open-source package, which is a replacement of DocView package, which is built-in emacs. More details about the package can be sought at [PDF tools README](https://github.com/politza/pdf-tools). To install it, follow the steps below.

* Install *use-package* package from *M-x package-list-packages*
* Open *.emacs* (Preferences.el) file and add the following

~~~
;;; pdf-tools elisp via the use-package below. To upgrade the epdfinfo
;;; server, just do 'brew upgrade pdf-tools' prior to upgrading to newest
;;; pdf-tools package using Emacs package system. If things get messed
;;; up, just do 'brew uninstall pdf-tools', wipe out the elpa
;;; pdf-tools package and reinstall both as at the start.
(use-package pdf-tools
  :ensure t
  :config
  (custom-set-variables
    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
(pdf-tools-install)
~~~
* Restart emacs or run *M-x eval-buffer RET*  to take effect of pdf-tools. Note that you will need to follow the on-screen instructions for the first time as it will install *poppler* package using brew installer (install Homebrew installer if haven't!)
* In case Emacs is frozen to open a PDF file using PDF-tools, it is probably because you have linum-mode enabled. Note that pdf-tools pretty much unusable with linum-mode enabled. Therefore, you will need to **deactivate** it. For that add the following line somewhere in your .emacs (Preferences.el) file:
>
>(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1))) 
>

If the above steps installing pdf-tools doesn't work then follow the steps below:

* Install *use-package* package from *M-x package-list-packages*
* For macOS, install poppler using *brew install poppler automake*
* Using terminal install pdf-tools using *brew install --HEAD dunn/homebrew-emacs/pdf-tools*  Note the path of epdfinfo and after the installation as this path will be required down the road
* Install *pdf-tools* package from *M-x package-list-packages*
* Open *.emacs* (Preferences.el) file and add the above lines. 



Working with latex &quot;minted&quot; package: Invoke latex command with

==========================================

1. Type Meta(Alt)-!
2. Then type: pdflatex -shell-escape source.tex or latex -shell-escape source.tex

Or insert the following lines in .emacs file and save:

(eval-after-load &quot;tex&quot;

&#39;(setcdr (assoc &quot;LaTeX&quot; TeX-command-list)

&#39;(&quot;%`%l%(mode) -shell-escape%&#39; %t&quot;

TeX-run-TeX nil (latex-mode doctex-mode) :help &quot;Run LaTeX&quot;)

)

)

%%% HOw to install TOC ref option in AUCTEX

Add the following lines in .emacs

; Table of contents of latex document by reftex! (this is a comment)

(add-hook &#39;LaTeX-mode-hook &#39;turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)

%%% How to install packages in emacs (e.g., auto-complete, auto-complete-auctex, yasnippet)

1. Open .emacs file from &quot;C:\extract\emacs/&quot; directory
2. Add the following lines and save .emacs file:

; start package.el with emacs
 (require &#39;package)
 ; add MELPA repository list
 (add-to-list &#39;package-archives &#39;(&quot;melpa&quot; . &quot;http://melpa.milkbox.net/packages/&quot;))
 ; initialize package.el
 (package-initialize)

3. Run the command *M-x eval-buffer*  or restart emacs

4. Type M-x package-list-packages

5. Find the package: e.g. auto-complete

6. Take the cursor at the beginning of the line containing package name, then type &quot;I&quot; then &quot;x&quot;. Your package auto-complete is installed.

7. Add the following lines in the .emacs file and save:

; start auto-complete with emacs
 (require &#39;auto-complete)
 ; do default config for auto-complete
 (require &#39;auto-complete-config)
 (ac-config-default)
 8. Restart emacs. In order to add auto-complete-auctex and yasnippet, do the similar procedure

(Note that yasnippet package automatically drops down list of available commands so is very powerful.)

Show line numbers at the left side of the file.

1. M-x package-list-packages
2. Search for linum
3. Type &#39;i&#39; at the beginning of the line followed by &#39;x&#39;
4. Type M-x global-linum

%%%%%%%%%%%%% OUTPUT DVI

Command: TeX-PDF-mode
 (C-c C-t C-p) This command toggles the PDF mode of AUCTeX, a buffer-local minor mode which is enabled by default. You can customize TeX-PDF-mode to give it a different default or set it as a file local variable on a per-document basis. This option usually results in calling either PDFTeX or ordinary TeX.

After TeX-PDF-mode is disabled, you will be able to comple latex document to dvi and do the following to view dvi file:

1. M-x customize-variable
2. Type &quot;TeX-view-program-selection&quot;
3. Replace &quot;Yap&quot; with &quot;Start&quot;

%%%%%%%%%%%%%%% Auto-completion text mode

- Install company package from melpha: -> M-x package-list-packages, then C-s company -> i -> x -> y
- Insert the following in the .emacs file

(require &#39;company)

(add-hook &#39;after-init-hook &#39;global-company-mode)

(defun text-mode-hook-setup ()

;; make `company-backends&#39; local is critcal

;; or else, you will have completion in every major mode, that&#39;s very annoying!

(make-local-variable &#39;company-backends)

;; company-ispell is the plugin to complete words

(add-to-list &#39;company-backends &#39;company-ispell)

;; OPTIONAL, if `company-ispell-dictionary&#39; is nil, `ispell-complete-word-dict&#39; is used

;; but I prefer hard code the dictionary path. That&#39;s more portable.

(setq company-ispell-dictionary (file-truename &quot;~/.emacs.d/misc/english-words.txt&quot;)))

(add-hook &#39;text-mode-hook &#39;text-mode-hook-setup)
