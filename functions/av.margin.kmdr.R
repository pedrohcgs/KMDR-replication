#-----------------------------------------------------------------------------
# This file compute Average Marginal effects from Kaplan-Meier Distributional
# Regression Model - only one marginal effect
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
av.margin.kmdr <- function(fit,
                           x = NULL,
                           coeff = 2,
                           inference = TRUE,
                           nboot = NULL, 
                           ci = 90,
                           standardize = FALSE,
                           center = FALSE,
                           probs.min = 1e-8,
                           inf_function = FALSE){
  if (!inherits(fit, "kmdr")){ 
    stop("fit argument must be a kmdr object")
  }
  xx <- x
  if (is.null(x)==TRUE){
    # if you impose a vector of x to compute AME, use these
    xx <- as.matrix(fit$x)
  }
  if (length(fit$coefficients[,1])!=dim(xx)[2]){
    # Dimension 
    stop("Dimension of covariates need to match the number of coefficients")
  }
  
  if (is.null(xx)==1) {
    stop ("must include vector of x")
  }
  
  if (length(coeff)!=1){
    # Code only works for a single ADME(t) 
    stop("At this stage, code only works to compute a single ADME(t) at a time.")
  }
  
  if (is.null(nboot) == TRUE) nboot = 9999
  
  if (inference == TRUE){
    if (ci %in% c(90,95,99) == F){
      # Code only works for a ci equal to 90, 95 or 99 
      stop("Confidence interval level ci must be either 90, 95 or 99")
    }
  }
  
  # get the thresholds and set up number of thresholds, dimension of covariates and sample size
  y <- fit$t.threshold
  n.tev <- length(y)
  n.col <- dim(xx)[2]
  n <- length(xx[,1] )
  #-----------------------------------------------------------------------------
  # Initialize statistics related to outcome of the code when inference is not to be displayed
  point.lb = NULL; point.ub = NULL; unif.lb = NULL; unif.ub = NULL
  #-----------------------------------------------------------------------------
  probs.min <- probs.min
  if (fit$link == "logit"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- stats::plogis((xx) %*% fit$coefficients)
    
    ext.fit <- base::sum((kmdr.fit.x < probs.min) + ((kmdr.fit.x > (1 - probs.min))))
    if(ext.fit>0) {
      warning("Fitted probabilities close to 0 or 1 occurred. We truncated them according to probs.min = ",probs.min)
    }
    # Avoid dividing by zero (computational trick)
    kmdr.fit.x[kmdr.fit.x < probs.min] <- probs.min
    kmdr.fit.x[kmdr.fit.x > (1 - probs.min)] <- 1 - probs.min
    #-----------------------------------------------------------------------------
    # Compute Average Marginal Effects for each t in the data
    # psi = derivative of 1/(1+exp(-u)) 
    psi <-  (kmdr.fit.x * (1 -  kmdr.fit.x)) # n.row= #observations, n.col = # of t; each column is one fixed t. 
    # Get the summands for the KMDR estimator of the ADME
    kmdr.adme <- fit$coefficients[coeff,] * t(psi)
    kmdr.adme <- t(kmdr.adme)  #n by n.tev
    #-----------------------------------------------------------------------------
    #KMDR estimator of the ADME
    mkmdr <- base::colMeans(kmdr.adme) #
    #-----------------------------------------------------------------------------
    if(inference==TRUE){
      
      # Compute influence function
      #-----------------------------------------------------------------------------
      # 1st term: beta_0 * psi(x'b) - En[beta_0 * psi(x'b)]
      inf1 <- t(t(kmdr.adme) - mkmdr )
      #-----------------------------------------------------------------------------
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
      
      if (center == TRUE){
        # Let's center zeta just in case
        zeta.mean <- array(0, dim =  c(dim((xx)), n.tev)) # n by k by n.tev
        
        for (j in 1 : n.tev) {
          zeta.mean[, , j] <-  base::matrix(base::colMeans(zeta[,,j]), nrow = n, ncol = dim(xx)[2], byrow=T)
        }
        
        zeta <- zeta - zeta.mean
      }
      
      #Singularity test
      #singular.test <- 0
      #for (j in 1 : n.tev) {
      #  singular.test <-  singular.test + 
      #matrixcalc::is.singular.matrix(base::crossprod(zeta[, , j])/n, tol = 1e-16)
      #}
      #if(singular.test>0){
      #  warning("The Covariance matrix associated with the KM score may be close to singular.
      #  Proceed with caution")
      #}
      
      
      #Get the second derivative of logit wrt index
      psi2 <- psi * (1 - 2 * kmdr.fit.x)
      #inverse of the Hessian matrix of KMDR coefficients
      s.term1 <- as.vector(fit$kmw) * ((psi2/psi) * (indicators - kmdr.fit.x))
      h.term1 <- as.vector(fit$kmw) * (indicators - kmdr.fit.x)^2
      
      var.term <- -(s.term1 -h.term1)
      #s.term <- array(0, dim = c(n.col, n.col, n.tev ))
      #h.term <- array(0, dim = c(n.col, n.col, n.tev ))
      Hessian.kmdr <- array(0, dim = c(n.col, n.col, n.tev ))
      Hessian.kmdr.inv <- Hessian.kmdr
      
      for (j in 1:n.tev){
        #s.term[,,j] <- base::crossprod(s.term1[,j]*xx, xx)
        #h.term[,,j] <- base::crossprod(h.term1[,j]*xx, xx)
        Hessian.kmdr[,,j] <- base::crossprod(var.term[,j]*xx, xx)
        #Hessian.kmdr.inv[,,j] <- solve(Hessian.kmdr[,,j])
        Hessian.kmdr.inv[,,j] <- MASS::ginv(Hessian.kmdr[,,j], tol = 0)
        #Hessian.kmdr.inv[,,j] <- base::solve(-(s.term[,,j] - h.term[,,j]))
        #Hessian.kmdr.inv[,,j] <- MASS::ginv(-(s.term[,,j] - h.term[,,j]))
        #Hessian.kmdr.inv[,,j] <- MASS::ginv(-(s.term[,,j] - h.term[,,j]), tol = 0)
        #Hessian.kmdr.inv[,,j] <- matlib::Ginv(-(s.term[,,j] - h.term[,,j]))
      }
      
      
      if (center == TRUE){
        # Compute the KM average of the score
        phi.m.m.t <- array(0, dim = c(n.col, n.col, n.tev )) # n by k by n.tev
        
        for (j in 1 : n.tev) {
          phi.m.m.t[, , j] <-  base::tcrossprod(base::colSums(fit$kmw * phi[,,j]))
          
        }
        
        Hessian.kmdr <- Hessian.kmdr + phi.m.m.t
        
        for (j in 1 : n.tev) {
          Hessian.kmdr.inv[,,j] <- MASS::ginv(Hessian.kmdr[,,j], tol = 0)
        }
        
      }
      # Compute the Asymptotic linear representation of the KMDR coefficients
      lin.rep.kmdr <- zeta
      for (j in 1:n.tev){
        lin.rep.kmdr[,,j] <- zeta[,,j] %*% Hessian.kmdr.inv[,,j]
      }
      #-----------------------------------------------------------------------------
      #3rd term of the lin.rep of the ADME: beta_hat * mean(psi^2 * X') * lin.rep.kmdr
      # Compute the mean(psi^2 * X')
      mean.psi2.X <- t(base::crossprod(xx, psi2) / n)  # n.tev by n.k
      # product of beta_hat * meanps2.X
      aux2 <- (fit$coefficients[coeff,] * mean.psi2.X) 
      
      inf3 <- matrix(0, n, n.tev)
      for (j in 1:n.tev){
        inf3[,j] <- lin.rep.kmdr[,,j] %*% (as.matrix(aux2[j,]))
      }
      #-----------------------------------------------------------------------------
      #2nd term now
      #lin.rep.kmdr.beta22 <- lin.rep.kmdr[, coeff, ]
      selection.matrix <- matrix(0, ncol = n.col, nrow = length(coeff) ) #n.coeff by n.col
      for (j in 1:length(coeff)){
        selection.matrix[j, coeff[j]] <- 1
      }
      
      lin.rep.kmdr.beta <- array(0, dim = c(n, length(coeff), n.tev))
      for (j in 1:n.tev){
        lin.rep.kmdr.beta[,,j] <- base::tcrossprod(lin.rep.kmdr[,,j], selection.matrix)
      }
      
      mean.psi <- base::colMeans(psi) # Vector ot n.tev means 
      
      mean.psi2 <- array(0, dim = c(n,length(coeff), n.tev))
      for(j in 1:n.tev){
        mean.psi2[,,j] <- mean.psi[j]
      }
      
      inf2 <-   lin.rep.kmdr.beta * mean.psi2
      #-----------------------------------------------------------------------------
      #linear representation of the ADME <- So far, only works for scalar!!
      lin.rep.adme <- inf1 + inf2[,1,] + inf3
      #-----------------------------------------------------------------------------
      #-----------------------------------------------------------------------------
      # Compute bootstrapped critival values
      b.kmdr.adme <- boot.adme.kmdr(lin.rep.adme, nboot)
      #-----------------------------------------------------------------------------
      #Compute confidence intervals
      if(ci==90) z.ind=1
      if(ci==95) z.ind=2
      if(ci==99) z.ind=3
      
      unif.ci.adme <- b.kmdr.adme$unif.crit.val[z.ind] * b.kmdr.adme$boot.se
      point.ci.adme <- b.kmdr.adme$p.crit.val[,z.ind] * b.kmdr.adme$boot.se
      
      unif.lb <- mkmdr - unif.ci.adme
      unif.ub <- mkmdr + unif.ci.adme
      
      point.lb <- mkmdr - point.ci.adme
      point.ub <- mkmdr + point.ci.adme
    }
    
    
  }
  
  
  if (fit$link == "probit"){
    # Estimate CDF: lines are X's (observations of x) and columns are the time t's 
    kmdr.fit.x <- stats::pnorm(as.matrix(xx) %*% fit$coefficients)
    ext.fit <- base::sum((kmdr.fit.x < probs.min) + ((kmdr.fit.x > (1 - probs.min))))
    if(ext.fit>0) {
      warning("Fitted probabilities close to 0 or 1 occurred. We truncated them according to probs.min = ",probs.min)
    }
    # Avoid dividing by zero (computational trick)
    kmdr.fit.x[kmdr.fit.x < probs.min] <- probs.min
    kmdr.fit.x[kmdr.fit.x > (1 - probs.min)] <- 1 - probs.min
    # Compute Average Marginal Effects for each t in the data
    # derivative of phi(x'b), where phi is the normal CDF
    mkmdr <-  base::rowSums(fit$coefficients[coeff,] *
                              t(stats::dnorm(as.matrix(xx) %*% fit$coefficients))) / n
    
    if(inference == TRUE){
      stop("We currently do not support probit link function for inference procedures.")
      
    }
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
    # Compute Average Marginal Effects for each t in the data
    # psi = derivative of 1 - exp(-exp(u))
    psi <-  (1 -  kmdr.fit.x) * exp.xb # n.row= n, n.col = # of t; each column is a fixed t. 
    # Get the summands for the KMDR estimator of the ADME
    kmdr.adme <- fit$coefficients[coeff,] * t(psi)
    kmdr.adme <- t(kmdr.adme)  #n by n.tev
    #-----------------------------------------------------------------------------
    #KMDR estimator of the ADME
    mkmdr <- base::colMeans(kmdr.adme) 
    #-----------------------------------------------------------------------------
    if (inference == TRUE){
      #-----------------------------------------------------------------------------    
      # Compute influence function
      #-----------------------------------------------------------------------------
      # 1st term: beta_0 * psi(x'b) - En[beta_0 * psi(x'b)]
      inf1 <- t(t(kmdr.adme) - mkmdr )
      #-----------------------------------------------------------------------------
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
      
      if (center == TRUE){
        # Let's center zeta just in case
        zeta.mean <- array(0, dim =  c(dim((xx)), n.tev)) # n by k by n.tev
        
        for (j in 1 : n.tev) {
          zeta.mean[, , j] <-  base::matrix(base::colMeans(zeta[,,j]), nrow = n, ncol = dim(xx)[2], byrow=T)
        }
        
        zeta <- zeta - zeta.mean
      }
      #Singularity test
      #singular.test <- 0
      #for (j in 1 : n.tev) {
      #  singular.test <-  singular.test + 
      #matrixcalc::is.singular.matrix(base::crossprod(zeta[, , j])/n, tol = 1e-16)
      #}
      #if(singular.test>0){
      #  warning("The Covariance matrix associated with the KM score may be close to singular.
      #  Proceed with caution")
      #}
      
      #Get the second derivative of cloglog distribution wrt index
      psi2 <- psi * (1 - exp.xb)
      #inverse of the Hessian matrix of KMDR coefficients
      s.term1 <- as.vector(fit$kmw) * (indicators - kmdr.fit.x) * (psi2/(kmdr.fit.x * (1 - kmdr.fit.x)))
      
      h.term11 <- as.vector(fit$kmw) * (((1 - kmdr.fit.x) * psi / (kmdr.fit.x * (1 - kmdr.fit.x)))^2) * indicators
      h.term12 <- as.vector(fit$kmw) * (( kmdr.fit.x * psi/(kmdr.fit.x * (1 - kmdr.fit.x)))^2) * (1 - indicators)
      
      h.term1 <- h.term11 + h.term12
      
      # term for minus the Hessian
      var.term <- -(s.term1 -h.term1)
      
      #s.term <- array(0, dim = c(n.col, n.col, n.tev ))
      #h.term <- array(0, dim = c(n.col, n.col, n.tev ))
      Hessian.kmdr <- array(0, dim = c(n.col, n.col, n.tev ))
      Hessian.kmdr.inv <- Hessian.kmdr
      for (j in 1:n.tev){
        #s.term[,,j] <- base::crossprod(s.term1[,j]*xx, xx)
        #h.term[,,j] <- base::crossprod(h.term1[,j]*xx, xx)
        Hessian.kmdr[,,j] <- base::crossprod(var.term[,j]*xx, xx)
        #Hessian.kmdr.inv[,,j] <- solve(Hessian.kmdr[,,j])
        Hessian.kmdr.inv[,,j] <- MASS::ginv(Hessian.kmdr[,,j], tol = 0)
        #Hessian.kmdr.inv[,,j] <- base::solve(-(s.term[,,j] - h.term[,,j]))
        #Hessian.kmdr.inv[,,j] <- MASS::ginv(-(s.term[,,j] - h.term[,,j]))
        #Hessian.kmdr.inv[,,j] <- MASS::ginv(-(s.term[,,j] - h.term[,,j]), tol = 0)
        #Hessian.kmdr.inv[,,j] <- matlib::Ginv(-(s.term[,,j] - h.term[,,j]))
      }
      
      if (center == TRUE){
        # Compute the KM average of the score, mu, and then get mu %*% t(mu)
        phi.m.m.t <- array(0, dim = c(n.col, n.col, n.tev )) # n by k by n.tev
        
        for (j in 1 : n.tev) {
          phi.m.m.t[, , j] <-  base::tcrossprod(base::colSums(fit$kmw * phi[,,j]))
          
        }
        
        Hessian.kmdr <- Hessian.kmdr + phi.m.m.t
        
        for (j in 1 : n.tev) {
          Hessian.kmdr.inv[,,j] <- MASS::ginv(Hessian.kmdr[,,j], tol = 0)
        }
        
      }
     
      # Compute the Asymptotic linear representation of the KMDR coefficients
      lin.rep.kmdr <- zeta
      for (j in 1:n.tev){
        lin.rep.kmdr[,,j] <- zeta[,,j] %*% Hessian.kmdr.inv[,,j]
      }
      #-----------------------------------------------------------------------------
      #-----------------------------------------------------------------------------
      #3rd term of the lin.rep of the ADME: beta_hat * mean(psi^2 * X') * lin.rep.kmdr
      # Compute the mean(psi^2 * X')
      mean.psi2.X <- t(base::crossprod(xx, psi2) / n)  # n.tev by n.k
      # product of beta_hat * meanps2.X
      aux2 <- (fit$coefficients[coeff,] * mean.psi2.X) 
      
      inf3 <- matrix(0, n, n.tev)
      for (j in 1:n.tev){
        inf3[,j] <- lin.rep.kmdr[,,j] %*% (as.matrix(aux2[j,]))
      }
      #-----------------------------------------------------------------------------
      #2nd term now
      #lin.rep.kmdr.beta22 <- lin.rep.kmdr[, coeff, ]
      selection.matrix <- matrix(0, ncol = n.col, nrow = length(coeff) ) #n.coeff by n.col
      for (j in 1:length(coeff)){
        selection.matrix[j, coeff[j]] <- 1
      }
      
      lin.rep.kmdr.beta <- array(0, dim = c(n, length(coeff), n.tev))
      for (j in 1:n.tev){
        lin.rep.kmdr.beta[,,j] <- base::tcrossprod(lin.rep.kmdr[,,j], selection.matrix)
      }
      
      mean.psi <- base::colMeans(psi) # Vector ot n.tev means 
      
      mean.psi2 <- array(0, dim = c(n,length(coeff), n.tev))
      for(j in 1:n.tev){
        mean.psi2[,,j] <- mean.psi[j]
      }
      
      inf2 <-   lin.rep.kmdr.beta * mean.psi2
      #-----------------------------------------------------------------------------
      #linear representation of the ADME <- So far, only works for scalar!!
      lin.rep.adme <- inf1 + inf2[,1,] + inf3
      #-----------------------------------------------------------------------------
      #-----------------------------------------------------------------------------
      # Compute bootstrapped critival values
      b.kmdr.adme <- boot.adme.kmdr(lin.rep.adme, nboot)
      #-----------------------------------------------------------------------------
      #Compute confidence intervals
      if(ci==90) z.ind=1
      if(ci==95) z.ind=2
      if(ci==99) z.ind=3
      
      unif.ci.adme <- b.kmdr.adme$unif.crit.val[z.ind] * b.kmdr.adme$boot.se
      point.ci.adme <- b.kmdr.adme$p.crit.val[,z.ind] * b.kmdr.adme$boot.se
      
      unif.lb <- mkmdr - unif.ci.adme
      unif.ub <- mkmdr + unif.ci.adme
      
      point.lb <- mkmdr - point.ci.adme
      point.ub <- mkmdr + point.ci.adme
      
    }
  }
  
  influence_function <- NULL
  
  if(inf_function == TRUE) {
    influence_function <- lin.rep.adme
  }
  #-----------------------------------------------------------------------------
  #return adme, it's upper and lower bound as well as the ci level.
  return(list(adme = mkmdr, 
              adme.pointwise.lb = point.lb,
              adme.pointwise.ub = point.ub, 
              adme.uniform.lb = unif.lb, 
              adme.uniform.ub = unif.ub,
              #singular.test = singular.test,
              ci = ci,
              influence_function = influence_function))
  
}