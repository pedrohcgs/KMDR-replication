#-----------------------------------------------------------------------------
# This file estimates the Kaplan-Meier Distributional Regression
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------

# Equation formula is the default!
kmdr <- function(formula,
                 censor,
                 data,
                 linkf = c("logit", "probit", "cloglog"),
                 t.threshold, 
                 x = FALSE, ...) {
  
  # Store call 
  call <- match.call()
  # If data is missing, look at the global environment
  if (missing(data)) {
    data <- environment(formula)
  }
  #Get the call
  mf <- match.call(expand.dots = FALSE)
  #get location of the arguments
  m <- match(c("formula", "censor", "data"), names(mf), 0L)
  # get model frame 
  mf <- mf[c(1L, m)]
  mf$weights <- NULL
  mf[[1L]] <- as.name("model.frame")
  mf <- eval(mf, parent.frame())
  
  # Compute Kaplan-Meier weigths
  mf <- kmweight(1, dim(mf)[2], mf)
  
  # Make it like terms
  mt <- attr(mf, "terms")
  
  Y <- model.response(mf, "any")
  if (length(dim(Y)) == 1L) {
    nm <- rownames(Y)
    dim(Y) <- NULL
    if (!is.null(nm)) 
      names(Y) <- nm
  }
  X <- if (!is.empty.model(mt)) 
    base::suppressWarnings(model.matrix(mt, mf, contrasts))
  else matrix(NA, NROW(Y), 0L)
  
  # Thresholds
  if (missing(t.threshold)) {
    t.threshold <- sort(unique(Y))
  }
  
  # Estimate Coefficients
  coeff <- suppressWarnings(apply(as.matrix(t.threshold), 1, 
                                  function(i){
                                    coef(stats::glm.fit(X,(Y <= i),
                                                        weights = NROW(Y) * mf$w,
                                                        family = binomial(link = linkf)))
                                  }
  )
  )
  coeff <- coeff[, colSums(!is.nan(coeff))>0]
  # Name the Coefficient Vectors
  colnames(coeff) <- paste("t = ", t.threshold, sep = "")
  rownames(coeff) <- colnames(X)
  
  # Save X if x = TRUE
  if (x){
    xx <- X
    colnames(xx) <- colnames(X)
  }
  
  #Output
  fit <- c(list(coefficients = coeff,
                t.threshold = t.threshold, 
                call = call, 
                link = linkf, 
                x =  if (x) xx,
                outcome = Y, 
                censor = (mf[,(dim(mf)[2]-1)]),
                kmw = mf$w))
  class(fit) <- c("kmdr")
  fit
}

#-----------------------------------------------------------------------------
# If you want to provide the regressors separately

kmdr.fit <- function(outcome, 
                     regressors, 
                     censor, 
                     linkf = c("logit", "probit", "cloglog", "cauchit", "log"),
                     t.threshold) {
  
  call <- match.call()
  m <- call
  
  m <- match(c("outcome", "regressors", "kmw", "weights", "t.threshold"), names(call), 0L)
  mf <- call[c(1L, m)]
  mf[[1L]] <- as.name("model.frame")
  mf <- data.frame(cbind(as.matrix(outcome),  regressors , as.matrix(censor)))
  
  # Compute Kaplan-Meier weigths
  mf <- kmweight(1, dim(mf)[2], mf)
  
  # Thresholds
  if (missing(t.threshold)) {
    t.threshold <- sort(unique(mf$outcome))
  }
  
  # Covariate vector
  X <- as.matrix(mf[2:(dim(mf)[2]-2)])
  
  # Estimate Coefficients
  coeff <- suppressWarnings(
    apply(as.matrix(t.threshold), 1,
          function(i){
            coef(stats::glm((mf[,1] <= i) ~ X,
                            weights = length(mf[,1]) * as.matrix(mf$w),
                            family = binomial(link = linkf)))
          }
    )
  )
  
  
  coeff <- coeff[, colSums(!is.nan(coeff))>0]
  
  colnames(coeff) <-  paste("y = ", t.threshold, sep = "")
  rownames(coeff) <- c("(Intercept)", colnames(regressors))
  
  #Predictions: lines are X's (observations of x) and columns are the time t's 
  #pred <- stats::plogis(cbind(1, regressors) %*% coeff) 
  
  
  fit <- c(list(coefficients = coeff, 
                t.threshold = t.threshold, 
                call = call, 
                link = linkf, 
                outcome = mf[,1],
                censor = (mf[,(dim(mf)[2]-1)]),
                x = X, 
                kmw = mf$w))
  class(fit) <- c("kmdr")
  fit
  
}
