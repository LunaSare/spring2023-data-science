---
layout: page
element: lecture
title: 'Reusing code - Creating functions'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

## Day 1: Functions in R

> **Learning Objectives**
>
> This week, students will:
> - learn the parts of a function
>
> **Practice Objectives**
> - Reading and writing tables
> - Reading and plotting phylogenies
>
<!-- > **Non Objectives**
> -
> -  
> -->


### Setup your RStudio project (5 min)

- 🎗️ Structuring your files into a _project_ is a best practice for good data science!
- Open your _RStudio project_ for the class; I called mine "**fall-2022**".
- Open a new file, name it "**functions.Rmd**", and save it to your "**documents**" folder.

### Why do we use functions in programming? (10 min)

#### Exercise 1:

In your Rmd file:

- Write a secon level subtitle for the introductory section.
- Discuss and list three reasons why using functions is useful in data science. 

### Writing functions (10 min)

- In this lesson we will use mass to learn how to create functions.
- Mass describes the density and type of atoms in any given object.
- The SI unit of mass is the kilogram (kg), though mass can also be measured in grams (gr), ounces (oz), and pounds (lb).
- The mass of an object will never change, but the weight of an item can change based on its location.
- Weight is the measure of the force of gravity on an object:

![https://spaceplace.nasa.gov/planets-weight/en/](https://spaceplace.nasa.gov/review/planets-weight/planets-weight3.en.png)

![https://sciencenotes.org/mass-vs-weight-the-difference-between-mass-and-weight/](https://sciencenotes.org/wp-content/uploads/2020/08/Mass-vs-Weight.jpg)

<!-- [https://www.reagent.co.uk/whats-the-difference-between-volume-mass-weight/](https://www.reagent.co.uk/wp-content/uploads/weight-and-mass-illustration-1.png) -->

- Mass unit conversion formulas
  - Pounds to kilograms
  ![](https://www.wikihow.com/images/thumb/8/83/Convert-Pounds-to-Kilograms-Step-2-Version-6.jpg/aid1718006-v4-728px-Convert-Pounds-to-Kilograms-Step-2-Version-6.jpg.webp)
  - Kilograms to pounds
  ![](https://www.wikihow.com/images/thumb/0/00/Convert-Pounds-to-Kilograms-Step-5-Version-2.jpg/aid1718006-v4-728px-Convert-Pounds-to-Kilograms-Step-5-Version-2.jpg.webp)


#### Exercise 2: [Inputs and outputs]({{ site.baseurl }}/exercises/Functions-writing-functions-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-writing-functions-R -->

---

### Using and modifying functions (10 min)

- The length of an organism is typically strongly correlated with its body
mass. This is useful because it allows us to estimate the mass of an organism
even if we only know its length. This relationship generally takes the form:

> mass = a * length^b

- Where the parameters `a` and `b` vary among groups. This allometric approach is
regularly used to estimate the mass of dinosaurs since we cannot weigh something
that is only preserved as bones.

#### Exercise 3: [Use and Modify Functions]({{ site.baseurl }}/exercises/Functions-use-and-modify-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-use-and-modify-R/ -->

---

### Arguments (10 min)

- Allowing `a` and `b` to be passed as arguments to `get_mass_from_length()` made the function more flexible, but for some types of dinosaurs we don't have specific values of `a` and `b` and so we have to use general values that can be applied to a number of different species.

#### Exercise 4: [Default Arguments]({{ site.baseurl }}/exercises/Functions-default-arguments-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-default-arguments-R -->

---

### Combining functions (10 min)

- Measuring things using the metric system is the standard approach for scientists, but when communicating your results more broadly it may be useful to use different units (at least in some countries).

#### Exercise 5: [Using Functions within Functions]({{ site.baseurl }}/exercises/Functions-combining-functions-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-combining-functions-R -->



---
---

## Day 2: Making choices in R

<!-- #### Exercise: []({{ site.baseurl }}/) -->
