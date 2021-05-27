# Kaplan-Meier Distribution Regression: <br> Replication files for Delgado, Garcia-Suaza and Sant'Anna (2021)

Contain codes and data for application and Monte Carlo simulations in Delgado, Garcia-Suaza and Sant'Anna (2021), "Distribution Regression in Duration Analysis: an Application to Unemployment Spells"

## Empirical Aplication
Our empirical application builds on [Chetty (2008)](https://www.journals.uchicago.edu/doi/abs/10.1086/588585). We assess how changes in unemployment insurance benefits affect, on average, the distribution of unemployment duration, using data from the Survey of Income and Program Participation for the period 1985-2000. The SIPP unprocessed data files were provided by Chetty (all his replication files are [here](http://www.rajchetty.com/chettyfiles/Chetty_UI_stata_code.zip), and we can be found in the `data/Chetty2008` folder. The folder `data/raw` contains the merged SIPP data files used by Chetty (2008). The processed data we use in our empirical aplication is available in the `data/processed` folder; the `Stata` file we used to produce it is available in at `application/00-data-process.do`.

All codes to replicate the results of our empirical application are available in the `application` folder. The `run-all.R` file will run all codes and produce all the results. The generated plots are saved in the `figures` folder. 

## Monte Carlo Simulations
All files to replicate our Monte Carlo results are available in the `simulations` folder. The R file `KMDR-sim-main.R` generate all results.

## Problems
If you have any trouble running the code, or find any errors, please file an issue on this repo and we will look into it.
