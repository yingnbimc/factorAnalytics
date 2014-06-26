#' @title Prints out a fitted time series factor model object
#' 
#' @description S3 \code{print} method for object of class \code{tsfm}. Prints 
#' the call, factor model dimension, regression coefficients, r-squared and 
#' residual volatilities from the fitted object. 
#' 
#' @param x an object of class \code{tsfm} produced by \code{fitTSFM}.
#' @param digits an integer value, to indicate the required number of 
#' significant digits. Default is 3.
#' @param ... optional arguments passed to the \code{print} method.
#'    
#' @author Yi-An Chen and Sangeetha Srinivasan
#' 
#' @seealso \code{\link{fitTSFM}}
#' 
#' @examples
#' data(managers.df)
#' fit <- fitTSFM(asset.names=colnames(managers.df[,(1:6)]),
#'                factor.names=colnames(managers.df[,7:9]), 
#'                market.name="SP500.TR",
#'                data=data, fit.method="OLS", variable.selection="none", 
#'                add.up.market=TRUE, add.market.sqd=TRUE)
#' print(fit)
#' 
#' @export
#' 

print.tsfm <- function(x, digits=max(3, .Options$digits - 3), ...){
  if(!is.null(cl <- x$call)){
    cat("\nCall:\n")
    dput(cl)
  }
  cat("\nFactor Model dimensions:\n")
  tmp <- c(dim(t(x$beta)), nrow(x$data))
  names(tmp) <- c("#Factors", "#Assets", "#Periods")
  print(tmp)
  cat("\nRegression Alphas:\n")
  print(x$alpha , digits = digits, ...)
  cat("\nFactor Betas:\n")
  print(t(x$beta), digits = digits, ...)
  cat("\nRegression R-squared values:\n")
  print(x$r2, digits = digits, ...)
  cat("\nResidual Volatilities:\n")
  print(x$resid.sd, digits = digits, ...)
}
