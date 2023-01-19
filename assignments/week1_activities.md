---
layout: page
element: assignment
title: 'The Data Life Cycle'
pagetype: activities
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
language: Excel
exercises: ['Improving Messy Data', 'Data entry validation in Excel']
---



## Day 1: The data life cycle


- Create your own data life cycle on this [jamboard](https://jamboard.google.com/d/1giFAdjGzPK9vMM8aLuGP5KwF_FzyyT5hJ3eoPslS3rU/viewer?f=1).

---
---

## Day 2: Messy Data

> **Instructions**
>
> - (2 min) Go in small groups (breakout rooms) of 2-3 people.
> - (10 min) Half of the groups will do Activity 1 (small mammals) and the other half will do Activity 2 (birds).
> - Register your answers in the [collaborative document](https://jamboard.google.com/d/1R2BrILLK9K6IPD6O7kBYrdao8-Sd5o82oPnbcGKeIQc/viewer?f=5).
> - (10 min) Discuss answers with the whole group.
> - (3 min) Start doing Activity 3 individually.


---

### Activity 1
### Improving Messy Data: Mammals data set
<!--
exercise from https://github.com/datacarpentry/semester-biology/blob/main/exercises/Tidy-data-improving-messy-data-SQL.md
-->

A lot of real data isn't very tidy, mostly because most scientists aren't taught
about how to structure their data in a way that is easy to analyze.

[Download this untidy version](https://ndownloader.figshare.com/files/24469424)
of some of the Portal Project Teaching Database data, which includes information on the site, date,
species identification, weight and sampling plot (within the site) for some small mammals.

Think about what could be improved about this data and [write down answers](https://jamboard.google.com/d/1R2BrILLK9K6IPD6O7kBYrdao8-Sd5o82oPnbcGKeIQc/viewer?f=5) to the following questions:

1.   Describe five things about this data that are not tidy and how you could
     fix each of those issues.

2.   Could this data easily be imported into a programming language or a
     database in its current form?

3.   Do you think it's a good idea to enter the data like this and clean it up
     later, or to have a good data structure for analysis by the time data is
     being entered? Why?

---

### Activity 2
### Improving Messy Data: Birds data set
<!--
exercise from https://github.com/ericlind/data-mgmt-4-biologists/blob/gh-pages/exercises/Improving-messy-data.md
-->

MS Excel is a _visual_ data medium--a spreadsheet. People naturally
use the variety of visually oriented tools available, as well as their own intuition of
how to organize data, when digitizing field notes or data forms into Excel.

This visual intuition breaks down when the data captured
in the spreadsheet need to be accessed by data software for summary or
analysis. Things people can gloss over without losing meaning
become serious impediments to understanding for most software.
Thus the challenge for the data
manager inside each biologist is to think like a computer when
handling data.

Imagine you have been asked to help out a colleague, a well-trained
birder who has been sampling some of Minnesota's [Wildlife Management Areas (WMA)](http://www.dnr.state.mn.us/wmas/index.html).
Download the [bird dataset](https://ericlind.github.io/data-mgmt-4-biologists/data/bird-data.xlsx)
containing some of data from two years of this survey work. Note that there are multiple tabs in this
spreadsheet. Write down your answers in the [collaborative document](https://jamboard.google.com/d/1R2BrILLK9K6IPD6O7kBYrdao8-Sd5o82oPnbcGKeIQc/viewer?f=5).

1. Find the mean and variance of the number of birds observed _per species_
for each WMA (a) in each year and (b) across years.

2. Think about what could be improved about this data. With a partner
or in a small group, identify five things about this data that cause
 problems when trying to summarize or analyze these data.

	What would you do to fix each of those issues?

3. Evidently between the 2016 and 2017 field season, your birder colleague
heard something about long versus wide data and switched up the data entry.
Do you prefer one or the other approach? How would you combine the two?

---

### Activity 3: Extra
<!--
exercise from https://github.com/ericlind/data-mgmt-4-biologists/blob/gh-pages/exercises/Data-entry-validation-in-excel.md
-->

Watch the video ["Data validation in Excel"](https://www.youtube.com/watch?v=nMxl1_NAcxc).

For additional tips, read the lesson ["Quality Assurance and Control in Excel"](https://datacarpentry.org/spreadsheet-ecology-lesson/04-quality-control/).

Refer to the [bird dataset](https://ericlind.github.io/data-mgmt-4-biologists/data/bird-data.xlsx) about
which your colleague asked for assistance.

You decide to create a new data pipeline from scratch for the 2018
field season. Create a spreadsheet in Excel for data entry.

Be sure to use the data validation criteria to prevent some of the
challenges you identified with the data earlier. The goal is
to prevent obviously wrong values from being entered, and
to create homogenous data columns.

Some examples of things to try:

1. Year must be an integer with a value in the study period.
2. Site should be one of the WMAs.
3. Species should be one of the identified list.
4. Dates should be standardized, and units should be specified.

Save this file as `yourname_WMA_bird_data_entry.xlsx`.
