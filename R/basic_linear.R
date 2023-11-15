#' @title basic_linear processing the raw data
#'
#'linear is used to find basic information about Simple Linear Regression and Multiple Linear Regression models with continuous variables.
#' @param Y Output variable in Equation :Y ~ X1 + X2... + Xn in character.
#' @param X The vector of interested variables in Equation :Y ~ X1 + X2... + Xn in character.
#' @param dataset Data frame containing the variables and response variable as column names.
#' @param intercept The indicator function of intercept. If user do not want intercept, this value is false.
#'
#'#'@details basic_linear takes an equation and a data set as arguments to fit a linear regression model represented by the equation.
#'The data set should contain the response variable and the variables present in the equation as column names.\cr The variables are treated as continuous.\cr linear then fits the model using the method of least squares.
#' @return basic_linear returns a list. The list contains the following components:\cr
#' #\tabular{rrrrr}{
#'
#'   \emph{dataset} \tab Equation used to fit the model.\cr
#'   \emph{y} \tab Output variable used to fit the model.\cr
#'   \emph{x} \tab Interested variable used to fit the model.\cr
#'   \emphn{n} \tab Number of rows for x.\cr
#'   \emph{p} \tab Number of columns for x.\cr
#'   \emph{x_m} \tab The matrix of x.\cr
#'   \emph{y_m} \tab The matrix of y.\cr
#'   \emph{x_v} \tab The vector of input X separate by " ".\cr
#'   \emph{Y} \tab The input varaible Y.\cr
#' }
#'
#' @examples
#' library(datasets)\cr
#' data(iris)\cr
#' b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length Species",iris)
basic_linear <- function(Y,X,dataset,intercept=TRUE){

  # Split the string into a vector
  x_v = unlist(strsplit(X, " "))
  data_v = c(Y,x_v)

  #input all the data
  dataset=na.omit(dataset[data_v])
  y = dataset[Y]
  x = dataset[x_v]

  #if the model need a intercept
  if (intercept){
    beta_0 = rep(1,nrow(x))
    x = cbind(beta_0,x)
  }

  # define design matrix, outcome, dimensions
  x_m = as.matrix(x)
  y_m = as.matrix(y)
  n = nrow(x)
  p = ncol(x)

  return(list(dataset,y,x,n,p,x_m,y_m,x_v,Y))
}
