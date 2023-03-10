# Data Science Research in Biology
# Spring 2023

This is a [forkable](https://help.github.com/articles/fork-a-repo/) set of teaching materials for teaching biologists how to work
with data through programming, database management and computing more generally.

This repository contains teaching materials (excluding exams and
answers to assignments) for a university style and self-guided
course teaching computational data skills to biologists.

The basic design of this website is based on the Programming for Biologists course developed by Ethan White (@ethanwhite) at the University of Florida. His course materials can be found and forked [here](http://datacarpentry.org/semester-biology)
It was also based using Eric Lind's course [Data Management for Biologists](https://github.com/ericlind/data-mgmt-4-biologists)

[Helpful information](http://www.datacarpentry.org/semester-biology/docs/)
is available regarding the structure and function of the course and website
materials for customized development and delivery of the course.

## Where is everything

Core teaching materials are stored in `exercises/`, `lectures/`, and
`materials/`.

Class specific materials are stored in the `syllabus`, `schedule` and `assignments/`.

Most of the other folders and files support creating the course website using
[Jekyll](http://jekyllrb.com/).


## How to contribute

We use standard [GitHub flow](https://guides.github.com/introduction/flow/), so
fork the repository, add or change material, and submit a pull request.

The goal of making this course forkable is to facilitate collaboration on
developing this kind of material for university courses. The central component
of a flipped computing course is the exercises, so one of the primary forms of
contribution will be adding exercises to the pool of exercises. Individual
instructors can then select from a rich pool of exercises the ones that fit the
topics, languages, and scientific domains that best fit the material they want
to cover in the course.

There are lots of great resources for being introduced to the individual
concepts being taught in courses like this. Our philosophy is to use and improve
these external resources when available instead of creating new versions of the
same content. In particularly we actively use
[Data Carpentry](http://datacarpentry.org/lessons) and
[Software Carpentry](http://software-carpentry.org/lessons.html) workshop
materials. However, in cases where the necessary material doesn't exist
elsewhere it can certainly be added here.


## Using Jekyll to build your own course website

### Simple setup

The website is setup to be easy to run automatically through GitHub:

1. [Fork](https://github.com/datacarpentry/semester-biology#fork-destination-box)
   or [import](https://import.github.com/) the repository to
   `https://github.com/yourusername/semester-biology`.
2. Update `# Setup` information in `_config.yml` in the main directory for
   proper site rendering.
   * You must `push` this change to your repository to build and browse your
     forked version.
   * In a few minutes you should be able to see the site at:
     `https://yourusername.github.io/semester-biology/`
3. Edit any of the markdown (.md) files
4. Commit and push the changes
   * The changes should now be reflected on the website
5. If you want to use a custom domain name instead of `github.io`, follow
   [GitHub's instructions for setting up a custom domain](https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/).

If you have any problems please
[let us know](https://github.com/datacarpentry/semester-biology/issues/new) and
we'll be happy to help.

### Previewing changes locally

If you want to view your changes locally, before pushing them to the live
website, you'll need to setup Jekyll locally. GitHub provides a [good
introduction on how to do this](https://help.github.com/articles/using-jekyll-with-pages/).

If you have Jekyll properly installed, you can then run

`bundle exec jekyll serve --baseurl ''`

from the command line and navigate to http://localhost:4000/ in your browser to
preview the current state of the website.


## Creating new pages

If you want to add new exercises, lecture notes, etc. you do this by creating a
[markdown file](http://daringfireball.net/projects/markdown/basics) in the
appropriate directory. Each markdown file needs to start with some information
that tells Jekyll what the page is. This is done using something called YAML,
and the standard YAML for a new exercise would look like this:

```
---
layout: exercise
topic: Topic group of exercise
title: Name of exercise
language: [R, Python, SQL]
---
```

This is placed at the very beginning of the markdown file and provides
information on what kind of content it is (e.g., exercise, page, etc.),
the title of the page, and what language it applies to.

The page should then be available at a url based on where the file is located
and what the file name is. So if you created a new exercise in the `exercises/`
folder called `my_awesome_exercise.md` it would be located at:

Locally: `http://localhost:4000/exercises/my_awesome_exercise`

After pushing to GitHub:
`https://yourusername.github.io/semester-biology/exercises/my_awesome_exercise`


## Acknowledgements

Development of this material is funded by the [National Science Foundation](http://nsf.gov/) as part of a [RUI Collaborative Research grant](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1556651).

## Grading Rubric ideas from:

https://www.researchgate.net/figure/Grading-rubric-for-DYOE-proposals_tbl2_5535069
https://www.researchgate.net/figure/Group-Participation-Rubric_tbl1_280151573
https://www.biologycorner.com/worksheets/participation_rubric.html
https://www.academia.edu/35123968/Grading_Rubric_for_Class_Participation
