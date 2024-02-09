# Git worktree

A bare git repository is needed to build a worktree:

```sh
git clone --bare <repositoryAddress>
```

To create a worktree that is based on an existitng branch run:

```sh
cd repositoryAddress.git 
git worktree add --checkout <remoteBranch>
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
