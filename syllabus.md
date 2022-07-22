---
layout: page
title: Syllabus
catalog: BIO 197
semester: Fall 2022


professor: Dr. Luna L Sanchez Reyes
office: Science and Engineering Building 1
email: sanchez.reyes.luna@gmail.com
office_hours: By appointment and Monday, Wednesday, Friday, 10-noon.

professor2: Prof. Emily Jane McTavish
office2: Science and Engineering Building 1
email2: ejmctavish@ucmerced.edu
office_hours2: By appointment

schedule: ['Tuesday & Thursday, 2:30-4pm, Online']
---


## {{ page.catalog }}, {{ page.semester }}

## Instructors

<i>{{ page.professor }}</i>

**Office**: {{ page.office }}

**Email**:
[{{ page.email }}](mailto:{{ page.email }})

**Office hours**: {{ page.office_hours }}


<i>{{ page.professor2}}</i>

**Office**: {{ page.office2 }}

**Email**:
[{{ page.email2 }}](mailto:{{ page.email2 }})

**Office hours**: {{ page.office_hours2}}


## In-class Times & Location

{% for class in page.schedule %}
  {{ class }}
{% endfor %}

## Prerequisite Knowledge and Skills

Evolution

## Schedule

The schedule and all relevant class information and resources will be posted
on the [course website](https://lunasare.github.io/data-science-research-biology/schedule).
Check the website periodically for updates.


## Course Communications

Email: [{{ page.email }}](mailto:{{ page.email }}), [{{ page.email2 }}](mailto:{{ page.email2 }})


## Suggested Texts

* Beckerman, A.P., Childs, D.Z. and Petchey, O.L., 2017. Getting started with R: an introduction for biologists. Oxford University Press.
* Wickham, H., & Grolemund, G., 2017. R for data science. O'Reilly. http://r4ds.had.co.nz/
* Cooper et al., 2017. A guide to Reproducible Code in Ecology and Evolution. https://goo.gl/iVkDb8


## Web resources

* [RStudio CheatSheets](https://www.rstudio.com/resources/cheatsheets/)
* [Coding club tutorials](https://ourcodingclub.github.io/tutorials/)
* [R tips by Dolph Schluter](https://www.zoology.ubc.ca/~schluter/R/)
* [Exploratory Data Analysis with R by Dylan Childs](http://dzchilds.github.io/aps-data-analysis-L1/)
* [Data Carpentry for Biologists](http://www.datacarpentry.org/semester-biology/)


## Course Description

This is a course-based undergraduate research experience (CURE) in using data science to address research questions of biological significance in ecology and evolution. The course will focus on bioinformatic and phylogenetic methods, using state-of-the-art computational tools and statistical skills to design appropriate analyses to describe and explain general patterns in the species distribution and evolutionary history of organisms. Special attention will be given to phylogenetic patterns of biodiversity and their basis in both ecological (dispersal, competition) and evolutionary (speciation, extinction) processes.
The course will be conducted seminar style and student-centered. Most of the reading will be drawn from recent primary literature.
The application of research methods using published data, computational tools, and best practices in reproducibility to address questions in ecology and evolution, will be an integral part of this course.
Students will communicate their results in written, oral and visual formats.


## Course Goals and Learning Objectives

Goals

* Data and how to do science with it
* Data entry -> Data storage -> Data manipulation -> Data visualization
* Not statistics

Learning Objectives

Students completing this course will be able to:

* Have an overview of the main concepts in macroecology
* Understand how ecological systems and assemblages have been shaped
* Infer and forecast how current environmental changes affect global biodiversity
* Apply fundamental data science skills to answer broad macroecology questions
* Write simple computer programs in R
* Understand how to organise, explore and visualise environmental data
* Reproduce analyses in ecology
* Organise and keep track of ecological projects using version control.


## Teaching methods

* Flipped classroom: I do, we do, you do
  - You don't learn how to ride a bike just by listening to someone talk about it and the same is true for data science
* Peer instruction
  - Interact with each other during in-class activities and (if possible) when doing homework
  - You are at least as likely to learn from your peers as from the instructor

## A flipped course structure

* Homework before class: readings and exercises that will prepare you for class.
* Lecture:
  - I will lecture while reviewing homework together, and demo the concept using live coding
* In-class activities
  - We will work on an associated exercise together in class
  - Then, you will work on an exercise in class
* Homework after class: You will work on additional exercises and your project on your own (both in & out of class)

* Turn-in work: Related to your research project

* Optional homework and in-class activities: adds points to final(?) grades

## Projects

## Grading checklist

{% include_relative materials/turn_in_checklist.md %}

## Course Policies

We follow the [Carpentries code of conduct](https://docs.carpentries.org/topic_folders/policies/code-of-conduct.html).
