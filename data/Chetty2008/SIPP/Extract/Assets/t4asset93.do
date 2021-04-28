*Run using UNIX version of Stata;
*8-19-02 This program extracts information on people's rent, util, and car costs
*datasets: original sipp extracts must be unzipped into sip93t*.dat temp
*files, and t4asset93 is output;

log using t4asset93, replace

global X = 4

set more off
set mem 200m

!pkunzip /homes/data/sipp/1993/sipp93t$X.zip
!mv sipp93t$X.dat sipp93t$X.raw
log close

do sip93t$X

rename id suid
rename wave r_wave
rename tm8538 rent 
rename tm8540 util 
rename tm8762 car1debt
rename tm8796 car2debt
rename tm8798 car3debt
rename tmcarvl1 tmcarva1
rename tmcarvl2 tmcarva2
rename tmcarvl3 tmcarva3

*Concatenate pnum
replace pnum = 1000*entry+pnum

keep suid pnum r_wave rent util tmcarva1 tmcarva2 tmcarva3 car1debt car2debt car3debt

log close
set logtype text
log using miss-val-t493.txt, replace

*mvdecode rent util, mv(0)

log close

save t4asset93, replace
rm sipp93t$X.raw
