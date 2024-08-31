patient_data <- read.csv("cancer patient data sets.csv", header = TRUE, stringsAsFactors = FALSE)
str(patient_data)
summary(patient_data)
patient_data <- na.omit(patient_data)
numeric_vars <- sapply(patient_data, is.numeric)
variances <- apply(patient_data[, numeric_vars], 2, var, na.rm = TRUE)
constant_vars <- names(variances[variances == 0])
print(constant_vars)
patient_data <- patient_data[, !(names(patient_data) %in% constant_vars)]
library(caret)
patient_data <- data.frame(lapply(patient_data, function(x) if (is.character(x)) as.factor(x) else x))
processing <- preProcess(patient_data, method=c("range"))
patient_data <- predict(processing, patient_data)
str(patient_data)
set.seed(123)
train_proportion <- createDataPartition(1:nrow(patient_data), p = .8, list = FALSE)
train_data <- patient_data[train_proportion, ]
test_data <- patient_data[-train_proportion, ]
numeric_variables <- sapply(train_data, is.numeric)
numeric_train_data <- train_data[, numeric_variables]
correlation_matrix <- cor(numeric_train_data)
high_correlation <- findCorrelation(correlation_matrix, cutoff = 0.75)
train_data <- train_data[, -high_correlation]
library(e1071)
train_control <- trainControl(method = "cv", number = 10)
model <- train(Level ~ ., data = train_data, method = "svmLinear", trControl = train_control)
summary(model)
predictions <- predict(model, test_data)
confusionMatrix(predictions, test_data$Level)