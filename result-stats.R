drawScatterPlot <- function(resultFrame, title="Result overview"){
  plot(resultFrame$Date,resultFrame$Result,xlab="Date",ylab="Result")
  abline(h=mean(resultFrame$Result), lwd=4, col="blue")
  abline(lm(resultFrame$Result~resultFrame$Date), lwd=3, col="green")
  title(title)
}

loadResults <- function(){
  tempResultFile <- tempfile()
  download.file("https://dl.dropboxusercontent.com/u/26682142/TargetShootingResults/results.txt",destfile=tempResultFile, method="curl")
  results <- read.csv(tempResultFile, sep=";", colClasses=c("Date","character","numeric","character","character"))
  ordered = results[order(results[,"Date"]),]
  return(ordered)
}