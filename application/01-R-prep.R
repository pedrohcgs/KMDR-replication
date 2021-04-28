#-----------------------------------------------------------------------------
# Prepare data for the replication, and load all functions into environment
#-----------------------------------------------------------------------------
# Libraries
library(here)
library(haven)
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Fix thresholds to run DR
# Baseline parameters
tev     <- seq(2,50)
n.tev   <- length(tev)
# Number of bootstrap draws
nboot   <- 100000
seed    <- 04192020
set.seed(seed)
#-----------------------------------------------------------------------------
# Source all functions
fldr <- here("functions/")
sapply(paste0(fldr,"/", list.files(fldr)), source)
#-----------------------------------------------------------------------------
# Load data
ui <- read_stata(here("data/processed/sipp-processed.dta"))
#-----------------------------------------------------------------------------
# Keep only the variables we will really use to make things simpler
rel.vars <- c("dur", "delta", "l_wba", "mardum", "hh_twlth", "ed", "l_annwg",
              "age", "unemprate", "gind", "hh_netliq", "hasmortg")
ui <- ui[rel.vars]
# Re-scale household total weatlh
ui$hh_twlth <- ui$hh_twlth/10000
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Create all subsets of the data that we will use in the application
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Subset by whether household net liquid wealth is below median
ui$below_median <- as.numeric(ui$hh_netliq <= quantile(ui$hh_netliq, 0.5, type = 1))
ui.below.median <- subset(ui, ui$below_median == 1 )
ui.abv.median <- subset(ui, ui$below_median == 0 )
#-----------------------------------------------------------------------------
# Subset by mortgage
ui.mort1 <- subset(ui, ui$hasmortg == 1)
ui.mort0 <- subset(ui, ui$hasmortg == 0)
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Specification of the KMDR 
spec.kmdr <- as.formula(dur ~ l_wba + mardum + hh_twlth+
                          ed +
                          l_annwg + age +
                          as.factor(gind)+
                          unemprate) 
# Specification of the Cox-Model
spec.cox <- as.formula(Surv(dur,delta) ~ l_wba + mardum + hh_twlth+
                         ed +
                         l_annwg + age + 
                         as.factor(gind)+
                         unemprate)
#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------
# Save 
save.image(here("data/processed/sipp-R.RData"))
