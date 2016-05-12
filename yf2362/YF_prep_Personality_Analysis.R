#-------------------------------------------------------------
# Personality Analysis - text for selected presidents
#-------------------------------------------------------------
# #install.packages("gdata")
# library(gdata)
# 
# #TOC == Table of Contents
# TOC <- read.csv('SOTU_table_of_contents.csv')
# 
# full <- read.table('State of the Union Addresses 1970-2016.txt',
#                    quote="",
#                    blank.lines.skip=FALSE,
#                    fill=FALSE,
#                    sep ='\n',
#                    skipNul = FALSE)
# # Selected President
# Person = c("George Washington","Thomas Jefferson","Franklin D. Roosevelt",
#            "William J. Clinton","George W. Bush","Barack Obama")
# Selected = TOC[which(TOC$President %in% Person),]
# min_line = aggregate(Speech_Start_Line~President, data = Selected, min)
# max_line = aggregate(Speech_End_Line~President, data = Selected, max)
# 
# #Keep the selected presidents' speach:
# for (p in Person){
#   st = as.numeric(min_line[which(min_line$President==p),][2])
#   ed = as.numeric(max_line[which(min_line$President==p),][2])
#   Speach <- drop.levels(full[st:ed,])
#   Speach = as.vector(Speach)
#   Speach = paste(Speach[which(Speach!="")], collapse=" ")
#   write(Speach, paste(p,".txt",sep=""))
# }

