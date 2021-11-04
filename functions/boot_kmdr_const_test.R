
boot_kmdr_const_test <- function(lin_rep_kmdr, 
                                 test_statistic_summand,
                                 kmdr_coeff,
                                 nboot, 
                                 standardize = FALSE) {
  # Use Rademacher weights
  k1 <- -1 #0.5 * (1 - 5^0.5)
  k2 <- 1 #0.5 * (1 + 5^0.5)
  pkappa <- 0.5 #0.5 * (1 + 5^0.5)/(5^0.5)
  
  n.t <- dim(lin_rep_kmdr)[3]
  n.k <- dim(lin_rep_kmdr)[2]
  n <- dim(lin_rep_kmdr)[1]
  
  test_statistic <-  n * max(base::colSums(test_statistic_summand^2))
  
  bootapply <- function(nn) {
    v <- stats::rbinom(n, 1, pkappa)
    v <- base::ifelse(v == 1, k1, k2)
    #v <- rnorm(n)
    # Bootstrap lin.rep
    lin_rep_kmdr.b <- lin_rep_kmdr * v
    # Bootstrapped kmdr coefficients
    boot_kmdr_coef <- matrix(0, nrow = n.k, ncol = n.t)
    for (j in 1 : n.t) {
      boot_kmdr_coef[,j] <- base::colMeans(lin_rep_kmdr.b[,,j])
    }
    boot_kmdr_coef <-  kmdr_coeff + boot_kmdr_coef
    
    # Compute bootstrapped test statistic
    
    boot_average_coefficients_over_t <- base::rowMeans(boot_kmdr_coef)
    boot_average_coefficients_over_t <- matrix(boot_average_coefficients_over_t, 
                                          ncol = dim(kmdr_coeff)[2], 
                                          nrow = dim(kmdr_coeff)[1]
    )
    
    boot_test_statistic_summand <-  boot_kmdr_coef - boot_average_coefficients_over_t
    boot_test_statistic_summand <- boot_test_statistic_summand - test_statistic_summand

    
    boot_test_statistic <-  n * max(base::colSums(boot_test_statistic_summand^2))
    
    # Return tests
    return(boot_test_statistic)
  }
  
  boot.km <- lapply(1:nboot, bootapply)
  
  # Put the Bootstrap results in a vector matrix 
  boot.km <- unlist(boot.km)
  
  # compute the Bootstrapped critical values
  crit.val <- stats::quantile(boot.km, probs = c(0.9, 0.95, 0.99), type = 1)
  
  # Compute Bootstrapped p-value
  p_value <- mean(boot.km > test_statistic)
  
  return(list(p_value = p_value, 
              crit_value = crit.val, 
              test_statistic = test_statistic))
}
