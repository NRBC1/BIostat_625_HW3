#' @Title Check significance of p-values and give symbols
#'
#' @param p_value a vector of p-values.
#'
#' @return\emph{significant_level} returns a vector, where each element is the p value  with a symbol denoting it's significant.\cr
#' \tabular{rrrrr}{
#'   \strong{Symbol} \tab \strong{Meaning}\cr
#'   \emph{***} \tab p_value<0.001\cr
#'   \emph{**} \tab p_value<0.01\cr
#'   \emph{*} \tab p_value<0.05\cr
#'   \emph{.} \tab p_value<0.1
#' }
#'
#' @examples
#' p_array <- c(4.3253e-7,0.22312,0.00222,1)
#' significant_level(p_array)
significant_level <- function(p_value){
  num_p <- as.numeric(p_value)
  for( i in 1:length(p_value)){
    if (num_p[i]<0.001) {
      p_value[i]<-paste(p_value[i],"***")
    } else if (num_p[i]<0.01) {
      p_value[i]<-paste(p_value[i],"**")
    } else if  (num_p[i]<0.05) {
      p_value[i]<-paste(p_value[i],"*")
    } else if  (num_p[i]<0.1) {
      p_value[i]<-paste(p_value[i],".")
    } else {
      p_value[i]
    }
  }
  return(p_value)

}
