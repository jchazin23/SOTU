library(gdata)

#TOC == Table of Contents
TOC <- read.csv('SOTU_table_of_contents.csv')

full <- read.table('State of the Union Addresses 1970-2016.txt',
                   quote="",
                   blank.lines.skip=FALSE,
                   fill=FALSE,
                   sep ='\n',
                   skipNul = FALSE)

## Notes
## Be sure to use "drop.levels" otherwise processing will be long and annoying


#Here is how to print out a State of the Union Speech:
#Call drop.levels(), and sub-set using TOC$Speech_Start_Line[<SOTU #>] and end_line, like this:
SOTU1 <- drop.levels(full[TOC$Speech_Start_Line[1]:TOC$Speech_End_Line[1],])
SOTU1 #this prints the State of the Union number 1

SOTU2 <- drop.levels(full[TOC$Speech_Start_Line[2]:TOC$Speech_End_Line[2],])
SOTU2 #this prints the State of the Union number 2
#etc...

## There are 224 State of the Union addresses in data frame "full"
SOTU224 <- drop.levels(full[TOC$Speech_Start_Line[224]:TOC$Speech_End_Line[224],])
SOTU224 #this prints the State of the Union number 224

#etc...
