#-----------------------------------------------------------------------------
# This file  runs all the simulations and create the output with the results 
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#Create the censoring variables
if(cens==1) cens.level <- '0%'
if(cens==2) cens.level <- '10%'
if(cens==3) cens.level <- '30%'
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#Make cluster
cl <- makeCluster(ncores) 
registerDoSNOW(cl)
#-----------------------------------------------------------------------------
#Set seed
iseed <- floor(seed1 + n * 2598 + cens * 71638 + dgp * 711)
set.seed(iseed)
#-----------------------------------------------------------------------------
#Start the MONTE CARLO loop
a <- foreach (nn=1:nrep,.packages=c('survival','icenReg')) %dorng% {
  #---------------------------------------------------------------------------
  #Generate the data
  datamatrix <- dgps(dgp, cens, n)
  # Order data
  datamatrix <- datamatrix[order(datamatrix$y, datamatrix$delta),]
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  #Estimate the parameters of interest: Cox Model
  cox.model <- survival::coxph(Surv(y,delta) ~ x, data = datamatrix, x = T)
  # Get Average Marginal Effects
  av.mcox <- av.margin.cox(cox.model)(tev)
  # Get Marginal Effect at x = xev and t = tev
  mcox.av <- margin.cox(cox.model, x = data.frame(x = xev))
  mcox.av <- mapply(do.call, mcox.av, lapply(data.frame(t = tev) , list))
  
  # Get CDF at x = xev and t = tev
  cox.cdf <- cdf.cox(cox.model, x = data.frame(x = xev))
  cox.cdf <- mapply(do.call, cox.cdf, lapply(data.frame(t = tev) , list))
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  #Estimate the parameters of interest: Proportional Odds Model
  lim1 = datamatrix$y
  lim2 = ifelse(datamatrix$delta==1,datamatrix$y,Inf)
  po.model <- icenReg::ic_sp(Surv(lim1, lim2, type = 'interval2') ~ x, model = 'po',
                             bs_samples = 0, data = datamatrix)
  # Get Average Marginal Effects
  av.mpo <- av.margin.po(po.model)(tev)
  # Get Marginal Effect at x = xev and t = tev
  mpo.av <- margin.po(po.model, x = data.frame(x = xev))
  mpo.av <- mapply(do.call, mpo.av, lapply(data.frame(t = tev) , list))
  
  # Get CDF at x = xev and t = tev
  po.cdf <- cdf.po(po.model, x = data.frame(x = xev))
  po.cdf <- mapply(do.call, po.cdf, lapply(data.frame(t = tev) , list))
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  #Estimate the parameters of interest: DR Model with cloglog ignoring censoring
  dr.ig.clog <- kmdr(y ~  x, as.matrix(rep(1 ,n)), data = datamatrix,
                     linkf = "cloglog", x = T,
                     t.threshold = tev) 
  # Get Average Marginal Effects
  av.mdr.ig.clog<- av.margin.kmdr(dr.ig.clog, inference = F)
  #av.mdr.ig.clog <- av.mdr.ig.clog$adme
  # Get Marginal Effect at x = xev and t = tev
  dr.ig.clog.av <- margin.kmdr(dr.ig.clog, x = data.frame(x = xev))
  dr.ig.clog.av <- mapply(do.call, dr.ig.clog.av, lapply(data.frame(t = tev) , list))
  
  # Get CDF at x = xev and t = tev
  dr.ig.clog.cdf <- cdf.kmdr(dr.ig.clog, x = data.frame(x = xev))
  dr.ig.clog.cdf <- mapply(do.call, dr.ig.clog.cdf, lapply(data.frame(t = tev) , list))
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  #Estimate the parameters of interest: DR Model with logit ignoring censoring
  dr.ig.logit <- kmdr(y ~  x, as.matrix(rep(1, n)), data = datamatrix,
                      linkf = "logit", x = T, t.threshold = tev) 
  # Get Average Marginal Effects
  av.mdr.ig.logit<- av.margin.kmdr(dr.ig.logit, inference = F)
  # Get Marginal Effect at x = xev and t = tev
  dr.ig.logit.av <- margin.kmdr(dr.ig.logit, x = data.frame(x = xev))
  dr.ig.logit.av <- mapply(do.call, dr.ig.logit.av, lapply(data.frame(t = tev) , list))
  
  # Get CDF at x = xev and t = tev
  dr.ig.logit.cdf <- cdf.kmdr(dr.ig.logit, x = data.frame(x = xev))
  dr.ig.logit.cdf <- mapply(do.call, dr.ig.logit.cdf, lapply(data.frame(t = tev) , list))
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  #Estimate the parameters of interest: DR Model with cloglog
  kmdr.clog <- kmdr(y ~  x, delta, data = datamatrix, linkf = "cloglog", x = T,
                    t.threshold = tev)
  # Get Average Marginal Effects
  av.mkmdr.clog<- av.margin.kmdr(kmdr.clog, inference = F)
  # Get Marginal Effect at x = xev and t = tev
  kmdr.clog.av <- margin.kmdr(kmdr.clog, x = data.frame(x = xev))
  kmdr.clog.av <- mapply(do.call, kmdr.clog.av, lapply(data.frame(t = tev) , list))
  
  # Get CDF at x = xev and t = tev
  kmdr.clog.cdf <- cdf.kmdr(kmdr.clog, x = data.frame(x = xev))
  kmdr.clog.cdf <- mapply(do.call, kmdr.clog.cdf, lapply(data.frame(t = tev) , list))
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  #Estimate the parameters of interest: DR Model with logit
  kmdr.logit <- kmdr(y ~  x, delta, data = datamatrix, linkf = "logit", x = T,                   
                     t.threshold = tev) 
  # Get Average Marginal Effects
  av.mkmdr.logit<- av.margin.kmdr(kmdr.logit, inference = FALSE)
  # Get Marginal Effect at x = xev and t = tev
  kmdr.logit.av <- margin.kmdr(kmdr.logit, x = data.frame(x = xev))
  kmdr.logit.av <- mapply(do.call, kmdr.logit.av, lapply(data.frame(t = tev) , list))
  
  # Get CDF at x = xev and t = tev
  kmdr.logit.cdf <- cdf.kmdr(kmdr.logit, x = data.frame(x = xev))
  kmdr.logit.cdf <- mapply(do.call, kmdr.logit.cdf, lapply(data.frame(t = tev) , list))
  #---------------------------------------------------------------------------
  #---------------------------------------------------------------------------
  
  
  
  # output
  out <- (cbind(av.mcox, av.mpo, 
                av.mkmdr.clog$adme, av.mkmdr.logit$adme, 
                av.mdr.ig.clog$adme, av.mdr.ig.logit$adme,
                
                mcox.av, mpo.av, 
                kmdr.clog.av, kmdr.logit.av, 
                dr.ig.clog.av, dr.ig.logit.av, 
                
                cox.cdf, po.cdf,
                kmdr.clog.cdf, kmdr.logit.cdf,
                dr.ig.clog.cdf, dr.ig.logit.cdf
  ))
  
  #Return it 
  return(out)
  
}
#---------------------------------------------------------------------------
#Stop the cluster
stopCluster(cl)

#Put the Monte Carlo Results in an array
simu <- array(a, dim = c(nrow(a[[1]]), ncol(a[[1]]), length(a)))

####################################################################
#Compute the true average marginal effects
nx <- length(xev)
nt <- length(tev)

if (dgp == 1){
  true.mar <- exp(- tev^2) - exp(- (tev * exp(-1))^2)
  
  true.mar.av <- -2 * ((matrix (tev) %*% t (exp(- xev)))^2) * 
    exp (- ((matrix (tev) %*% t (exp(- xev)))^2) )
  
  true.cdf <- 1 - exp (- ((matrix (tev) %*% t (exp(- xev)))^2) )
  
}

if (dgp == 2){
  true.mar <- (1 / (tev^4 + 1)) - (1 / (exp(-1) * tev^4 + 1))
  
  
  true.mar.av <- - (matrix (tev^4) %*% t (exp(-xev))) /
    ((1 + (matrix (tev^4) %*% t (exp(-xev))))^2)
  
  true.cdf <-  (matrix (tev^4) %*% t (exp(-xev))) /
    ((1 + (matrix (tev^4) %*% t (exp(-xev)))))
  
}


if (dgp == 3){
  true.mar <- exp( - tev) - exp(- tev * exp(1 + log(tev^2)))
  
  bb = matrix (1 + log(tev^2))
  xbb = bb %*% t(xev)
  ind3 = matrix(rep(log(tev), length(xev)), ncol = length(xev) ) + xbb
  
  true.mar.av <- exp(ind3) * exp(- exp(ind3)) * 
    matrix(bb, nrow = dim(bb)[1], ncol = dim(ind3)[2])
  
  true.cdf <- 1 - exp(- exp(ind3))
  
  
}


true <- cbind(true.mar, true.mar, true.mar, true.mar, true.mar, true.mar,
              
              true.mar.av, true.mar.av, true.mar.av, true.mar.av, true.mar.av, true.mar.av,
              
              true.cdf, true.cdf, true.cdf, true.cdf, true.cdf, true.cdf)

bias <- array(NA, c(nt, 18 , nrep))
for (i in 1:nrep){
  bias[,,i] <- simu[[i]] - true
}


#Average bias
mean.bias <- apply(bias, 1:2, mean)
mean.bias <- cbind(mean.bias, n = n, cens = cens.level)

#Average |bias|
mean.abs.bias <- apply(abs(bias), 1:2, mean)
mean.abs.bias <- cbind(mean.abs.bias, n = n, cens = cens.level)

#RMSE
rmse <- (apply((bias)^2, 1:2, mean))^0.5
rmse <- cbind(rmse, n = n, cens = cens.level)

####################################################################
#Give names to the columns and rows
colnames(mean.bias) <- c("ame.cox","ame.po",
                         "ame.kmdr.clog", "ame.kmdr.logit",
                         "ame.dr.ig.clog", "ame.mdr.ig.logit",
                         
                         
                         paste("me.cox.x = ", xev, sep = ""),
                         paste("me.po.x = ", xev, sep = ""),
                         paste("me.kmdr.clog.x = ", xev, sep = ""),
                         paste("me.kmdr.logit.x = ", xev, sep = ""),
                         paste("me.dr.ig.clog.x = ", xev, sep = ""),
                         paste("me.dr.ig.logit.x = ", xev, sep = ""),
                         
                         
                         paste("cdf.cox.x = ", xev, sep = ""),
                         paste("cdf.po.x = ", xev, sep = ""),
                         paste("cdf.kmdr.clog.x = ", xev, sep = ""),
                         paste("cdf.kmdr.logit.x = ", xev, sep = ""),
                         paste("cdf.dr.ig.clog.x = ", xev, sep = ""),
                         paste("cdf.dr.ig.logit.x = ", xev, sep = ""), 
                         
                         
                         "n", "cens.level")
colnames(mean.abs.bias) <- colnames(mean.bias)
colnames(rmse) <- colnames(mean.bias)

rownames(mean.bias) <- paste("t = ", tev, sep = "")
rownames(mean.abs.bias) <- rownames(mean.bias)
rownames(rmse) <- rownames(mean.bias)
#-----------------------------------------------------------------------------
#Export everything in CSV files

m1 <- paste0(here("simulations/results/mean.bias.dgp"), dgp,".c.",cens,".n.",n)
m2 <- paste0(here("simulations/results/mean.abs.bias.dgp"), dgp,".c.",cens,".n.",n)
m3 <- paste0(here("simulations/results/rmse.dgp"), dgp,".c.",cens,".n.",n)

write.csv(mean.bias, file = paste0(m1,".csv"))
write.csv(mean.abs.bias, file = paste0(m2,".csv"))
write.csv(rmse, file = paste0(m3,".csv"))
#-----------------------------------------------------------------------------
