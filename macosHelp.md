List of softwares installed for Macintosh

1.  Google chrome

2.  Thunderbird

3.  aquamacs

4.  MacTeX

5.  Disk Order

6.  dropbox (built-in with Disk Order)

7.  macport installation

    a.  Install
        > [[Xcode]{.underline}](http://guide.macports.org/#installing.xcode)

        i.  Once you have Xcode installed,

        ii. Install [[Xcode Command Line
            > Tools]{.underline}](http://guide.macports.org/#installing.xcode).
            > For that, open a terminal, run xcode-select \--install,
            > and click the Install button to install the required
            > command line developer tools. Don\'t worry if you see a
            > message telling you the software cannot be installed
            > because it is not currently available from the Software
            > Update Server. This usually means you already have the
            > latest version installed. You can also get the command
            > line tools from [[the Apple developer
            > website]{.underline}](https://developer.apple.com/downloads/index.action).

    b.  Agree to Xcode license in Terminal: sudo xcodebuild -license

    c.  Install MacPorts for your version of OS X:

        i.  [OS X 10.10 Yosemite]{.underline}

        ii. [OS X 10.9 Mavericks]{.underline}

        iii. [OS X 10.8 Mountain Lion]{.underline}

8.  Install XQuatz (latest version)

9.  Install ImageMagick: sudo port install ImageMagick

10. Install xfig: sudo port install xfig

    a.  To launch xfig, run the following commands

        i.  startx &

        ii. click on XQuartz

        iii. click applications-\>terminal

        iv. type xfig on the XQuartz terminal

11. sudo port install unrar

12. Google drive

====

**How to set environment variable in MACOS:**

1.  Open terminal and run command: env

    -   This should show all the environment variables

2.  To set an environment variable, run the following command (example
    > is shown here)

    -   export
        > [[MLM\_LICENSE\_FILE=2200\@ece2.bradley.edu]{.underline}](mailto:MLM_LICENSE_FILE=2200@ece2.bradley.edu)

**How to point matlab to a license server in MACOS:**

1.  Open a new text editor and create a "network.lic" file

2.  Write the following lines in the "network.lic" and save

> \# LicenseNo: Unknown
>
> \# You must fill in the server\_name, hostid, and port\_number
>
> \# fields below using the values from the license server.
>
> SERVER server\_name hostid port\_number
>
> USE\_SERVER
>
> Note:

1.  You need to replace server\_name with your license server name (for
    > example: ece2.bradley.edu)

2.  Your license administrator should give you a license file (for
    > example: 2017alicense.lic), open this file using a text editor and
    > and look for HostID (which is the mac address) in the second line

3.  Replace "hostid" in the "network.lic" with the 12 digit HostID (for
    > example: 001A708F8AEB) that you just copied

4.  Replace the "port\_number" in the network.lic file with the port
    > number (for example: 2200) given by your license administrator

3\. Finally save your network.lic file that should like like:

> \# LicenseNo: Unknown
>
> \# You must fill in the server\_name, hostid, and port\_number
>
> \# fields below using the values from the license server.
>
> SERVER ece2.bradley.edu 001A708F8AEB 2200
>
> USE\_SERVER

4\. Right click on the matlap app (MATLAB\_R2017a.app) -\> Show package
contents

5\. In the "licenses" folder, replace the network.lic file with the one
that you just created.

List of commands on the terminal of mac os x:\
\
==============================================================================\
1. Show/Hide Hidden Files in Finder\
\
defaults write com.apple.finder AppleShowAllFiles TRUE\
killall Finder\
\
==============================================================================\
The following command will remove all .DS\_Store files in a directory
where it is executed as well as that particular directory or
subdirectories:\
\
find . -name \'\*.DS\_Store\' -type f -delete\
==============================================================================\
\
2. delete all files in the directory but NOT the file with extension
.tex and .eps:\
\
find . -type f ! -name \"\*.tex\" ! -name \"\*.eps\" -delete\
==============================================================================\
\
Installing macports:\
\
1. Install X11 from mac install disk\
2. Install Xcode from mac install disk\
3. Install macports\
\
Installing xfig using macports:\
\
1. Open terminal\
2. \$sudo port install xfig\
\
Opening xfig\
\-\-\-\-\-\-\-\-\-\--\
1. Double-click X11 under Applications/Utilities/\
2. lunch xfig by the command \$xfig on the terminal\
\
or\
1. Type the command \"startx &\" to open X11\
2. lunch xfig by the command \$xfig on the terminal\
\
==============================================================================\
Merging multiple pdf files into a single pdf file:\
\
1. First create a PDFconcat command by following the commands below (you
need to do only once in your computer life!)\
\
a) cd /usr/local/bin\
b) sudo ln \"/System/Library/Automator/Combine PDF
Pages.action/Contents/Resources/join.py\" PDFconcat\
\
2. Now merge pdf files using PDFconcat command\
\
PDFconcat -o PATH/TO/YOUR/MERGED/MERGED-FILE.pdf
/PATH/TO/A/WHOLE/DIR/\*.pdf\
\
OR\
\
PDFconcat -o PATH/TO/YOUR/MERGED/MERGED-FILE.pdf\
/PATH/TO/ORIGINAL/1.pdf /PATH/TO/ANOTHER/2.pdf\
/PATH/TO/A/WHOLE/DIR/\*.pdf\
\
OR\
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite\
-sOutputFile=combined\_file.pdf file1.pdf file2.pdf file3.pdf\
\
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite\
-sOutputFile=UPEI-Miah-appln-pkg.pdf\
/Users/mdsuruzmiah/Documents/Suruz/Jobs/MyJob/academic/teaching-applications/docs/cover-letters/cl-upei.pdf\
/Users/mdsuruzmiah/Documents/Suruz/Jobs/MyJob/academic/teaching-applications/Miah-CV-details1.pdf\
=============================\
Converting pdf figure to eps without rastering the fonts.\
\
\
Ghostscript (multi-platform)\
Note: -dNOCACHE is needed to prevent GhostScript from rastering the
fonts.\
\
gs -q -dNOCACHE -dNOPAUSE -dBATCH -dSAFER -sDEVICE=epswrite\
-sOutputFile=output.eps input.pdf\
\
\
\
=============================\
Allow write/modify permit recursively in all files of a directory\
(color/ in the following example)\
\
sudo chmod -R 777
/usr/local/texlive/2014/texmf-dist/tex/Latex/beamer/themes/color/\*\
=================================================

==

Copy files folders from mac hard drive to external USB hard drive:

rsync -avz source/ destination/

(Force) formatting external hard drive

=====

diskutil cs list

sudo diskutil cs deleteLVG B6308EC8-297D-44BD-9212-6BD867F6331B (your
logical number)

======

Image compression using ImageMagic

======

convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85%
source.jpg result.jpg
