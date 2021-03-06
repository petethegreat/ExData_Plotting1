# read the rows containing data between 2007/2/1 and 2007/2/2 (ymd). This is not exact, so we'll filter further later
# these skip/row values are not exact, will filter by data later
data<-read.table('household_power_consumption.txt',sep=';',skip=66600,nrow=4000)
# set the column names on the data frame
names(data)<-c('date','time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')

# convert the date column to class date
data$time<-paste(data$date,data$time)
# combine date and time
# data$date<-as.Date(data[,1],format='%d/%m/%Y')
data$time<-strptime(data$time,format="%d/%m/%Y%H:%M:%S")
# convert the time column to class time (POSIXlt) (note that the data parts are screwed up, assumed to be "today")
# data$Times<-strptime(data[,2],format='%H:%M:%S')
# filter the rows based on date (properly)
data<-data[data$time >= "2007-02-01" & data$time < "2007-02-03",]

# want 2880 rows

# plot the data
png(filename='./plot2.png')
plot(x=data$time,y=data$GlobalActivePower,type='l',ylab='Global Active Power (kiloWatts)',xlab='')
dev.off()
