#-----------------------------------------------------------------------------
# This file compute Average Marginal effects from Proportional Odds Model
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


av.margin.po <- function(fit, x = NULL){
  if (!inherits(fit, "ic_po")){ 
    stop("fit argument must be a ic_po object")
  }
  xx <- x
  if (is.null(x)==T){
    # if you impose a vector of x to compute AME, use these
    #xx <- fit$pca_info$x * fit$pca_info$scale + fit$pca_info$center 
    formula <- fit$formula
    
    formula[[2]] <- NULL
    
    xx <- as.matrix(model.matrix(formula, fit$getRawData())[,-1])
    
    
  }
  if (length(fit$coefficients)!=dim(xx)[2]){
    # Dimension 
    stop("Dimension of covariates need to match the number of coefficients")
  }
  
  if (is.null(xx)==1) {
    stop ("must include vector of x")
  }
  
  
  # Compute baseline Proportional Odds
  uncens.y <- as.numeric(fit$T_bull_Intervals[1,])
  
  xnull <- data.frame(rep(0, length(fit$coefficients)))
  names(xnull) <- names(fit$coefficients)
  baseline <- icenReg::getSCurves(fit, newdata = xnull)$S_curves$`1`[2:(length(uncens.y)+1)]
  baseline <- (1 - baseline) / baseline
  baseline[length(uncens.y)] <- as.numeric(baseline[length(uncens.y)-1])
  
  
  # Sample size
  #n <- length(fit$pca_info$x[,1])
  n <- dim(xx)[1]
  
  # Make survival fit for all covariates (each row is a x, each column a t)
  #po.fit.x <- icenReg::getSCurves(fit, newdata = (xx))$S_curves
  
  #po.fit.x <- (matrix(unlist(po.fit.x), length(po.fit.x[[1]]), length(po.fit.x)))
  
  # Compute Marginal Effects for each t in the data
  # Here we must have in mind that ic_po estimate the inverse of the proportional odds!!!
  exp.xp <- t(matrix(exp (as.matrix(xx) %*% matrix(fit$coefficients))))
  
  
  mpo <- rowSums (- matrix(fit$coefficients * baseline) %*% exp.xp / 
    ((matrix(rep(baseline,dim(xx)[1]), ncol = dim(exp.xp)[2]) +
        t(matrix(rep(exp.xp,length(baseline)), nrow = dim(exp.xp)[2])))^2)) / n
  
  mpo <- as.numeric(mpo)
  
  
  #Write as approximate funciton
  mpo <- stats::approxfun(uncens.y, mpo,
                           method = "linear", f = 0, ties = "ordered", rule = 2)
  
  class(mpo) <- c("av.margin.po", "stepfun")
  assign("nobs", n, envir = environment(mpo))
  attr(mpo, "call") <- sys.call()
  mpo

  
}