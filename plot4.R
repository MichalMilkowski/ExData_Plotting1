####### Exploratory data analysis

##### project 1 
### PLOT 4

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

#changing subsetting the plotting space into plots
par(mfrow=c(2,2))

#changing the size of labels and main title
par(cex.lab=0.75)
par(cex.main=0.9)

  ##plot 1st
  plot(datetime,dane_final$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab='')
  ##plot 2nd
  plot(datetime,dane_final$Voltage,type='l',ylab="Voltage")
  ##plot 3rd
  plot(datetime,dane_final$Sub_metering_1,type='l',col="black", ylab="Energy sub metering",xlab='')
  lines(datetime,dane_final$Sub_metering_2,type="l",col="red")
  lines(datetime,dane_final$Sub_metering_3,type="l",col="blue")
  legend("topright", lty=1, bty='n',col = c("black", "red","blue"),
         text.width=60000,cex=1.2,y.intersp=2,
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  ##plot 4th
  plot(datetime,dane_final$Global_reactive_power,type='l',ylab="Global_reactive_power")



#copying to to the png file
dev.copy(png, file = "plot4.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off()

