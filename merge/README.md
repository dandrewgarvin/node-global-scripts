# Merge

This script combines the functionality of the following multiple commands into a single, easy-to-use script:

```
git checkout <branch name>
git pull
git checkout <original branch>
git merge <branch name>
```

This script uses CLI arguments to handle checking out to various branches.

The default use-case of this script is `merge <remote branch name>`, and will update the current branch with the remote code from the branch specified, like `merge master`.

There are a few additional options that can be passed in:

- `-h, --help` lists all the available commands
- `-V, --version` list the current version of the script
- `-n, --new <name>` allows the user to switch to a new local branch after pulling the code from the first specified branch
- `-c, --checkout <name>` allows the user to check out to an existing local branch 
