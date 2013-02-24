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

#
######### Week 3
#
fileUrl="https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
download.file(fileUrl,destfile="./data/ss06hid.csv")
getwd()
list.files("./data")
pData <- read.csv("./data/ss06hid.csv")
head(pData)
boxplot(pData$AGEP,col="blue")


plot(pData$JWMNP,pData$WAGEP,pch=19,col="blue",cex=.5)
library(Hmisc)
ageG=cut2(pData$AGEP,g=5)
head(ageG)
ageG
plot(pData$JWMNP,pData$WAGEP,pch=19,col=ageG,cex=.5)

#library(survival)

x=rnorm(10000)
y=rnorm(10000)
plot(x,y,pch=19)
s <- sample(1:10000,size=1000,replace=FALSE)
plot(x[s],y[s],pch=19)
head(s)
smoothScatter(x,y)

library(hexbin)
h<-hexbin(x,y)
plot(h)

qqplot(x,y)
abline(c(0,1))

X <- matrix(rnorm(20*5),nrow=5)
matplot(X,typ="b")

image(1:5,1:20,X)
#m <- as.matrix(pData[1:10,200:400])
tm <- t(X)[,nrow(X):1]
image(1:20,1:5,tm)

library(maps)
map("france")
points(0,0,pch=19,col="red")
points(0,45,pch=19,col="red")

x <- c(NA,NA,NA,4,5,6,7,8,9,10)
y <- 1:10
plot(x,y)
plot(x,y,pch=19,xlim=c(0,11),ylim=c(0,11))

x <- rnorm(150)
y <- rnorm(150)
y[x < 0] <- NA
?boxplot(x ~ is.na(y),varwidth=T,)


#ggplot2#
#
#
# Quizz W3
#

#Q
library(datasets)
data(iris)
irisSubset <- iris[,1:4]
head(iris)
dataFrame <- data.frame(x=x,y=y)
distxy <- dist(dataFrame)
h <- dist(irisSubset)
hClustering <- hclust(h)
plot(hClustering)

#Q
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.rda",destfile="./data/quiz3question4.rda")
#https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv 
load("./data/quiz3question4.rda")
head(dataSet)
plot(dataSet)

kmeansObj <- kmeans(dataSet,centers=2,iter.max=30)
names(kmeansObj)
kmeansObj

plot(dataSet,col=kmeansObj$cluster,pch=19,cex=.5)
points(kmeansObj$centers,col=1:2,pch=3,cex=2,lwd=1)

#dataFrame <- data.frame(x,y)
#kmeansObj <- kmeans(dataFrame,centers=3)
#names(kmeansObj)


#
# Q5
#
library(ElemStatLearn)
data(zip.train)
dim(zip.train)
head(zip.train)
im8 = zip2image(zip.train,8)
im18 = zip2image(zip.train,18)
image(im8)
image(im18)
svd8 <- svd(im8)
svd18 <- svd(im18)
svd8
plot(svd8$d^2/sum(svd8$d^2),pch=19,xlab="Singluar vector",ylab="Variance explained")
plot(svd18$d^2/sum(svd18$d^2),pch=19,xlab="Singluar vector",ylab="Variance explained")


# W4
########

samsungData <- read.table("https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda")
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda",dest="./data/samsungData.rda")
load("./data/samsungData.rda")
dim(samsungData)
str(samsungData)
summary(samsungData)
class(samsungData)
names(samsungData)

download.file("https://spark-public.s3.amazonaws.com/dataanalysis/hunger.csv", dest="hunger.csv")
file.show("hunger.csv")
hunger <- read.csv("https://spark-public.s3.amazonaws.com/dataanalysis/hunger.csv")
str(hunger)


income <- https://spark-public.s3.amazonaws.com/dataanalysis/income.csv
movies <- https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt


download.file("https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt",destfile="./data/movies.txt")
movies <- read.table("./data/movies.txt",sep="\t",header=T,quote="")
str(movies)
summary(movies)
head(movies)
lm1 <- lm(movies$score ~ movies$box.office)
#lm1 <- lm(movies$score ~ as.factor(movies$rating))
summary(lm1)
confint(lm1,level=.9)
plot (movies$score ~ movies$box.office)

lm2 <- lm(movies$score ~ movies$box.office + movies$running.time + movies$box.office * movies$running.time)
summary(lm2)

anova(lm(movies$box.office ~ movies$running.time))

plot(movies$running.time ~ movies$score)

lm2 <- lm(movies$score ~ movies$box.office + movies$running.time )
summary(lm2)

lm4 <- lm(movies$score ~ as.factor(movies$rating) + movies$running.time + as.factor(movies$rating) * movies$running.time)
summary(lm4)

data(warpbreaks)
str(warpbreaks)
lm3 <- lm(warpbreaks$breaks ~ relevel(as.factor(warpbreaks$tension),ref="H"))
anova(lm3)
confint(lm3,level=.95)
table(warpbreaks$breaks , warpbreaks$tension)

### W5

data(waprbreaks)
