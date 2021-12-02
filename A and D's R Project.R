#### Supporting Functions R Script - Biocomp R Project
### Dianna Perez and Abi Batkoff


library(ggplot2)

## tab/space delimited file converter to comma delimited

txt2csv <- function(directory) {
  #define set of files and loop
  files <- list.files(path=directory, full.names = TRUE)
  
  for(i in 1:length(files)){
    input <- files[i]
    output <- paste0(gsub("\\.txt$", "", input),".csv")
    data.csv <- read.table(file=input, header=TRUE, stringsAsFactors = FALSE)
    write.csv(data.csv, file=output, col.names=TRUE, row.names=FALSE)
    file.remove(input)
  }
}
txt2csv("/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryY")



## compile multiple csv files into one csv file
csvcompilerY <- function(directory = "/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryY") {
 
  #read in first file name it alldata
  alldata<- read.csv("/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryY/screen_120.csv", header=TRUE)
  alldata$country <- "Y"
  alldata$DOY <- 120
  
  #define set of files
  files<-list.files(path=directory, full.names = TRUE)
  
  for(i in 2:length(files)){
    #open each file
    testcsv <- read.table(file=files[i], sep = ",", header=TRUE, stringsAsFactors = FALSE)
    #add columns (country, DOY)
    testcsv$country <- "Y"
    testcsv$DOY <- substr(files[i],87,89)
    #append/combine
    alldata<- rbind(alldata,testcsv)
    #handle NAs (argument)
  }
  answer <- readline(prompt="Do you want to remove rows with NA values? (hit 1 if yes) Do you want to include NA values
                     but be warned of their presence? (hit 2 if yes) Do you want to include NA values without a warning (hit 3 if yes)")
  as.numeric(answer)
  if( answer == 1){
    #remove all rows with NAs
    alldata <- na.omit(alldata)
  }else if(answer == 2 && nrow(alldata)-sum(is.na(alldata[,])) > 0){
    #remove all rows with NAs with a warning
    print("Warning: this compiled data contains NA values")
  }else{
    #keep all NAs without a warning
    return(alldata)
  }
  return(alldata)
}

dataY <- csvcompilerY("/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryY")

colnames(dataY)

csvcompilerX <- function(directory= "/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryX") {
  
  #read in first file name it alldata
  alldata2<- read.csv("/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryX/screen_120.csv", header=TRUE)
  alldata2$country <- "X"
  alldata2$DOY <- "120"
  
  #define set of files
  files<-list.files(path=directory, full.names = TRUE)
  
  for(i in 2:length(files)){
    #open each file
    testcsv <- read.table(file=files[i], sep = ",", header=TRUE, stringsAsFactors = FALSE)
    #add columns (country, DOY)
    testcsv$country <- "X"
    testcsv$DOY <- substr(files[i],87,89)
    #append/combine
    alldata2<- rbind(alldata2,testcsv)
    #handle NAs (argument)
  }
  answer <- readline(prompt="Do you want to remove rows with NA values? (hit 1 if yes) Do you want to include NA values
                     but be warned of their presence? (hit 2 if yes) Do you want to include NA values without a warning (hit 3 if yes)")
  as.numeric(answer)
  if( answer == 1){
    #remove all rows with NAs
    alldatanoNA <- na.omit(alldata2)
    return(alldatanoNA)
  }else if(answer == 2 && nrow(alldata2)-sum(is.na(alldata2[,])) > 0){
    #remove all rows with NAs with a warning
    print("Warning: this compiled data contains NA values")
    return(alldata2)
  }else{
    #keep all NAs without a warning
    return(alldata2)
  }
}

dataX<- csvcompilerX("/Users/abigaylebatkoff/Downloads/MBA Year 1/Biocomputing/RProject2021/countryX")

nrow(dataX)

tail(dataX)

forrealalldata <- rbind(dataX,dataY)

forrealalldata

#summary plots 

ggplot(data=forrealalldata,aes(x=nrow(forrealalldata[,forrealalldata$country=="X"]),y=nrow(forrealalldata[,forrealalldata$country=="Y"])))+
  geom_bar()+
  xlab("")+
  ylab("writing score")+
  theme_classic()+
  stat_smooth()




#vaccine question: look at how different the markers are, does it change a lot in country y



#summarize
#assumes there is compiled data
#subset, count, sum
#print plot in an informative way

#analysis R
#use functions you defined
#answer 2 questions w/ explanation in comments
#figure to support BOTH answers

