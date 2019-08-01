# Loading datasets
train <- read.csv('train (1).csv', header = FALSE)
test <- read.csv('test (1).csv', header = FALSE)

# Checking missing value
sum(is.na(train)) # No missing value in the dataset

# Target
names(train)[ncol(train)] <- "target"

# Cross Validation 
set.seed(123) 

train_idx <- sample(nrow(train), nrow(train)*0.8)
valid_idx <- setdiff(seq(1, nrow(train)), train_idx)

validation <- train[valid_idx,]
train <- train[train_idx,]

train_scaled <- as.data.frame(cbind(scale(train[,-501]), train$target))

# Linear Regression
m1 <- lm(target~., train_scaled)

# Expected performance on validation dataset
pred <- predict(m1, validation)
sqrt(mean((pred-validation$target)^2))

# Test
test_prediction <- as.data.frame(predict(m1, test))

# Saving CSV file
write.table(test_prediction, 'prediction.csv', sep=',', row.names = FALSE, col.names=FALSE) 
