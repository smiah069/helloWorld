# My Git Documentation   

* Some usefull links 

  * Upload/upgrade local repository to github (online) repository using the command line

    [See this link](https://help.github.com/en/articles/adding-a-file-to-a-repository-using-the-command-line)

  * How to upload a project to Github

  * [See this link](https://stackoverflow.com/questions/12799719/how-to-upload-a-project-to-github)



* (Windows MINGW64) Working set of commands for uploading local repositing to github remote repository

1. Navigate command line to go to local github repository

~~~
$ git init

$ git add . 

~~~

*** Please tell me who you are.

==
Run

~~~
  git config --global user.email "you@example.com"
  
  git config --global user.name "Your Name"
~~~

to set your account's default identity.

~~~
Omit --global 
~~~
to set the identity only in this repository

==

~~~
$ git commit -m "Adding poster and labnotebook"

$ git remote add origin https://github.com/smiah069/gitHubReposSeniorProject1-18-19

$  git pull origin master --allow-unrelated-histories

$ git push --force origin master
~~~

For merging: use 

~~~
$ git merge origin origin/master)
~~~

=====

* To work with the  latest version of repository in local repository drive, first fetch it in the local repo drive:

$ git pull origin master       (OR  $ git fetch --all)


# Troubleshooting 


1. Error
   ~~~
   fatal: refusing to merge unrelated histories
   Error redoing merge 1234deadbeef1234deadbeef
   ~~~

  Solution: 

  > git pull origin master --allow-unrelated-histories
  > git merge origin origin/master 

2. Suppose that you have a local (existing) git repository that needs to be updated with the remote repository. With "git pull    origin master" you will get the following error

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
git fetch downloads the latest from remote without trying to merge or rebase anything. Then the git reset resets the master branch to what you just fetched. The --hard option changes all the files in your working tree to match the files in origin/master
~~~


