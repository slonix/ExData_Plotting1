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

# Creating plot 3
png(file="plot3.png", width=480, height=480)
with(data, {
    plot(DateTime, Sub_metering_1, type="l",
         ylab="Energy sub metering", xlab="",)
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd=1, lty=1, col=c("black", "red", "blue"))
})
dev.off()
