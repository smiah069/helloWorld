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

    c.  Install homebrew (easier than MacPorts)


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


* Installing macports:\
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
==============================================================================
