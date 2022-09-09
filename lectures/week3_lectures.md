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

---

Day 1

* [Navigating Files and Directories](https://swcarpentry.github.io/shell-novice/02-filedir/index.html)
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

* [Working With Files and Directories](https://swcarpentry.github.io/shell-novice/03-create/index.html)
  - creating directories with `mkdir` and `mkdir -p`
  - list nested directories with `ls -FR`
  - use the finder to see the folders you just created
  - good names for files and directories do not use blank spaces
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
