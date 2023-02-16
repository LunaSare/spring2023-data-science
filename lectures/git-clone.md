---
layout: page
element: lecture
title: 'Cloning repositories with `git` (20 min)'
language: Bash
---

- To "clone" a repository means to make a local copy of a repository from a remote copy of it.
- you can clone any public repository on GitHub, from any user account or organization
- **In-class activity 1**: Clone the GitHub repository [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) to your computer using termnal commands:
  1. Go to the repository home on GitHub, at [https://github.com/LunaSare/markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet)
  1. Copy the ssh address of the repo. You can find that by clicking on the green button that says "Code":
  ![Git clone]({{ site.baseurl }}/materials/git-clone.png)
  1. Go to your terminal and change directories (`cd`) to where you want to save the copy of the repo locally (aka in your computer).
    *Note*: Do not clone a repo inside another repository (e.g., your class repository). This creates problems.
    If you accidentally cloned the [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) repo inside another repo in your computer, delete the [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) repo with the command:
    ```
    rm -rf markdown-cheatsheet
    ```    
  1. To create a local copy of the repo, use the command `git clone "paste here the ssh address that you copied from the repo on GitHub"`.
  1. What happened on the terminal?
  1. List the contents of your current directory. Do you see a new folder there?
  1. Change directories to the new folder and list its contents. Compare this local list of files to the contents of the [repo on Github](https://github.com/LunaSare/markdown-cheatsheet). What do you note?
