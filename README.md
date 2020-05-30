# Getting Started with Git

* To download a repository in the local directory

>$ git clone *repo_link*


* To work with the  latest version of repository in local repository drive, first fetch it in the local repo drive:


>$ git pull origin master       (OR  $ git fetch --all)

* "git status" is an important command that you run every time before pushing modified files to the repository

* Suppose you want to download the latest version from the GitHub repository in your local directory, modify some files, and then upload the modified version back to the repository in GitHub website. For that, follow the steps below. (I'm assuming that you've already set up the git repository in your local directory by $git clone *repo_link*)

	1. Go to the local directory Run
	   >$git status
	1. Modify the contents of the files that you want to upload in the Git repository and then save all files.
	1. Run the following command to add all the files in the staging area of your local drive 
	   >$git add . 
   1. Run the following command to commit changes in your local drive 
	  >$git commit -m "Type meaningful message here regarding the changes you made" 
  1. Finally, you are ready to commit changes by ***pushing*** updated files/contents to the  remote repository. For that,
	  simply type the following command
	  >$git push 


* Some usefull links 

  * Upload/upgrade local repository to github (online) repository using the command line

    [See this link](https://help.github.com/en/articles/adding-a-file-to-a-repository-using-the-command-line)

  * How to upload a project to Github

  * [See this link](https://stackoverflow.com/questions/12799719/how-to-upload-a-project-to-github)


* Some other commands may be necessary:

>$ git remote add origin https://github.com/smiah069/gitHubReposSeniorProject1-18-19
>
>$  git pull origin master --allow-unrelated-histories
>
>$ git push --force origin master

### Terminologies



**Stashing** is the process of temporarity shelving (storing) the current changes so that once can quickly switch to different different piece of work and come back to re-apply the stashed changes in the current work. [See this link](https://www.atlassian.com/git/tutorials/saving-changes/git-stash) for details. 



## Magit

It is git UI for emacs. Instead of working with git commands from the terminal, emacs magit allows to manage GitHub repository. Frequently used keyboard commands are:

> C-x g => Keyboard shortcut for git status
>
> S   => Stage all
>
> c c => Commit message  followed by C-c C-c
>
> P p => Push
>
>?  => Help 
>
> g => To refresh magit buffer
>
> TAB => To see differences in files 
>
> C-t => To set default options 

>M-p, M-n  => revisit previous commit messages

>V V   => reverting magit and commit
>
>V v  => reverting magit and no commit

>r i => rebasing   (change/delete commits and rebase)

>C-c C-k => quit current operation
>
> C-t => To set default options  
>
> C-c C-a => Commit ammend

You may want to watch the [Youtube video](https://www.youtube.com/watch?v=vQO7F2Q9DwA), which is very helpful for beginners.  

~~~
*Dealing with merge conflict using the built-in Ediff tool in emacs*

Suppose that you are changing a file locally. After that, changes are to be pushed to the remote (upstream) branch. However, when you push



First try to commit using c c => Write commit messages => C-c C-c => Shift+P p 
~~~

~~~
1. Fetch using Shift F
1. Move the cursor to unstaged file that you changed locally 
~~~


# Common Errors with Git Commands

1. Error
   ~~~
   fatal: refusing to merge unrelated histories
   Error redoing merge 1234deadbeef1234deadbeef
   ~~~

	Solution: 

	> git pull origin master --allow-unrelated-histories
	> git merge origin origin/master 

1. Suppose that you have a local (existing) git repository that needs to be updated with the remote repository. With "git pull    origin master" you will get the following error

	~~~
	error: Untracked working tree file 'public/images/icon.gif' would be overwritten by merge
	~~~

	Solution: 

	>git fetch --all

	Then, you have two options:

	>git reset --hard origin/master

	OR If you are on some other branch type:

	>git reset --hard origin/<branch_name>

	*Explanation* 
	~~~
	git fetch downloads the latest from remote without trying to merge or rebase anything. Then the git reset resets the    master branch to what you just fetched. The --hard option changes all the files in your working tree to match the files in   origin/master
	~~~

1. Error: "fatal: unable to auto-detect email address (got 'Obby@ObbyWorkstation.(none)')"

	Solution: Run 
	>git config --global user.email "yourEmail@email.com"
	>
	>git config --global user.name "Your name"


# Some Useful Commands

  * To remotely login to a file server:
    >sftp username@serverName
    >
    >put sourceFiles       [it places source files in the current directory]




