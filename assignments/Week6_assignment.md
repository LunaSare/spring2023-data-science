---
layout: page
element: assignment
title: 'Finding Data'
language: R
---


** Activity: The amniote life-history database**

> Following this assignment students should be able to:
>
> - Download biological data from GBIF
> - Explore data frames
> - Manipulate data frames
> - Visualise biological data
> - Create reproducible reports with rmatkdown

{% include assignment.html %}

Using the [amniote life-history database](http://www.esapubs.org/archive/ecol/E096/269/#data),

1. State a question that explore the effect of body size on lifestyle and productivity in amniotes (in any group and at any level)
2. Create a reproducible document in your favorite format (.pdf, .html or .md) that includes
 * Download and read data
 * Data exploration and visualisation
 * Relationship between variables
 * Distribution of values of a specific variable among different groups
3. Select two species of reptiles and download occurrence dataset from GBIF
4. Extract values of Annual mean temperature and Precipitation for each species
5. Plot the occurrences of both species on a map
6. Compare the temperature and precipitation value distribution of both species using histograms or boxplots


## Macroecology projects


### Journals

1. Global Ecology and Biogeography
2. Ecography
3. Journal of Biogeography
4. Diversity and Distributions
5. Ecology
6. The American Naturalist
7. Oikos
8. Oecology
9. Ecology Letters
10. Trends in Ecology and Evolution

---

** Activity: Lizard habitats & intro to spatial analysis**

#### Learning Objectives

> Following this assignment students should be able to:
>
> - Download global climatic data
> - Download geographic occurrence data for a particular species
> - Manipulate rasters
> - Create spatial point dataframes
> - Plot rasters and occurrences

****
{% include assignment.html %}

In this assignment, we are going to compare the climatic conditions of the habitats of two species of lizards in Australia, *Ctenotus piankai* and *Calyptotis scutirostrum*.

![](http://www.arod.com.au/arod/pictures/squamata/scincidae/ctenotus/Ctenotus-piankai-thumb.jpg)

![](http://www.arod.com.au/arod/pictures/squamata/scincidae/calyptotis/Calyptotis-scutirostrum-thumb.jpg)

Before you start the assignment, accept the assignment repository [here](https://classroom.github.com/a/GWrG-lOD){:target="_blank"} and clone it to your local machine. Make sure to commit and push any significant change.

Using the Intro to [Spatial Analysis tutorial]({{ site.baseurl }}/materials/06_Intro_Spatial_Analysis/Spatial_analysis.html){:target="_blank"} as reference,

1. Download the global climatic data from the Worldclim database using a resolution of 10m.
2. Download the geographic occurrence data from the two species of lizards from GBIF.
3. Using the mean annual temperature (bio1) and mean annual precipitation (bio12) rasters, calculate the Global Net Primary Production (NPP) using the [Miami model](http://wergosum.com/miami-npp/){:target="_blank"}
4. Extract the mean annual temperature, precipitation and net primary productivity values for each occurrence location in each lizard species. Before extracting the values, make sure to filter any NAs, zeros and duplicates from your lat and lon coordinates.
5. Plot a map of NPP in Australia displaying the occurrences of both lizards species in different colours (hint! use the argument `add=TRUE` to add a new layer to your plot).
* *You can use the function `drawExtent()` to extract the extent of Australia. However, you will need to write the values in a separate object, and then comment the line once you used the function. **Using only the `drawExtent()` will affect the reproducibility of your code***
6. Plot the distribution of the temperature and precipitation for each of the species of lizards.
7. Compare the distribution of NPP values for both lizard species using only one plot (check [here](https://stackoverflow.com/questions/3541713/how-to-plot-two-histograms-together-in-r){:target="_blank"} for some examples)

### *Want a challenge?*
* Instead of using histograms to compare the distribution of NPP, precipitation and temperature for both lizard species, use [violin plots](http://www.sthda.com/english/wiki/ggplot2-violin-plot-quick-start-guide-r-software-and-data-visualization){:target="_blank"}
