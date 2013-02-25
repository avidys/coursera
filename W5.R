### W5

download.file("http://www.rossmanchance.com/iscam2/data/movies03RT.txt",
             destfile="./data/movies.txt")
file.show("./data/movies.txt")
movies <- read.table("./data/movies.txt",sep="\t",header=T,quote="")
head(movies)

aovObject <- aov(movies$score ~ movies$rating)
aovObject
aovObject$coeff

aovObject2 <- aov(movies$score ~ movies$rating + movies$genre)
aovObject2
summary(aovObject2)

aovObject3 <- aov(movies$score ~ movies$genre + movies$rating)
aovObject3
summary(aovObject3)

aovObject4 <- aov(movies$score ~ movies$genre + movies$rating + movies$box.office)
summary(aovObject4)


download.file("https://dl.dropbox.com/u/7710864/data/ravensData.rda",
              destfile="./data/ravensData.rda")
load("./data/ravensData.rda")
head(ravensData)

lmRavens <- lm(ravensData$ravenWinNum ~ ravensData$ravenScore)
summary(lmRavens)

logRegRavens <- glm(ravensData$ravenWinNum ~ ravensData$ravenScore,family="binomial")
summary(logRegRavens)

plot(ravensData$ravenScore,logRegRavens$fitted,pch=19,col="blue",xlab="Score",ylab="Prob Ravens Win")
     
exp(logRegRavens$coeff)
exp(confint(logRegRavens))

anova(logRegRavens,test="Chisq")


download.file("https://dl.dropbox.com/u/7710864/data/gaData.rda",destfile="./data/gaData.rda",method="wget")
load("./data/gaData.rda")
gaData$julian <- julian(gaData$date)
head(gaData)
              
plot(gaData$julian,gaData$visits,pch=19,col="darkgrey",xlab="Julian",ylab="Visits")
lm1 <- lm(gaData$visits ~ gaData$julian)
abline(lm1,col="red",lwd=3)

glm1 <- glm(gaData$visits ~ gaData$julian,family="poisson")
abline(lm1,col="red",lwd=3); lines(gaData$julian,glm1$fitted,col="blue",lwd=3)

plot(glm1$fitted,glm1$residuals,pch=19,col="grey",ylab="Residuals",xlab="Date")

source('~/Documents/R/coursera/agnostic.R')
#source("agnostic.R")
confint(glm1)
confint.agnostic(glm1)

glm2 <- glm(gaData$simplystats ~ julian(gaData$date),offset=log(visits+1),
            family="poisson",data=gaData)
plot(julian(gaData$date),glm2$fitted,col="blue",pch=19,xlab="Date",ylab="Fitted Counts")
points(julian(gaData$date),glm1$fitted,col="red",pch=19)

glm2 <- glm(gaData$simplystats ~ julian(gaData$date),offset=log(visits+1),
            family="poisson",data=gaData)
plot(julian(gaData$date),gaData$simplystats/(gaData$visits+1),col="grey",xlab="Date",
     ylab="Fitted Rates",pch=19)
lines(julian(gaData$date),glm2$fitted/(gaData$visits+1),col="blue",lwd=3)

#data(waprbreaks)

### quizz

data(warpbreaks)
str(warpbreaks)
head(warpbreaks)

aov(breaks ~ wool + tension, data=warpbreaks)
summary(aov(breaks ~ wool + tension, data=warpbreaks))

p <- .2
o <- p/(1-p)
log(o)

22 * .164

library(glm2)
data(crabs)
str(crabs)
head(crabs)


g2 <- glm(Satellites ~ Width,
            family="poisson",data=crabs)
g2
summary(g2)

#log(Sat) = .164 * w - 3.305
#Sat = e-3.305.e.164*w
c <- g2$coefficient
#exp(c[1]) * exp(c[2])
exp(0.164) 
exp(-3.305) * exp(0.164 * 22)
exp(-3.305 + 0.164 * 22)


plot(crabs$Satellites,g2$fitted,col="blue",pch=19,xlab="Sat",ylab="Fitted Counts")
plot(x=crabs$Satellites,y=crabs$width,col="blue",pch=19,xlab="Sat",ylab="width")
points(crabs$Satellites,g2$fitted,col="red",pch=19)
lines(crabs$Width,g2$fitted,col="red",lwd=3)
abline(g2)

library(MASS)
data(quine) 
lm1 <- lm(log(Days + 2.5) ~.,data=quine)
aic <- step(lm1)
aic
