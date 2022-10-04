---
layout: page
element: lecture
title: 'Intro to rmarkdown'
language: R
time: 1hr 45min
---

> **Learning Objectives**
>
> After this week, students will be able to:
>
> - Use the main markup format syntax in an `rmarkdown` document
> - Include images from other URL or saved in a project
> - Render simple rmarkdown documents (pdf, html, word)
> - R Notebooks are not covered yet


---
### Other software for version control (5 min)

- [A wikipedia List of version control software](https://en.wikipedia.org/wiki/List_of_version-control_software)
- [And a comparison](https://en.wikipedia.org/wiki/Comparison_of_version-control_software)
- Centralized vs Distributed version control software:
  ![Centralized version control](https://miro.medium.com/max/674/1*2FZbXMmr_FTV2T3LFj33sA.png)
  ![Distributed version control](https://miro.medium.com/max/834/1*2cG4BW2m1E-EcklOLG51jg.png)
  1. Centralized version control examples:
    - Open Source: [Concurrent Versions System](https://en.wikipedia.org/wiki/Concurrent_Versions_System)
      - Has a cool logo:
    ![](http://savannah.nongnu.org/images/Savannah.theme/floating.png)
    - Proprietary: [Microsoft Visual SourceSafe](https://learn.microsoft.com/en-us/previous-versions/ms181038(v=vs.80))
      - You have to pay to use it!
  2. Distributed version control examples:
    - Open Source: [Git](https://git-scm.com/)
      - Ability to create branches and merge them (`git merge` and `git branch` will be seen later during the course).
      - Ability to create working copies from any public project hosted on GitHub: cloning and forking
      - [Other platforms for remote hosting of Git repositories](https://www.guru99.com/github-alternative.html).

_Images from [medium original article](https://medium.com/analytics-vidhya/what-is-version-control-tool-explore-git-and-github-e8c4e719bc05)_


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

### Markup languages (5 min)

* A markup language is a text-encoding system consisting of a set of symbols inserted in a text document to control its structure, formatting, or the relationship between its parts ([Wikipedia. Retrieved 2022-09-29](https://en.wikipedia.org/wiki/Markup_language); [Encyclopedia Britannica. Retrieved 2022-08-17](https://www.britannica.com/technology/markup-language)).
* Open source markup languages use procedural or descriptive markup. This makes them best for version control because:
  - A file can be opened and edited with any text editor.
  - Files are always written as plain text and do not contain hidden formatting codes or binary instructions.
* Proprietary word processing software such as Microsoft Word, use a type of markup language called presentational or ["What You See Is What You Get"](https://en.wikipedia.org/wiki/WYSIWYG). They are not the best for open science and version control because:
  - Files can only be edited with the proprietary software
  - Files are written with binary code embedded with plain text, and is hidden from authors and editors.
* Some examples of open source markup languages:
  1. Markdown: Used for simple text digital documents, such as blogs, comments, messages.

```
Heading
=======

Sub-heading
-----------

# Alternative heading #

Paragraphs are separated
by a blank line.

Two spaces at the end of a line
produce a line break.
```

  2. HyperText Markup Language (HTML): used for websites and the internet in general.

```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My test page</title>
  </head>
  <body>
  <h1>Heading</h1>

  <h2>Sub-heading</h2>

  <h1>Alternative heading</h1>

  <p>Paragraphs are separated
  by a blank line.</p>

  <p>Two spaces at the end of a line<br />
  produce a line break.</p>

    <h1>Mozilla is cool</h1>
    <img src="images/firefox-icon.png" alt="The Firefox logo: a flaming fox surrounding the Earth.">

    <p>At Mozilla, we’re a global community of</p>

    <ul> <!-- changed to list in the tutorial -->
      <li>technologists</li>
      <li>thinkers</li>
      <li>builders</li>
    </ul>

    <p>working together to keep the Internet alive and accessible, so people worldwide can be informed contributors and creators of the Web. We believe this act of human collaboration across an open platform is essential to individual growth and our collective future.</p>

    <p>Read the <a href="https://www.mozilla.org/en-US/about/manifesto/">Mozilla Manifesto</a> to learn even more about the values and principles that guide the pursuit of our mission.</p>
  </body>
</html>
```

  3. LaTeX: used for writing documents that include complex math expressions or non-Latin scripts, such as Arabic, Devanagari, Greek, Sanskrit, and Chinese.

```
\documentclass{article} % Starts an article
\usepackage{amsmath} % Imports amsmath
\title{\LaTeX} % Title

\begin{document} % Begins a document
  \maketitle
  \LaTeX{} is a document preparation system for the \TeX{} typesetting program. It offers programmable desktop publishing features and extensive facilities for automating most aspects of typesetting and desktop publishing, including numbering and  cross-referencing, tables and figures, page layout, bibliographies, and much more. \LaTeX{} was originally written in 1984 by Leslie Lamport and has become the  dominant method for using \TeX; few people write in plain \TeX{} anymore. The current version is \LaTeXe.

  % This is a comment, not shown in final output.
  % The following shows typesetting  power of LaTeX:
  \begin{align}
    E_0 &= mc^2 \\
    E &= \frac{mc^2}{\sqrt{1-\frac{v^2}{c^2}}}
  \end{align}
\end{document}
```


### Rmarkdown (15 min)

Resources:
[Reproducible documents with rmarkdown]({{ site.baseurl }}/materials/07_Rmarkdown/07_Rmarkdown.html)
["Getting Started with rmarkdown by Coding club"](https://ourcodingclub.github.io/2016/11/24/rmarkdown-1.html#identify)

* `rmarkdown` is an R package that:
  - allows writing and formatting text and code on the same file using syntax from the markdown markup language
  - it allows rendering the documents to multiple formats
  - it runs the code and displays the output with a given format
* In-class activity: Create an R project from your newly copied repository [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet)
  - Go to RStudio
  - Select `New project`
  - When the menu opens, select create New project from `an existing directory`
  - Browse to select the path to the `markdown-cheatsheet` folder
  - Press the `Create project` button
* Install the `rmarkdown` package with `install.packages()`
* Create a new Rmarkdown (.Rmd) file in RStudio and save it using your name, for example `Luna rmarkdown tutorial`
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

### and first steps for project collaboration on GitHub (15 min)
- Add, commit and push the files that the instructor created.
- `git pull` before `git push`
- Add collaborators to a project so that they can push changes.

## Individual Activity (15 min)

1. Using the markdown cheatsheet available on the README, use as many format options as you can to make a summary of what you have learned in the course so far.
1. Create a PDF file from your .Rmd file
1. Add, commit and push the files that you just created.

## Homework Activity
[rmarkdown demo R code]({{ site.baseurl }}/code/07_Rmarkdown/Rmarkdown_demo.zip)
