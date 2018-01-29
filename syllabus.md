---
layout: page
title: Syllabus
catalog: BIOL 328
semester: Fall 2018


professor: Prof. Andrew J. Kerkhoff
office: Higley Hall 301
email: kerkhoffa@kenyon.edu
office_hours:

professor2: Dr. Susy Echeverría-Londoño
office2: Higley Hall 203
email2: echeverrialondono1@kenyon.edu
office_hours1:

schedule: ['Fridays, 1:15-4:00pm, Higley Hall, Kerkhoff Lab']



---

## {{ site.title }}

{{ page.catalog }}, {{ page.semester }}

### Professor

{{ page.professor }}

Office: {{ page.office }}

Email:
[{{ page.email }}](mailto:{{ page.email }})

Times: {{ page.office_hours }}


{{ page.professor2}}

Office: {{ page.office2 }}

Email:
[{{ page.email2 }}](mailto:{{ page.email2 }})

Times: {{ page.office_hours }}


### Times & Location

{% for class in page.schedule %}
  {{ class }}
{% endfor %}


### Website

The syllabus and other relevant class information and resources will be posted
at [{{ site.url}}]({{ site.baseurl }}/).
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

This is a comprehensive course in the large-scale history and dynamics of the biosphere. The course will focus on ecoinformatics and macroecology, using computational approaches to describe and explain general patterns in the distribution, abundance and functioning of organisms. Special attention will be given to geographical patterns of biodiversity and their basis in both ecological (dispersal, competition) and evolutionary (speciation, extinction) processes. The course will also examine the large-scale interactions between humans and the rest of the biosphere. The course will be conducted seminar style, with most of the reading will be drawn from recent primary literature. The development of research methods using published data, computational tools and model output to address new ecological questions at continental to global scales will be an integral part of this course. This counts as an upper-level lecture in environmental biology.


### Prerequisite Knowledge and Skills

BIOL 228, 241, 251, 253, or 261 or permission of instructor


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
