# lung-cancer-detection-model
## A machine learning model coded in R to predict the likelihood of a patient developing lung cancer.
Can be run in Rstudio or any other environment that supports R code.
### About
This project was carried out to further develop my understanding of the uses of different machine learning models as well gain experience of the coding of such models in the R language.
The dataset used is from [Kaggle](https://www.kaggle.com/datasets/thedevastator/cancer-patients-and-air-pollution-a-new-link) and provides information on a 1000 different patients with both numeric and categorical variables.
By using the caret and e1071 packages, a linear SVM model was used along with a cross-validation method to prevent overfitting, which was then successfully trained and evaluated.

### Confusion Matrix and Statistics
```
          Reference
Prediction High Low Medium
    High     69   0      0
    Low       0  51      0
    Medium    0   0     80
```
```
Statistics by Class:

                     Class: High Class: Low Class: Medium
Sensitivity                1.000      1.000           1.0
Specificity                1.000      1.000           1.0
Pos Pred Value             1.000      1.000           1.0
Neg Pred Value             1.000      1.000           1.0
Prevalence                 0.345      0.255           0.4
Detection Rate             0.345      0.255           0.4
Detection Prevalence       0.345      0.255           0.4
Balanced Accuracy          1.000      1.000           1.0
```
### Evaluation
The confusion matrix shows that the model was able to predict the likelihood of developing cancer for the patients in the test datset with an accuracy of 100%, which suggests that the model is extremely effective and suitable for this data, however there is a chance that there was overfitting or some data leakage. To further evaluate the model, an increased number of data would have to be used, and further measures could be put into place to reduce the risk of overfitting and increase the reliablity of the model.
