*Raj Chetty 4-25-03

#delimit;

*Run using UNIX version of Stata in appropriate directory;

set more off;
set mem 500m;

global Y 93;
global W 2;

log using marital$Y, replace;

!pkunzip /home/data/sipp/19$Y/sipp93t$W.zip;
!mv sipp93t$W.dat sipp93t$W.raw;

quietly infile using sip93t$W;

rename id suid;
replace pnum = 1000*entry+pnum;
rename tm8602 nummars;
rename tm8640 marmth;
rename tm8642 maryr;
*sepmth/yr here refer to when you actually LEFT spouse;
rename tm8652 sepmth;
rename tm8654 sepyr;
*Need two sets of brth1 variables b/c it depends on whether kid is in sample;
rename tm8760 brth1mth_inhouse;
rename tm8762 brth1yr_inhouse;
rename tm8792 brth1mth;
rename tm8794 brth1yr;
replace brth1mth=brth1mth_inhouse if brth1mth==0;
replace brth1yr=brth1yr_inhouse if brth1yr==0;


keep suid pnum nummars marmth maryr sepmth sepyr brth1mth brth1yr;
mvdecode nummars marmth maryr sepmth sepyr brth1mth brth1yr, mv(0);

sort suid pnum;
save marital$Y, replace;
rm sipp93t$W.raw;

log close;
