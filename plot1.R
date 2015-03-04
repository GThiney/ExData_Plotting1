data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Reads the data table with column names, separator=; and "?" identified as NA

data[[1]] <- as.Date(data[[1]], "%d/%m/%Y")
# Sets column "Date" format as Date and replaces it in the dataset

data <- data[data$Date>"2007-01-31" & data$Date<"2007-02-03",]
# Keeps only the data between the two target dates

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", cex.lab=.75, cex.axis=.75, cex.main=.75)
# Plots the histogram in red, with the correct labels and playing with the text size a bit to approach the target picture

dev.copy(png, file = "plot1.png", width=480, height=480, units="px")
dev.off()
# Copies the plot in a .png file of size 480x480 pixels