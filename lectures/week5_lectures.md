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
