#-----------------------------------------------------------------------------
# This script run all scripts to replicate the empirical application  
#-----------------------------------------------------------------------------
start_time <- Sys.time()
# Library
library(here)
#-----------------------------------------------------------------------------
# Source files
source(here("application/01-R-prep.R"))
source(here("application/02-pooled.R"))
source(here("application/03-wealth.R"))
source(here("application/04-mortgage.R"))
source(here("application/05-hyp_tests.R"))
source(here("application/06-plots.R"))
#-----------------------------------------------------------------------------
end_time <- Sys.time()
end_time - start_time