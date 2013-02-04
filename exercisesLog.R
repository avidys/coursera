#
######  W1
#

heights = rnorm(10,mean=188,sd=3)
heights

args(rbinom)
coinFlips = rbinom(10,size=10,prob=0.5)
coinFlips

args(dnorm)
x = seq(from=-5,to=5,length=10)
normalDensity = dnorm(x,mean=0,sd=1)
normalDensity
round(normalDensity,2)

args(dbinom)
x = seq(0,10,by=1)
binomialDensity = dbinom(x,size=10,prob=0.5)
round(binomialDensity,2)

heights = rnorm(10,mean=188,sd=3)
round(heights,2)
sample(heights,size=10,replace=TRUE)
sample(heights,size=5,replace=FALSE)

set.seed(12345)
rnorm(5,mean=0,sd=1)

#
######  W2
#

library(kernlab)
data(spam)
dim(spam)

#setwd("./data")
getwd()
setwd("./data")
setwd("../")

#download.file("https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru")
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv") #,method="curl")
list.files("./data")
dateDownloaded <- date()
dateDownloaded

cameraData <- read.table("./data/cameras.csv")
head(cameraData)
cameraData <- read.table("./data/cameras.csv",sep=",",header=TRUE)
head(cameraData)

library(xlsx)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/camera.xlsx",method="curl")
cameraData <- read.xlsx2("./data/camera.xlsx",sheetIndex=1)
head(cameraData)

file.choose()

list.files("./data")

#Important parameters file, header, sep, row.names, nrows
#Related: read.csv(), read.csv2()
#read.table()
cameraData <- read.table("./data/cameras.csv")
head(cameraData)
getwd()
cameraData <- read.table("./data/cameras.csv",sep=",",header=TRUE)
head(cameraData)
cameraData <- read.csv("./data/cameras.csv")

#read.xlsx(), read.xlsx2() {xlsx package}
#Reads .xlsx files, but slow
#Important parameters file, sheetIndex, sheetIndex, rowIndex, colIndex, header
#read.xlsx2() relies more on low level Java functions so may be a bit faster

library(xlsx)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/camera.xlsx",method="curl")
cameraData <- read.xlsx2("./data/camera.xlsx",sheetIndex=1)
head(cameraData)

cameraData <- read.csv(file.choose())

library(kernlab)
data (spam)
dim(spam)
n=dim(spam)[1]
n

# training set
set.seed(3435)
trainI=rbinom(n,size=1,prob=.5)
length(trainI)
table(trainI)
trainSpam=spam[trainI==1,]
trainHam=spam[trainI==0,]
dim(trainHam)
dim(trainSpam)
dimnames(trainHam[1,])
names(trainSpam)
head(trainSpam)
table(trainSpam$type)
length(trainSpam$type)
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve+1) ~ trainSpam$type)
plot(log10(trainSpam[,1:4]+1))
hC=hclust(dist(t(trainSpam[,1:4])))
plot(hC)
hC=hclust(dist(t(log10(trainSpam[,1:55]+1))))
plot(hC)

### 3 QUIZZ 2

fileUrl="http://simplystatistics.tumblr.com/"
con <- url(fileUrl)
v=readLines(con,n=150)
close(con)
head(v)
?nchar
nchar(v[2])
nchar(v[45])
nchar(v[122])
n=lapply(v,nchar) 
head(v)
head(n)

fileUrl="https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
download.file(fileUrl,destfile="./data/houses.csv")
dateDownload <- date()
list.files("./data")
hData <- read.csv("./data/houses.csv")
head(hData)
dim(hData)
head(hData[,c('VAL')])
table(hData[hData$VAL==24,c('VAL')])
val=hData$VAL
h.freq = table(val)      
h.freq
cbind(table(hData$VAL)      )
#How many households have 3 bedrooms and and 4 total rooms? 
#How many households have 2 bedrooms and 5 total rooms? 
#How many households have 2 bedrooms and 7 total rooms?
table(is.na(hData[hData$BDS==3 & hData$RMS==4 & hData$BDS != NA  & hData$RMS != NA,c('BDS','RMS')]))
table(is.na(hData[hData$BDS==2 & hData$RMS==5 & hData$BDS != NA  & hData$RMS != NA,c('BDS','RMS')]))
table(is.na(hData[hData$BDS==2 & hData$RMS==7 & hData$BDS != NA  & hData$RMS != NA,c('BDS','RMS')]))
table(hData$BDS==3 & hData$RMS==4)
table(hData$BDS==2 & hData$RMS==5)
table(hData$BDS==2 & hData$RMS==7)


agricultureLogical =   as.vector(hData$ACR==3 & hData$AGS==6)
indexes =  which(agricultureLogical) 
subsetDataFrame  = hData[indexes,] 
table(subsetDataFrame$MRGX,useNA="always")
dim(subsetDataFrame)
head(which(agricultureLogical) )

quantile(hData$YBL,na.rm=T)
summary(hData)
nm=names(hData)
s=cat(nm)
strsplit(nm[1],split="wgtp")
sapply(nm,strsplit(split="wgtp"))

strsplit("wgtp55","wgtp")


fPop="https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv"
download.file(fPop,destfile="./data/pop.csv")
dateDownload2 <- date()
list.files("./data")
pData <- read.csv("./data/pop.csv")
mData<-merge(hData,pData,by.x="SERIALNO",by.y="SERIALNO",all=TRUE)
dim(mData)