# Project structure assignment

* Class: Global Ecology and Biogeography

* Aim: Understand how to properly structure a typical R project

Created by Susy Echeverría-Londoño
@susyelo

# Code structure
``01_Transform_data.R ``---> R code to clean and subset the raw data1

``02_Exploratory_analysis.R``--> R code to summarise and plot data

``data/`` --> Raw data folder

``data/30_Jan_18_Raw_graz.csv`` --> data file showing the effect of different grazing treatments on fruit and root size

``outputs/`` --> Temporal and intermediate output file folders

``outputs/graz_sub1.csv`` --> Subset data with Fruit  > 80 or Root < 6

``figs/`` --> Plots folders

``figs/Graz_Fruit_Root.pdf`` --> Plot showing the relation between fruit and root size among different grazing treatments

``figs/FruitSize_perGrazing.pdf`` --> Plot showing the distribution of fruit size per grazing treatment
