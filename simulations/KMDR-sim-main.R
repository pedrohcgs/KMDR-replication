#-----------------------------------------------------------------------------
# This file is the main file for the simulations
############################################################################## 
#-----------------------------------------------------------------------------
# Startup - clear memory, load packages, and set parameters
# Clear memory
rm(list=ls())
#-----------------------------------------------------------------------------
start_time <- Sys.time()
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Basic parameters of the simulation - Doesn't change over setups
nrep <- 1000        # Monte Carlo replications
ncores <- 14        # Number of cores to use in parallel
seed1 <- 1234       # Set initial seed

# Evaluations points of x (t will be in the loop)
xev     <- 0.5
#-----------------------------------------------------------------------------
# load the necessary libraries
library(MASS)
library(utils)
library(foreach)
library(doSNOW)
library(doRNG)
library(survival)
library(icenReg)
library(TransModel)
library(here)
library(readr)
library(taRifx)
#-----------------------------------------------------------------------------
# Source the files with the DGPS
source(here("simulations/aux_functions/dgps-sim.R"))
# Source all functions
fldr <- here("functions/")
sapply(paste0(fldr,"/", list.files(fldr)), source)

#-----------------------------------------------------------------------------
# Compute the finte sample properties for each DGP, censoring, and sample size
for (dgp in 1:3){
  # Fix Thresholds for t
  if (dgp ==1) {
    x1 <- runif(10000000)
    tt <- rweibull(10000000, shape = 2, scale = exp((x1)))
    tev <- seq(quantile(tt,probs = 0.1), quantile(tt,probs = 0.9), length.out = 100)
  }
  
  if (dgp ==2) {
    x1 <- runif(10000000)
    u <- runif(10000000)
    tt <- ((exp(x1) / u) - exp(x1)) ^ (1/4)
    tev <- seq(quantile(tt,probs = 0.1), quantile(tt,probs = 0.9), length.out = 100)
  }
  
  if (dgp == 3) {
    x1 <- runif(10000000)
    u <- runif(10000000)
    tt <- (exp((log(-log(1 - u)) - 0 - 1 * x1 )/(1 + 2 * x1)))
    tev <- seq(quantile(tt,probs = 0.1), quantile(tt,probs = 0.9), length.out = 100)
  }
  
  for (nn in 1:3){
    #set sample size
    if(nn == 1) n <- 100
    if(nn == 2) n <- 400
    if(nn == 3) n <- 1600
    for (cens in 1:3){
      # do the Monte Carlo for each censoring level, n, and dgp
      source(here("simulations/aux_functions/simulations.R"))
    }
  }
}
end_time <- Sys.time()
end_time - start_time
#-----------------------------------------------------------------------------
# Create the plots and tables
source(here("simulations/aux_functions/table_dgp1.R"))
source(here("simulations/aux_functions/table_dgp2.R"))
source(here("simulations/aux_functions/table_dgp3.R"))
#-----------------------------------------------------------------------------
