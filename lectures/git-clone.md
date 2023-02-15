### Copying repositories with `git` (20 min)

- Cloning
- to "clone" a repository means to make a local copy of a repository from a remote copy of it.
- you can clone any public repository on GitHub, from any user account or organization
- In-class activity 1: Clone the GitHub repository [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) to your computer using termnal commands:
  1. Go to the repository home on GitHub, at [https://github.com/LunaSare/markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet)
  1. Copy the ssh address of the repo. You can find that by clicking on the green button that says "Code":
  ![Git clone]({{ site.baseurl }}/materials/git-clone.png)
  1. Go to your terminal and change directories (`cd`) to where you want to save the copy of the repo locally (aka in your computer).
    *Note*: Do not clone a repo inside another repository (e.g., your class repository). This creates problems.
    If you accidentally cloned the [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) repo inside another repo in your computer, delete the [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) repo with the command:
    ```
    rm -rf markdown-cheatsheet
    ```    
  1. Use the command `git clone "paste here the ssh address that you copied from the repo on GitHub"` to create a local copy of the repo.
  1. What happened on the terminal?
  1. List the contents of your current directory. Do you see a new folder there?
  1. Change directories to the new folder and display the contents of the README.md file from the repo. You can use the commands `nano`, `cat` or `less`.
  1. What is the difference between the file that you see on your terminal and the [file as it is displayed on GitHub](https://github.com/LunaSare/markdown-cheatsheet#readme)?

  <!-- Answer: Text is intermixed with markup instructions or symbols -->
- In-class activity 2:
  1. 
- Forking
- to make a remote copy of a public repo in your account, you have to use the "fork" option on GitHub.
- the ability to clone and fork a public repository is one of the features that makes Git and GitHub so widely used and a great tool for collaboration, not only by computer developers!
- Take home activity: Read the Git Basics tutorial [Getting a Git Repository](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)
