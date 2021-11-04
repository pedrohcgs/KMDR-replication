# Analysis for pooled data analysis
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
#Estimate the parameters of interest: DR Model with cloglog link
# pooled data
kmdr.clog <- kmdr(spec.kmdr, 
                  censor = delta,
                  data = ui,
                  linkf = "cloglog", 
                  x = TRUE,
                  t.threshold = tev)

kmdr.clog.ame <- av.margin.kmdr(fit = kmdr.clog, 
                                nboot = nboot)

# # test slope coefficients are constant
# kmdr.clog.const_test <- kmdr_const_test(kmdr.clog)
#-----------------------------------------------------------------------------
#Estimate the parameters of interest Proportional Hazard
cox <- survival::coxph(spec.cox,
                       data = ui,
                       x = TRUE)
cox.ame <- av.margin.cox(cox)(tev)
# test proportionality assumption using the Schoenfeld residuals
cox.zph(cox)
#-----------------------------------------------------------------------------
# Save results
save.image(here("data/processed/pooled.RData"))