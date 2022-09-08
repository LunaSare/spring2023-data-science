<!--
from https://github.com/ericlind/data-mgmt-4-biologists/blob/gh-pages/exercises/Read-data-R.md
-->

### Reading data tables into R

After your hard work helping your colleague prepare for the 2018
field season by rearranging their data, you receive a revised
dataset for 2016. Your colleague has asked that you
make sure you can read in this format and work with it in R
before tackling the rearrangement of the 2017 data.

1. Download the [cleaned 2016 WMA bird dataset](https://github.com/ericlind/data-mgmt-4-biologists/blob/gh-pages/data/wma-bird-data-2016.csv)
using the function `download.file()`, and save it to the /data directory in your working directory.
The url for the file is `https://raw.githubusercontent.com/ericlind/data-mgmt-4-biologists/gh-pages/data/wma-bird-data-2016.csv`

2. Read in the dataset using `read.csv()`, and assign it to a named object.

3. Using the `str()` function, examine the structure of the
imported dataset. Do the field types appear to be correct?

4. Type the name of the object at the console and hit enter. Is
what is printed to screen useful? Explain your answer.

5. Examine the first few rows of data using the `head()` function. How many rows and columns does the data table have?

6. Based on the last two questions, which one is more useful, using the function `head()` or typing the name of the object?

7. Create a new object from only the first 100 rows of data. Use the function `write.csv()` to export
this new object to a file called `wma-bird-data-2016-first100.csv`. Send this table to your instructor for grading.
