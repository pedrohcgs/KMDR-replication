*Raj Chetty
*3-25-03 This program creates the asset85 dataset from SIPP 1985 Wave 3 data;
*Only variables relevant for this project are retained;

#delimit;

*Run using UNIX version of Stata;

set more off;
set mem 500m;

*Only do wave 3;

global X 3;

*Following commands use for UNIX/NBER data;
!pkunzip /home/data/sipp/1985/sipp85rt$X.zip;
!mv sipp85rt$X.dat sipp85rt$X.raw;
quietly infile using sip85rt$X;

*CONCATENATE entry and pnum to generate new, unique pnum;

gen pnum = 1000*pp_entry+pp_pnum;
drop pp_*;
rename su_id suid;
gen a_wave=4;

save rt3asset85, replace;
rm sipp85rt$X.raw;
