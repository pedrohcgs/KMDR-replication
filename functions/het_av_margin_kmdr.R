#-----------------------------------------------------------------------------
# This file compute the different of two 
# Average Marginal effects from Kaplan-Meier Distributional
# Regression Models (groups must be disjoint)
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
het_av_margin_kmdr <- function(fit1,
                               fit2,
                               nboot = NULL, 
                               ci = 90){
 
  if (length(fit1$adme)!=length(fit2$adme)){
    # Dimension 
    stop("Dimension of t in fit1 and fit2 models must be the same")
  }
  if (!all(names(fit1$adme) == names(fit2$adme))){
    # Dimension 
    stop("fit1 and fit2 models must have the same t's")
  }
  
  if (is.null(fit1$influence_function)){
    stop("You must set inf_function = TRUE when using av.margin.kmdr")
  }
  
  if (is.null(fit2$influence_function)){
    stop("You must set inf_function = TRUE when using av.margin.kmdr")
  }
  
  
  if (is.null(nboot) == TRUE) nboot = 9999
  
  if (ci %in% c(90,95,99) == FALSE){
      # Code only works for a ci equal to 90, 95 or 99 
      stop("Confidence interval level ci must be either 90, 95 or 99")
    }
  
  
  #-----------------------------------------------------------------------------
  # Compute difference of ADME
  diff_adme <- fit1$adme - fit2$adme
  
  inf_function_diff = rbind(fit1$influence_function,
                             - fit2$influence_function)
  
  # get the thresholds and set up number of thresholds, dimension of covariates and sample size
  n.tev <- length(fit1$adme)
  n <- dim(inf_function_diff)[1]
  #-----------------------------------------------------------------------------
  # Initialize statistics related to outcome of the code when inference is not to be displayed
  point.lb = NULL; point.ub = NULL; unif.lb = NULL; unif.ub = NULL
  #-----------------------------------------------------------------------------
  # Compute bootstrapped critival values
  b.kmdr.adme <- boot.adme.kmdr(inf_function_diff, nboot)
  #-----------------------------------------------------------------------------
  #Compute confidence intervals
  if(ci==90) z.ind=1
  if(ci==95) z.ind=2
  if(ci==99) z.ind=3
  
  unif.ci.adme <- b.kmdr.adme$unif.crit.val[z.ind] * b.kmdr.adme$boot.se
  point.ci.adme <- b.kmdr.adme$p.crit.val[,z.ind] * b.kmdr.adme$boot.se
  
  unif.lb <- diff_adme - unif.ci.adme
  unif.ub <- diff_adme + unif.ci.adme
  
  point.lb <- diff_adme - point.ci.adme
  point.ub <- diff_adme + point.ci.adme
  #-----------------------------------------------------------------------------
  #return adme, it's upper and lower bound as well as the ci level.
  return(list(diff_adme = diff_adme, 
              pointwise.lb = point.lb,
              pointwise.ub = point.ub, 
              uniform.lb = unif.lb, 
              uniform.ub = unif.ub,
              #singular.test = singular.test,
              ci = ci))
  
}