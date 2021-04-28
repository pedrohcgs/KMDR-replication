*Run using UNIX version of Stata;
*8-19-02 This program extracts information on  people's assets and liabilities
*datasets: original sipp extracts must be unzipped into sip91t*.dat temp
*files, and t7asset91 is output;

log using t7asset91, replace

global X = 7

set more off
set mem 200m

!pkunzip /home/data/sipp/1991/sipp91t$X.zip
!mv sipp91t$X.dat sipp91t$X.raw
log close

do sip91t$X

rename id suid
rename wave a_wave
rename tm8538 PrimHmMthPurch 
rename tm8539 PrimHmYearPurch 
rename tm8540 PrimHmMrtgYN 
rename tm8542 PrimHmMrtgNum 
rename tm8564 Mrtg1PrincOwed 
rename tm8568 Mrtg1YearObtaind 
rename tm8569 Mrtg1MnthObtaind 
rename tm8572 Mrtg1OrgnlAmnt 
rename tm8576 Mrtg1NumYearsPymt 
rename tm8580 Mrtg1APR 
rename tm8592 Mrtg1OtherMrtgYN 
rename tm8566 Mrtg2PrincOwed 
rename tm8570 Mrtg2YearObtaind 
rename tm8571 Mrtg2MnthObtaind 
rename tm8574 Mrtg2OrgnlAmnt 
rename tm8578 Mrtg2NumYearsPymt 
rename tm8582 Mrtg2APR 
rename tm8598 ProptyCurrVal 
rename tm8658 ResSubsdYN 
rename tm8660 OwnOthRealEstYN 
rename tm8666 TValOthRealEst 
rename tm8714 OwnVehYN 
rename tm8716 HNumVeh 
rename tm8730 MVeh1Year 
rename tm8754 MVeh1DebtYN 
rename tm8760 MVeh1DebtAmnt 
rename tm8766 OtherMVeh1YN 
rename tm8732 MVeh2Year 
rename tm8756 MVeh2DebtYN 
rename tm8762 MVeh2DebtAmnt 
rename tm8768 OtherMVeh2YN 
rename tm8734 MVeh3Year 
rename tm8758 MVehDebtYN 
rename tm8764 MVeh3DebtAmnt 

rename tmcarvl1 tmcarva1
rename tmcarvl2 tmcarva2
rename tmcarvl3 tmcarva3

*Concatenate pnum
replace pnum = 1000*entry+pnum

keep suseqnum suid state pinx pnum a_wave tmcarva1 tmcarva2 tmcarva3 hh_mortg hh_theq hh_vehcl hh_beq hh_intbk hh_intot hh_stk hh_ore hh_otast hh_ira hh_twlth hh_scdbt hh_usdbt hh_debt hh_tnw PrimHmMthPurch PrimHmYearPurch PrimHmMrtgYN PrimHmMrtgNum Mrtg1PrincOwed Mrtg1YearObtaind Mrtg1MnthObtaind Mrtg1OrgnlAmnt Mrtg1NumYearsPymt Mrtg1APR Mrtg1OtherMrtgYN Mrtg2PrincOwed Mrtg2YearObtaind Mrtg2MnthObtaind Mrtg2OrgnlAmnt Mrtg2NumYearsPymt Mrtg2APR ProptyCurrVal ResSubsdYN OwnOthRealEstYN TValOthRealEst OwnVehYN HNumVeh MVeh1Year MVeh1DebtYN MVeh1DebtAmnt OtherMVeh1YN MVeh2Year MVeh2DebtYN MVeh2DebtAmnt OtherMVeh2YN MVeh3Year MVehDebtYN MVeh3DebtAmnt

*decode the 0's in certain vars to missing values

log close
set logtype text
log using miss-val-t791.txt, replace

#delimit;

mvdecode PrimHmMthPurch PrimHmYearPurch PrimHmMrtgYN Mrtg1PrincOwed Mrtg1YearObtaind Mrtg1MnthObtaind
Mrtg1OrgnlAmnt Mrtg1NumYearsPymt Mrtg1APR Mrtg1OtherMrtgYN Mrtg2PrincOwed Mrtg2YearObtaind Mrtg2MnthObtaind Mrtg2OrgnlAmnt
Mrtg2NumYearsPymt Mrtg2APR ProptyCurrVal ResSubsdYN OwnOthRealEstYN OwnVehYN HNumVeh MVeh1Year MVeh1DebtYN
OtherMVeh1YN MVeh2Year MVeh2DebtYN OtherMVeh2YN MVeh3Year MVehDebtYN, mv(0);

#delimit cr

log close 


save t7asset91, replace
rm sipp91t$X.raw
