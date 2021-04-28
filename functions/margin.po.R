#-----------------------------------------------------------------------------
# This file compute Marginal Effects at a point X from Proportional Odds Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


margin.po <- function(fit, x){
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

  # Compute baseline Proportional Odds
  uncens.y <- fit$T_bull_Intervals[1,]
  
  xnull <- data.frame(rep(0, length(fit$coefficients)))
  names(xnull) <- names(fit$coefficients)
  baseline <- icenReg::getSCurves(fit, newdata = xnull)$S_curves$`1`[2:(length(uncens.y)+1)]
  baseline <- (1 - baseline) / baseline
  baseline[length(uncens.y)] <- baseline[length(uncens.y)-1]
  
  
  # Make survival fit for all covariates (each row is a x, each column a t)
  #po.fit.x <- icenReg::getSCurves(fit, newdata = (xx))$S_curves
  
  #po.fit.x <- (matrix(unlist(po.fit.x), length(po.fit.x[[1]]), length(po.fit.x)))
  
  # Compute Marginal Effects for each t in the data
  # Here we must have in mind that ic_po estimate the inverse of the proportional odds!!!
  exp.xp <- t(matrix(exp (as.matrix(xx) %*% matrix(fit$coefficients))))
                   
                   
  mmpo <- - matrix(fit$coefficients * baseline) %*% exp.xp / 
                ((matrix(rep(baseline,dim(xx)[1]), ncol = dim(exp.xp)[2]) +
                  t(matrix(rep(exp.xp, length(baseline)), nrow = dim(exp.xp)[2])))^2)
    
    
  
  #Write as approximate function
  #How many covarites?
  ncov <- dim(data.matrix(xx))[1]
  
  #for (i in 1:ncov){
  #  assign(paste("mmcox",i,sep=''),
  #         stats::approxfun(cum.hazard[,2], mmcox[,i],
  #          method = "linear", f = 0, ties = "ordered", rule = 2))
  #}
  mmpo_list <-  sapply(1:ncov,function(i){
    stats::approxfun(uncens.y, mmpo[,i],
                     method = "linear", f = 0, ties = "ordered", rule = 2)
  }
  )
  names(mmpo_list) <- paste("x", 1:ncov, sep = "")
  #list2env(mmcox, envir = globalenv())
  
  class(mmpo_list[[1:ncov]]) <- c("margin.po", "stepfun")
  #assign("nobs", n, envir = environment(mmcox))
  attr(mmpo_list, "call") <- sys.call()
  #unlist(mmcox)
  mmpo_list
  
  
  
}