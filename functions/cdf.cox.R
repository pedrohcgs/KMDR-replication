#-----------------------------------------------------------------------------
# This file compute the CDF at a point X from Cox Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


cdf.cox <- function(fit, x){
  if (!inherits(fit, "coxph")){ 
    stop("fit argument must be a coxph object")
  }
  if (is.null(x)==T){
    stop("must provide the covariate values to evaluate")
  }
  if (is.data.frame(x)==F){
    stop("x argument must be a data frame")
  }
  
  if (names(x)!=names(fit$coefficients)){
    stop("x argument must be a data frame with same names as the covariates used")
  }
  
  xx <- x
  
  # Compute Cumulative hazard
  cum.hazard <- survival::basehaz(fit, centered=F)
  
  # Make CDF fit for all covariates (each column is a x, each row a t)
  cox.fit.x <- 1 - survival::survfit(fit, newdata = (xx),
                                 centered=F)$surv
  
  #Write as approximate function
  #How many covarites?
  ncov <- dim(data.matrix(xx))[1]
  
  if (ncov ==1){
    cox.fit.x <- (matrix(cox.fit.x, ncol = 1))
  }
  
  cox.fit.x <-  sapply(1:ncov,function(i){
    stats::approxfun(cum.hazard[,2], cox.fit.x[,i],
                     method = "linear", f = 0, ties = "ordered", rule = 2)
  }
  )
  names(cox.fit.x) <- paste("x", 1:ncov, sep = "")
  

  class(cox.fit.x[[1:ncov]]) <- c("cdf.cox", "stepfun")
  attr(cox.fit.x, "call") <- sys.call()
  cox.fit.x
  
  
  
}
