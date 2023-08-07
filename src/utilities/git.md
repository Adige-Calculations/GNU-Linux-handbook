# Git

Git is a programme which permit to share and contribute to project. The usual 
workflow is to download (```clone``` in the git jargon) the code, apport 
modification and upload the code (```push``` in git language). 

If you already have a git server, configure the client running:

```sh
git config --global user.email "<yourEmail>"
# Otherwise you can configure the account with your usernam 
git config --global user.name "<yourName>"
```

### Get a repository from server 

Once cloned the repository you are interest with on your local device:

```sh
# Using the SSH protocol, you must have a key the access the repository
git clone <sshAddress>
# or you can use the https protocol
git clone <repositoryUrl>
```

With an existing repository, to get new remote code run:

```sh
git pull
```

### Create a repository

Initialized empty Git repository locally,

```sh
git init -b main
git add . && git commit -m "initial commit"
```

### Navigate the repository

Look at the local branches in your repository:

```sh
git branch
```

To see all other branches hiding in your repository and you can use the
--all/-a flag.

```sh
git branch --all
```

If you just want to take a quick peek at an upstream branch, you can use
a 'detached HEAD' state. You can look around, make experimental changes
and commit them, and you can discard any commits you make in this state
without impacting any branches by switching back to a branch. With the
command:

```sh
git checkout <wholePathToTheBranch>
```

But if you want to work on that branch, you'll need to create a local
tracking branch which is done automatically by:

```sh
git checkout <branchName>
```

## Modify the repository branch 

First, always check the status of the local repository to see which file changed and which has not:

``` sh
git status
```

To not consider the changes made since the last commit, you can stash your changes with:

```sh 
git stash
```
However if the data are needed in the future, you can recover the last stashed repository state with:

```sh
# Only the last stashed modifications 
git stash pop
```

### Add code
Add some code and then do a commit into the base level of the
repository. Stages all changes:

```sh
git add . 
# Or a particolar file 
git add path/to/file
```

### Commit code

After having added new file/modifications into the git queue. You can commit these with:

```sh
git commit -m “comment”
```
A commit file will appear where you need to make visible the changes you
want to commission.

### Merge branches

If you are in the ```main``` branch, run:

```sh
git merge <dev-branch-name>
```
To merge the dev-branch modification into main.

### Push

Then push the directory to add the files on the online repository:
```sh
git push
```
if your branch is new, set a seed in the remote branch to upload the new
files:

```sh
git push --set-upstream origin <branchName>
```

### Manage branches

To create a new branch, execute the following:

```sh
git branch <newBranch>
```

Remove a branch run one of these two command:

```sh
# Remote branch
git push -d <remoteBranchName> <branch_name>
# Local branch
git branch -d <localBranchName>
```

the **remote_name** usually is: **origin**

# Contribute to a project - GitHub 

You can contribute to an existing project, opening a pull request.
The overall process should look somewhat like this:

1. Fork the repo.

2. Clone your fork locally:
  `git clone https://github.com/your_username/forked_project.git`

3. Create a feature branch, e.g. named after the command you plan to edit:
  `git checkout -b branch_name`

  > :warning: It is bad practice to submit a pull request from the `main` branch of your forked repository.

4. Make your changes

5. Commit the changes:
  `git commit --all -m "commit_message"`

6. Push the commit(s) to your fork:
  `git push origin branch_name`

  > :warning: Please avoid force-pushing since it makes the review process harder.

7. Go to the GitHub page for your fork and click the green "Compare & pull request" button.


## GitHub SSH keys

To acceed in Github using the SSH protocol, you need to make aware the platform of 
your public SSH key, which you can generate with:

```sh
ssh-keygen -t ed25519 -C <your_email@example.com>
```
<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
