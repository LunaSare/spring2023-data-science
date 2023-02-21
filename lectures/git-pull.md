---
layout: page
element: lecture
subtitle: 'Pulling from a repository on GitHub'
language: Bash
---

- "Pulling" means to incorporate changes from a remote repository into a local repository.
```
error: failed to push some refs to 'github.com:LunaSare/markdown-cheatsheet.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
- To do this, we run the command `git pull`
- `git pull` does two actions at once, `git fetch` and `git merge`

When we try to incorporate changes, there are many errors that can come up:
