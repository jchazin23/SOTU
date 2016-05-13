library(RTextTools)
library(dplyr)
library(ggplot2)
library(gdata)

## Prepare the data
TOC <- read.csv('SOTU_table_of_contents.csv')

full <- read.table('State of the Union Addresses 1970-2016.txt',
                   quote="",
                   blank.lines.skip=FALSE,
                   fill=FALSE,
                   sep ='\n',
                   skipNul = FALSE)

## This part takes awhile to load 
docs <- c()
for (i in c(1:dim(TOC)[1])){
  SOTU <- drop.levels(full[TOC$Speech_Start_Line[i]:TOC$Speech_End_Line[i],])
  SOTU = as.vector(SOTU)
  # remove punctuation
  SOTU = gsub("[[:punct:]]", "", SOTU)
  # lowercase
  Text = tolower(paste(SOTU[which(SOTU!="")], collapse=" "))
  # stemming, whitespace 
  Word = wordStem(unlist(strsplit(Text, split=" ")), "english")
  docs <- cbind(docs, Word)
}

# I/me/my/mine
nums <- 1:224
count.Me <- c()
for (i in nums) {
  w <- length(which(docs[,i] == 'I'))
  x <- length(which(docs[,i] == 'me'))
  y <- length(which(docs[,i] == 'my'))
  z <- length(which(docs[,i] == 'mine'))
  count.Me <- cbind(count.Me, w+x+y+z)
}
count.Me <- as.matrix(count.Me)
count.Me <- t(count.Me)
count.Me <- as.data.frame(count.Me)
Me <- ggplot(count.Me, aes(x = nums, y = count.Me$V1)) + geom_bar(stat='identity') + ggtitle('Frequency of "I/Me/My/Mine"') + xlab('') + ylab('Count') 

# You/your/yours/y'all
count.You <- c()
for (i in nums) {
  w <- length(which(docs[,i] == 'you'))
  x <- length(which(docs[,i] == 'your'))
  y <- length(which(docs[,i] == 'yours'))
  z <- length(which(docs[,i] == "y'all"))
  count.You <- cbind(count.You, w+x+y+z)
}
count.You <- as.matrix(count.You)
count.You <- t(count.You)
count.You <- as.data.frame(count.You)
You <- ggplot(count.You, aes(x = nums, y = count.You$V1)) + geom_bar(stat='identity') + ggtitle('Frequency of "You/Your/Yours/Y\'all"') + xlab('') + ylab('Count') 

# We/us/our/ours
count.We <- c()
for (i in nums) {
  w <- length(which(docs[,i] == 'we'))
  x <- length(which(docs[,i] == 'us'))
  y <- length(which(docs[,i] == 'our'))
  z <- length(which(docs[,i] == 'ours'))
  count.We <- cbind(count.We, w+x+y+z)
}
count.We <- as.matrix(count.We)
count.We <- t(count.We)
count.We <- as.data.frame(count.We)
We <- ggplot(count.We, aes(x = nums, y = count.We$V1)) + geom_bar(stat='identity') + ggtitle('Frequency of "We/Us/Our/Ours"') + xlab('') + ylab('Count') +

# America/America's/Americans/Americans'
count.America <- c()
for (i in nums) {
  w <- length(which(docs[,i] == 'america'))
  x <- length(which(docs[,i] == "america's"))
  y <- length(which(docs[,i] == 'american'))
  z <- length(which(docs[,i] == 'americans'))
  xx <- length(which(docs[,i] == "americans'"))
  count.America <- cbind(count.America, w+x+y+z+xx)
}
count.America <- as.matrix(count.America)
count.America <- t(count.America)
count.America <- as.data.frame(count.America)
America <- ggplot(count.America, aes(x = nums, y = count.America$V1)) + geom_bar(stat='identity') + ggtitle('Frequency of "America/America\'s/American/Americans/Americans\'"') + xlab('') + ylab('Count')


# They/Them/Their/Theirs
count.They <- c()
for (i in nums) {
  w <- length(which(docs[,i] == 'they'))
  x <- length(which(docs[,i] == 'them'))
  y <- length(which(docs[,i] == 'their'))
  z <- length(which(docs[,i] == 'theirs'))
  count.They <- cbind(count.They, w+x+y+z)
}
count.They <- as.matrix(count.They)
count.They <- t(count.They)
count.They <- as.data.frame(count.They)
They <- ggplot(count.They, aes(x = nums, y = count.They$V1)) + geom_bar(stat='identity') + ggtitle('Frequency of "They/Them/Their/Theirs"') + xlab('') + ylab('Count')


#Country/Country's/Nation/Nation's
count.Country <- c()
for (i in nums) {
  w <- length(which(docs[,i] == 'country'))
  x <- length(which(docs[,i] == "country's"))
  y <- length(which(docs[,i] == 'nation'))
  z <- length(which(docs[,i] == "nation's"))
  count.Country <- cbind(count.Country, w+x+y+z)
}
count.Country <- as.matrix(count.Country)
count.Country <- t(count.Country)
count.Country <- as.data.frame(count.Country)
Country <- ggplot(count.Country, aes(x = nums, y = count.Country$V1)) + geom_bar(stat='identity') + ggtitle('Frequency of "Country/Nation/Country\'s/Nation\'s\'"') + xlab('') + ylab('Count') 


# Plots
require(gridExtra) 

grid.arrange(Me, We, nrow=2)
grid.arrange(You, They, nrow=2)
grid.arrange(Country, America, nrow=2)
# print(Me)
# print(We)
# print(You)
# print(They)
# print(Country)
# print(America)