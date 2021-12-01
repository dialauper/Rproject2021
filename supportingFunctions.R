#### Supporting Functions R Script - Biocomp R Project
### Dianna Perez

## tab/space delimited file converter to comma delimited

txt2csv <- function(directory) {
  #define set of files and loop
  files <- list.files(path=directory, full.names = FALSE)
  
for(i in 1:length(files)){
    input <- files[i]
    output <- paste0(gsub("\\.txt$", "", input),".csv")
    data.csv <- read.table(file=input, header=TRUE, stringsAsFactors = FALSE)
    write.csv(data.csv, file=output, col.names=TRUE, row.names=FALSE)
    file.remove(input)
}
}


## compile multiple csv files into one csv file
csvcompiler <- function(directory) {
  #define set of files
  files<-list.files(path=directory, full.names = FALSE)
  
for(i in 1:length(files[i])){
  #open each file
  openfile <- read.table(file=files[i], sep = ",", header=TRUE, stringsAsFactors = FALSE)
  #add columns (country, DOY)
  openfile$country <- c()
  openfile$DOY <- c()
  #append/combine
  
  #handle NAs (argument)
}
                                      
}

testcsv <- read.csv("BiocompR/Rproject2021/countryX/screen_175.csv")

openfile <- read.table(file=testcsv, sep = ",", header=TRUE, stringsAsFactors = FALSE)
#add columns (country, DOY)
openfile$country <- c()
openfile$DOY <- c()

View(openfile)

#summarize
#assumes there is compiled data
#subset, count, sum
#print plot in an informative way

#analysis R
#use functions you defined
#answer 2 questions w/ explanation in comments
#figure to support BOTH answers