

# read the rows containing data between 2007/2/1 and 2007/2/2 (ymd). This is not exact, so we'll filter further later
# these skip/row values are not exact, will filter by data later
data<-read.table('household_power_consumption.txt',sep=';',skip=66600,nrow=4000)
# set the column names on the data frame
names(data)<-c('date','Times','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')

# convert the date column to class date
data$date<-as.Date(data[,1],format='%d/%m/%Y')
# convert the time column to class time (POSIXlt) (note that the data parts are screwed up, assumed to be "today")
data$Times<-strptime(data[,2],format='%H:%M:%S')
# filter the rows based on date (properly)
data<-data[data$date >= "2007-02-01" & data$date <= "2007-02-02",]
# make the plot

#open the png graphics device (480 x 480 are defaults)
png(filename='./plot1.png')
hist(data$GlobalActivePower,xlab='Global Active Power (kiloWatts)',col='red',main='Global Active Power')
dev.off()
