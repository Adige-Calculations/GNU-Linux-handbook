# Git

Git is a programme that does version control on code bases. The usual 
workflow is to download (```clone``` in the git jargon) the code, apport 
modification (```commit```) and upload the code (```push```). 

If you already have a git server, configure the client running:

```sh
git config --global user.email "<yourEmail>"
git config --global user.name "<yourName>"   # Otherwise you can configure the account with your username 
```

### Get a repository from server 

Once cloned the repository you are interest with on your local device:

```sh
git clone <sshAddress>  # Or repo URL
```
Using the SSH protocol, you must have a key the access the repository if the repository is private.
To get the last version of the remote code, run:

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

If you want to work on a specific branch, you'll need to create a local
tracking branch which is done by:

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

the **remote_name** is usually: **origin**

# Contribute to a project - GitHub 

You can contribute to an existing project, opening a pull request.
The overall process should look somewhat like this:

1. Fork the repo.

2. Clone your fork locally:
  `git clone https://github.com/your_username/forked_project.git`

3. Create a feature branch, e.g. named after the command you plan to edit:
  `git checkout -b branch_name`

> It is bad practice to submit a pull request from the `main` branch of your forked repository.

4. Make your changes

5. Commit the changes:
  `git commit --all -m "commit_message"`

6. Push the commit(s) to your fork:
  `git push origin branch_name`

> Please avoid force-pushing since it makes the review process harder.

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
