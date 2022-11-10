set.seed(123)
a <- 2000
squareloss <- 0
squarelossoptimal <- c()
y <- rgamma(a, 15, 3)

for (i in 1:a ){
  squareloss <- append(squareloss, (i%%7-y[i])^2)
  squarelossoptimal <- append(squarelossoptimal, (15/3 - y[i])^2)
}
squarelossoptimal
mean(squareloss)
mean(squarelossoptimal)
min <- 15/3^2 #the minimum loss occurs at alpha/beta^2 which is also equal to the variance of a beta
mean(squarelossoptimal)- min #The difference between these two should be approximately 0 on average

q=.75 #Hyperparameter that is fixed to take a mixure of the two different distributions
checkloss <- c()
for (i in 1:a){
if (y[i] > i) {
  checkloss <- append(checkloss, q*(y[i]-i))
} else {
  checkloss <- append(checkloss, (1-q)*(i-y[i]))
}
}
#Mean Check Loss
mean(checkloss)

x <- qgamma(q, 15, 3)
loss2 <- c()
for (i in 1:a){
if (y[i] > x) {
  loss2 <- append(loss2, q*(y[i]-x))
} else {
  loss2 <- append(loss2, (1-q)*(x-y[i]))
}
}
#Mean of loss2 given inverse CDF values
mean(loss2)

#The optimal action is when q is the inverse of the CDF for Y

loss <- c()
y <- rpois(a, 5.3)
for (i in 1:a) {

  if (y[i] != i){
  loss <- append(loss, 1)  
} else {
  loss <- append(loss, 0)
}
}
#This code uses the identity fuction in order to check to see if the Poisson distribution is different that the value a and returns a 1 if the values are the same and a 0 if the values are different
mean(loss)
loss

taufloor <- floor(5.3) 
lossfloor <- c()
#This takes the floor of the Poisson parameter and checks to see if it is different than the value a
y <- rpois(a, taufloor)
for (i in 1:a) {
if (y[i] != i%%7){ #Here we do modulus seven to make the code more likely to produce a 0 and match up the loss with the poisson
  lossfloor <- append(lossfloor, 1)  
} else {
  lossfloor <- append(lossfloor, 0)
}
}
#Average loss after taking the floor
mean(lossfloor)
#Loss vector after taking the floor
lossfloor
