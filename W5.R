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

#data(waprbreaks)

### quizz