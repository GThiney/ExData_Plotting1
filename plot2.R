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

with(data, plot(data2, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=.75, cex.axis=.75))
# Plots the global active power as a function of the time, with the correct labels and playing with the text size a bit 
# to approach the target picture

dev.copy(png, file = "plot2.png", width=480, height=480, units="px")
dev.off()
# Copies the plot in a .png file of size 480x480 pixels