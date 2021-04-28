#-----------------------------------------------------------------------------
# This file set up the DGP's for the simulations
#-----------------------------------------------------------------------------
#DGP's

dgps <- function(dgp, cens, n){
  #generate covariates
  x <- runif(n,0,1)
  # Parameters of the DGPS
  beta <- 1
  cons <- 0
  
  
  if (dgp==1){ # Proportional Hazard Model - Weibull
    # generate latent duration
    shape <- 2
    tt <- rweibull(n, shape = shape, scale = exp((cons + beta * x)))
    
    #Generate data for the censoring random variables
    if (cens==1) cc <- 99999
    if (cens==2) {
      cc <- (0.5 +  9* rexp(n))      #10% of censoring
    }
    if (cens==3) {
      cc <- (0.5 + 2.5 * rexp(n))      #30% of censoring
    }
    
  }
  
  if (dgp==2){# Proportional Odds Model
    ## Parameters of the DGPS
    phi <- 4
    u <- runif(n)
    # generate latent duration
    tt <- (((exp( cons + x * beta)) / u) - exp(cons + x * beta)) ^ (1/phi)
    
    #Generate data for the censoring random variables
    if (cens==1) cc <- 99999
    if (cens==2) {
      cc <-  0.5 + 7 * rexp(n)      #10% of censoring
    }
    if (cens==3) {
      cc <-  0.5 + 2*rexp(n)      #30% of censoring
    }
  }
 
  
  if (dgp==3){ # Distributional Regression Model with beta(t) = 1+ln(t^2)
    ## Parameters of the DGPS
    u <- runif(n)
    a <- 2 # parameter of the power of DR function
    # generate latent duration
    tt <- (exp((log(-log(1 - u)) - cons - beta * x )/(1 + a * x)))
    
    # Generate data for the censoring random variables
    if (cens==1) cc <- 99999
    if (cens==2) {
      cc <- (0.25 + 4 * (rexp(n)))      #10% of censoring
    }
    if (cens==3) {
      cc <- (0.25 + 1.15 * rexp(n))      #30% of censoring
    }
    
  }
  
  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
 
  #Compute the realized outcome
  y <- pmin(tt, cc)
  
  #Compute the (non-)censoring indicator
  delta <- as.numeric(cc > tt)

  
  ##Put in a datamatrix
  datamatrix <- data.frame(cbind(y, delta, x))
  
  return(datamatrix)
}