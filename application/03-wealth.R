# Subsample analysis: above and below median of net liquid wealth
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
# Subsample analysis: above and below median of net liquid wealth
#-----------------------------------------------------------------------------
# below median
kmdr.clog.below.median <- kmdr(spec.kmdr, 
                               censor = delta,
                               data = ui.below.median, 
                               linkf = "cloglog",
                               x = TRUE,
                               t.threshold = tev)

kmdr.clog.ame.below.median <- av.margin.kmdr(kmdr.clog.below.median, 
                                             nboot = nboot)

#Estimate the parameters of interest Proportional Hazard
cox.below.median <- survival::coxph(spec.cox,
                                    data = ui.below.median,
                                    x = TRUE)
cox.ame.below.median <- av.margin.cox(cox.below.median)(tev)
# test proportionality assumption
cox.zph(cox.below.median)
#-----------------------------------------------------------------------------
# above median
kmdr.clog.above.median <- kmdr(spec.kmdr, 
                               censor = delta,
                               data = ui.abv.median,
                               linkf = "cloglog",
                               x = TRUE,
                               t.threshold = tev)

kmdr.clog.ame.above.median <- av.margin.kmdr(kmdr.clog.above.median, 
                                             nboot = nboot)

#Estimate the parameters of interest Proportional Hazard
cox.above.median <- survival::coxph(spec.cox,
                                    data = ui.abv.median,
                                    x = TRUE)
cox.ame.above.median <- av.margin.cox(cox.above.median)(tev)
# test proportionality assumption
cox.zph(cox.above.median)
#-----------------------------------------------------------------------------
# Save results
save.image(here("data/processed/wealth.RData"))