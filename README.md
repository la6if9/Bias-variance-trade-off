# Bias-variance-trade-off

Aim of the supervised learning is to find a compromise between model simplicity and complexity.

Predicting mpg (miles per gallon) from displacement (engine displacement).

The variables are in the data set Auto from the package ISLR.

Partition the data in a training set Train consisting of 80% of the data, and a test set Test consisting of the remaining 20% of the data.

Scatter plot with displacement on the x-axis and mpg on the y-axis. Cases in the training set are in blue, and the cases in the test set are in red.

![](https://github.com/la6if9/Bias-variance-trade-off/blob/main/Rplot.png)

#Training the models

Linear regression model: "mpg=β0+β1⋅displacement" 
MSE= 21.32563
Quadratic regression model: mpg=β0+β1⋅displacement+β2⋅displacement^2"
MSE= 18.87988
k-nearest neighbor: (5-fold cross validation)
MSE= 17.03057

#Visualizing the predictions

#linear= "Blue"
#quadric= "Red"
#knn= "Green"

![](https://github.com/la6if9/Bias-variance-trade-off/blob/main/Rplot02.png)

#Testing the predictions
MSE
testMSE_linear: 21.58022
testMSE_quadratic: 19.03581
testMSE_knn: 21.56773

Plotting the predictions for the test set

![](https://github.com/la6if9/Bias-variance-trade-off/blob/main/Rplot03.png)



