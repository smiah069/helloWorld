# helloWorld
This is my first hello world repository.

# Some usefull links

## Upload/upgrade local repository to github (online) repository using the command line

* [See this link](https://help.github.com/en/articles/adding-a-file-to-a-repository-using-the-command-line)

## How to upload a project to Github

* [See this link](https://stackoverflow.com/questions/12799719/how-to-upload-a-project-to-github)

## Troubleshooting

* fatal: refusing to merge unrelated histories
Error redoing merge 1234deadbeef1234deadbeef

Solution: 

* git pull origin master --allow-unrelated-histories
git merge origin origin/master * 


### (Windows MINGW64) Working set of commands for uploading local repositing to github remote repository

1. Navigate command line to go to local github repository


$ git init
$ git add . 

*** Please tell me who you are.

==
Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

===

$ git commit -m "Adding poster and labnotebook"

$ git remote add origin https://github.com/smiah069/gitHubReposSeniorProject1-18-19

$  git pull origin master --allow-unrelated-histories

$ git push --force origin master


(For merging: use $ git merge origin origin/master)

=====
