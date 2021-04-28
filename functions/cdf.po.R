#-----------------------------------------------------------------------------
# This file compute the CDF at a point X from Proportional Odds Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


cdf.po <- function(fit, x){
  if (!inherits(fit, "ic_po")){ 
    stop("fit argument must be a ic_po object")
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
  
  # get uncensored Y's
  uncens.y <- fit$T_bull_Intervals[1,]

  #How many covarites?
  ncov <- dim(data.matrix(xx))[1]
  
  # Make CDF fit for all covariates (each row is a x, each column a t)
  po.fit.x <- 1 - matrix(unlist(icenReg::getSCurves(fit, newdata = (xx))$S_curves),
                     ncol = ncov)[2:(length(uncens.y)+1),]
  
  if (ncov == 1){
    po.fit.x <- matrix(po.fit.x, ncol = 1)
  }
  #Write as approximate function
  po.fit.x <-  sapply(1:ncov,function(i){
    stats::approxfun(uncens.y, po.fit.x[,i],
                     method = "linear", f = 0, ties = "ordered", rule = 2)
  }
  )
  names(po.fit.x) <- paste("x", 1:ncov, sep = "")
  
  class(po.fit.x[[1:ncov]]) <- c("cdf.po", "stepfun")
  attr(po.fit.x, "call") <- sys.call()
  po.fit.x
  
  
  
}