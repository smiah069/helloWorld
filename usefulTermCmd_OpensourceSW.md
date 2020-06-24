**Disclaimer**

*This document is very messy at this point! I started putting things here long ago. Of course, many things have changed and some information placed here is obsolete!!.  Hopefully, I will find some time down the road to delete some obsolete information/instructions and  make this document tidy for other users. It comes with no warranty and you can try some instructions placed here at your own risk!*

**Installing Homebrew for Linux**

	* To install Homebrew, simply copy the following line
	>
	>/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	>
	and then paste it in the terminal
	* Press RET key to install it

After installing homebrew, you will need to install ruby for **Linux** as well. For that, run *brew install ruby*

Once ruby is installed, you can install other open-source software using brew. 

**Zipping and Unzipping Files**

* *unzip folder.zip*  will unzip the folder.zip and place its contents in the current directory
* *unzip folder.zip -d myFolder* will unzip the folder.zip and place its contents in /myFolder/ directory
* *zip -r myZipFolder folder* will zip the *folder* (and its contents) and name the zip folder as *myZipFolder*
* *zip folder file1 file2 file3* will put files named file1 file2 file3 into the new zip archive called folder.zip 



*  *Pandoc* is an open source software that can be used to do many things, for example, converting docx to markdown format

- First install pandoc using homebrew *brew install  pandoc*
- Then, convert, V-REP.docx file to markdown format, for example using
>
>pandoc -f docx -t markdown -o coppeliaSim.md V-REP.docx
>

* *unoconv* is an open source software that is used to convert any document from and to any LibreOfice supported format  

*  To remotely login to a file server:
    >sftp username@serverName
    >
    >put sourceFiles       [it places source files in the current directory]



**How to set environment variable in MACOS:**

1.  Open terminal and run command: env

    -   This should show all the environment variables

2.  To set an environment variable, run the following command (example
    > is shown here)

    -   export
        > [[MLM\_LICENSE\_FILE=2200\@ece2.bradley.edu]{.underline}](mailto:MLM_LICENSE_FILE=2200@ece2.bradley.edu)

List of commands on the terminal of macOS

* Show/Hide Hidden Files in Finder

>defaults write com.apple.finder AppleShowAllFiles TRUE
>
>killall Finder

* Delete all *.ttt* files in the current directory
>
>find . -name "*.ttt" -delete
>

* The following command will remove all .DS\_Store files in a directory
where it is executed as well as that particular directory or
subdirectories:
>
>find . -name \'\*.DS\_Store\' -type f -delete
>
* Delete all files in the directory but NOT the file with extension
.tex and .eps:
>
>find . -type f ! -name \"\*.tex\" ! -name \"\*.eps\" -delete\
>
* Merging multiple pdf files into a single pdf file:
  
  1. First create a PDFconcat command by following the commands below (you need to do only once in your computer life!)
	 a) cd /usr/local/bin
	 b) sudo ln \"/System/Library/Automator/Combine PDFPages.action/Contents/Resources/join.py\" PDFconcat
  1. Now merge pdf files using PDFconcat command
  >
  >PDFconcat -o PATH/TO/YOUR/MERGED/MERGED-FILE.pdf /PATH/TO/A/WHOLE/DIR/\*.pdf
  >
OR

>PDFconcat -o PATH/TO/YOUR/MERGED/MERGED-FILE.pdf /PATH/TO/ORIGINAL/1.pdf /PATH/TO/ANOTHER/2.pdf /PATH/TO/A/WHOLE/DIR/\*.pdf

OR

>gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=combined\_file.pdf file1.pdf file2.pdf file3.pdf
>gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=UPEI-Miah-appln-pkg.pdf /Users/mdsuruzmiah/Documents/Suruz/Jobs/MyJob/academic/teaching-applications/docs/cover-letters/cl-upei.pdf /Users/mdsuruzmiah/Documents/Suruz/Jobs/MyJob/academic/teaching-applications/Miah-CV-details1.pdf
>

* Allow write/modify permit recursively in all files of a directory (color/ in the following example):

>sudo chmod -R 777 /usr/local/texlive/2014/texmf-dist/tex/Latex/beamer/themes/color/\*


* Copy files folders from mac hard drive to external USB hard drive:
>
>rsync -avz source/ destination/
>


* (Force) formatting external hard drive

>diskutil cs list
>
>sudo diskutil cs deleteLVG B6308EC8-297D-44BD-9212-6BD867F6331B (your logical number)


* Image compression using ImageMagic

>convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% source.jpg result.jpg
