*Raj Chetty
*3-24-03 This program creates the asset86 dataset from SIPP ascii file wave 4;

#delimit;

*Run using UNIX version of Stata in appropriate directory;

*4-24-03 This program creates the asset86 dataset from SIPP flat file for wave 4;
*Only variables relevant for this project are retained;

set more off;
set mem 500m;

*Only do wave 4;

global X 4;

*Following commands use for UNIX/NBER data;
!pkunzip /home/data/sipp/1986/sipp86rt$X.zip;
!mv sipp86rt$X.dat sipp86rt$X.raw;
quietly infile using sip86rt$X;

*CONCATENATE entry and pnum to generate new, unique pnum;

gen pnum = 1000*pp_entry+pp_pnum;
drop pp_*;
rename su_id suid;
gen a_wave = 4;

save rt4asset86, replace;
rm sipp86rt$X.raw;
