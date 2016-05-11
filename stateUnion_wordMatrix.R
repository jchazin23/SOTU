#install.packages("gdata")
#install.packages("RTextTools")
library(gdata)
library(RTextTools)

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
#Call drop.levels(), and sub-set using TOC$Speech_Start_Line[<SOTU #>] and end_line, like this

#Keep all info from TOC and make document-item matrix
Dict = as.data.frame(NA)
names(Dict)[1] = "Word"
for (i in c(1:dim(TOC)[1])){
  SOTU <- drop.levels(full[TOC$Speech_Start_Line[i]:TOC$Speech_End_Line[i],])
  SOTU = as.vector(SOTU)
  SOTU = gsub("[[:punct:]]", "", SOTU)
  Text = tolower(paste(SOTU[which(SOTU!="")], collapse=" "))
  Word = wordStem(unlist(strsplit(Text, split=" ")), "english")
  WordCounts = as.data.frame(table(Word))
  Dict<- merge(Dict,WordCounts,by="Word",all=TRUE)
  names(Dict)[dim(Dict)[2]] = paste("doc_",i,sep="")
}

# Keep only words with letters (take out the "" one)
Dict = Dict[grep("^[[:alpha:]]*$", Dict$Word),]
Dict = Dict[Dict$Word!="",]

# Replace NA with 0
Dict[is.na(Dict)] = 0

# Note:
# Now, TOC[i] is the document information corresponding to Dict["doc_i"] in the Dict matrix(i=1:224)

# Save Dictionary Matrix
write.csv(Dict, "Word_Document_Matrix.csv", row.names=FALSE)