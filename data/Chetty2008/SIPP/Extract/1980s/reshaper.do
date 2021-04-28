#delimit;

*THIS PROGRAM REQUIRES 2 digit GLOBAL YEAR Y to be defined before execution;
*This program reshapes the wide-format data in wide$Y (pre-90 SIPPs downloaded from ICPSR)
into long format and saves output as base$Y after renaming and recoding some vars;

*RUN IN UNIX STATA;

log using reshaper$Y, replace;

clear;
set mem 500m;
use ~/bulk/wide$Y, clear;

drop pp_entry pp_pnum;

reshape long mth year state finc fearn
             fnlwgt_  ms_ pnsp_ pptotin pp_earn esr_ wksper wksjb wislok 
             ws1_wks ws1_amt i05rec i05amt i06rec i06amt, i(suid pnum wave) j(refmth);

rename fnlwgt_ fnlwgt;
rename ms_ ms;
rename pnsp_ pnsp;
rename esr_ esr;
rename pptotin inc;
rename pp_earn earn;
rename wksper wks;
rename wislok wkslok;
rename ws1_wks ws1wks;
rename ws1_amt ws1amt;
rename i05rec ui_yn;
rename i05amt uiamt;
rename i06rec suppui_yn;
rename i06amt suppuiamt;


*Recode binary vars;

replace sex=sex-1;

label define sexlabel 0 M 1 F;
label values sex sexlabel;

for var ui_yn suppui_yn: replace X=. if X==0 \ replace X=-(X-2);

label define yesno 0 no 1 yes;

for var ui_yn suppui_yn: label values X yesno;

save ~/bulk/base$Y, replace;

clear;

log close;
