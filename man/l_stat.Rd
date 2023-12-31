% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/l_stat.R
\name{l_stat}
\alias{l_stat}
\title{statistical information}
\usage{
l_stat(betahat, se_betahat, sigma_squared, degree, x_m, y_m, y)
}
\arguments{
\item{betahat}{Coefficient estimates.}

\item{se_betahat}{The matrix of Standard Deviation.}

\item{sigma_squared}{The value of MSE.}

\item{degree}{The degree of freedom for t test.}

\item{x_m}{The matrix of x.}

\item{y_m}{The matrix of y.}

\item{y}{Output variable used to fit the model.}
}
\value{
l_stat returns a list. The list contains the following components:\cr
#\tabular{rrrrr}{
  \emph{SSY} \tab Sum of Square for Y.\cr
  \emph{MsqrtE} \tab Sum of Square for Y.\cr
  \emph{MSE} \tab Mean sum of square for error.\cr
  \emph{t_statistic} \tab The vector of t value for each variable.\cr
  \emph{p_value} \tab P-value for each variable's t value.\cr
  \emph{Ci_low} \tab The lower boundary for each confident interval.\cr
  \emph{Ci_up} \tab The Upper boundary for each confident interval.\cr

}
}
\description{
statistical information
}
\details{
l_stat use the output of function basic_linear and l_Estimation to give more specific information in statistics.\cr
}
\examples{
library(datasets)
data(iris)
b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length",iris)
l_E <- l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]])
l_s <- l_stat(l_E[[1]],l_E[[5]],l_E[[6]],l_E[[7]],b_l[[6]],b_l[[7]],b_l[[2]])
}
