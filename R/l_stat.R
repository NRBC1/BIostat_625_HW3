#'statistical information
#'
#' @param betahat Coefficient estimates.
#' @param se_betahat The matrix of Standard Deviation.
#' @param sigma_squared The value of MSE.
#' @param degree The degree of freedom for t test.
#' @param x_m The matrix of x.
#' @param y_m The matrix of y.
#' @param y Output variable used to fit the model.
#'
#'@details l_stat use the output of function basic_linear and l_Estimation to give more specific information in statistics.\cr
#' @return l_stat returns a list. The list contains the following components:\cr
#' #\tabular{rrrrr}{
#'   \emph{SSY} \tab Sum of Square for Y.\cr
#'   \emph{MsqrtE} \tab Sum of Square for Y.\cr
#'   \emph{MSE} \tab Mean sum of square for error.\cr
#'   \emph{t_statistic} \tab The vector of t value for each variable.\cr
#'   \emph{p_value} \tab P-value for each variable's t value.\cr
#'   \emph{Ci_low} \tab The lower boundary for each confident interval.\cr
#'   \emph{Ci_up} \tab The Upper boundary for each confident interval.\cr
#'
#' }
#'
#' @examples
#' library(datasets)
#' data(iris)
#' b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length",iris)
#' l_E <- l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]])
#' l_s <- l_stat(l_E[[1]],l_E[[5]],l_E[[6]],l_E[[7]],b_l[[6]],b_l[[7]],b_l[[2]])
l_stat<- function(betahat,se_betahat,sigma_squared,degree,x_m,y_m,y){

  #find all statistical information
  y_mean = mean(y_m)
  t_statistic = c(betahat/se_betahat)
  t_1 = qt(0.975,degree)
  p_value = c(2*( 1-pt(q=abs(t_statistic),df=degree) ))

  Ci_low = betahat-t_1*se_betahat
  Ci_up = betahat+t_1*se_betahat

  SSY=sum((y-y_mean)^2)
  MSE=sigma_squared[1,1]
  MsqrtE=sqrt(sigma_squared)

  return(list(SSY,MsqrtE,MSE,t_statistic,p_value,Ci_low,Ci_up))
}
