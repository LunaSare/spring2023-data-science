---
layout: exercise
topic: Functions
title: A function for the Portal data set
language: R
---


1. If [surveys.csv](https://ndownloader.figshare.com/files/2292172), [species.csv](https://ndownloader.figshare.com/files/3299483), and [plots.csv](https://ndownloader.figshare.com/files/3299474) are not available in your workspace download them, and load them into R using `read.csv()`.
2. Combine the `surveys` and `species` tables into a single data frame.
3. Write a function that:
    * Takes three arguments - a data frame (the combined table created before), a `genus` name, and a `species` name,
    * Uses functions from the `dplyr` package to produce a data frame with two columns: `year` and `count`, where `count` is the number of individuals (i.e., the number of rows) for the species indicated by `genus` and `species` in that `year`,
    * Returns the resulting data frame. Note that this data frame is a time series by year.
3. Use your function to get the data frame of time series by year for the `genus` _Dipodomys_ and the `species` _merriami_ and then make a graph of this time series using `ggplot` that has `year` on the x axis, `count` on the y axis, and displays the data as points.
4. Use your function to get the data frame time series by year for the `genus` _Chaetodipus_ and `species` _penicillatus_ and then make a graph of this time-series using `ggplot` that has `year` on the x axis, `count` on the y axis, and displays the data as blue points (with size = 1) connected by blue lines (with size = 2). Change the x axis label to `Year` and the y axis label to `Number of Individuals`.
