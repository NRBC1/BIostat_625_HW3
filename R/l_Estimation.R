#' information of coefficient
#'
#' @param x Interested variable used to fit the model.
#' @param y Output variable used to fit the model.
#' @param x_m The matrix of x.
#' @param y_m The matrix of y.
#' @param n Number of rows for x.
#' @param p Number of columns for x.
#'
#' @details l_Estimation use the output of function basic_linear to give more specific information.\cr
#' @return l_Estimation returns a list. The list contains the following components:\cr
#' #\tabular{rrrrr}{
#'
#'   \emph{betahat} \tab Coefficient estimates.\cr
#'   \emph{y_hat} \tab Predicted Y values.\cr
#'   \emph{epsilonhat} \tab The residual value.\cr
#'   \emph{var_betahat} \tab The matrix of variance and covaraince.\cr
#'   \emph{se_betahat} \tab The matrix of Standard Deviation.\cr
#'   \emph{sigma_squared} \tab The value of MSE.\cr
#'   \emph{degree} \tab The degree of freedom for t test.\cr
#' }
#'
#' @examples
#' library(datasets)\cr
#' data(iris)\cr
#' b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length Species",iris)
#' l_E <- l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]])
l_Estimation <- function(x,y,x_m,y_m,n,p){

  # Find all information of betahat
  betahat = solve(t(x_m)%*%x_m)%*%t(x_m)%*%y_m
  y_hat = x_m%*%betahat
  epsilonhat = y_m - y_hat
  sigma_squared = t(epsilonhat)%*%epsilonhat/(n-p)
  var_betahat = diag( solve(t(x_m)%*%x_m) )*c(sigma_squared)
  se_betahat = sqrt(var_betahat)
  degree=n-p

  return(list(betahat,y_hat,epsilonhat,var_betahat,se_betahat,sigma_squared,degree))
}
