
<!-- README.md is generated from README.Rmd. Please edit that file -->

## DiabetesReadmission

The goal of DiabetesReadmission is to predict the 30-day hospital
readmission risk for diabetes patients using a pre-trained Random Forest
model. This package was developed as part of a Bioinformatics Capstone
Project.

## Installation

You can install the development version of DiabetesReadmission from
GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("JackF0/DiabetesReadmission")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DiabetesReadmission)

# 1. Load the sample data included in the package
data("sample_diabetes")

# 2. View the first few rows
head(sample_diabetes[, 1:5])
#>              race gender     age admission_type_id discharge_disposition_id
#> 1       Caucasian Female [10-20)                 1                        1
#> 2 AfricanAmerican Female [20-30)                 1                        1
#> 3       Caucasian   Male [30-40)                 1                        1
#> 4       Caucasian   Male [40-50)                 1                        1
#> 5       Caucasian   Male [50-60)                 2                        1
#> 6       Caucasian   Male [60-70)                 3                        1

# 3. Predict readmission risk
# (Note: Requires the trained model in inst/extdata)
# predictions <- predict_readmission(sample_diabetes)
# print(predictions)
```

## Model Performance Report

Our model is based on a Random Forest classifier optimized for clinical
data. Below are the performance metrics.

1.  ROC Curve The model demonstrates strong predictive power with the
    following ROC curve:

<img src="man/figures/roc_curve.png" width="80%" />

2.  Feature Importance We identified “Number of Inpatient Visits” as the
    most critical predictor:

<img src="man/figures/feature_importance.png" width="80%" />

3.  Model Interpretation (SHAP) SHAP analysis reveals how specific
    features impact individual predictions:

<img src="man/figures/shap.png" width="80%" />

## Contributors:

Machine Learning Modeling: ShiyaChen

Shiny Web App: XinyaoTan

R Package Developer: JiakaiFan
