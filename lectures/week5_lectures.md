---
layout: page
element: lecture
title: 'Intro to rmarkdown'
language: R
---

> **Learning Objectives**
>
> After this week, students will be able to:
>
> - Use the main markup format options in an rmarkdown document
> - Include images
> - Create basic plots
> - Render simple rmarkdown documents (pdf, html, word)

---
## Lecture

* Other software for version control
  - https://en.wikipedia.org/wiki/List_of_version-control_software
  - https://en.wikipedia.org/wiki/Comparison_of_version-control_software
  - Centralized version control:
  ![Centralized version control](https://miro.medium.com/max/674/1*2FZbXMmr_FTV2T3LFj33sA.png)
    - Open Source: [Concurrent Versions System](https://en.wikipedia.org/wiki/Concurrent_Versions_System)
      ![](http://savannah.nongnu.org/images/Savannah.theme/floating.png)
    - Proprietary: [Microsoft Visual SourceSafe](https://learn.microsoft.com/en-us/previous-versions/ms181038(v=vs.80))
  - Distributed version control
  ![Distributed version control](https://miro.medium.com/max/834/1*2cG4BW2m1E-EcklOLG51jg.png)
    - Open Source: [Git](https://git-scm.com/)
      - main Git features
        - Ability to create local branches and merge them.
        - `git merge` and `git branch` will be seen later during the course.

_Images from [medium original article](https://medium.com/analytics-vidhya/what-is-version-control-tool-explore-git-and-github-e8c4e719bc05)_

* [Other platforms for remote version control with Git](https://www.guru99.com/github-alternative.html)

## Live-coding

### cloning repositories and markup  

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


### Rmarkdown and first steps for of project collaboration on GitHub

* In-class activity: Create an R project from your newly copied repository [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet)

Resources:
[Reproducible documents with rmarkdown]({{ site.baseurl }}/materials/07_Rmarkdown/07_Rmarkdown.html)
["Getting Started with rmarkdown by Coding club"](https://ourcodingclub.github.io/2016/11/24/rmarkdown-1.html#identify)


* What is Rmarkdown:
  - an R package
  - it allows writing and formatting text and code on the same file using syntax from the markdown markup language
  - it allows rendering the documents to multiple formats
  - it runs the code and displays the output with a given format
* Install the `rmarkdown` package with `install.packages()`
* Create a new Rmarkdown (.Rmd) file in RStudio and save it using your name, for example `Luna-rmarkdown-tutorial.Rmd`
* The three main parts of an Rmd file:
  1. the YAML header
  2. the R global options
  3. the body of your document:
    - Text: overview of the markdown syntax
    - R code chunks
      - In-class activity: insert code from an R script into your .Rmd file
      - Code chunk options
    - Inline code
- Create a PDF file from your .Rmd file
- Add, commit and push the files that you just created.
- R Notebooks

## Individual Activity

1. Using the markdown cheatsheet available on the README, use as many format options as you can to make a summary pf what you have learned in the course so far.
1. Create a PDF file from your .Rmd file
1. Add, commit and push the files that you just created.

## Homework Activity
[rmarkdown demo R code]({{ site.baseurl }}/code/07_Rmarkdown/Rmarkdown_demo.zip)
