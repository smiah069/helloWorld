Installing AucTeX for emacs to have improved Latex Editor for MS windows.

 01. Install Emacs
 For my case: it was in c:\emacs\emacs-23.2 directory
 02. Download auctex-11.86-e23.2-msw.zip from http://www.gnu.org/software/auctex/download-for-windows.html

 03. Extract auctex-11.86-e23.2-msw.zip and you should have the &quot;site-lisp&quot; directory after extraction

 04. Copy the contents of the &quot;site-lisp&quot; folder (not the &quot;site-lisp&quot; folder itself) into your &quot;c:\emacs\emacs-23.2\site-lisp&quot; directory. The &quot;site-lisp&quot; folder the AucTeX package contains two folders auctex and site-start.d, and two .el files (site-start.el and tex-site.el)

 05. Add the following line into your init.el or .emacs file which is located in your emacs home directory

 (load &quot;c:/emacs/emacs-23.2/site-lisp/tex-site.el&quot;)

Emac customization file .emacs is located (in my windows laptop) at the following directory: c:/Users/smiah-admin.JOB340LAP/AppData/Roaming/

Emacs command:

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

3. Restart emacs

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
