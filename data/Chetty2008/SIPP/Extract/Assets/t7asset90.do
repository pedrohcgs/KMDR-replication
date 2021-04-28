*Run using UNIX version of Stata;
*8-19-02 This program extracts information on  people's assets and liabilities
*datasets: original sipp extracts must be unzipped into sip90t*.dat temp
*files, and t7asset90 is output;

log using t7asset90, replace

global X = 7

set more off
set mem 200m

!pkunzip /home/data/sipp/1990/sipp90t$X.zip
!mv sipp90t$X.dat sipp90t$X.raw
log close

do sip90t$X


rename tm8538 rent 
rename tm8540 util 

keep suseqnum id state pinx pnum wave rent util 

log close
set logtype text
log using miss-val-t790.txt, replace


mvdecode rent util, mv(0) 

log close 


save t7asset90, replace
rm sipp90t$X.raw
