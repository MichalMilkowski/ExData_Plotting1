####### Exploratory data analysis

##### project 1 
### PLOT 1

# setting directory
#YOU NEED TO SET YOUR OWN DIRECTORY WITH THE DATA
#setwd("D:/COURSERA/Data science/exploratory data analysis/week 1/Project 1")

#reading data
dane<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
dane[,1]<-as.Date(dane[,1],"%d/%m/%Y")

#choosing only 2 dates

dane_final<-dane[dane$Date=="2007-02-01" | dane$Date=="2007-02-02" ,]

#changing the size of labels and main title
par(cex.lab=0.75)
par(cex.main=0.9)
#plot 1
hist(dane_final$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#copying to to the png file
dev.copy(png, file = "plot1.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off()
