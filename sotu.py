import pandas as pd

f = open('State of the Union Addresses 1970-2016.txt','r')

#list of addresses stops at 229 
#first *** at 231

count = 0
addresses = []
for line in f:
    if count < 230:
        addresses.append(line.strip())
        count += 1
    else:
        break

for ad in addresses:
    if ad == '':
        addresses.remove(ad)

#clean up stragglers
addresses.remove(addresses[217])
addresses.remove(addresses[0])

## create comma-split version
addresses = [x.split(',') for x in addresses]

#this is the table of contents
tableOfContents = pd.DataFrame(addresses,columns=("President","SOTU","Month_Day","Year")) 

f.close()

f = open('State of the Union Addresses 1970-2016.txt','r')
#this gets the indices of each SOTU speech
sotuIndex = []
starCount = 0
for line in f:
    if '***' in line:
        sotuIndex.append(starCount)
        starCount += 1
    else:
        starCount += 1
        continue
f.close()

# add columns to dataframe for beginning and ending lines
tableOfContents['Speech_Start_Line'] = pd.Series(sotuIndex)

sotuEnds = sotuIndex[1:] + [177471] #manually provide end line for last SOTU
tableOfContents['Speech_End_Line'] = pd.Series(sotuEnds)

tableOfContents.to_csv('SOTU_table_of_contents.csv',index = False)