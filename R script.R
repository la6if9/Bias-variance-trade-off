library(ggplot2)
library(caret)
library(ISLR)
library(dplyr)
set.seed(1)

inTrain <- createDataPartition(y = Auto$mpg, p = .8, list = FALSE)

Train <- Auto[inTrain, ]

Test  <- Auto[-inTrain, ]
ggplot() + 
  geom_point(Train, mapping = aes(displacement, mpg), col = "blue") +
  geom_point(Test, mapping = aes(displacement, mpg), col = "red") +
  theme_minimal() 

linear <- lm(mpg ~ displacement, data = Train)
summary(linear)
mean(resid(linear)^2)
quadratic <- lm(mpg ~ displacement + I(displacement^2), data = Train)
summary(quadratic)
mean(resid(quadratic)^2)

knn <- train(mpg ~ displacement, 
             data = Train, 
             method = "knn",
             tuneGrid = expand.grid(k = c(1, 2, 5, 10, 25, 50, 100)),
             trControl = trainControl(method = "cv", number = 5))
min(knn$results$RMSE^2)

Train <- Train %>% 
  mutate(pred_linear    = predict(linear,    Train),
         pred_quadratic = predict(quadratic, Train),
         pred_knn       = predict(knn,       Train))

ggplot(Train) + 
  geom_point(aes(displacement, mpg)) +
  geom_line(aes(x = displacement, y = pred_linear), col = "blue") +
  geom_line(aes(x = displacement, y = pred_quadratic), col = "red") +
  geom_line(aes(x = displacement, y = pred_knn), col = "green") +
  theme_minimal()

Test <- Test %>% 
  mutate(pred_linear    = predict(linear,    Test),
         pred_quadratic = predict(quadratic, Test),
         pred_knn       = predict(knn,       Test))

Test %>% summarise(testMSE_linear    = mean((mpg - pred_linear)^2),
                   testMSE_quadratic = mean((mpg - pred_quadratic)^2),
                   testMSE_knn       = mean((mpg - pred_knn)^2)) 

ggplot(Test) + 
  geom_point(aes(displacement, mpg)) +
  geom_line(aes(x = displacement, y = pred_linear), col = "blue") +
  geom_line(aes(x = displacement, y = pred_quadratic), col = "red") +
  geom_line(aes(x = displacement, y = pred_knn), col = "green") +
  theme_minimal()
