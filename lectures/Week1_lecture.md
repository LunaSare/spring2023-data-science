---
layout: page
element: lecture
title: 'The Data Life Cycle'
language: Excel
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

> **Learning Objectives**
>
> This week, students will be able to:
>
> - list the elements of the data life cycle
> - articulate the relevance of good data management for scientific research
> - identify the differences between good and bad data entry and management
> - recognize bad data organization and why it is problematic for research
> - implement quality assurance and control measures for data entry in spreadsheets using excel
> - list current measures used by the scientific community in ecology and evolution to preserve data long term

## Day 1
### Welcome!

* Introductions
* Why are you taking this class? What do you expect from it?

### Logistics survey:

- Take 5 min to complete the survey on this [Google Form](https://docs.google.com/forms/d/e/1FAIpQLSfXzFNSegtfIuAPTK9LEwSmYKhPk_Fs8GPFXRjia5DNZaJTtg/viewform).

### Syllabus overview

* Go through the syllabus
* Do you have any questions about it?
* Choose grading scheme
* Choose office hours

### Schedule overview

The schedule shows a list of topics that will be covered each week of the course.

The schedule reflects a flipped course structure, aka minimal lecture and maximal
student practice.
Each row corresponds to a different topic, and organizes links for pre-class
activities, in-class activities and homework.

* Before Class
  - Prepare: Readings or activities to dive into the topic before class

* Lectures/live-coding
  - Lecture notes used in class
	- Not expected to be read in advance; may be useful for review
	- May not match lecture precisely

* In-class activities
  - Individually or jointly
  - A challenge that will support the construction of a mental model of your own
	- May require additional work time after class

* After-class
  - Strengthen: Exercises to strengthen and evaluate concepts discussed during class

### The importance of data for research: Exercises

1. Data is used in all areas of human activity. Tim Stobierski writes about business analytics and the importance of knowing the data life cycle.
  - Take 5-10 min to read [8 Steps in the Data Life Cycle](https://online.hbs.edu/blog/post/data-life-cycle), from Harvard business school.  
  - Answer the next two questions interactively on this [mentimeter](https://www.menti.com/al5kemcp5gtc):
    - What is the importance of the data life cycle?
    - How is it related to research?

2. [DataONE](https://www.dataone.org/) is an organization dedicated to making earth data universally accessible and FAIR (Findable, Accessible, Interoperable, and Reusable).
  - Take 10 min to read [The DataONE Life Cycle](https://www.dataone.org/data-life-cycle).
  If the link is not available, a screen shot of the text is available [here]({{ site.baseurl }}/dataone-data-life-cycle).
  - Answer the following questions interactively on this [mentimeter](https://www.menti.com/al7r43cgidhm):
    - How many steps are there in the DataOne life cycle?
    - Identify steps that are different between the previous and this data life cycle.

3. Look at [Figure 1]({{ site.baseurl }}/f1000res-2017-paper) from research paper [Best practice data life cycle approaches for the life sciences](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6069748/).
    - Take 5 min to identify steps that are similar across the three data life cycle
    approaches you have reviewed so far. Write the steps that you consider similar
     on this [mentimeter](https://www.menti.com/ald679dwg3j3).


### In class group activity

- Follow instructions on this [jamboard](https://jamboard.google.com/d/1T7MKWvtgBZuLa_LjGg02GAjySPQtHj1iwf9sdupfkoU/viewer?f=0).

### Homework

- Create your own data life cycle on this [jamboard](https://jamboard.google.com/d/1giFAdjGzPK9vMM8aLuGP5KwF_FzyyT5hJ3eoPslS3rU/viewer?f=1).

**A minute feedback**

- Provide some quick feedback for this session [here](https://docs.google.com/forms/d/e/1FAIpQLSeRETx27OK9PJlTd8djqySqrRa5ZMDTiUizF_vXuau82nASqQ/viewform)


---
---

## Day 2

### Reading discussion

- Before class, read the text [Scientists Losing Data at a Rapid Rate](http://www.nature.com/news/scientists-losing-data-at-a-rapid-rate-1.14416)

- Questions:
  - Which research paper are they referring to in the text? **Hint**: take a look at the references.
  - According to the research paper, how much does data availability drop per year?
  - Contacted researchers say the data still exists, why is it considered lost?
  - What percentage of contacted researchers answered back?
  - How can authors organize and preserve data used in research papers?
  - Is willingness to share data increasing or decreasing among researchers?

- On the role of journals and data repositories:
  - "Some types of data, such as DNA sequences, **must** be submitted to a community-endorsed public repository"
    - data repository websites (GenBank, GBIF, Dryad, Zenodo)
  - "For other kinds of data, where public repositories are less developed, this is **"strongly recommended"**."

- What are some differences between the Nature text you just read and the research paper they talk about (the Vines _et al_. paper)?
- What is a research paper?


### Group exercise

- Work with your neighbor.
- Skim the paper [Vines _et al_. (2014)](https://www.sciencedirect.com/science/article/pii/S0960982213014000?via%3Dihub)
  - What are the main sections of a research paper?
  - Identify the following [parts on the abstract](https://services.unimelb.edu.au/__data/assets/pdf_file/0007/471274/Writing_an_Abstract_Update_051112.pdf):
    1. Reason for writing: What is the importance of the research?
    1. Problem: What problem does this work attempt to solve?
    1. Methodology: Includes specific models or approaches used in the larger study.
    1. Results:  Include specific data that indicates the results of the project
    1. Implications: How does this work add to the body of knowledge on the topic?


### Tidy Data Principles

- What: Tidy data is data that is well designed for processing with computers
- Why: Creating tidy data as you collect it will make it much easier to analyze it later
- Joint exercise: [Improving Messy Data]({{ site.baseurl }}/exercises/Tidy-data-improving-messy-data-SQL)
  - Goal: look at some messy data and think about what makes it messy and what we could do to improve it:
    - make it a (narrow) rectangle
    - one cell one value
    - don't confuse the computer
    - be clear and consistent
    - Use one table for each category of data
    - Export data into easy to read formats

### Steps for data entry

- What's the first thing to do when you are ready to enter/collect data?
  - Planning
- Where to enter data?
  - Software
- Data quality assurance VS. data quality control
  - Read [Quality Assurance and Control](http://www.datacarpentry.org/spreadsheet-ecology-lesson/04-quality-control) to answer the following question _What is the difference between quality assurance and quality control?_
- How to assure data quality?
  - Do individual [Exercise - Data Entry Validation in Excel]({{ site.baseurl }}/exercises/Qaqc-data-entry-validation-in-excel-SQL/).

  <!-- - Demo data validation in excel using this data file [figshare.com/files/2252083](https://ndownloader.figshare.com/files/2252083). Students **download** it to their computer, too, and follow along. -->

- Important steps for quality control
  - Saving a copy of the original raw data is key in this step.
  - Sorting to check for invalid data, demo
  <!-- : [Exercise 1](https://datacarpentry.org/spreadsheet-ecology-lesson/04-quality-control/#exercise) -->
    - Ensure that data sorting is expanded to the whole data table, so data is not corrupted.
  - Conditional formatting to scan data for outliers, Demo
   <!-- [Exercise 2](https://datacarpentry.org/spreadsheet-ecology-lesson/04-quality-control/#exercise-1) -->
    - Use this cautiously, it might corrupt the data.

### Best practices for data collection

- What step of the data life cycle we addressed today?
  - collection
  - assurance
  - processing
  - management

### A minute feedback

- Please provide some quick feedback for this second session of the course [here](https://docs.google.com/forms/d/e/1FAIpQLSebNcnZqOBS8eUjI2V6bMyjHBQIukRZLY4PuMTh9ERjJXJBUw/viewform).

### Homework

- Complete homework [activities]({{ site.baseurl}}/assignments/week1_activities/).
