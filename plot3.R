####### Exploratory data analysis

##### project 1 
### PLOT 3

# setting directory
#YOU NEED TO SET YOUR OWN DIRECTORY WITH THE DATA
#setwd("D:/COURSERA/Data science/exploratory data analysis/week 1/Project 1")

#reading data
dane<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
dane[,1]<-as.Date(dane[,1],"%d/%m/%Y")

#choosing only 2 dates

dane_final<-dane[dane$Date=="2007-02-01" | dane$Date=="2007-02-02" ,]
#concatentaing times and date
x<-paste(dane_final$Date,dane_final$Time,sep=' ')
#converting to the proper format
datetime<-strptime(x,"%Y-%m-%d %H:%M:%S")

#changing the size of labels and main title
par(cex.lab=0.75)
par(cex.main=0.9)

#plotting
plot(datetime,dane_final$Sub_metering_1,type='l',col="black", ylab="Energy sub metering",xlab='')
lines(datetime,dane_final$Sub_metering_2,type="l",col="red")
lines(datetime,dane_final$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black", "red","blue"),
       text.width=50000,cex=0.8,y.intersp=2,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

?legend
#copying to to the png file
dev.copy(png, file = "plot3.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off()
?plot

