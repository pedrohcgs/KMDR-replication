*THIS PROGRAM REQUIRES GLOBAL Y TO BE DEFINED IN ADVANCE

log using spells, replace
#delimit;
set more off;
clear;
set mem 500m;

*8-11-02 This program creates a dataset of unemp spells from individual monthly SIPP data
 Input dataset: unemp$Y
 Output dataset: spells$Y;

use ~/bulk/unemp$Y;

*** JOB SEPARATION DEFINED IN UNEMP.DO;

sort suid pnum wave refmth;
drop if suid==suid[_n-1]&pnum==pnum[_n-1]&panel==panel[_n-1]&wave==wave[_n-1]&refmth==refmth[_n-1];

*In the 1980s data, there is no wesr variable.  Therefore the following defs are replaced:
gen wksunemp = (wesr1>=3)+(wesr2>=3)+(wesr3>=3)+(wesr4>=3)+(wesr5>=3)
gen searchwks = (wesr1==4)+(wesr2==4)+(wesr3==4)+(wesr4==4)+(wesr5==4)
gen wksemp =(wesr1==1|wesr1==2)+(wesr2==1|wesr2==2)+
   (wesr3==1|wesr3==2)+(wesr4==1|wesr4==2)+(wesr5==1|wesr5==2);

gen wksunemp = wks-wksjb;
gen searchwks = wkslok;
gen wksemp = wksjb;
gen unempmth = wksunemp==wks;

*Redefine job separation because of partial unemployment problem in 1980s definition
 -- sometimes have dur=0 with jobsep=1 because ESR changes without actual empl status change;
replace jobsep=0 if jobsep==1&wksunemp==0;

*Label each spell of unemployment for each person;
gen spell=.;
sort suid pnum jobsep year mth;
by suid pnum jobsep: replace spell = _n if jobsep==1;
tab spell;
sort suid pnum year mth;
by suid pnum: replace spell=spell[_n-1] if wksunemp>0&jobsep~=1;

*Add weeks and uiamt in each spell to compute dur and totuiamt;
sort suid pnum spell;
by suid pnum spell: egen dur = sum(wksunemp);
by suid pnum spell: egen searchdur = sum(searchwks);
by suid pnum spell: egen totuiamt = sum(uiamt);

*Add weeks remaining in a wave for seam calculation (DIFFERENT IN 1980s panels);
*ASSUME ONLY ONE JOB SEPARATION IN THE MONTH;

gen unempwk = wksjb+1 if jobsep==1;

sort suid pnum wave refmth;
by suid pnum wave: egen refwks = sum(wks);
replace refwks=. if refwks<17;
tab refwks;

sort suid pnum wave refmth;
gen seam1wks = refwks-(unempwk-1) if jobsep==1&refmth==1;
replace seam1wks = refwks-wks[_n-1]-(unempwk-1) if jobsep==1&refmth==2;
replace seam1wks = refwks-wks[_n-1]-wks[_n-2]-(unempwk-1) if jobsep==1&refmth==3;
replace seam1wks = wks-(unempwk-1) if jobsep==1&refmth==4;

sort suid pnum refmth wave;
gen ref2wks = refwks[_n+1] if suid==suid[_n+1]&pnum==pnum[_n+1]&(wave[_n+1]-wave==1);
gen ref3wks = ref2wks[_n+1] if suid==suid[_n+1]&pnum==pnum[_n+1]&(wave[_n+1]-wave==1);
sort suid pnum wave refmth;
gen seam2wks = seam1wks+ref2wks if jobsep==1;
gen seam3wks = seam1wks+ref2wks+ref3wks if jobsep==1;

*Label right-censored spells;
sort suid pnum year mth;
by suid pnum: gen mthsleft = _N-_n;
gen censrd=0;
replace censrd=1 if mthsleft==0&unempmth==1;
sort suid pnum spell year mth;
by suid pnum spell: replace censrd=censrd[_N];

*Compute tenure -- weeks employed before job separation;
*Need to reverse sorting order to execute replace mark statement;
gsort +suid +pnum -year -mth;
gen mark=spell;
by suid pnum: replace mark=mark[_n-1] if wksemp>0&jobsep==0;
sort suid pnum mark;
by suid pnum mark: egen tenure=sum(wksemp);

*Identify censored tenures;  
sort suid pnum year mth;
by suid pnum: gen cummths = _n;
gen empcens=0;
replace empcens=1 if cummths==1&wksemp==wks;
by suid pnum: replace empcens=1 if wksemp==wks&empcens[_n-1]==1;
by suid pnum: replace empcens=1 if jobsep==1&empcens[_n-1]==1;

*Compute actual weekly wage after job find and dummy for spell ending on seam;
sort suid pnum year mth;
by suid pnum: gen nextwage = earn_f1 if spell~=spell[_n+1];
by suid pnum: gen seamend = refmth==4&spell~=spell[_n+1]&unempmth==1;
sort suid pnum spell year mth;
by suid pnum spell: replace nextwage = nextwage[_N];
by suid pnum spell: replace seamend = seamend[_N];
replace seamend=0 if censrd==1;
gen seambeg = refmth==1&jobsep==1&unempmth==1;

*Define UI receipt (during any point in spell) variable;
sort suid pnum year mth;
replace uiamt=0 if uiamt==.;
gen ui_yn2 = uiamt>0|(suid==suid[_n+1]&pnum==pnum[_n+1]&spell==spell[_n+1]&uiamt[_n+1]>0);
sort suid pnum spell year mth;
by suid pnum spell: egen uireceipt=sum(ui_yn);
replace uireceipt=uireceipt>0;

*Identify temporary layoffs (by esr==3 at ANY point in spell);
by suid pnum spell: egen templayoff=sum(esr==3);
replace templayoff=templayoff>0;

sort suid pnum year mth;

***COLLAPSE dataset into spells;
keep if jobsep==1;
count;

rename fnlwgt p5wgt;
rename ws1_ind ws1ind;
rename ws1_occ ws1occ;

*ethncty, htype removed below;
rename ws1uhours uhours;

keep suid pnum panel wave mth year refmth seamth qtr state 
     p5wgt age sex race mardum ed ws1ind ws1occ kids
     qearn_l* cv_earn bpw hq1w hq2w annwg fanninc spanninc
     ui_yn totuiamt suppui_yn suppuiamt
     spell dur spwork_yn templayoff censrd tenure empcens
     seambeg seamend nextwage wks_f* earn_f* inc_f* spinc_f* finc_f*
     ui_yn2 uireceipt uhours searchdur mthsinsamp seam1wks seam2wks seam3wks;

order suid pnum panel wave mth year refmth seamth qtr state 
     p5wgt age sex race mardum ed ws1ind ws1occ kids
     qearn_l* cv_earn bpw hq1w hq2w annwg fanninc spanninc
     ui_yn totuiamt suppui_yn suppuiamt
     spell dur spwork_yn templayoff censrd tenure empcens
     seambeg seamend nextwage wks_f* earn_f* inc_f* spinc_f* finc_f*
     ui_yn2 uireceipt uhours searchdur mthsinsamp seam1wks seam2wks seam3wks;

save spells$Y, replace;

log close;
