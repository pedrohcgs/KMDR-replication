# Dgp 3 files
bias_dgp3_c_1_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.1.n.100.csv"))))
bias_dgp3_c_2_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.2.n.100.csv"))))
bias_dgp3_c_3_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.3.n.100.csv"))))

bias_dgp3_c_1_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.1.n.400.csv"))))
bias_dgp3_c_2_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.2.n.400.csv"))))
bias_dgp3_c_3_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.3.n.400.csv"))))

bias_dgp3_c_1_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.1.n.1600.csv"))))
bias_dgp3_c_2_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.2.n.1600.csv"))))
bias_dgp3_c_3_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/mean.bias.dgp3.c.3.n.1600.csv"))))

rmse_dgp3_c_1_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.1.n.100.csv"))))
rmse_dgp3_c_2_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.2.n.100.csv"))))
rmse_dgp3_c_3_n_100 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.3.n.100.csv"))))

rmse_dgp3_c_1_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.1.n.400.csv"))))
rmse_dgp3_c_2_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.2.n.400.csv"))))
rmse_dgp3_c_3_n_400 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.3.n.400.csv"))))

rmse_dgp3_c_1_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.1.n.1600.csv"))))
rmse_dgp3_c_2_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.2.n.1600.csv"))))
rmse_dgp3_c_3_n_1600 <- as.data.frame(base::suppressWarnings(
  read_csv(here("simulations/results/rmse.dgp3.c.3.n.1600.csv"))))

#-----------------------------------------------------------------------------
# let's create the t
tev <- substr(as.data.frame(bias_dgp3_c_1_n_100)[,1], 5, 100)
tev <- destring(tev) 
#-----------------------------------------------------------------------------
# Generate table
table.3 <- matrix(rep(NA,18*48), ncol = 18)

# No censoring
table.3[1,1:6] <- as.numeric(bias_dgp3_c_1_n_100[1,14:19])
table.3[2,1:6] <- as.numeric(bias_dgp3_c_1_n_100[50,14:19])
table.3[3,1:6] <- as.numeric(bias_dgp3_c_1_n_100[100,14:19])
table.3[4,1:6] <- colSums(abs(bias_dgp3_c_1_n_100[,14:19])) / 100
table.3[5,1:6] <- as.numeric(bias_dgp3_c_1_n_100[1,2:7])
table.3[6,1:6] <- as.numeric(bias_dgp3_c_1_n_100[50,2:7])
table.3[7,1:6] <- as.numeric(bias_dgp3_c_1_n_100[100,2:7])
table.3[8,1:6] <- colSums(abs(bias_dgp3_c_1_n_100[,2:7])) / 100

table.3[9,1:6] <- as.numeric(rmse_dgp3_c_1_n_100[1,14:19])
table.3[10,1:6] <- as.numeric(rmse_dgp3_c_1_n_100[50,14:19])
table.3[11,1:6] <- as.numeric(rmse_dgp3_c_1_n_100[100,14:19])
table.3[12,1:6] <- colSums(abs(rmse_dgp3_c_1_n_100[,14:19])) / 100
table.3[13,1:6] <- as.numeric(rmse_dgp3_c_1_n_100[1,2:7])
table.3[14,1:6] <- as.numeric(rmse_dgp3_c_1_n_100[50,2:7])
table.3[15,1:6] <- as.numeric(rmse_dgp3_c_1_n_100[100,2:7])
table.3[16,1:6] <- colSums(abs(rmse_dgp3_c_1_n_100[,2:7])) / 100


table.3[17,1:6] <- as.numeric(bias_dgp3_c_1_n_400[1,14:19])
table.3[18,1:6] <- as.numeric(bias_dgp3_c_1_n_400[50,14:19])
table.3[19,1:6] <- as.numeric(bias_dgp3_c_1_n_400[100,14:19])
table.3[20,1:6] <- colSums(abs(bias_dgp3_c_1_n_400[,14:19])) / 100
table.3[21,1:6] <- as.numeric(bias_dgp3_c_1_n_400[1,2:7])
table.3[22,1:6] <- as.numeric(bias_dgp3_c_1_n_400[50,2:7])
table.3[23,1:6] <- as.numeric(bias_dgp3_c_1_n_400[100,2:7])
table.3[24,1:6] <- colSums(abs(bias_dgp3_c_1_n_400[,2:7])) / 100

table.3[25,1:6] <- as.numeric(rmse_dgp3_c_1_n_400[1,14:19])
table.3[26,1:6] <- as.numeric(rmse_dgp3_c_1_n_400[50,14:19])
table.3[27,1:6] <- as.numeric(rmse_dgp3_c_1_n_400[100,14:19])
table.3[28,1:6] <- colSums(abs(rmse_dgp3_c_1_n_400[,14:19])) / 100
table.3[29,1:6] <- as.numeric(rmse_dgp3_c_1_n_400[1,2:7])
table.3[30,1:6] <- as.numeric(rmse_dgp3_c_1_n_400[50,2:7])
table.3[31,1:6] <- as.numeric(rmse_dgp3_c_1_n_400[100,2:7])
table.3[32,1:6] <- colSums(abs(rmse_dgp3_c_1_n_400[,2:7])) / 100


table.3[33,1:6] <- as.numeric(bias_dgp3_c_1_n_1600[1,14:19])
table.3[34,1:6] <- as.numeric(bias_dgp3_c_1_n_1600[50,14:19])
table.3[35,1:6] <- as.numeric(bias_dgp3_c_1_n_1600[100,14:19])
table.3[36,1:6] <- colSums(abs(bias_dgp3_c_1_n_1600[,14:19])) / 100
table.3[37,1:6] <- as.numeric(bias_dgp3_c_1_n_1600[1,2:7])
table.3[38,1:6] <- as.numeric(bias_dgp3_c_1_n_1600[50,2:7])
table.3[39,1:6] <- as.numeric(bias_dgp3_c_1_n_1600[100,2:7])
table.3[40,1:6] <- colSums(abs(bias_dgp3_c_1_n_1600[,2:7])) / 100

table.3[41,1:6] <- as.numeric(rmse_dgp3_c_1_n_1600[1,14:19])
table.3[42,1:6] <- as.numeric(rmse_dgp3_c_1_n_1600[50,14:19])
table.3[43,1:6] <- as.numeric(rmse_dgp3_c_1_n_1600[100,14:19])
table.3[44,1:6] <- colSums(abs(rmse_dgp3_c_1_n_1600[,14:19])) / 100
table.3[45,1:6] <- as.numeric(rmse_dgp3_c_1_n_1600[1,2:7])
table.3[46,1:6] <- as.numeric(rmse_dgp3_c_1_n_1600[50,2:7])
table.3[47,1:6] <- as.numeric(rmse_dgp3_c_1_n_1600[100,2:7])
table.3[48,1:6] <- colSums(abs(rmse_dgp3_c_1_n_1600[,2:7])) / 100

# 10% censoring
table.3[1,7:12] <- as.numeric(bias_dgp3_c_2_n_100[1,14:19])
table.3[2,7:12] <- as.numeric(bias_dgp3_c_2_n_100[50,14:19])
table.3[3,7:12] <- as.numeric(bias_dgp3_c_2_n_100[100,14:19])
table.3[4,7:12] <- colSums(abs(bias_dgp3_c_2_n_100[,14:19])) / 100
table.3[5,7:12] <- as.numeric(bias_dgp3_c_2_n_100[1,2:7])
table.3[6,7:12] <- as.numeric(bias_dgp3_c_2_n_100[50,2:7])
table.3[7,7:12] <- as.numeric(bias_dgp3_c_2_n_100[100,2:7])
table.3[8,7:12] <- colSums(abs(bias_dgp3_c_2_n_100[,2:7])) / 100

table.3[9,7:12] <- as.numeric(rmse_dgp3_c_2_n_100[1,14:19])
table.3[10,7:12] <- as.numeric(rmse_dgp3_c_2_n_100[50,14:19])
table.3[11,7:12] <- as.numeric(rmse_dgp3_c_2_n_100[100,14:19])
table.3[12,7:12] <- colSums(abs(rmse_dgp3_c_2_n_100[,14:19])) / 100
table.3[13,7:12] <- as.numeric(rmse_dgp3_c_2_n_100[1,2:7])
table.3[14,7:12] <- as.numeric(rmse_dgp3_c_2_n_100[50,2:7])
table.3[15,7:12] <- as.numeric(rmse_dgp3_c_2_n_100[100,2:7])
table.3[16,7:12] <- colSums(abs(rmse_dgp3_c_2_n_100[,2:7])) / 100


table.3[17,7:12] <- as.numeric(bias_dgp3_c_2_n_400[1,14:19])
table.3[18,7:12] <- as.numeric(bias_dgp3_c_2_n_400[50,14:19])
table.3[19,7:12] <- as.numeric(bias_dgp3_c_2_n_400[100,14:19])
table.3[20,7:12] <- colSums(abs(bias_dgp3_c_2_n_400[,14:19])) / 100
table.3[21,7:12] <- as.numeric(bias_dgp3_c_2_n_400[1,2:7])
table.3[22,7:12] <- as.numeric(bias_dgp3_c_2_n_400[50,2:7])
table.3[23,7:12] <- as.numeric(bias_dgp3_c_2_n_400[100,2:7])
table.3[24,7:12] <- colSums(abs(bias_dgp3_c_2_n_400[,2:7])) / 100

table.3[25,7:12] <- as.numeric(rmse_dgp3_c_2_n_400[1,14:19])
table.3[26,7:12] <- as.numeric(rmse_dgp3_c_2_n_400[50,14:19])
table.3[27,7:12] <- as.numeric(rmse_dgp3_c_2_n_400[100,14:19])
table.3[28,7:12] <- colSums(abs(rmse_dgp3_c_2_n_400[,14:19])) / 100
table.3[29,7:12] <- as.numeric(rmse_dgp3_c_2_n_400[1,2:7])
table.3[30,7:12] <- as.numeric(rmse_dgp3_c_2_n_400[50,2:7])
table.3[31,7:12] <- as.numeric(rmse_dgp3_c_2_n_400[100,2:7])
table.3[32,7:12] <- colSums(abs(rmse_dgp3_c_2_n_400[,2:7])) / 100


table.3[33,7:12] <- as.numeric(bias_dgp3_c_2_n_1600[1,14:19])
table.3[34,7:12] <- as.numeric(bias_dgp3_c_2_n_1600[50,14:19])
table.3[35,7:12] <- as.numeric(bias_dgp3_c_2_n_1600[100,14:19])
table.3[36,7:12] <- colSums(abs(bias_dgp3_c_2_n_1600[,14:19])) / 100
table.3[37,7:12] <- as.numeric(bias_dgp3_c_2_n_1600[1,2:7])
table.3[38,7:12] <- as.numeric(bias_dgp3_c_2_n_1600[50,2:7])
table.3[39,7:12] <- as.numeric(bias_dgp3_c_2_n_1600[100,2:7])
table.3[40,7:12] <- colSums(abs(bias_dgp3_c_2_n_1600[,2:7])) / 100

table.3[41,7:12] <- as.numeric(rmse_dgp3_c_2_n_1600[1,14:19])
table.3[42,7:12] <- as.numeric(rmse_dgp3_c_2_n_1600[50,14:19])
table.3[43,7:12] <- as.numeric(rmse_dgp3_c_2_n_1600[100,14:19])
table.3[44,7:12] <- colSums(abs(rmse_dgp3_c_2_n_1600[,14:19])) / 100
table.3[45,7:12] <- as.numeric(rmse_dgp3_c_2_n_1600[1,2:7])
table.3[46,7:12] <- as.numeric(rmse_dgp3_c_2_n_1600[50,2:7])
table.3[47,7:12] <- as.numeric(rmse_dgp3_c_2_n_1600[100,2:7])
table.3[48,7:12] <- colSums(abs(rmse_dgp3_c_2_n_1600[,2:7])) / 100

# 30% censoring
table.3[1,13:18] <- as.numeric(bias_dgp3_c_3_n_100[1,14:19])
table.3[2,13:18] <- as.numeric(bias_dgp3_c_3_n_100[50,14:19])
table.3[3,13:18] <- as.numeric(bias_dgp3_c_3_n_100[100,14:19])
table.3[4,13:18] <- colSums(abs(bias_dgp3_c_3_n_100[,14:19])) / 100
table.3[5,13:18] <- as.numeric(bias_dgp3_c_3_n_100[1,2:7])
table.3[6,13:18] <- as.numeric(bias_dgp3_c_3_n_100[50,2:7])
table.3[7,13:18] <- as.numeric(bias_dgp3_c_3_n_100[100,2:7])
table.3[8,13:18] <- colSums(abs(bias_dgp3_c_3_n_100[,2:7])) / 100

table.3[9,13:18] <- as.numeric(rmse_dgp3_c_3_n_100[1,14:19])
table.3[10,13:18] <- as.numeric(rmse_dgp3_c_3_n_100[50,14:19])
table.3[11,13:18] <- as.numeric(rmse_dgp3_c_3_n_100[100,14:19])
table.3[12,13:18] <- colSums(abs(rmse_dgp3_c_3_n_100[,14:19])) / 100
table.3[13,13:18] <- as.numeric(rmse_dgp3_c_3_n_100[1,2:7])
table.3[14,13:18] <- as.numeric(rmse_dgp3_c_3_n_100[50,2:7])
table.3[15,13:18] <- as.numeric(rmse_dgp3_c_3_n_100[100,2:7])
table.3[16,13:18] <- colSums(abs(rmse_dgp3_c_3_n_100[,2:7])) / 100


table.3[17,13:18] <- as.numeric(bias_dgp3_c_3_n_400[1,14:19])
table.3[18,13:18] <- as.numeric(bias_dgp3_c_3_n_400[50,14:19])
table.3[19,13:18] <- as.numeric(bias_dgp3_c_3_n_400[100,14:19])
table.3[20,13:18] <- colSums(abs(bias_dgp3_c_3_n_400[,14:19])) / 100
table.3[21,13:18] <- as.numeric(bias_dgp3_c_3_n_400[1,2:7])
table.3[22,13:18] <- as.numeric(bias_dgp3_c_3_n_400[50,2:7])
table.3[23,13:18] <- as.numeric(bias_dgp3_c_3_n_400[100,2:7])
table.3[24,13:18] <- colSums(abs(bias_dgp3_c_3_n_400[,2:7])) / 100

table.3[25,13:18] <- as.numeric(rmse_dgp3_c_3_n_400[1,14:19])
table.3[26,13:18] <- as.numeric(rmse_dgp3_c_3_n_400[50,14:19])
table.3[27,13:18] <- as.numeric(rmse_dgp3_c_3_n_400[100,14:19])
table.3[28,13:18] <- colSums(abs(rmse_dgp3_c_3_n_400[,14:19])) / 100
table.3[29,13:18] <- as.numeric(rmse_dgp3_c_3_n_400[1,2:7])
table.3[30,13:18] <- as.numeric(rmse_dgp3_c_3_n_400[50,2:7])
table.3[31,13:18] <- as.numeric(rmse_dgp3_c_3_n_400[100,2:7])
table.3[32,13:18] <- colSums(abs(rmse_dgp3_c_3_n_400[,2:7])) / 100


table.3[33,13:18] <- as.numeric(bias_dgp3_c_3_n_1600[1,14:19])
table.3[34,13:18] <- as.numeric(bias_dgp3_c_3_n_1600[50,14:19])
table.3[35,13:18] <- as.numeric(bias_dgp3_c_3_n_1600[100,14:19])
table.3[36,13:18] <- colSums(abs(bias_dgp3_c_3_n_1600[,14:19])) / 100
table.3[37,13:18] <- as.numeric(bias_dgp3_c_3_n_1600[1,2:7])
table.3[38,13:18] <- as.numeric(bias_dgp3_c_3_n_1600[50,2:7])
table.3[39,13:18] <- as.numeric(bias_dgp3_c_3_n_1600[100,2:7])
table.3[40,13:18] <- colSums(abs(bias_dgp3_c_3_n_1600[,2:7])) / 100

table.3[41,13:18] <- as.numeric(rmse_dgp3_c_3_n_1600[1,14:19])
table.3[42,13:18] <- as.numeric(rmse_dgp3_c_3_n_1600[50,14:19])
table.3[43,13:18] <- as.numeric(rmse_dgp3_c_3_n_1600[100,14:19])
table.3[44,13:18] <- colSums(abs(rmse_dgp3_c_3_n_1600[,14:19])) / 100
table.3[45,13:18] <- as.numeric(rmse_dgp3_c_3_n_1600[1,2:7])
table.3[46,13:18] <- as.numeric(rmse_dgp3_c_3_n_1600[50,2:7])
table.3[47,13:18] <- as.numeric(rmse_dgp3_c_3_n_1600[100,2:7])
table.3[48,13:18] <- colSums(abs(rmse_dgp3_c_3_n_1600[,2:7])) / 100
#-----------------------------------------------------------------------------
# Save it
write.table(table.3, here("simulations/tables/table_dgp3_complete.txt"), sep="\t")
#-----------------------------------------------------------------------------
# Summary table with results (selective ones)
summary_table3 <- matrix(NA, ncol = 19, nrow = 12)
summary_table3[,1] <- rep(c(100,400,1600),4) 
summary_table3[1,2:19] <- table.3[4,] 
summary_table3[2,2:19] <- table.3[20,] 
summary_table3[3,2:19] <- table.3[36,] 

summary_table3[4,2:19] <- table.3[12,] 
summary_table3[5,2:19] <- table.3[28,] 
summary_table3[6,2:19] <- table.3[44,] 


summary_table3[7,2:19] <- table.3[8,] 
summary_table3[8,2:19] <- table.3[24,] 
summary_table3[9,2:19] <- table.3[40,] 

summary_table3[10,2:19] <- table.3[16,] 
summary_table3[11,2:19] <- table.3[32,] 
summary_table3[12,2:19] <- table.3[48,] 

summary_table3[,2:19] <- 100 * summary_table3[,2:19]

colnames(summary_table3) <- c("n", 
                              "PH-0%", "PO-0%", "DR-cll-0%", "DR-logit-0%", "DR-cll-ig-0%", "DR-logit-ig-0%",
                              "PH-10%", "PO-10%", "DR-cll-10%", "DR-logit-10%", "DR-cll-ig-10%", "DR-logit-ig-10%",
                              "PH-30%", "PO-30%", "DR-cll-30%", "DR-logit-30%", "DR-cll-ig-30%", "DR-logit-ig-30%"
)

rownames(summary_table3) <- c(rep("cdf-bias", 3),
                              rep("cdf-rmse", 3),
                              rep("adme-bias", 3), 
                              rep("adme-rmse", 3))

#-----------------------------------------------------------------------------
# Save it
write.table(summary_table3, here("simulations/tables/table_dgp3_summary.txt"), sep="\t")
#-----------------------------------------------------------------------------


rm(list=ls())
