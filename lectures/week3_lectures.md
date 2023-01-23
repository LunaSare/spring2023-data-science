---
layout: page
element: lecture
title: 'Intro to the Unix shell'
language: Unix
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---


> **Learning Objectives**
>
> After this lesson, students will be able to:
>
> - recognize the elements of the unix shell
> - will be able to use paths to files and directories
> - understand the difference between absolute and relative paths

---

<!--
From https://datascience.virginia.edu/news/importance-software-skills-data-science

Programming means using a set of written rules that give instructions to a computational device (such as a computer) to perform a set of tasks, which will then change a function within the computer. Programming languages each have their own syntax and grammar, so a different set of words and instructions are analyzed depending on what programming language the engineer chooses. Additionally, the way a computer or computing device makes sense of the syntax varies by language, and a compiler translates this written code into information for a computer.

The job of a software engineer, data scientist, or any other technical person writing in a programming language is to accurately use the language or tools so the computer does the job it’s supposed to do. Sometimes, there are errors with the actual words, which is known as a “syntax error,” and the compiler can often tell the programmer what to change in order to make the code run effectively. Sometimes, even though the code fits the correct syntax, it is not performing the job that the technical engineer intended, in which case, debugging is necessary. This can often be a much more complicated process, and requires a more in-depth knowledge of computer science.
-->


## Programming with the unix shell

### Intro

- homework review
- Programming is a key tool for data science
- What is programming?
- Programming means to write a set of written rules that give instructions to a computational device (such as a computer) to perform a set of tasks.
- Programming languages have different strengths
- What is the Unix shell?

### Navigating Files and Directories (40 min)
- [SWC lesson](https://swcarpentry.github.io/shell-novice/02-filedir/index.html)
- the file system
- command `pwd`
- the home directory and its variations
- the two meaning of the "forward slash" `/`
- the command `ls`
- getting help with `man ls`
- the option `ls -F`
- options that throw errors
- explore other directories with `ls -F Desktop`
- changing locations down the file system with `cd`
- going up in the file system with `..`
- `.` means the current directory
- `ls -F -a`
- using `cd` with no argument to go back home
- using the "tilde" `~` as shortcut of the current home directory
- using `cd -` to go back
- defining commands, options and arguments
- other names for options and arguments are parameters, switches or flags
- capitalization is meaningful, example: `ls -s` vs `ls -S`

- Joint exercise [Absolute vs Relative Paths](https://swcarpentry.github.io/shell-novice/02-filedir/index.html#absolute-vs-relative-paths)
- Solo exercise [Relative Path Resolution](https://swcarpentry.github.io/shell-novice/02-filedir/index.html#relative-path-resolution)

### Working With Files and Directories (50 min)
- [SWC lesson](https://swcarpentry.github.io/shell-novice/03-create/index.html)
- creating directories with `mkdir` and `mkdir -p`
  - Read [10 Best Practices for Naming Files & Folders](https://medium.com/thewhybuilder/10-best-practices-for-naming-files-folders-for-you-and-your-team-653f58d5db73)
- list nested directories with `ls -FR`
- use the finder to see the folders you just created
- good names for files and directories do not use blank spaces
  - Read [File Naming Best Practices](https://guides.library.harvard.edu/c.php?g=1033502&p=7496710)
- creating a text file with `nano`
- using the nano text editor
- homework challenge: creating a text file with `touch`
- file extensions
- moving files and directories with `mv`
- copying files and directories with `cp`
- removing files with `rm` and directories with `rm -r`
- wildcards `*` and `?`
- [Challenge](https://swcarpentry.github.io/shell-novice/03-create/index.html#list-filenames-matching-a-pattern)
- Homework activities

### Pipes and filters (35 min)
- [SWC lesson](https://swcarpentry.github.io/shell-novice/04-pipefilter/index.html)
