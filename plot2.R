# Reading a data file
filename <- "household_power_consumption.txt"
columnNames <- read.table(filename, sep=";", nrows=1, colClasses="character")
columnClasses <- c(rep("character", 2), rep("numeric", 7))
data <- read.table(filename, sep=";", skip=66637, nrows=2880,
                   colClasses=columnClasses)
colnames(data) <- columnNames
rm(columnNames, columnClasses)

# Creating additional datetime column
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

# Creating plot 2
png(file="plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
