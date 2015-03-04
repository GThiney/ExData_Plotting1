data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Reads the data table with column names, separator=; and "?" identified as NA

data[[1]] <- as.Date(data[[1]], "%d/%m/%Y")
# Sets column "Date" format as Date and replaces it in the dataset

data <- data[data$Date>"2007-01-31" & data$Date<"2007-02-03",]
# Keeps only the data between the two target dates

data2 <- strptime(paste(data[[1]], data[[2]]), "%Y-%m-%d %H:%M:%S")
# Concatenates columns Date and Time in order to have a continous dataset (day+time) to use in the x,y plot 

Sys.setlocale("LC_TIME", "English")
# Just necessary to get the correct days of the week ("monday", and not "lundi"): I live in France... 

with(data, {
        plot(data2, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", cex.lab=.75, cex.axis=.75)
        points(data2, data$Sub_metering_2, type="l", col="red")
        points(data2, data$Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), cex=.75, text.width=45000)
})
# First plots the energy sub metering 1 as a function of the time, with the correct labels and text size
# Then adds red points for the sub metering 2, then blue points for sub metering 3
# Finally, adds a legend with quite a bit of fidgeting to get the spacing right in the .png file (via text.width) !

dev.copy(png, file = "plot3.png", width=480, height=480, units="px")
dev.off()
# Copies the plot in a .png file of size 480x480 pixels