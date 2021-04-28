
boot.adme.kmdr <- function(lin.rep.adme, 
                           nboot, 
                           standardize = FALSE) {
  # Use Rademacher weights
  k1 <- -1 #0.5 * (1 - 5^0.5)
  k2 <- 1 #0.5 * (1 + 5^0.5)
  pkappa <- 0.5 #0.5 * (1 + 5^0.5)/(5^0.5)

  n.t <- dim(lin.rep.adme)[2]
  n <- dim(lin.rep.adme)[1]
  
  bootapply <- function(nn) {
    v <- stats::rbinom(n, 1, pkappa)
    v <- base::ifelse(v == 1, k1, k2)
    #v <- rnorm(n)
    # Bootstrap lin.rep
    lin.rep.adme.b <- lin.rep.adme * v
    # Bootstrap linear representations
    R.star <- sqrt(n) * base::colMeans(lin.rep.adme.b)
   # Return both tests
    return(R.star)
  }
  
  boot.km <- lapply(1:nboot, bootapply)
  
  # Put the Bootstrap resuls in a matrix # Rows are bootstrap draws, columns are thresholds
  # (i.e. each column has n.boot draws for each threshold t)
  boot.km <- t(matrix(unlist(boot.km), n.t, nboot))
  
  std.boot = 1
  if (standardize == TRUE) {
    # Compute bootstrap standard error based on interquartile range
    std.boot <- matrixStats::colIQRs(boot.km, type = 1)/(stats::qnorm(0.75) - stats::qnorm(0.25))
  }
  #Compute bootstrap t-test
  boot.t.test <- abs(boot.km/std.boot)
  #Compute bootstrap max t-test
  boot.max.t.test <- base::apply(boot.t.test, 1, max)
  
  # compute the Bootstrap uniform critical values
  unif.crit.val <- stats::quantile(boot.max.t.test, probs = c(0.9, 0.95, 0.99), type = 1)
  
  # Compute pointwise critical values
  p.crit.val <- matrixStats::colQuantiles(boot.t.test, probs = c(0.9, 0.95, 0.99), type = 1)
  
  return(list(max.t.test = boot.max.t.test, 
              boot.se = std.boot/sqrt(n), 
              p.crit.val = p.crit.val,
              unif.crit.val = unif.crit.val))
}
