1\. Reclaiming disk space from MacPorts\
========================\
\
I use and like MacPorts for some software that have a too
cumbersome/bugged compilation process. Many people use it extensively
and others just dislike and ignore it.\
\
A frequent complain about MacPorts is that it takes too much disk space
(since it installs its own libraries instead of using the system ones).
This is a valid concern and thereâ€™s a way to mitigate it. MacPorts
allows you to clear files used to build a port, namely work files,
distribution files and archives. To remove all of them from all
installed ports, execute the following command:\
\
sudo port clean \--all all\
This will clean all kinds of file for all ports. The syntax is simple.
Letâ€™s say you want to clear only work files from the port icu:\
\
sudo port clean \--work icu\
More information can be obtained on the port command man files.\
\
Another thing you can do to reclaim some disk space is uninstall
inactive ports:\
\
sudo port uninstall inactive\
These two commands worked very well for me, managing to reduce MacPorts
directory (/opt/local/var/macports) size from 1.3 Gb to 730 Mb.\
=====\
\
\
2. Macports-directory: /opt/local/var/macports\
===============================

3\. List of commands\
================

\% update ports

sudo port selfupdate

\% upgrade outdated ports

sudo port upgrade outdated

\% port search

port search \--name \--line \--regex \'\^php\\d\*\$\'

\% list of installed ports

port search \--name \--line \--regex '.\*'
