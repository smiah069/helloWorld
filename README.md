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


For merging: use 


>$ git merge origin origin/master)




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
    >put sourceFiles  -- it places source files in the current directory




