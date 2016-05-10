# SOTU

Sup fam.

I did some data cleaning and wrote a python script and an R script to help isolate SOTU speeches. From here, we can begin doing "analysis" per the project description (which I've pasted at the end of this README).

This repository contains the following files:

1)State of the Union Addresses 1970-2016.txt
  --> this is the raw text file from Mengqian

2)sotu.py
  --> this is a python script I wrote to clean the file and create the csv...

3)SOTU_table_of_contents.csv
  --> self-explanatory, this can be used in R script to grab inidividual speeches

4)stateUnion.R
  --> this uses the csv file to break out individual SOTU speeches. There are examples in there of how to use the data as currently structured. 

Let me know if you have any quesitons. 
-Jordan

====================
Project Description
====================
Some description on the project 4:

President Barack Obama gave his final State of the Union address in January this year, and since I have been using presidents' speeches as examples in class to give you ideas of what we shall look for when we have a set of text data, I would like to ask you to find something interesting out of the State of the Union data from 1970 to 2016. There have been many analysis done on this data, many just touch the skin and their visualizations are limited. What I am looking for, in terms of evaluation, is whether you can tell a different story or a story with different perspectives using text visualization. The storytelling is similar to the project 3, with differences lying on the nature of the data you will be dealing with. Since the text data itself is already "telling" a story, the "story" told by your work shall not repeat something obvious that I can get by reading the scripts.

The following things might help to give your some ideas:

(1) Temporal feature -- what have changed through time, what have remained the same? Is there a trend you would like to inform the public?

(2) President -- for different presidents, what have changed during his service? Compared to other presidents, any feature? Dissimilarity/similarity among all presidents?

(3) Key words/Topics -- what have changed through time, what have remained the same?
