# Reading a data file
filename <- "household_power_consumption.txt"
columnNames <- read.table(filename, sep=";", nrows=1, colClasses="character")
columnClasses <- c(rep("character", 2), rep("numeric", 7))
data <- read.table(filename, sep=";", skip=66637, nrows=2880,
                   colClasses=columnClasses)
colnames(data) <- columnNames
rm(columnNames, columnClasses)

# Creating plot 1
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
