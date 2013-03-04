# lo reg  glm binomial plotting

par(mfrow=c(1,2))
boxplot(predict(lTrain) ~ trainSA$chd,col="blue")
boxplot(predict(lTrain,type="response") ~ trainSA$chd,col="blue")

par(mfrow=c(1,2))
boxplot(predict(lTrain,testSA) ~ testSA$chd,col="blue")
boxplot(predict(lTrain,testSA,type="response") ~ testSA$chd,col="blue")

par(mfrow=c(1,2))
boxplot(predict(lTrain,type="response") ~ trainSA$chd,col="blue")
boxplot(predict(lTrain,testSA,type="response") ~ testSA$chd,col="blue")



# comparing with cross validation

library(boot)
cost <- function(win, pred = 0) mean(abs(win-pred) > 0.5)
glm1 <- glm(ravenWinNum ~ ravenScore,family="binomial",data=ravensData)
glm2 <- glm(ravenWinNum ~ ravenScore,family="gaussian",data=ravensData)
cv1 <- cv.glm(ravensData,glm1,cost,K=3)
cv2 <- cv.glm(ravensData,glm2,cost,K=3)
cv1$delta

### Quizz

library(ElemStatLearn)
data(SAheart)
str(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
str(trainSA)

lTrain <- glm(chd ~ age + alcohol + obesity + tobacco + typea + ldl , family="binomial", data=trainSA)
str(lTrain)
lTrain
summary(lTrain)
anova(lTrain,test="Chisq")

par(mfrow=c(1,2))
boxplot(predict(lTrain) ~ trainSA$chd,col="blue")
boxplot(predict(lTrain,type="response") ~ trainSA$chd,col="blue")

par(mfrow=c(1,2))
boxplot(predict(lTrain,testSA) ~ testSA$chd,col="blue")
boxplot(predict(lTrain,testSA,type="response") ~ testSA$chd,col="blue")

par(mfrow=c(1,2))
boxplot(predict(lTrain,type="response") ~ trainSA$chd,col="blue", main="train set")
boxplot(predict(lTrain,testSA,type="response") ~ testSA$chd,col="blue", main="test set")

xx <- seq(0,1,length=10); err <- rep(NA,10)
for(i in 1:length(xx)){
  err[i] <- sum((predict(lTrain,type="response") > xx[i]) != trainSA$chd)
}
plot(xx,err,pch=19,xlab="Cutoff",ylab="Error")

#missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
#cv <- cv.glm(testSA,lTrain,missClass,K=2)
#cv$delta

missClass(trainSA$chd,predict(lTrain,type="response",trainSA))
missClass(testSA$chd, predict(lTrain,type="response",newdata=testSA))



# Calculate RMSE on training
for(i in 1:length(xx)){
  missClass(lTrain$fitted,trainSA$chd)
  for(i in 1:length(xx)){
    
# Calculate RMSE on test
sqrt(sum((predict(lm1,newdata=testFaith)-testFaith$eruptions)^2))

library(boot)
cost <- function(win, pred = 0) mean(abs(win-pred) > 0.5)
glm1 <- glm(ravenWinNum ~ ravenScore,family="binomial",data=ravensData)
glm2 <- glm(ravenWinNum ~ ravenScore,family="gaussian",data=ravensData)
cv1 <- cv.glm(ravensData,glm1,cost,K=3)
cv2 <- cv.glm(ravensData,glm2,cost,K=3)
cv1$delta

# Calculate RMSE on training
sqrt(sum((lm1$fitted-trainFaith$eruptions)^2))
# Calculate RMSE on test
sqrt(sum((predict(lm1,newdata=testFaith)-testFaith$eruptions)^2))

coef(lTrain)[1] + coef(lTrain)[2]*80
newdata <- data.frame(waiting=80)
predict(lTrain,newdata)





plot(SAheart$chd , SAheart$al1$fitted, pch=20,col="blue",xlab="chd")
     
exp(l1$coeff)
exp(confint(l1))
summary(l1)
anova(l1,test="Chisq")

####

library(pgmm)
data(olive)
str(olive)
olive = olive[,-1]
str(olive)
#data()

# An alternative is library(rpart)
library(tree)
tree1 <- tree(Area ~ .,data=olive)
summary(tree1)
plot(tree1)
text(tree1)
newdata = as.data.frame(t(colMeans(olive)))
str(newdata)
predict(tree1,newdata)
with(olive,table(Area))
with(olive,table(Region))

#plot(,pch=19,col=as.numeric(iris$Species))
#partition.tree(tree1,label="Species",add=TRUE)
#legend(1.75,4.5,legend=unique(iris$Species),col=unique(as.numeric(iris$Species)),pch=19)

# predicting
set.seed(32313)
newdata <- data.frame(Petal.Width = runif(20,0,2.5),Sepal.Width = runif(20,2,4.5))
pred1 <- predict(tree1,newdata)
pred1

newData = data.frame(Palmitic = 1200, Palmitoleic = 120, Stearic=200,Oleic=7000,Linoleic = 900, Linolenic = 32, Arachidic=60,Eicosenoic=6)
str(newData)