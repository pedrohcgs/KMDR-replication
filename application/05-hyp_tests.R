# Test if KMDR slope coefficients are constant
#-----------------------------------------------------------------------------
# Libraries
library(here)
library(survival)
library(MASS)
library(matrixStats)
#-----------------------------------------------------------------------------
load(here("data/processed/mortgage.RData"))
#-----------------------------------------------------------------------------
# Test KMDR slope coefficients are constant across all t's.
#-----------------------------------------------------------------------------
# pooled data
kmdr.clog.const_test <- kmdr_const_test(fit = kmdr.clog, 
                                        nboot = nboot)

# Below median of net liquid wealth
kmdr.clog.below.median.const_test <- kmdr_const_test(fit =kmdr.clog.below.median, 
                                                     nboot = nboot)

# Above median of net liquid wealth
kmdr.clog.above.median.const_test <- kmdr_const_test(fit =kmdr.clog.above.median,
                                                     nboot = nboot)

# With Mortgage
kmdr.clog.m1.const_test <- kmdr_const_test(fit =kmdr.clog.m1, 
                                           nboot = nboot)

# Without mortgage
kmdr.clog.m0.const_test <- kmdr_const_test(fit = kmdr.clog.m0, 
                                           nboot = nboot)

#-----------------------------------------------------------------------------
# Test ADME are different between liquidity constrained and unconstrained households
#-----------------------------------------------------------------------------
# Liquidity constrain proxied by mortgage 
adme_het_mortgage <- het_av_margin_kmdr(fit1 = kmdr.clog.ame.m1,
                                        fit2 = kmdr.clog.ame.m0,
                                        nboot = nboot
)

# Liquidity constrain proxied by wealth 
adme_het_wealth <- het_av_margin_kmdr(fit1 = kmdr.clog.ame.below.median,
                                      fit2 = kmdr.clog.ame.above.median,
                                      nboot = nboot
)

# Save results
save.image(here("data/processed/hyp_tests.RData"))