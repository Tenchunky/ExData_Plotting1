# Load full dataset
data_full <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Subset dataset from the dates 2007-02-01 and 2007-02-02 and remove full dataset from memory
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data_subset <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

# Concatenate date_subset$Date and data_subset$Time and convert the result to class "POSIXlt"
data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

# Make plot2
plot(data_subset$datetime, data_subset$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()