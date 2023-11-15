#' Create A Summary Table
#'
#' @param b_l basic_linear
#' @param l_E information of coefficient
#' @param l_s statistical information
#'
#' @return All the following result from the model fit:\cr
#' Function call for \emph{linear}\cr and \emph{significant_level}\cr
#' Summary statistics of residuals\cr
#' Coefficient estimates and p-values\cr
#' The confident interval of all variables\cr
#' Residual standard error\cr
#' Multiple R-squared & Adjusted R-squared\cr
#'
#' @examples
#' library(datasets)
#' data(iris)
#' b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length",iris)
#' l_E <- l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]])
#' l_s <- l_stat(l_E[[1]],l_E[[5]],l_E[[6]],l_E[[7]],b_l[[6]],b_l[[7]],b_l[[2]])
#' summary_linear(b_l,l_E,l_s)
summary_linear <- function(b_l,l_E,l_s){

  x = b_l[[3]]
  y = b_l[[2]]

  Beta_hat <-l_E[[1]]
  se <- l_E[[5]]
  t_information <- l_s[[4]]
  p_value <- sapply(t_information,function(i) pt(abs(i),nrow(y)-ncol(x),lower.tail=FALSE)*2)
  p_valueplus <- significant_level(p_value)
  sse <- l_s[[3]]*(b_l[[4]]-b_l[[5]])
  mse <- l_s[[2]][1,1]
  Ci_low <- l_s[[6]]
  Ci_up <- l_s[[7]]
  DF <- b_l[[4]]-b_l[[5]]
  DF2 <- b_l[[5]]-1

  formula = paste(b_l[[9]],paste(b_l[[8]], collapse = " + ") , sep = " ~ ")
  print(formula)

  table1 <- data.frame("Estimate" = Beta_hat,
                       "Std. Error" = se,
                       "t value" = t_information,
                       "Pr(>|t|)" = p_valueplus,check.names = FALSE)
  print("Coefficients:")
  print(as.matrix(table1))
  cat("Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1","\n")
  print("Confident Interval:")
  table2 <- data.frame("2.5%CI"=Ci_low,
                       "97.5%CI"=Ci_up)
  print(as.matrix(table2))
  cat("\n",
      paste("Residual standard error: ",mse," on",DF," degrees of freedom"),"\n",
      paste("Multiple R-squared:  ",1-(sse/l_s[[1]]),"   Adjusted R-squared:  ",1-(sse/DF)/(l_s[[1]]/(DF+DF2))),"\n",
      sep="")
}
