
lr.kmdr <- function(outcome, censor, phi) {
  
  # Dimensions of phi
  n.row <- dim(phi)[1]
  n.col <- dim(phi)[2]
  n.t <- dim(phi)[3]
  
  
  ###########################################################
  ########### Necessary ingridients for the  ################
  ###########   linear represenation and     ################
  ###########         the bootstrap          ################
  ###########################################################
  # Compute integrand of gamma0
  FY <- stats::ecdf(outcome)
  dist.FY <- FY(outcome)
  # Avoid problem of numerator (this is just mechanical,
  #given that the last obs of gamma0 is zero)
  #s1 <- base::ifelse(dist.FY == 1, 0.00001, 1 - dist.FY)
  s1 <- 1/(1 - dist.FY)
  s1[is.infinite(s1)] <- 0
  s1[is.nan(s1)] <- 0
  
  nc <- (1 - censor) * s1
  
  # Compute Gamma0
  indy <- outer(outcome, outcome, "<")
  
  # gamma0 is a n.row x 1 matrix
  gamma0 <- base::exp(base::crossprod(indy, nc) / n.row)
  
  # Leading term of the expansion
  tau <- phi
  aux1 <- as.vector(gamma0 * censor)
  for (j in 1:n.t){
    tau[,,j] <- aux1 * phi[,,j]
  }
  
  # Compute gamma1 and the second term of the expansion
  t.sub <- outer(outcome, outcome, ">")
  gamma1 <- tau
  for (j in 1:n.t){
    gamma1[,,j] <- (base::crossprod(t.sub, tau[,,j])/n.row)
  }
  
  # compute the gamma1
  gamma1 <- s1 * gamma1
  
  # Now, compute the second term of the expansion
  term2 <- gamma1 * array((1 - censor), dim = c(n.row, n.col, n.t))
  
  # Now, compute gamma2 and the last term of the expansion
  gamma2 <- gamma1 * as.numeric(nc)
  
  for (j in 1:n.t){
    gamma2[,,j] <- (base::crossprod(indy, (gamma2[,,j])) / n.row)
    
  }
  
  # This is the term of the asymptotic expansion of the KMDR coefficient
  terms <- tau + term2 - gamma2
  return(terms)
}
