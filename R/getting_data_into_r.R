# For missing data, make sure the cells are empty. 
# Make sure column headings are clear. Try not have space in them. 
# read.table read.csv
setwd() 
getwd()  # check current working directory
dir()  # List the files in the working directory, same as list.files()
dll.data <- read.csv("dll.csv", header=TRUE)
fix(dll.data)  # provides a spreadsheet to examine the data. See if missing values are encoded correctly. # not working
str(dll.data)
summary(dll.data)

with(dll.data, mean(SCT))
with(dll.data, mean(na.omit(SCT)))

with(dll.data, table(line:genotype))  # list all combinations of line and genotype and gives the number of obs for each

# remove NA
dll.data.vetted <- na.omit(dll.data)  
# this removes all rows with missing data. this is a pretty extreme option that you do not want to generally use. 

# convert a column to a factor
dll.data$temp <- factor(dll.data$temp)

# subset
SCT_Dll <- dll.data[dll.data$genotype == "Dll", ]
SCT_Dll.2 <- subset(dll.data, genotype == "Dll")


# remove the unused levels
droplevels(sct_ddd_25$temp)
# OR
factor(sct_ddd_25$temp)
