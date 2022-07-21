---
layout: page
title: Syllabus
catalog: BIO XXX
semester: Fall 2022


professor: Dr. Luna L Sanchez Reyes
office: Science and Engineering Building 1
email: sanchez.reyes.luna@gmail.com
office_hours: By appointment and Monday, Wednesday, Friday, 10-noon.

professor2: Prof. Emily Jane McTavish
office2: Science and Engineering Building 1
email2: ejmctavish@ucmerced.edu
office_hours2: By appointment

schedule: ['Tuesday & Thursday, 10:30-11:45pm, Online']



---

## {{ site.title }}

{{ page.catalog }}, {{ page.semester }}

### Professor

#### {{ page.professor }}

Office: {{ page.office }}

Email:
[{{ page.email }}](mailto:{{ page.email }})

Office hours: {{ page.office_hours }}


#### {{ page.professor2}}

Office: {{ page.office2 }}

Email:
[{{ page.email2 }}](mailto:{{ page.email2 }})

Office hours: {{ page.office_hours2}}


### In-class Times & Location

{% for class in page.schedule %}
  {{ class }}
{% endfor %}


### Website

The syllabus and other relevant class information and resources will be posted
at [https://lunasare.github.io/data-science-research-biology/](https://lunasare.github.io/data-science-research-biology/).
Changes to the schedule will be posted to this site so please try to check it
periodically for updates.


### Course Communications

Email: [{{ page.email }}](mailto:{{ page.email }}), [{{ page.email2 }}](mailto:{{ page.email2 }})


### Suggested Texts

* Beckerman, A.P., Childs, D.Z. and Petchey, O.L., 2017. Getting started with R: an introduction for biologists. Oxford University Press.
* Wickham, H., & Grolemund, G., 2017. R for data science. O'Reilly. http://r4ds.had.co.nz/
* Cooper et al., 2017. A guide to Reproducible Code in Ecology and Evolution. https://goo.gl/iVkDb8


## Web resources

* [RStudio CheatSheets](https://www.rstudio.com/resources/cheatsheets/)
* [Coding club tutorials](https://ourcodingclub.github.io/tutorials/)
* [R tips by Dolph Schluter](https://www.zoology.ubc.ca/~schluter/R/)
* [Exploratory Data Analysis with R by Dylan Childs](http://dzchilds.github.io/aps-data-analysis-L1/)
* [Data Carpentry for Biologists](http://www.datacarpentry.org/semester-biology/)


### Course Description

This is a course-based undergraduate research experience (CURE) in using data science to address research questions of biological significance in ecology and evolution. The course will focus on bioinformatic and phylogenetic methods, using state-of-the-art computational tools and statistical skills to design appropriate analyses to describe and explain general patterns in the species distribution and evolutionary history of organisms. Special attention will be given to phylogenetic patterns of biodiversity and their basis in both ecological (dispersal, competition) and evolutionary (speciation, extinction) processes.
The course will be conducted seminar style and student-centered. Most of the reading will be drawn from recent primary literature.
The application of research methods using published data, computational tools, and best practices in reproducibility to address questions in ecology and evolution, will be an integral part of this course.
Students will communicate their results in written, oral and visual formats.


### Prerequisite Knowledge and Skills

Evolution


### Course Goals and Objectives

Students completing this course will be able to:

* Have an overview of the main concepts in macroecology
* Understand how ecological systems and assemblages have been shaped
* Infer and forecast how current environmental changes affect global biodiversity
* Apply fundamental data science skills to answer broad macroecology questions
* Write simple computer programs in R
* Understand how to organise, explore and visualise environmental data
* Reproduce analyses in ecology
* Organise and keep track of ecological projects using version control.


### Course Project

## Course Policies
