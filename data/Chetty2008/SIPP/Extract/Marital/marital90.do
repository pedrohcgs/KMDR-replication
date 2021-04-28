*Raj Chetty 4-25-03

#delimit;

*Run using UNIX version of Stata in appropriate directory;

set more off;
set mem 500m;

global Y 90;
global W 2;

log using marital$Y, replace;

!pkunzip /home/data/sipp/19$Y/sipp90t$W.zip;
!mv sipp90t$W.dat sipp90t$W.raw;

quietly infile using sip90t$W;

rename id suid;
replace pnum = 1000*entry+pnum;
rename tm8602 nummars;
rename tm8640 marmth;
rename tm8642 maryr;
*sepmth/yr here refer to when you actually LEFT spouse;
rename tm8652 sepmth;
rename tm8654 sepyr;

*Can only get brth1 var if kid lives in house b/c other question asks about birthdate of 2nd child;
*Skip fertility stuff for now because of errors in this topical module;
*rename tm8760 brth1mth;
*rename tm8762 brth1yr;


*keep suid pnum nummars marmth maryr sepmth sepyr brth1mth brth1yr;
*mvdecode nummars marmth maryr sepmth sepyr brth1mth brth1yr, mv(0);
keep suid pnum nummars marmth maryr sepmth sepyr;
mvdecode nummars marmth maryr sepmth sepyr, mv(0);

sort suid pnum;
save marital$Y, replace;
rm sipp90t$W.raw;

log close;
