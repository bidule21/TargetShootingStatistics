drawScatterPlot <- function(resultFrame, title="Result overview"){
  plot(resultFrame$Date,resultFrame$Result,xlab="Date",ylab="Result")
  abline(h=mean(resultFrame$Result), lwd=4, col="blue")
  abline(lm(resultFrame$Result~resultFrame$Date), lwd=3, col="green")
  title(title)
}

loadResults <- function(){
  results <- read.csv("data/results.txt", sep=";", colClasses=c("Date","character","numeric","character","character"))
  ordered = results[order(results[,"Date"]),]
  ordered
}

loadResultType <- function(typeName){
  results<-loadResults()
  subset(results, TypeOfResult == typeName)
}