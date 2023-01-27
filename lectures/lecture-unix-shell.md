---
layout: page
element: lecture
title: 'Intro to the Unix shell'
language: Unix
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
etherpad:         https://etherpad.wikimedia.org/p/spring2023
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


## Day 1
### Intro

- the data life cycle homework review
- Computers (and programming) are key tools for data science
- [“Introducing the Shell”](https://swcarpentry.github.io/shell-novice/01-intro/index.html) reading discussion:
  - What is a GUI?
  - What is a command shell?
    - An command-line interface (CLI): How else do we interact with computers? [Interfaces exercise](https://jamboard.google.com/d/11001yh4s56Qg8_h73_hnTbvH-PHKRyy9uO1KTPDwlHo/viewer?f=0)
    - A scripting language: What is a scripting language? [High-level languages](https://jamboard.google.com/d/1R091zAGq9zB-Zl0I7DlQO67rvs458hZW_s5OVunTNKc/viewer?f=0)
      - [Banksy fetch](https://raw.githubusercontent.com/LunaSare/slides/master/media/banksy_2019.11.13.png)
      - Programming and scripting languages provide a set of written rules that give instructions to a computational device (such as a computer) to perform a set of tasks.
    - Programming and scripting languages have different strengths.
  - Why would I use the command shell? What are the strengths of the shell?
  - Explain how the shell relates to the keyboard, the screen, the operating system, and users’ programs.
  - Explain when and why command-line interfaces should be used instead of graphical interfaces.
  - What is the prompt?

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

---
---

## Day 2
### Pipes and filters (35 min)
- [SWC lesson](https://swcarpentry.github.io/shell-novice/04-pipefilter/index.html)

[IN-CLASS ACTIVITIES]({{ site.etherpad }})

<!-- After class notes: students took 15 min tops to finish all the questions, and got them right. They were super fast!
The first student emailed me the code from their terminal 50 min after they started the class. It was really fast, but other students took more time.
Might be a good idea for in-class lessons to have them do the exercise at the beginning of the class, and then we go over the code together and I explain some more things along. -->


A) Go into teams of 2 or 3 people. Find a name for your team and write it down in the etherpad along with the names of the team members. Take 5-7 min to do so.

B)  Read https://swcarpentry.github.io/shell-novice/04-pipefilter/index.html and run along the example code on the terminal (as well as the exercises!). Email the code to your instructor once you are done. You can email the code as a .txt file or directly on the body of the email.

C) As you read, discuss with your team and answer:

1) what does the command `wc` do?

2) what do the options `-l`, `-m`, and `-w` from the `wc` command do?

3) How do you escape a waiting command?

4) What symbol do you use to redirect output to a file instead of printing it to the screen?

5) What does the `cat` command do?

6) What does `sort -n` do?

7) What command can you use to confirm that a file exists?

8) What is the main difference between the `cat` and `less` commands?

9) What happens if you redirect the output of a command operating on a file to the same file?

10) What does the symbol `>>` do?

11) What is the main difference between the commands `head` and `tail`?

12) What symbol do you use to pass the output of a command as input of the next command?

13) What is a pipeline?

14) What is the main difference between redirecting and piping an output?

15) What does the `uniq` command do?
