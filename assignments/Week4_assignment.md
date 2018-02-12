---
layout: page
element: assignment
title: 'Manipulating data II'
language: R
---

#### Learning Objectives

> Following this assignment students should be able to:
>
>  - Read files in R
> - Understand data manipulation functions in R
> - Summarise dataframes
> - Write csv files
> - Create plots with lattice and ggplot

****
{% include assignment.html %}

## Data basics

For this exercise, we are going to use some of the data provided in the paper *"Root, H. T., Verschuyl, J., Stokely, T., Hammond, P., Scherr, M. A. and Betts, M. G. (2017), Plant diversity enhances moth diversity in an intensive forest management experiment. Ecol Appl, 27: 134–142."*

Using a two-year manipulative experiment, Root et al. were interested in studying
how a gradient in intensive forest management (from light to intensive) affects both moth species richness and abundances. They have placed the data file on the Dryad repository:

*Root HT, Verschuyl J, Stokely T, Hammond P, Scherr MA, Betts MG (2016) Data from: Plant diversity enhances moth diversity in an intensive forest management experiment. Dryad Digital Repository. https://doi.org/10.5061/dryad.47200*

1. Download this data and copy the files `MothCommunities2012.csv`, `MothCommunities2013.csv` and `PlantCommunity.csv` into the `data` folder.

2. Open the Rproj file in Rstudio

3. Open the file `0_cleaning_data.R` and import both Moth communities files using the functions `read_csv()` or `read.csv()` Name the objects `comu_2012` and `comu_2013`

4. Use `str()` to show the structure of the data frame and its individual columns. Print out the first few rows of the data using the function `head()`.

5. The following code calculates the total moth richness and abundance for the gradient in intensive forest management in each study block.  

```r
comu_2012_dt<-comu_2012 %>%
  group_by(block, treatment) %>%
  summarise(Total_sp=sum(richness,na.rm=TRUE),
            Total_abundance=sum(totabund,na.rm=TRUE)) %>%
  mutate(year=2012)
```

* Add a comment to each line of the code explaining what it does
* Using the same code, create a new object called `comu_2013_dt` using the 2013 treatment data

6. Comment in the code how the object `Comunitity_total` was obtained, and check the dimensions of the object or data frame using the function `dim()`

7. Write a csv file into the `outputs` folder called `mothComunity_2012_2013.csv` using the function `write.csv()`

8. Open the `1_Exploring_data.R` file, read the data as it is written on the file.

9. Using the code in the task 5, calculate the total abundance of per moths species per treatment using the object `Sp_values`.

10. The following code filters the total abundance of the *Agrotis vancouverensis* species in each forest management treatment

```r
Sp_Abun_table %>%
  filter(Species=="Agrotis.vancouverensis")
```

* Using the same code, filter the total abundance for the following species: *"Drasteria divergens, Hydriomena manzanita, Xanthorhoe defensaria"*

* Contrast the abundances of the above species with those shown in the original paper [here](http://onlinelibrary.wiley.com/store/10.1002/eap.1426/asset/supinfo/eap1426-sup-0001-AppendixS1.docx?v=1&s=ba090f8047a359acf1dfdfc5672fe3654f2ae8f8)

11. Change the class of the `year` variable as a factor, using the function `as.factor()`

12. The following code plots the number of species in four forest management treatments

```r
ggplot(Total_comun, aes(y = Total_sp, x = treatment, fill=year)) +
  geom_boxplot() +
  geom_jitter(aes(shape = year,colour=year), width = 0.1)
```

* Using this code, create a plot for the total abundance in the four forest management
* Print the number of species and the abundance plots in a pdf using the function `pdf()` and save the files into the `figs` folder
* Contrast the total abundance figure with the figure 2D of the original paper (see paper [here](http://onlinelibrary.wiley.com/doi/10.1002/eap.1426/full){:target="_blank"})


### *Want a challenge?*

1. Check the R file `0_reshaping_community_data.R` into the Rscripts folder and comment the code explaining what it does

2. Try to reproduce the plot in the task 12 using other plot functions such as `boxplot()` or `bwplot()` from the lattice package. You might need to use other functions such as `stripchart()` to display the points on the boxplots.
