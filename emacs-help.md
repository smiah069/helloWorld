# myEmacs Configuration

*See myEmacsSetup/aquamacs/Preferences.el file*

~~~
This document is currently very disorganized and is intended for myself only. However, I've plan to make this document organized and available for public.
~~~

**Configuring emacs DIRectory EDitor (dired)**

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

*Find file from dired*
Example: Find all files with prefix "Pref" in directory "~/Preferences/". Enter the following:
~~~
M-x find-name-dired
~/Preferences
Pref*
~~~
Enjoy...


* Add *(require 'dired-x)* in the *.emacs* file to take advantage of *C-x C-j* (jume to the directory of the file you are editing) and I (for information of file/folder), *C-x C-q* to make the directory editor **(Editable!)** and *C-c C-c* to switch back to the **normal (uneditable)** directory editor



**Installing AucTeX for emacs to have improved Latex Editor (for macOS)**

1. Install Emacs using *brew cask install emacs*
1. M-x package-list-packages
1. Search for auctex and install it

Emac customization file .emacs is located (in my windows laptop) at the following directory: c:/Users/smiah-admin.JOB340LAP/AppData/Roaming/

**Some basic emacs command and keyboard shortcut**

1. Force indentation: C-q < TAB Key >
2. Toggle word wrap: M-x toggle-word-wrap
3. Toggle word wrap in Visual line mode (preferred): M-x global-visual-line-mode. To set it permanently, open .emacs file and insert the following line and save:

(global-visual-line-mode 1) ; 1 for on, 0 for off.

If C-a and C-e makes your cursor go to the beginning of a paragraph and end of a paragraph, then just turn of visual line mode by M-x visual-line-mode and then hit enter

1. Word wrap in Aquamacs: a) **Options ► Line Wrapping ► Word wrap b) Options ► Line Wrapping ► Adopt as default c) Options ► Save options**
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
18. Command+Shift+{ => switch between tabbed buffers.

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
