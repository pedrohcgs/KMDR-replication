# DGP 1 files
bias_dgp1_c_1_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.1.n.100.csv"))))
bias_dgp1_c_2_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.2.n.100.csv"))))
bias_dgp1_c_3_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.3.n.100.csv"))))

bias_dgp1_c_1_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.1.n.400.csv"))))
bias_dgp1_c_2_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.2.n.400.csv"))))
bias_dgp1_c_3_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.3.n.400.csv"))))

bias_dgp1_c_1_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.1.n.1600.csv"))))
bias_dgp1_c_2_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.2.n.1600.csv"))))
bias_dgp1_c_3_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp1.c.3.n.1600.csv"))))

rmse_dgp1_c_1_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.1.n.100.csv"))))
rmse_dgp1_c_2_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.2.n.100.csv"))))
rmse_dgp1_c_3_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.3.n.100.csv"))))

rmse_dgp1_c_1_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.1.n.400.csv"))))
rmse_dgp1_c_2_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.2.n.400.csv"))))
rmse_dgp1_c_3_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.3.n.400.csv"))))

rmse_dgp1_c_1_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.1.n.1600.csv"))))
rmse_dgp1_c_2_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.2.n.1600.csv"))))
rmse_dgp1_c_3_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp1.c.3.n.1600.csv"))))

#-----------------------------------------------------------------------------
# let's create the t
tev <- substr(as.data.frame(bias_dgp1_c_1_n_100)[,1], 5, 100)
tev <- destring(tev) 
#-----------------------------------------------------------------------------
# Generate table
table.1 <- matrix(rep(NA,18*48), ncol = 18)

# No censoring
table.1[1,1:6] <- as.numeric(bias_dgp1_c_1_n_100[1,14:19])
table.1[2,1:6] <- as.numeric(bias_dgp1_c_1_n_100[50,14:19])
table.1[3,1:6] <- as.numeric(bias_dgp1_c_1_n_100[100,14:19])
table.1[4,1:6] <- colSums(abs(bias_dgp1_c_1_n_100[,14:19])) / 100
table.1[5,1:6] <- as.numeric(bias_dgp1_c_1_n_100[1,2:7])
table.1[6,1:6] <- as.numeric(bias_dgp1_c_1_n_100[50,2:7])
table.1[7,1:6] <- as.numeric(bias_dgp1_c_1_n_100[100,2:7])
table.1[8,1:6] <- colSums(abs(bias_dgp1_c_1_n_100[,2:7])) / 100

table.1[9,1:6] <- as.numeric(rmse_dgp1_c_1_n_100[1,14:19])
table.1[10,1:6] <- as.numeric(rmse_dgp1_c_1_n_100[50,14:19])
table.1[11,1:6] <- as.numeric(rmse_dgp1_c_1_n_100[100,14:19])
table.1[12,1:6] <- colSums(abs(rmse_dgp1_c_1_n_100[,14:19])) / 100
table.1[13,1:6] <- as.numeric(rmse_dgp1_c_1_n_100[1,2:7])
table.1[14,1:6] <- as.numeric(rmse_dgp1_c_1_n_100[50,2:7])
table.1[15,1:6] <- as.numeric(rmse_dgp1_c_1_n_100[100,2:7])
table.1[16,1:6] <- colSums(abs(rmse_dgp1_c_1_n_100[,2:7])) / 100


table.1[17,1:6] <- as.numeric(bias_dgp1_c_1_n_400[1,14:19])
table.1[18,1:6] <- as.numeric(bias_dgp1_c_1_n_400[50,14:19])
table.1[19,1:6] <- as.numeric(bias_dgp1_c_1_n_400[100,14:19])
table.1[20,1:6] <- colSums(abs(bias_dgp1_c_1_n_400[,14:19])) / 100
table.1[21,1:6] <- as.numeric(bias_dgp1_c_1_n_400[1,2:7])
table.1[22,1:6] <- as.numeric(bias_dgp1_c_1_n_400[50,2:7])
table.1[23,1:6] <- as.numeric(bias_dgp1_c_1_n_400[100,2:7])
table.1[24,1:6] <- colSums(abs(bias_dgp1_c_1_n_400[,2:7])) / 100

table.1[25,1:6] <- as.numeric(rmse_dgp1_c_1_n_400[1,14:19])
table.1[26,1:6] <- as.numeric(rmse_dgp1_c_1_n_400[50,14:19])
table.1[27,1:6] <- as.numeric(rmse_dgp1_c_1_n_400[100,14:19])
table.1[28,1:6] <- colSums(abs(rmse_dgp1_c_1_n_400[,14:19])) / 100
table.1[29,1:6] <- as.numeric(rmse_dgp1_c_1_n_400[1,2:7])
table.1[30,1:6] <- as.numeric(rmse_dgp1_c_1_n_400[50,2:7])
table.1[31,1:6] <- as.numeric(rmse_dgp1_c_1_n_400[100,2:7])
table.1[32,1:6] <- colSums(abs(rmse_dgp1_c_1_n_400[,2:7])) / 100


table.1[33,1:6] <- as.numeric(bias_dgp1_c_1_n_1600[1,14:19])
table.1[34,1:6] <- as.numeric(bias_dgp1_c_1_n_1600[50,14:19])
table.1[35,1:6] <- as.numeric(bias_dgp1_c_1_n_1600[100,14:19])
table.1[36,1:6] <- colSums(abs(bias_dgp1_c_1_n_1600[,14:19])) / 100
table.1[37,1:6] <- as.numeric(bias_dgp1_c_1_n_1600[1,2:7])
table.1[38,1:6] <- as.numeric(bias_dgp1_c_1_n_1600[50,2:7])
table.1[39,1:6] <- as.numeric(bias_dgp1_c_1_n_1600[100,2:7])
table.1[40,1:6] <- colSums(abs(bias_dgp1_c_1_n_1600[,2:7])) / 100

table.1[41,1:6] <- as.numeric(rmse_dgp1_c_1_n_1600[1,14:19])
table.1[42,1:6] <- as.numeric(rmse_dgp1_c_1_n_1600[50,14:19])
table.1[43,1:6] <- as.numeric(rmse_dgp1_c_1_n_1600[100,14:19])
table.1[44,1:6] <- colSums(abs(rmse_dgp1_c_1_n_1600[,14:19])) / 100
table.1[45,1:6] <- as.numeric(rmse_dgp1_c_1_n_1600[1,2:7])
table.1[46,1:6] <- as.numeric(rmse_dgp1_c_1_n_1600[50,2:7])
table.1[47,1:6] <- as.numeric(rmse_dgp1_c_1_n_1600[100,2:7])
table.1[48,1:6] <- colSums(abs(rmse_dgp1_c_1_n_1600[,2:7])) / 100

# 10% censoring
table.1[1,7:12] <- as.numeric(bias_dgp1_c_2_n_100[1,14:19])
table.1[2,7:12] <- as.numeric(bias_dgp1_c_2_n_100[50,14:19])
table.1[3,7:12] <- as.numeric(bias_dgp1_c_2_n_100[100,14:19])
table.1[4,7:12] <- colSums(abs(bias_dgp1_c_2_n_100[,14:19])) / 100
table.1[5,7:12] <- as.numeric(bias_dgp1_c_2_n_100[1,2:7])
table.1[6,7:12] <- as.numeric(bias_dgp1_c_2_n_100[50,2:7])
table.1[7,7:12] <- as.numeric(bias_dgp1_c_2_n_100[100,2:7])
table.1[8,7:12] <- colSums(abs(bias_dgp1_c_2_n_100[,2:7])) / 100

table.1[9,7:12] <- as.numeric(rmse_dgp1_c_2_n_100[1,14:19])
table.1[10,7:12] <- as.numeric(rmse_dgp1_c_2_n_100[50,14:19])
table.1[11,7:12] <- as.numeric(rmse_dgp1_c_2_n_100[100,14:19])
table.1[12,7:12] <- colSums(abs(rmse_dgp1_c_2_n_100[,14:19])) / 100
table.1[13,7:12] <- as.numeric(rmse_dgp1_c_2_n_100[1,2:7])
table.1[14,7:12] <- as.numeric(rmse_dgp1_c_2_n_100[50,2:7])
table.1[15,7:12] <- as.numeric(rmse_dgp1_c_2_n_100[100,2:7])
table.1[16,7:12] <- colSums(abs(rmse_dgp1_c_2_n_100[,2:7])) / 100


table.1[17,7:12] <- as.numeric(bias_dgp1_c_2_n_400[1,14:19])
table.1[18,7:12] <- as.numeric(bias_dgp1_c_2_n_400[50,14:19])
table.1[19,7:12] <- as.numeric(bias_dgp1_c_2_n_400[100,14:19])
table.1[20,7:12] <- colSums(abs(bias_dgp1_c_2_n_400[,14:19])) / 100
table.1[21,7:12] <- as.numeric(bias_dgp1_c_2_n_400[1,2:7])
table.1[22,7:12] <- as.numeric(bias_dgp1_c_2_n_400[50,2:7])
table.1[23,7:12] <- as.numeric(bias_dgp1_c_2_n_400[100,2:7])
table.1[24,7:12] <- colSums(abs(bias_dgp1_c_2_n_400[,2:7])) / 100

table.1[25,7:12] <- as.numeric(rmse_dgp1_c_2_n_400[1,14:19])
table.1[26,7:12] <- as.numeric(rmse_dgp1_c_2_n_400[50,14:19])
table.1[27,7:12] <- as.numeric(rmse_dgp1_c_2_n_400[100,14:19])
table.1[28,7:12] <- colSums(abs(rmse_dgp1_c_2_n_400[,14:19])) / 100
table.1[29,7:12] <- as.numeric(rmse_dgp1_c_2_n_400[1,2:7])
table.1[30,7:12] <- as.numeric(rmse_dgp1_c_2_n_400[50,2:7])
table.1[31,7:12] <- as.numeric(rmse_dgp1_c_2_n_400[100,2:7])
table.1[32,7:12] <- colSums(abs(rmse_dgp1_c_2_n_400[,2:7])) / 100


table.1[33,7:12] <- as.numeric(bias_dgp1_c_2_n_1600[1,14:19])
table.1[34,7:12] <- as.numeric(bias_dgp1_c_2_n_1600[50,14:19])
table.1[35,7:12] <- as.numeric(bias_dgp1_c_2_n_1600[100,14:19])
table.1[36,7:12] <- colSums(abs(bias_dgp1_c_2_n_1600[,14:19])) / 100
table.1[37,7:12] <- as.numeric(bias_dgp1_c_2_n_1600[1,2:7])
table.1[38,7:12] <- as.numeric(bias_dgp1_c_2_n_1600[50,2:7])
table.1[39,7:12] <- as.numeric(bias_dgp1_c_2_n_1600[100,2:7])
table.1[40,7:12] <- colSums(abs(bias_dgp1_c_2_n_1600[,2:7])) / 100

table.1[41,7:12] <- as.numeric(rmse_dgp1_c_2_n_1600[1,14:19])
table.1[42,7:12] <- as.numeric(rmse_dgp1_c_2_n_1600[50,14:19])
table.1[43,7:12] <- as.numeric(rmse_dgp1_c_2_n_1600[100,14:19])
table.1[44,7:12] <- colSums(abs(rmse_dgp1_c_2_n_1600[,14:19])) / 100
table.1[45,7:12] <- as.numeric(rmse_dgp1_c_2_n_1600[1,2:7])
table.1[46,7:12] <- as.numeric(rmse_dgp1_c_2_n_1600[50,2:7])
table.1[47,7:12] <- as.numeric(rmse_dgp1_c_2_n_1600[100,2:7])
table.1[48,7:12] <- colSums(abs(rmse_dgp1_c_2_n_1600[,2:7])) / 100

# 30% censoring
table.1[1,13:18] <- as.numeric(bias_dgp1_c_3_n_100[1,14:19])
table.1[2,13:18] <- as.numeric(bias_dgp1_c_3_n_100[50,14:19])
table.1[3,13:18] <- as.numeric(bias_dgp1_c_3_n_100[100,14:19])
table.1[4,13:18] <- colSums(abs(bias_dgp1_c_3_n_100[,14:19])) / 100
table.1[5,13:18] <- as.numeric(bias_dgp1_c_3_n_100[1,2:7])
table.1[6,13:18] <- as.numeric(bias_dgp1_c_3_n_100[50,2:7])
table.1[7,13:18] <- as.numeric(bias_dgp1_c_3_n_100[100,2:7])
table.1[8,13:18] <- colSums(abs(bias_dgp1_c_3_n_100[,2:7])) / 100

table.1[9,13:18] <- as.numeric(rmse_dgp1_c_3_n_100[1,14:19])
table.1[10,13:18] <- as.numeric(rmse_dgp1_c_3_n_100[50,14:19])
table.1[11,13:18] <- as.numeric(rmse_dgp1_c_3_n_100[100,14:19])
table.1[12,13:18] <- colSums(abs(rmse_dgp1_c_3_n_100[,14:19])) / 100
table.1[13,13:18] <- as.numeric(rmse_dgp1_c_3_n_100[1,2:7])
table.1[14,13:18] <- as.numeric(rmse_dgp1_c_3_n_100[50,2:7])
table.1[15,13:18] <- as.numeric(rmse_dgp1_c_3_n_100[100,2:7])
table.1[16,13:18] <- colSums(abs(rmse_dgp1_c_3_n_100[,2:7])) / 100


table.1[17,13:18] <- as.numeric(bias_dgp1_c_3_n_400[1,14:19])
table.1[18,13:18] <- as.numeric(bias_dgp1_c_3_n_400[50,14:19])
table.1[19,13:18] <- as.numeric(bias_dgp1_c_3_n_400[100,14:19])
table.1[20,13:18] <- colSums(abs(bias_dgp1_c_3_n_400[,14:19])) / 100
table.1[21,13:18] <- as.numeric(bias_dgp1_c_3_n_400[1,2:7])
table.1[22,13:18] <- as.numeric(bias_dgp1_c_3_n_400[50,2:7])
table.1[23,13:18] <- as.numeric(bias_dgp1_c_3_n_400[100,2:7])
table.1[24,13:18] <- colSums(abs(bias_dgp1_c_3_n_400[,2:7])) / 100

table.1[25,13:18] <- as.numeric(rmse_dgp1_c_3_n_400[1,14:19])
table.1[26,13:18] <- as.numeric(rmse_dgp1_c_3_n_400[50,14:19])
table.1[27,13:18] <- as.numeric(rmse_dgp1_c_3_n_400[100,14:19])
table.1[28,13:18] <- colSums(abs(rmse_dgp1_c_3_n_400[,14:19])) / 100
table.1[29,13:18] <- as.numeric(rmse_dgp1_c_3_n_400[1,2:7])
table.1[30,13:18] <- as.numeric(rmse_dgp1_c_3_n_400[50,2:7])
table.1[31,13:18] <- as.numeric(rmse_dgp1_c_3_n_400[100,2:7])
table.1[32,13:18] <- colSums(abs(rmse_dgp1_c_3_n_400[,2:7])) / 100


table.1[33,13:18] <- as.numeric(bias_dgp1_c_3_n_1600[1,14:19])
table.1[34,13:18] <- as.numeric(bias_dgp1_c_3_n_1600[50,14:19])
table.1[35,13:18] <- as.numeric(bias_dgp1_c_3_n_1600[100,14:19])
table.1[36,13:18] <- colSums(abs(bias_dgp1_c_3_n_1600[,14:19])) / 100
table.1[37,13:18] <- as.numeric(bias_dgp1_c_3_n_1600[1,2:7])
table.1[38,13:18] <- as.numeric(bias_dgp1_c_3_n_1600[50,2:7])
table.1[39,13:18] <- as.numeric(bias_dgp1_c_3_n_1600[100,2:7])
table.1[40,13:18] <- colSums(abs(bias_dgp1_c_3_n_1600[,2:7])) / 100

table.1[41,13:18] <- as.numeric(rmse_dgp1_c_3_n_1600[1,14:19])
table.1[42,13:18] <- as.numeric(rmse_dgp1_c_3_n_1600[50,14:19])
table.1[43,13:18] <- as.numeric(rmse_dgp1_c_3_n_1600[100,14:19])
table.1[44,13:18] <- colSums(abs(rmse_dgp1_c_3_n_1600[,14:19])) / 100
table.1[45,13:18] <- as.numeric(rmse_dgp1_c_3_n_1600[1,2:7])
table.1[46,13:18] <- as.numeric(rmse_dgp1_c_3_n_1600[50,2:7])
table.1[47,13:18] <- as.numeric(rmse_dgp1_c_3_n_1600[100,2:7])
table.1[48,13:18] <- colSums(abs(rmse_dgp1_c_3_n_1600[,2:7])) / 100
#-----------------------------------------------------------------------------
# Save it
write.table(table.1, here("simulations/tables/table_dgp1_complete.txt"), sep="\t")
#-----------------------------------------------------------------------------
# Summary table with results (selective ones)
summary_table1 <- matrix(NA, ncol = 19, nrow = 12)
summary_table1[,1] <- rep(c(100,400,1600),4) 
summary_table1[1,2:19] <- table.1[4,] 
summary_table1[2,2:19] <- table.1[20,] 
summary_table1[3,2:19] <- table.1[36,] 

summary_table1[4,2:19] <- table.1[12,] 
summary_table1[5,2:19] <- table.1[28,] 
summary_table1[6,2:19] <- table.1[44,] 


summary_table1[7,2:19] <- table.1[8,] 
summary_table1[8,2:19] <- table.1[24,] 
summary_table1[9,2:19] <- table.1[40,] 

summary_table1[10,2:19] <- table.1[16,] 
summary_table1[11,2:19] <- table.1[32,] 
summary_table1[12,2:19] <- table.1[48,] 

summary_table1[,2:19] <- 100 * summary_table1[,2:19]

colnames(summary_table1) <- c("n", 
                              "PH-0%", "PO-0%", "DR-cll-0%", "DR-logit-0%", "DR-cll-ig-0%", "DR-logit-ig-0%",
                              "PH-10%", "PO-10%", "DR-cll-10%", "DR-logit-10%", "DR-cll-ig-10%", "DR-logit-ig-10%",
                              "PH-30%", "PO-30%", "DR-cll-30%", "DR-logit-30%", "DR-cll-ig-30%", "DR-logit-ig-30%"
                              )

rownames(summary_table1) <- c(rep("cdf-bias", 3),
                              rep("cdf-rmse", 3),
                              rep("adme-bias", 3), 
                              rep("adme-rmse", 3))

#-----------------------------------------------------------------------------
# Save it
write.table(summary_table1, here("simulations/tables/table_dgp1_summary.txt"), sep="\t")
#-----------------------------------------------------------------------------

rm(list=ls())
