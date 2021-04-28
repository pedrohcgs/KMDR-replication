*Raj Chetty 3-25-03

#delimit;

*Run using UNIX version of Stata in appropriate directory;
*This program extracts asset data from 1996 SIPP ascii wave 3;

set more off;
set mem 500m;


global W 3;
global X $W;

log using t3asset$W, replace;

!pkunzip /home/data/sipp/1996/sipp96t$X.zip;
!mv sipp96t$W.dat sipp96t$W.raw;

quietly infile using sip96t$W;

*Give the pre-1996 names to the post-1996 variables and recode other vars;

rename ssuid suid;
rename epppnum pnum;
rename swave a_wave;
gen r_wave= a_wave;

rename thhtnw hh_tnw;
rename thhtwlth hh_twlth;
rename thhtheq hh_theq;
rename thhmortg hh_mortg;
rename thhbeq hh_beq;
rename thhintbk hh_intbk;
rename thhintot hh_intot;
rename rhhstk hh_stk;
rename thhore hh_ore;
rename thhotast hh_otast;
rename thhira hh_ira;
rename thhdebt hh_debt;
rename thhscdbt hh_scdbt;
rename rhhuscbt hh_usdbt;
rename thhvehcl hh_vehcl;
rename tcarval1 tmcarva1;
rename tcarval2 tmcarva2;
rename tcarval3 tmcarva3;
rename ehbuymo PrimHmMthPurch;
rename ehbuyyr PrimHmYearPurch;
rename ehmort PrimHmMrtgYN;
rename enummort PrimHmMrtgNum;
rename tmor1pr Mrtg1PrincOwed;
rename emor1yr Mrtg1YearObtaind;
rename emor1mo Mrtg1MnthObtaind;
rename tmor1amt Mrtg1OrgnlAmnt;
rename emor1yrs Mrtg1NumYearsPymt;
rename emor1int Mrtg1APR;
rename tmor2pr Mrtg2PrincOwed;
rename emor2yr Mrtg2YearObtaind;  
rename emor2mo Mrtg2MnthObtaind;
rename tmor2amt Mrtg2OrgnlAmnt;
rename emor2yrs Mrtg2NumYearsPymt;
rename emor2int Mrtg2APR;
rename tpropval ProptyCurrVal;
rename eothre OwnOthRealEstYN;
rename tothreva TValOthRealEst;
rename eautoown OwnVehYN;
rename eautonum HNumVeh;
rename ea1owed MVeh1DebtYN;
rename ta1amt MVeh1DebtAmnt;
rename ea2owed MVeh2DebtYN;
rename ta2amt MVeh2DebtAmnt; 
rename ea3owed MVeh3DebtYN;
rename ta3amt MVeh3DebtAmnt; 
rename thomeamt rent;
rename tutils util;
rename eperspay perspayrent;

keep suid pnum a_wave tmcarva1 tmcarva2 tmcarva3 hh_mortg hh_theq hh_vehcl hh_beq hh_intbk hh_intot hh_stk 
hh_ore hh_otast hh_ira hh_twlth hh_scdbt hh_usdbt hh_debt hh_tnw PrimHmMthPurch PrimHmYearPurch PrimHmMrtgYN PrimHmMrtgNum
Mrtg1PrincOwed Mrtg1YearObtaind Mrtg1MnthObtaind Mrtg1OrgnlAmnt Mrtg1NumYearsPymt Mrtg1APR Mrtg2PrincOwed
Mrtg2YearObtaind Mrtg2MnthObtaind Mrtg2OrgnlAmnt Mrtg2NumYearsPymt Mrtg2APR ProptyCurrVal OwnOthRealEstYN
TValOthRealEst OwnVehYN HNumVeh MVeh1DebtYN MVeh1DebtAmnt MVeh2DebtYN MVeh2DebtAmnt MVeh3DebtYN MVeh3DebtAmnt
r_wave rent util perspayrent;

*decode the 0's in certain vars to missing values;

log close;
set logtype text;
log using miss-val-t396.txt, replace;

mvdecode PrimHmMthPurch PrimHmYearPurch PrimHmMrtgYN Mrtg1PrincOwed Mrtg1YearObtaind Mrtg1MnthObtaind
Mrtg1OrgnlAmnt Mrtg1NumYearsPymt Mrtg1APR Mrtg2PrincOwed Mrtg2YearObtaind Mrtg2MnthObtaind Mrtg2OrgnlAmnt
Mrtg2NumYearsPymt Mrtg2APR ProptyCurrVal OwnOthRealEstYN OwnVehYN HNumVeh MVeh1DebtYN MVeh2DebtYN MVehDebt3YN, mv(-1);

save t3asset96, replace;
rm sipp96t$W.raw;

log close;
