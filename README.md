# BIostat_625_HW3
<!-- badges: start -->
  [![R-CMD-check](https://github.com/NRBC1/BIostat_625_HW3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/NRBC1/BIostat_625_HW3/actions/workflows/R-CMD-check.yaml)
  [![Codecov test coverage](https://codecov.io/gh/NRBC1/BIostat_625_HW3/branch/main/graph/badge.svg)](https://app.codecov.io/gh/NRBC1/BIostat_625_HW3?branch=main)
<!-- badges: end -->
# R Package to operate linear regression
HW3.625 is a simplified package designed to facilitate regression analysis in R, mainly focusing on linear models. 

## Description
The package contains custom implementations of functions such as basic_linear() and l_Estimation(), making the process of fitting a Linear Regression model and viewing a summary of the regression results more accessible for user.

The model is given by:
$Y = X_1 + X_2 + ... + X_n + e$

Comparing with the existing function lm() and summary(), it divide the information and data in lm() more reasonable and also give confident interval for each estimator in the model, which could be more easier to write statistical report just using one summary table.

## Usage
This package need R environment. After install this package, library this package and use the function in it. 

## Functions
basic_linear():basic_linear() is used to find basic information about Simple Linear Regression and Multiple Linear Regression models with continuous variables.

l_Estimation():After using basic_linear(), we can put all the information in this function to get some estimated value of this model.

l_stat():The final step of linear regression is using this function to get statistical information.

summary_linear():Using three function shown above, this function will display the result table of a linear regression model fitted which is similar as summary() but adding the confident interval.

significant_level():This function is mainly used in summary_linear() to how the significance of p-values of the coefficient estimates from the fitted model with a specific symbol making its more readable.

## Example
Input data set iris
library(datasets)
data(iris)

Then apply three functions in right order to get different output lists.
b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length",iris)
l_E <- l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]])
l_s <- l_stat(l_E[[1]],l_E[[5]],l_E[[6]],l_E[[7]],b_l[[6]],b_l[[7]],b_l[[2]])

Using summary function to give a result table.
summary_linear(b_l,l_E,l_s)
model <- lm(Sepal.Length~Sepal.Width+Petal.Length,data=iris)

Using function bench::mark() could have a brief understanding about the efficiency of this package, however, since the outcome is not exactly equal to summary(), system.time() would be better to do the comparison.
The code is shown below:

system.time(basic_linear("Sepal.Length", "Sepal.Width Petal.Length",iris))
system.time(l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]]))
system.time(l_stat(l_E[[1]],l_E[[5]],l_E[[6]],l_E[[7]],b_l[[6]],b_l[[7]],b_l[[2]]))
system.time(summary_linear(b_l,l_E,l_s))

system.time(lm(Sepal.Length~Sepal.Width+Petal.Length,data=iris))
system.time(summary(model))

library(bench)
result <- bench::mark(as.numeric(model_test1[[1]]),as.numeric(model_refer$coefficients))
print(result)

## Contribution
Zhouchi Ni
