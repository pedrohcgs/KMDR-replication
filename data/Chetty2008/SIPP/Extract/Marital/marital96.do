*Raj Chetty 4-25-03

#delimit;

*Run using UNIX version of Stata in appropriate directory;
*This program extracts asset data from 1996 SIPP ascii wave 3;

set more off;
set mem 500m;


global W 2;
global X $W;

log using marital96, replace;

!pkunzip /home/data/sipp/1996/sipp96t$X.zip;
!mv sipp96t$W.dat sipp96t$W.raw;

quietly infile using sip96t$W;

*Give the pre-1996 names to the post-1996 variables and recode other vars;

rename ssuid suid;
rename epppnum pnum;
rename epmrunv maruniv;
rename exmar nummars;
rename elmmon marmth;
rename tlmyear maryr;
rename elsmon sepmth;
rename tlsyear sepyr;
rename efbrthmo brth1mth;
rename tfbrthyr brth1yr;

keep suid pnum nummars marmth maryr sepmth sepyr brth1mth brth1yr;
mvdecode nummars marmth maryr sepmth sepyr brth1mth brth1yr, mv(-1);

save marital96, replace;
rm sipp96t$W.raw;

log close;
