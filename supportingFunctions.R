#### Supporting Functions R Script - Biocomp R Project
### Dianna Perez

## tab/space delimited file converter to comma delimited

txt2csv <- function(argfile) {
  
  #infers the delimiter from a text file, stores delim as character 
  delim <- get.delim(argfile, n = 10, comment = "#", skip = 1, delims = c("\t", " ")) 
  
  #based on the determined delimiter, these fns convert the file to a csv
  if(delim == " "){
    csvfile <- read.table(file=argfile, header=TRUE, sep="", stringsAsFactors = FALSE)
  } else if(delim == "\t"){
    csvfile <- read.table(file=argfile, header=TRUE, sep="\t", stringsAsFactors = FALSE)
  }
  
}

?get.delim()

## compile multiple csv files into one csv file

csvcompiler <- function(file) {
  
}