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

### Why do we use functions in programming? (15 min)

#### Discussion in small groups (5 min)

- Discuss in small groups: Based on your experience with coding so far and after watching the [introductory videos]({{ }}/readings/before-reusable-code-1), discuss in small groups how creating your own functions would improve your coding workflow.

- Individually, work on your Rmd file:
  - Write a second level subtitle for the introductory section.
  - List and justify three reasons why using functions is useful in data science.

#### Discussion in full (10 min)

- How does creating your own functions will improve your code?

- Makes code more understandable:
  - Code is shorter, easier to remember
  - Code is more organized for you and others, so it is easier to read
  - Code is grouped conceptually, easier to understand
  - Code is more manageable, invites you to be intentional on the code that you are writing
  - Allows to be more in control of the outputs
- Makes code reusable:
  - It allows reusing code for other parts of a project or a future project
  - It is less error prone than copy-pasting code
    - If it occurs in more than one place, it will eventually be wrong somewhere.
  - It is more efficient than copy-pasting code
    - Functions are written to be reusable.


### Writing functions (10 min)

- In this lesson we will use the concept of "mass" to learn how to create functions.
- Mass describes the density and type of atoms in any given object.
- The SI unit of mass is the kilogram (kg), though mass can also be measured in grams (gr), ounces (oz), and pounds (lb).
- The mass of an object will never change, but the weight of an item can change based on its location.
- Weight is the measure of the force of gravity on an object:

![https://spaceplace.nasa.gov/planets-weight/en/](https://spaceplace.nasa.gov/review/planets-weight/planets-weight3.en.png)

<!-- ![https://sciencenotes.org/mass-vs-weight-the-difference-between-mass-and-weight/](https://sciencenotes.org/wp-content/uploads/2020/08/Mass-vs-Weight.jpg) -->

<!-- [https://www.reagent.co.uk/whats-the-difference-between-volume-mass-weight/](https://www.reagent.co.uk/wp-content/uploads/weight-and-mass-illustration-1.png) -->

- Formulas to convert between different units of mass:

Pounds to kilograms   |  Kilograms to pounds
:--------------------:|:---------------------:
![](https://www.wikihow.com/images/thumb/8/83/Convert-Pounds-to-Kilograms-Step-2-Version-6.jpg/aid1718006-v4-728px-Convert-Pounds-to-Kilograms-Step-2-Version-6.jpg.webp) | ![](https://www.wikihow.com/images/thumb/0/00/Convert-Pounds-to-Kilograms-Step-5-Version-2.jpg/aid1718006-v4-728px-Convert-Pounds-to-Kilograms-Step-5-Version-2.jpg.webp)
![](https://www.wikihow.com/images/thumb/5/53/Convert-Pounds-to-Kilograms-Step-1-Version-8.jpg/aid1718006-v4-728px-Convert-Pounds-to-Kilograms-Step-1-Version-8.jpg.webp) | ![](https://www.wikihow.com/images/thumb/0/0c/Convert-Pounds-to-Kilograms-Step-4-Version-2.jpg/aid1718006-v4-728px-Convert-Pounds-to-Kilograms-Step-4-Version-2.jpg.webp)



#### Exercise 1: [Converting between units of mass]({{ site.baseurl }}/exercises/Functions-writing-functions-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-writing-functions-R -->

---

### Using and modifying functions (10 min)

- The length of an organism is strongly correlated with its body
mass.
- Scientists use this correlation to estimate the mass of an organism
when we only know its length.
- This [allometric](https://www.nature.com/scitable/knowledge/library/allometry-the-study-of-biological-scaling-13228439/#:~:text=Allometry%2C%20in%20its%20broadest%20sense,as%20both%20grow%20during%20development.) relationship takes the form of _mass equals to parameter "a" multiplied by "length" elevated to the power of parameter "b"_:

> mass = a * length^b

- Parameters `a` and `b` vary among biological groups.
- This formula is used to estimate the mass of organisms for which we only have length measurememts. For example:
  - trees, we cannot weigh them unless we unroot them,
  - extinct creatures such as dinosaurs, as we cannot get the living weight of something that is fossilized.

- The following function uses the formula `mass = a * length^b` to estimate the mass of an organisms belonging to *Theropoda*
dinosaurs in kg, based on its
  length in meters and the set of parameter values `a` and `b` that have been estimated for that biological group, `a = 0.73` and `b = 3.63`, by [Seebacher (2001)](http://www.jstor.org/stable/4524171)).
  - Take 3 min to type the function in:
  ```r
  get_mass_from_length_theropoda <- function(length){
      mass <- 0.73 * length ^ 3.63
      return(mass)
    }
    ```

#### Exercise 2: [The weight of dinosaurs]({{ site.baseurl }}/exercises/Functions-use-and-modify-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-use-and-modify-R/ -->

---

### Defining argument values in a Function (10 min)

- In the previous exercise, you created the function `get_mass_from_length()` which is a more flexible form of `get_mass_from_length_theropoda()`, by allowing `a` and `b` to be passed as arguments.
- Still, for some organisms we don't have specific values of `a` and `b`. In this case, we have to use values of `a` and `b` that can be applied generally.
- We can set general values as default values for some or all arguments in any function that we are creating.

#### Exercise 3: [Setting default values for arguments]({{ site.baseurl }}/exercises/Functions-default-arguments-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-default-arguments-R -->

---

### Combining functions (10 min)

- The metric system is the standard approach used in scientific practice.
- To communicate scientific results to a broader audience, it might be more impactful to use different units (at least in some countries).

#### Exercise 4: [Converting between units]({{ site.baseurl }}/exercises/Functions-combining-functions-R)

<!-- https://datacarpentry.org/semester-biology/exercises/Functions-combining-functions-R -->



---
---

## Day 2: Making choices in R

<!-- #### Exercise: []({{ site.baseurl }}/) -->
