# Subsample analysis: mortgage sub-groups
#-----------------------------------------------------------------------------
# Libraries
library(here)
library(survival)
library(MASS)
library(matrixStats)
#-----------------------------------------------------------------------------
load(here("data/processed/sipp-R.Rdata"))
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Analysis for those with and without mortgage
#-----------------------------------------------------------------------------
# Those without mortgage
kmdr.clog.m0 <- kmdr(spec.kmdr, 
                     censor = delta,
                     data = ui.mort0,
                     linkf = "cloglog", 
                     x = T,
                     t.threshold = tev)

kmdr.clog.ame.m0 <- av.margin.kmdr(fit = kmdr.clog.m0, 
                                   nboot = nboot,
                                   inf_function = TRUE)

# test slope coefficients are constant
# kmdr.clog.m0.const_test <- kmdr_const_test(kmdr.clog.m0)


#Estimate the parameters of interest Proportional Hazard
cox.m0 <- survival::coxph(spec.cox ,
                          data = ui.mort0,
                          x = TRUE)
cox.ame.m0 <- av.margin.cox(cox.m0)(tev)
# test proportionality assumption
cox.zph(cox.m0)
#-----------------------------------------------------------------------------
# Those with mortgage
kmdr.clog.m1 <- kmdr(spec.kmdr, 
                     censor = delta,
                     data = ui.mort1, 
                     linkf = "cloglog", 
                     x = TRUE,
                     t.threshold = tev)

kmdr.clog.ame.m1 <- av.margin.kmdr(fit = kmdr.clog.m1, 
                                   nboot = nboot,
                                   inf_function = TRUE)

# test slope coefficients are constant
# kmdr.clog.m1.const_test <- kmdr_const_test(kmdr.clog.m1)

#Estimate the parameters of interest Proportional Hazard
cox.m1 <- survival::coxph(spec.cox,
                          data = ui.mort1,
                          x = TRUE)
cox.ame.m1 <- av.margin.cox(cox.m1)(tev)
# test proportionality assumption
cox.zph(cox.m1)
#-----------------------------------------------------------------------------
# Save results
save.image(here("data/processed/mortgage.RData"))