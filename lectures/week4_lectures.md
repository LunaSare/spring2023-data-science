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


> **Learning Objectives**
>
> Following this lesson, students will be able to:
>
> - Explain what is version control and why should we use it in research
> - use Rstudio to:
>   - create a new git repository locally
>   - understand the concepts of "staging" and "committing" file versions
>   - explain what is a hash
>   - display, read and comprehend the git history
> - Explain what is git
> - list alternative software to git for version control

---

**Day 1**

* Discussion: What is version control and why should we use it.
* Lecture: why git for version control?
  - free
  - open source
  - distributed repository system (not centralized)
  - faster to commit changes locally and offline
  - staging area
  - commit messages allow team communication
---

* Live coding [Git basics in RStudio](http://nicercode.github.io/git/rstudio.html)
  - activating git for your project with RStudio: starting a local git repository
  - checking the "git status" of your files
  - adding files to the staging area: indicating our intention to version control files
  - committing files: creating a numbered version of our work
  - viewing history: viewing the "git log" and "git diff" of versions that we have created
  - ignoring files: `.gitignore`
  - directories are not version controlled if they are empty


![Stage and commit area](https://swcarpentry.github.io/git-novice/fig/git-staging-area.svg)

---
* In-class exercise:

  1. Create a new RStudio project on your computer called bio.
  1. Write a three-line biography for yourself in a file called me.txt, add and commit your changes
  1. Modify one line, add a fourth line.
  1. Use the git history to describe the differences between the updated state and the original state of your repository.

---




**Day 2**

> **Learning Objectives**
>
> Following this lesson, students will be able to:
>
> - explain the difference between a local and a remote git repository
> - create a new repository on GitHub
> - set up git for usage with GitHub
> - `push` and `pull` changes to a remote repository
> - clone a repository from Github
> - list other platforms for remote version control with git.

Live coding

* [Setting up git](https://swcarpentry.github.io/git-novice/02-setup/index.html)

* [Setting up keys and tokens](https://github.com/LunaSare/lunasare-blogdown/blob/main/content/post-dev/2022-02-01_configuring-git/index.md)

* [Remotes in GitHub](https://swcarpentry.github.io/git-novice/07-github/index.html)

---
![Centralized version control](https://miro.medium.com/max/674/1*2FZbXMmr_FTV2T3LFj33sA.png)
---
![Distributed version control](https://miro.medium.com/max/834/1*2cG4BW2m1E-EcklOLG51jg.png)

Images from [medium original article](https://medium.com/analytics-vidhya/what-is-version-control-tool-explore-git-and-github-e8c4e719bc05)
