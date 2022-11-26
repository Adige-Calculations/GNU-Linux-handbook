# Utilities

A list of a useful software for UNIX like environment

## ltdr

This will return a better man page.

## curl 

Transfers data from or to a server. Supports most protocols, including
HTTP, FTP, and POP3. For example to test a rest-api:

curl https://pokeapi.co/api/v2/pokemon/ \> pokemon_return_rest_api.json

## Git

Git is a programme which permit to share project and contribute in open
source manner. The usual work frame is to download (clone in git
language) the code, apport modification and upload the code (push in git
language). The following image show how Git works in a schematic way:

<img src="media/image4.png" style="width:1.77154in;height:1.67826in" alt="Diagram Description automatically generated" />

If you already have a git server, configure the git client running:

git config --global user.email "\<**yourEmail**\>"

or

git config --global user.name "\<**yourName**\>"

### Get a repository from server 

Once cloned the repository you are interest with on your local device:

git clone \<**repositoryUrl**\>

With an existing repository:

git pull

### Create a repository

Initialized empty Git repository locally,

git init -b main

git add . && git commit -m "initial commit"

… complete

### Navigate into the repository

Look at the local branches in your repository:

git branch

To see all other branches hiding in your repository and you can use the
-a flag:

git branch --all

If you just want to take a quick peek at an upstream branch, you can use
a 'detached HEAD' state. You can look around, make experimental changes
and commit them, and you can discard any commits you make in this state
without impacting any branches by switching back to a branch. With the
command:

git checkout \<**wholePathToTheBranch**\>

But if you want to work on that branch, you'll need to create a local
tracking branch which is done automatically by:

git checkout \<**branchName**\>

Now, if you look at your local branches, this is what you'll see is the
branch you have chosen:

git branch

### Modify the repository 

Get the status of the local repository to see which file changed and
which not

git status

### Add code

Add some code and then do a commit into the base level of the
repository:

git add -A  Stages all changes

git add .  Stages new files and modifications, without deletions (on
the current directory and its subdirectories).

git add -u  stages modifications and deletions, without new files

Get again the status of the local repository

git status

### Merge 

If you are in main run:

git merge dev-branch

To merge the dev-branch modification into main

### Commit 

Now it is time to commit those modification

git commit -a

or juts commit everything with:

git commit -m “comment”

A commit file will appear where you need to make visible the changes you
want to commission.

### Push

Then push the directory to add the files on the online repository:

git push

if your branch is new, set a seed in the remote branch to upload the new
files:

git push --set-upstream origin \<branchName>

### Remove remote branch

Remove a remote branch

git push -d \<remote_name> \<branchname>

\<**remote_name**\> usually is **origin**

Remove a local branch:

git branch -d \<branchname>

