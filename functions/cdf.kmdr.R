#-----------------------------------------------------------------------------
# This file compute the CDF at a point X from Kaplan-Meier
# Distributional Regression Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
cdf.kmdr <- function(fit, x){
  if (!inherits(fit, "kmdr")){ 
    stop("fit argument must be a kmdr object")
  }
  if (is.null(x)==T){
    stop("must provide the covariate values to evaluate")
  }
  if (is.data.frame(x)==F){
    stop("x argument must be a data frame")
  }
  
  if (names(x)!=rownames(fit$coefficients)[-1]){
    stop("x argument must be a data frame with same names as the covariates used")
  }
  
  xx <- x
  
  # get the thresholds
  y <- fit$t.threshold
  
  
  if (fit$link == "logit"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- stats::plogis(as.matrix(cbind(1, xx))%*% fit$coefficients)
  }
  
  if (fit$link == "probit"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- stats::pnorm(as.matrix(cbind(1, xx))%*% fit$coefficients)
  }
  
  if (fit$link == "cloglog"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- 1 - exp(- exp(as.matrix(cbind(1, xx))%*% fit$coefficients))
  }
  
  #Write as approximate function
  #How many covarites?
  ncov <- dim(data.matrix(xx))[1]

  kmdr.fit.x <-  sapply(1:ncov,function(i){
    stats::approxfun(y, (kmdr.fit.x[i,]),
                     method = "linear", f = 0, ties = "ordered", rule = 2)
  }
  )
  names(kmdr.fit.x) <- paste("x", 1:ncov, sep = "")
  #list2env(mmcox, envir = globalenv())
  
  class(kmdr.fit.x[[1:ncov]]) <- c("cdf.kmdr", "stepfun")
  attr(kmdr.fit.x, "call") <- sys.call()
  kmdr.fit.x
  
  
}
