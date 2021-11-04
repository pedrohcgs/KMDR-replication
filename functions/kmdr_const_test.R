#-----------------------------------------------------------------------------
# This function test if all slope coefficients are constant.

#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
kmdr_const_test <- function(fit,
                            nboot = NULL,
                            probs.min = 1e-8){
  if (!inherits(fit, "kmdr")){ 
    stop("fit argument must be a kmdr object")
  }
  xx <- as.matrix(fit$x)
  
  if (length(fit$coefficients[,1])!=dim(xx)[2]){
    # Dimension 
    stop("Dimension of covariates need to match the number of coefficients")
  }
  
  if (is.null(xx)==1) {
    stop ("must include vector of x")
  }
  
  if (is.null(nboot) == TRUE) nboot = 9999
  
  
  # get the thresholds and set up number of thresholds, dimension of covariates and sample size
  y <- fit$t.threshold
  n.tev <- length(y)
  n.col <- dim(xx)[2]
  n <- length(xx[,1] )
  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
  # Compute test statistics
  kmdr_coeff <- fit$coefficients[-1,]
  # average of coefficients over t
  average_coefficients_over_t <- base::rowMeans(kmdr_coeff)
  average_coefficients_over_t <- matrix(average_coefficients_over_t, 
                                        ncol = dim(kmdr_coeff)[2], 
                                        nrow = dim(kmdr_coeff)[1]
  )
  
  test_statistic_summand <-  kmdr_coeff - average_coefficients_over_t
  
  test_statistic <-  n * max(base::colSums(test_statistic_summand^2))
  #-----------------------------------------------------------------------------
  # Get Influence functions (depend on the link function)
  #-----------------------------------------------------------------------------
  probs.min <- probs.min
  
  if (fit$link == "logit"){
    # Estimate CDF: rows are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- stats::plogis((xx) %*% fit$coefficients)
    
    ext.fit <- base::sum((kmdr.fit.x < probs.min) + ((kmdr.fit.x > (1 - probs.min))))
    if(ext.fit>0) {
      warning("Fitted probabilities close to 0 or 1 occurred. We truncated them according to probs.min = ",probs.min)
    }
    # Avoid dividing by zero (computational trick)
    kmdr.fit.x[kmdr.fit.x < probs.min] <- probs.min
    kmdr.fit.x[kmdr.fit.x > (1 - probs.min)] <- 1 - probs.min
    #-----------------------------------------------------------------------------
    # Compute influence functions to get the bootstrap
    #-----------------------------------------------------------------------------
    # psi = derivative of 1/(1+exp(-u)) 
    psi <-  (kmdr.fit.x * (1 -  kmdr.fit.x)) # n.row= #observations, n.col = # of t; each column is one fixed t. 
    #-----------------------------------------------------------------------------
    # Get linear representation of the Score of KMDR (for each t, this should be a n by n.k matrix)
    # get the initial functional
    indicators <- base::outer(fit$outcome, y, "<=") #n by  n.tev
    phi.scale <- ((indicators - kmdr.fit.x) / (kmdr.fit.x * (1 - kmdr.fit.x))) * psi #n by n.tev
    phi <- array((xx), dim =  c(dim((xx)), n.tev)) # n by k by n.tev
    
    for (j in 1 : n.tev) {
      phi[, , j] <-  phi[, , j] * phi.scale[,j]
    }
    
    
    # Compute the Asy.lin.rep of the score
    zeta <- lr.kmdr(fit$outcome, fit$censor, phi) # n by k by n.tev
    
    #Get the second derivative of logit wrt index
    psi2 <- psi * (1 - 2 * kmdr.fit.x)
    #inverse of the Hessian matrix of KMDR coefficients
    s.term1 <- as.vector(fit$kmw) * ((psi2/psi) * (indicators - kmdr.fit.x))
    h.term1 <- as.vector(fit$kmw) * (indicators - kmdr.fit.x)^2
    
    var.term <- -(s.term1 -h.term1)

    Hessian_kmdr <- array(0, dim = c(n.col, n.col, n.tev ))
    Hessian_kmdr_inv <- Hessian_kmdr
    
    for (j in 1:n.tev){
      Hessian_kmdr[,,j] <- base::crossprod(var.term[,j]*xx, xx)
      Hessian_kmdr_inv[,,j] <- MASS::ginv(Hessian_kmdr[,,j], tol = 0)
    }
    
    # Compute the Asymptotic linear representation of the KMDR coefficients
    lin_rep_kmdr <- zeta
    for (j in 1:n.tev){
      lin_rep_kmdr[,,j] <- zeta[,,j] %*% Hessian_kmdr_inv[,,j]
    }
    
    # Drop the intercept
    lin_rep_kmdr <- lin_rep_kmdr[,-1,]
    #-----------------------------------------------------------------------------
    # Compute bootstrapped test statistic
    b_test_statistics <- boot_kmdr_const_test(lin_rep_kmdr = lin_rep_kmdr, 
                                              test_statistic_summand = test_statistic_summand,
                                              kmdr_coeff = kmdr_coeff,
                                              nboot = nboot)
    #-----------------------------------------------------------------------------
    # Return
    p_value <- b_test_statistics$p_value
    crit_val <- b_test_statistics$crit_value
    
  }
  
  if (fit$link == "cloglog"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    exp.xb <- exp(xx %*% fit$coefficients)
    kmdr.fit.x <- - base::expm1(-exp.xb)
    
    ext.fit <- base::sum((kmdr.fit.x < probs.min) + ((kmdr.fit.x > (1 - probs.min))))
    if(ext.fit>0) {
      warning("Fitted probabilities close to 0 or 1 occurred. We truncated them according to probs.min = ",probs.min)
    }
    # Avoid dividing by zero (computational trick)
    kmdr.fit.x[kmdr.fit.x < probs.min] <- probs.min
    kmdr.fit.x[kmdr.fit.x > (1 - probs.min)] <- 1 - probs.min
    
    #truncated version
    exp.xb <- - base::log(1 - kmdr.fit.x)
    #-----------------------------------------------------------------------------
    # Compute influence functions to get the bootstrap
    #-----------------------------------------------------------------------------
    # Get derivative of link function
    # psi
    psi <-  (1 -  kmdr.fit.x) * exp.xb # n.row= n, n.col = # of t; each column is a fixed t.
    #-----------------------------------------------------------------------------
    # Get linear representation of the Score of KMDR (for each t, this should be a n by n.k matrix)
    # get the initial functional
    indicators <- base::outer(fit$outcome, y, "<=") #n by  n.tev
    phi.scale <- psi * (indicators - kmdr.fit.x) / (kmdr.fit.x * (1 - kmdr.fit.x)) #n by n.tev
    phi <- array(0, dim =  c(dim((xx)), n.tev)) # n by k by n.tev
    
    for (j in 1 : n.tev) {
      phi[, , j] <-  xx * phi.scale[,j]
    }
    
    # Compute the Asy.lin.rep of the score
    zeta <- lr.kmdr(fit$outcome, fit$censor, phi) # n by k by n.tev
    
    
    #Get the second derivative of cloglog distribution wrt index
    psi2 <- psi * (1 - exp.xb)
    #inverse of the Hessian matrix of KMDR coefficients
    s.term1 <- as.vector(fit$kmw) * (indicators - kmdr.fit.x) * (psi2/(kmdr.fit.x * (1 - kmdr.fit.x)))
    
    h.term11 <- as.vector(fit$kmw) * (((1 - kmdr.fit.x) * psi / (kmdr.fit.x * (1 - kmdr.fit.x)))^2) * indicators
    h.term12 <- as.vector(fit$kmw) * (( kmdr.fit.x * psi/(kmdr.fit.x * (1 - kmdr.fit.x)))^2) * (1 - indicators)
    
    h.term1 <- h.term11 + h.term12
    
    # term for minus the Hessian
    var.term <- -(s.term1 -h.term1)
    
    
    Hessian_kmdr <- array(0, dim = c(n.col, n.col, n.tev ))
    Hessian_kmdr_inv <- Hessian_kmdr
    for (j in 1:n.tev){
      Hessian_kmdr[,,j] <- base::crossprod(var.term[,j]*xx, xx)
      Hessian_kmdr_inv[,,j] <- MASS::ginv(Hessian_kmdr[,,j], tol = 0)
    }
    
    
    # Compute the Asymptotic linear representation of the KMDR coefficients
    lin_rep_kmdr <- zeta
    for (j in 1:n.tev){
      lin_rep_kmdr[,,j] <- zeta[,,j] %*% Hessian_kmdr_inv[,,j]
    }
    
    # Drop the intercept
    lin_rep_kmdr <- lin_rep_kmdr[,-1,]
    #-----------------------------------------------------------------------------
    # Compute bootstrapped test statistic
    b_test_statistics <- boot_kmdr_const_test(lin_rep_kmdr = lin_rep_kmdr, 
                                              test_statistic_summand = test_statistic_summand,
                                              kmdr_coeff = kmdr_coeff,
                                              nboot = nboot)
    #-----------------------------------------------------------------------------
    # Return
    p_value <- b_test_statistics$p_value
    crit_val <- b_test_statistics$crit_value
    

  }
  
  if (fit$link == "probit"){
    stop("We currently do not support probit link function for inference procedures.")
  }
  #-----------------------------------------------------------------------------
  #return adme, it's upper and lower bound as well as the ci level.
  return(list(test_statistic = test_statistic, 
              p_value = p_value,
              crit_val = crit_val))
  
}