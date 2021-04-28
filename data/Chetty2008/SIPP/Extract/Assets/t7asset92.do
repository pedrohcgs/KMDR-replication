*Run using UNIX version of Stata;
*8-19-02 This program extracts information on  people's assets and liabilities
*datasets: original sipp extracts must be unzipped into sip92t*.dat temp
*files, and t7asset92 is output;

log using t7asset92, replace

global X = 7

set more off
set mem 200m

!pkunzip /home/data/sipp/1992/sipp92t$X.zip
!mv sipp92t$X.dat sipp92t$X.raw
log close

do sip92t$X


rename tm8538 rent 
rename tm8540 util 

*Concatenate pnum
replace pnum = 1000*entry+pnum

keep suseqnum id state pinx pnum wave rent util 

log close
set logtype text
log using miss-val-t792.txt, replace


mvdecode rent util, mv(0) 

log close 


save t7asset92, replace
rm sipp92t$X.raw
