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

### Intro to `git`
- [quizz]({{ site.etherpad }})
* Discussion: What is version control and why should we use it?
* Lecture: `git` for version control
  - free
  - open source
  - distributed repository system (not centralized)
  - faster to commit changes locally and offline
  - staging area
  - commit messages allow team communication

### Configuring `git` (on the terminal)

* [Setting up git](https://swcarpentry.github.io/git-novice/02-setup/index.html)

### Creating a repository on the terminal

* [Creating a repository](https://swcarpentry.github.io/git-novice/03-create/index.html)

### Tracking changes on the terminal

* [Tracking changes](https://swcarpentry.github.io/git-novice/04-changes/index.html)
- the difference between staging/adding a file or changes to a file and commiting them:
![Stage and commit area](https://swcarpentry.github.io/git-novice/fig/git-staging-area.svg)

### Using `git` on Rstudio

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


### In-class exercise

  1. Create a new RStudio project on your computer called "bio".
  1. Write a three-line biography for yourself in a file called me.txt, add and commit your changes.
  1. Modify one line, add a fourth line, add and commit the changes.
  1. Display the git history of your project. Describe the differences between the updated state and the original state of your repository. Do your commit messages are informative enough to describe the differences?


**A minute feedback for class 7**

- Please provide some quick feedback for this session [here]({{ site.feedback.class7 }})

* Homework

Read: [Best practices for commit messages](https://reflectoring.io/meaningful-commit-messages/)


**Day 2**

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

### Remote version control with `git`

* [Remotes in GitHub](https://swcarpentry.github.io/git-novice/07-github/index.html)
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

---
---

### Group activity

* What is the difference between committing a change and pushing it?

1. Read the comic, can you find three main differences between committing a change to a repository and pushing a change?
2. Think of another example to illustrate the difference between `git commit` and `git push`. For example, I imagine that adding a song to my spotify queue is equivalent to committing a file, and then when the song is finally playing and made public that is like pushing the file to the remote repository 😜

![A Git Story](https://res.cloudinary.com/practicaldev/image/fetch/s--pYxSazy8--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/d9n3kcnc76l5viwl4z2n.jpeg)

Comic by [Erika Heidi](https://dev.to/erikaheidi/stage-commit-push-a-git-story-comic-a37).

<!-- Additional for the activity: a jamboard with missing cells: -->
<!-- Fill the missing cells in the [comparative table](http://cdn.differencebetween.net/wp-content/uploads/2019/10/Commit-vs-Push.jpg). -->

### Optional activity

* What is the difference between fetching changes from a remote and pulling them?

![A difference between fetching and pulling](https://pbs.twimg.com/media/FLG-tC-UcAEPRNk?format=jpg&name=4096x4096).

Comic by [Allison Hurst](https://twitter.com/allison_horst)

---
---

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
