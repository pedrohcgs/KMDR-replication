#-----------------------------------------------------------------------------
# This file compute Marginal Effects at a point X from Cox Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


margin.cox <- function(fit, x){
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

  # Make survival fit for all covariates (each column is a x, each row a t)
  cox.fit.x <- survival::survfit(fit, newdata = (xx),
                                 centered=F)$surv
  
  # Compute Marginal Effects for each t in the data
  n <- dim(cum.hazard)[1]
  mmcox <- fit$coefficients * 
          cox.fit.x *
          (matrix(cum.hazard[, 1], n, 1) %*% t(exp(as.matrix(xx) %*% matrix(fit$coefficients))))
  
  #Write as approximate function
  #How many covarites?
  ncov <- dim(data.matrix(xx))[1]
  
  #for (i in 1:ncov){
  #  assign(paste("mmcox",i,sep=''),
  #         stats::approxfun(cum.hazard[,2], mmcox[,i],
  #          method = "linear", f = 0, ties = "ordered", rule = 2))
  #}
  mmcox <- sapply(1:ncov, function(i){
     stats::approxfun(cum.hazard[,2], mmcox[,i],
                      method = "linear", f = 0, ties = "ordered", rule = 2)
   }
   )
  names(mmcox) <- paste("x", 1:ncov, sep = "")
  #list2env(mmcox, envir = globalenv())
  
  class(mmcox[[1:ncov]]) <- c("margin.cox", "stepfun")
  #assign("nobs", n, envir = environment(mmcox))
  attr(mmcox, "call") <- sys.call()
  #unlist(mmcox)
  mmcox
  

  
}
