#-----------------------------------------------------------------------------
# This file compute Average Marginal effects from Cox Model
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


av.margin.cox<- function(fit,
                         x = NULL, 
                         coeff = 1){
  if (!inherits(fit, "coxph")){ 
    stop("fit argument must be a coxph object")
  }
  xx <- x
  if (is.null(x)==T){
    # if you impose a vector of x to compute AME, use these
    xx <- fit$x
  }
  if (length(fit$coefficients)!=dim(xx)[2]){
    # Dimension 
    stop("Dimension of covariates need to match the number of coefficients")
  }
  
  
  if (is.null(xx)==1) {
    stop ("must include vector of x")
  }
  # Compute Cumulative hazard
  cum.hazard <- survival::basehaz(fit, centered=F)
  # Sample size
  n <- length(xx[,1] )
  # unique t's
  # Make survival fit for all covariates (each row is a x, each column a t)
  cox.fit.x <- exp(- matrix(cum.hazard[, 1],
                            length(cum.hazard[, 1]), 1) %*%
                     t(exp(xx %*% matrix(fit$coefficients))))
  
  # Compute Average Marginal Effects for each t in the data
  mcox <-  rowSums(fit$coefficients[coeff] * cox.fit.x *
                     ( matrix(cum.hazard[, 1],
                              length(cum.hazard[, 1]), 1) %*%
                              t(exp(xx %*% matrix(fit$coefficients))))) / n
  
  #Write as approximate fu
  mcox <- stats::approxfun(cum.hazard[,2], mcox,
                           method = "linear", f = 0, ties = "ordered", 
                           rule = 2)
  
  class(mcox) <- c("av.margin.cox", "stepfun")
  assign("nobs", n, envir = environment(mcox))
  attr(mcox, "call") <- sys.call()
  mcox
  
  
  #mcox <- cbind(mcox, fit$y[,1])
  #colnames(mcox) <- c(" Average Marginal Effect", "Time")
  
}