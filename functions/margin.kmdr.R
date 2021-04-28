#-----------------------------------------------------------------------------
# This file compute Marginal effects at a point X  from Kaplan-Meier 
# Distributional Regression Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
margin.kmdr <- function(fit, x){
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
    
    
    # Compute Average Marginal Effects for each t in the data
    # derivative of 1/(1+exp(-xb))
    mmkmdr <-  (fit$coefficients[-1,] * 
                        t(exp(-as.matrix(cbind(1,xx)) %*% fit$coefficients) * kmdr.fit.x^2))
  }
  
  if (fit$link == "probit"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- stats::pnorm(as.matrix(cbind(1, xx))%*% fit$coefficients)
    
    # Compute Average Marginal Effects for each t in the data
    # derivative of phi(x'b), where phi is the normal CDF
    mkmdr <-  fit$coefficients[-1,] * t(stats::dnorm(as.matrix(cbind(1, xx))%*% fit$coefficients))

  }
  
  if (fit$link == "cloglog"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- 1 - exp(- exp(as.matrix(cbind(1, xx))%*% fit$coefficients))
    
    # Compute Average Marginal Effects for each t in the data
    # derivative of 1- exp(-exp(x'b))
    mmkmdr <-  fit$coefficients[-1,] * t((1 - kmdr.fit.x) * (exp(as.matrix(cbind(1, xx))%*% fit$coefficients)))
  }
  
  #Write as approximate function
  #How many covarites?
  ncov <- dim(data.matrix(xx))[1]
  
  #for (i in 1:ncov){
  #  assign(paste("mmcox",i,sep=''),
  #         stats::approxfun(cum.hazard[,2], mmcox[,i],
  #          method = "linear", f = 0, ties = "ordered", rule = 2))
  #}
  mmkmdr <-  sapply(1:ncov,function(i){
    stats::approxfun(y, mmkmdr[,i],
                     method = "linear", f = 0, ties = "ordered", rule = 2)
  }
  )
  names(mmkmdr) <- paste("x", 1:ncov, sep = "")
  #list2env(mmcox, envir = globalenv())
  
  class(mmkmdr[[1:ncov]]) <- c("margin.kmdr", "stepfun")
  attr(mmkmdr, "call") <- sys.call()
  mmkmdr
  
  
  
}
