
**Note:**

*This is not an organized document. I pretty much wrote whatever I had in mind but there are a lot of items (in  addition to what I have in this document) that I have in my Macintosh that didn't mention here. Hopefully, some day I will have time to organize this document and make it more complete. For now, it's for myself only. However, if you can benefit from it, please go for it!*


**Some useful keyboard shortcut (full list is yet to type!)**

* Quickest way to *show/hide* hidden files: CMD+SHIFT+. => Press once to *show* hidden files and again to *hide* them. 

**List of necessary software installed for Macintosh**

1. Emacs (Emacs27) with spacemacs configuration
1. Google drive
1.  Google chrome
1.  Thunderbird
1.  aquamacs
1.  MacTeX
1.  Homebrew. For that follow instructions at this [link](https://brew.sh/)
	* To install Homebrew, simply copy the following line
	>
	>/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	>
	and then paste it in the terminal
	* Press RET key to install it
1.  Macport (optional, no need if Homebrew is installed)

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
    c.  Install homebrew (easier than MacPorts)
1.   ImageMagick: sudo port install ImageMagick
1. unrar



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

4. Right click on the matlap app (MATLAB\_R2017a.app) -\> Show package
contents

5. In the "licenses" folder, replace the network.lic file with the one
that you just created.


* Installing macports:
1. Install X11 from mac install disk
2. Install Xcode from mac install disk
3. Install macports

Installing xfig using macports:

1. Open terminal
2. \$sudo port install xfig

Opening xfig

1. Double-click X11 under Applications/Utilities/
2. lunch xfig by the command \$xfig on the terminal
or

* Type the command \"startx &\" to open X11
* lunch xfig by the command \$xfig on the terminal
