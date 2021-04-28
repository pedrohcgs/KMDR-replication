*Raj Chetty
*3-24-03 This program creates the asset87 dataset from SIPP ascii file wave 4;

#delimit;

*Run using UNIX version of Stata in appropriate directory;
*Only variables relevant for this project are retained;

set more off;
set mem 500m;

*Only do wave 4;

global X 4;

*Following commands use for UNIX/NBER data;
!pkunzip /home/data/sipp/1987/sipp87rt$X.zip;
!mv sipp87rt$X.dat sipp87rt$X.raw;
quietly infile using sip87rt$X;

*CONCATENATE entry and pnum to generate new, unique pnum;

gen pnum = 1000*pp_entry+pp_pnum;
drop pp_*;
rename su_id suid;
gen a_wave = 4;

save rt4asset87, replace;
rm sipp87rt$X.raw;
