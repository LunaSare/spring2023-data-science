---
layout: page
element: lecture
title: 'Intro to version control'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

<!--
[Measuring biodiversity]({{ site.baseurl }}/materials/01_BiodiversityMeasures/01_BiodiversityMeasures.html)

[Manipulating data]({{ site.baseurl }}/materials/02_Manipulating_data/02_ManipulatingData.html)
-->
<!--

Slides:

[Introduction to R and Version Control]({{ site.baseurl }}/materials/01_RIntro_VersionControl/01_RIntro_VersionControl.html)

-->


> **Learning Goal**
>
> - Familiarize with the main tools of version control with git using RStudio's graphical user interface.
> - Practice creating a new project with RStudio GUI.
>
> **Learning Objectives**
>
> Following this lesson, students will be able to:
>
> - Explain what is version control and why should we use it in research
> - Use Rstudio to:
>   - create a new git repository locally
>   - understand the concepts of "staging" and "committing" file versions
>   - explain what is a hash
>   - display, read and comprehend the git history
---

## Day 1

### Intro to `git` (40 min)

- Do the [quizz]({{ site.etherpad }}) (20 min)
* Discussion: What is version control and why should we use it? (20 min)
* `git` for version control
  - free
  - open source
  - distributed repository system (not centralized)
  - faster to commit changes locally and offline
  - staging area
  - commit messages allow team communication

### Configuring `git` (on the terminal, 20 min)

* [Setting up git](https://swcarpentry.github.io/git-novice/02-setup/index.html)

### Creating a repository on the terminal

* [Creating a repository](https://swcarpentry.github.io/git-novice/03-create/index.html)

### Tracking changes on the terminal

* [Tracking changes](https://swcarpentry.github.io/git-novice/04-changes/index.html)
- the difference between staging/adding a file or changes to a file and commiting them:
![Stage and commit area](https://swcarpentry.github.io/git-novice/fig/git-staging-area.svg)

### Using `git` on Rstudio (20 min)

* [Git basics in RStudio](http://nicercode.github.io/git/rstudio.html)
  - activating git for your project with RStudio: starting a local git repository
  - checking the "git status" of your files
  - adding files to the staging area: indicating our intention to version control files
  - committing files
    - it creates a unique numbered version of your work
    - commit messages must be informative:
    ![](https://workchronicles.com/wp-content/uploads/2020/08/Small-Changes-768x768.png)
  - viewing history: viewing the "git log" and "git diff" of versions that we have created
  - ignoring files for version control using the `.gitignore` file
    - which files should we ignore?
    - the ".Rproj" files
  - directories are not version controlled if they are empty

**A minute feedback for class 7**

- Please provide some quick feedback for this session [here]({{ site.feedback.class7 }})

* Homework

1. Do the following [exercise](https://swcarpentry.github.io/git-novice/04-changes/index.html#bio-repository), (either using the Rstudio GUI or the command line, from the terminal):
    1. Create a new RStudio project on your computer called "bio".
    1. Write a three-line biography for yourself in a file called me.txt, add and commit your changes.
    1. Modify one line, add a fourth line, add and commit the changes.
    1. Display the git history of your project. Describe the differences between the updated state and the original state of your repository. Do your commit messages are informative enough to describe the differences?
2. Read ["best practices for commit messages"](https://reflectoring.io/meaningful-commit-messages/)
    - Make a summary that lists 3 characteristics of a good commit message.


---
---

## Day 2

> **Learning Goals**
>
> - Learn `git` tools for version control of remote repositories on GitHub
> - Practice usage of Unix shell commands to set up and do remote version control on GitHub
>
> **Learning Objectives**
>
> Following this lesson, students will be able to:
>
> - Explain the difference between a local and a remote git repository
> - Create a new repository on GitHub
> - Set up git for usage with GitHub
> - `push` and `pull` changes to a remote repository
> - List alternative software to git for version control
> - List other platforms for remote version control with git
> - Explain why we use Git

### Introduction
- Do the [quizz]({{ site.etherpad }}) (10 min)
- A version control system is a tool (implemented as software) that keeps track of any changes made on files of a project, effectively creating different versions of our files.
- A repository is the complete history of commits for a particular project and their metadata.

### Other software for version control (10 min)
- [A wikipedia List of version control software](https://en.wikipedia.org/wiki/List_of_version-control_software)
- [And a comparison](https://en.wikipedia.org/wiki/Comparison_of_version-control_software)
- Centralized vs Distributed version control software:
  ![Centralized version control](https://miro.medium.com/max/674/1*2FZbXMmr_FTV2T3LFj33sA.png)
  ![Distributed version control](https://miro.medium.com/max/834/1*2cG4BW2m1E-EcklOLG51jg.png)
  1. Centralized version control examples:
    - Example of **centralized** open source software for version control: [Concurrent Versions System](https://en.wikipedia.org/wiki/Concurrent_Versions_System)
      - Pros: It is free
      - It has a cool logo
        ![](http://savannah.nongnu.org/images/Savannah.theme/floating.png)
    - Example of proprietary software for version control: [Microsoft Visual SourceSafe](https://learn.microsoft.com/en-us/previous-versions/ms181038(v=vs.80))
      - Cons: You have to pay to use it!
  2. Distributed version control examples:
    - Example of **distributed** open source software for version control: [Git](https://git-scm.com/)
    - As opposed to distributed software, centralized version control has:
      - The ability to create branches and merge them (`git merge` and `git branch` will be seen later during the course).
      - The ability to create working copies from any public project hosted on the web (GitHub): cloning and forking
      - [Other platforms for remote hosting of Git repositories](https://www.guru99.com/github-alternative.html).

  _Images from [medium original article](https://medium.com/analytics-vidhya/what-is-version-control-tool-explore-git-and-github-e8c4e719bc05)_


### Remote version control with `git`

* Lab [Remotes in GitHub](https://swcarpentry.github.io/git-novice/07-github/index.html)
  - Create a remote repository
  - Connect local repository to newly created remote repository
    - use SSH and not HTTPS, the latter is more secure
  - Set up authentication to remote repositories
    - [Setting up keys and tokens](https://github.com/LunaSare/lunasare-blogdown/blob/main/content/post-dev/2022-02-01_configuring-git/index.md)
    - create an SSH key pair
    - give your key to GitHub
    - manage your password
  - Push local repository to remote with `git push`
  - The GitHub GUI
    - create a README file
    - look at the git history remotely on the Github GUI
  - Pulling a remote repository to local repo with `git pull`
    - what happens locally when there are changes to remote?
    - what about when there are no changes to remote?
  - Look at the git history locally on the terminal with `git log`

### Group activity
* What is the difference between committing a change and pushing it?
1. Read the comic, can you find three main differences between committing a change to a repository and pushing a change?
2. Think of another example to illustrate the difference between `git commit` and `git push`. For example, I imagine that adding a song to my spotify queue is equivalent to committing a file, and then when the song is finally playing and made public that is like pushing the file to the remote repository 😜
![A Git Story](https://res.cloudinary.com/practicaldev/image/fetch/s--pYxSazy8--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/d9n3kcnc76l5viwl4z2n.jpeg)
Comic by [Erika Heidi](https://dev.to/erikaheidi/stage-commit-push-a-git-story-comic-a37).
<!-- Additional for the activity: a jamboard with missing cells: -->
<!-- Fill the missing cells in the [comparative table](http://cdn.differencebetween.net/wp-content/uploads/2019/10/Commit-vs-Push.jpg). -->


### Cloning repositories (20 min)
* The `git clone` tool:
  - to "clone" a repository means to make a local copy of it
  - you can clone any public repository on GitHub
  - to make a remote copy of a public repo in your account, you have to use the "fork" option on GitHub.
  - the ability to clone and fork a public repository is one of the features that makes Git and GitHub so widely used and a great tool for collaboration, not only by computer developers!
  - Take home activity: Read the Git Basics tutorial [Getting a Git Repository](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)
  - In-class activity: clone the GitHub repository [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) to your computer:
    1. Go to the repository home on GitHub, at [https://github.com/LunaSare/markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet)
    1. Copy the ssh address of the repo. You can find that by clicking on the green button that says "Code":
    ![Git clone]({{ site.baseurl }}/materials/git-clone.png)
    1. Go to your terminal and change directories to where you want to make the local copy of the repo. If you want the repo on your home directory, you can skip this step.
    1. Use the command `git clone "paste here the ssh address of the repo"` to create a local copy of the repo.
    1. On the terminal, see the contents of the README.md file from the repo. You can use `nano`, `cat` or `less`.
    1. What is the difference between the file that you see on your terminal and the file as it is displayed on GitHub?
    <!-- Answer: Text is intermixed with markup instructions or symbols -->

[Link]({{ site.baseurl }}/lectures/git-clone)

### Activity

* What is the difference between fetching changes from a remote and pulling them?

![A difference between fetching and pulling](https://pbs.twimg.com/media/FLG-tC-UcAEPRNk?format=jpg&name=4096x4096).

Comic by [Allison Hurst](https://twitter.com/allison_horst)


### Individual activity

1. Create a remote repository called "bio" on your GitHub account.
2. Add, commit and push your local repository to your newly created remote on GitHub.
3. Add a line to your bio file using the GitHub GUI, and commit it.
4. Modify another line of your bio on the GitHub GUI and commit it.
3. Find the commit history on GitHub.
4. Take a snapshot of the commit history displayed on GitHub and send it to your instructor.
5. Now pull the changes into your local repository.
6. Get your commit history on the terminal with `git log`, take a snapshot of it and send it to your instructor.

**A minute feedback for class 8**

- Please provide some quick feedback for this session [here]({{ site.feedback.class8 }})

* Homework

---
---
