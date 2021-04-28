#-----------------------------------------------------------------------------
# This file contain Auxiliary Functions for Censored Data
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------

# Function to generate KM weigths

# dimy = the column of datam in which the outcome of interest is located
# dimdelta = the column of datam in which the (non-)censoring indicator is located
# datam = a data set of interest.


kmweight <- function(dimy,
                     dimdelta,
                     datam) {
  datam <- as.data.frame(datam)
  datam <- datam[order(as.numeric(datam[, dimy]),
                       as.numeric(datam[, dimdelta])), ]
  
  Y11 <- as.numeric(datam[, dimy])
  delta11 <- as.numeric(datam[, dimdelta])
  
  
  srt <- order(Y11)
  sy <- as.double(Y11[srt])
  sdelta <- as.integer(delta11[srt])
  n11 <- length(sdelta)
  kmweights <- numeric(n11)
  kmweights[1] <- 1/n11
  if (n11 > 1) {
    for (i in 2:n11) {
      kmweights[i] <- kmweights[i - 1] *
        (n11 - i + 2)/(n11 - i + 1) * (((n11 - i + 1)/(n11 -
                                                         i + 2))^sdelta[i - 1])
    }
  }
  kmwts <- kmweights * sdelta
  
  
  datam$w <- kmwts
  datam <- as.data.frame(datam)
  return(datam)
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Function to compute weighted cdfs
# q is the variable
# w is the weight

w.ecdf=function(q,w){
  n <- length(q)
  if (n < 1)
    stop("'q' must have 1 or more non-missing values")
  if (all(q == sort(q)) == FALSE)
    stop ("'q' must be sorted beforehand")
  if (n != length(w))
    stop ("'q' and 'w' must have the same length")
  
  vals <- unique(q)
  if (anyDuplicated(q)) {
    w <- tapply(w, q, sum)
  }
  fn <- cumsum(w)
  fn[fn>1] <- 1
  rval <- stats::approxfun(vals, fn,
                           method = "constant", yleft = 0,
                           yright = 1, f = 0, ties = "ordered")
  class(rval) <- c("ecdf", "stepfun", class(rval))
  assign("nobs", n, envir = environment(rval))
  attr(rval, "call") <- sys.call()
  rval
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Function to compute rearranged (monotone) cdfs
# q is the variable
# w is the weight

r.ecdf=function(q,wr){
  n <- length(q)
  if (n < 1)
    stop("'q' must have 1 or more non-missing values")
  if (all(q == sort(q)) == FALSE)
    stop ("'q' must be sorted beforehand")
  if (min(wr) < 0)
    stop ("'wr' must be non-negative")
  if (max(wr) > 1)
    stop ("'wr' must be not greater than 1")
  
  
  rval <- stats::approxfun(q, wr,
                           method = "constant", yleft = 0,
                           yright = 1, f = 0, ties = "ordered")
  class(rval) <- c("ecdf", "stepfun", class(rval))
  assign("nobs", n, envir = environment(rval))
  attr(rval, "call") <- sys.call()
  rval
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


