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

*List of vars potentially useful to discern job separation: 
   esr weeks wesr1 wesr2 wesr3 wesr4 wesr5 wksjob wkswop wkslok reasab takjob
   takjobn cwork uhours wkspt wksptr empled w1stop w2stop;
*	Could add &wksjob[_n-2]==wks[_n-2]&....
	(for further stability of pre-unemp job in sample if desired)
	(defs below include partial unemployment);
*Other possibilties: change in wesr status, diff options in 96 SIPP;
*Definitions below are problematic for various reasons: see exploratory notes
 gen jobsep4=0
 by suid pnum: replace jobsep4 = notfullemp==1&notfullemp[_n-1]~=1
 gen jobsep3=0
 replace jobsep3=w1stop_yn==1
 gen jobsep1=0
 by suid pnum: replace jobsep1 = wksjob<wks&wksjob[_n-1]==wks[_n-1];
*by suid pnum: replace jobsep = esr[_n-1]==1&(esr==3|esr==5|esr==6|esr==7);
* Note: this def ignores problems of partial unemployment for now
  and only looks at jobs that last for at least one month;
*OLD Def of wksunemp below excludes weeks not looking;
*NEW DEF of wksunemp INCLUDES weeks not looking;
*gen wksunemp2 = (wesr1==4|wesr1==3)+(wesr2==4|wesr2==3)+
   (wesr3==4|wesr3==3)+(wesr4==4|wesr4==3)+(wesr5==4|wesr5==3);


gen wksunemp = (wesr1>=3)+(wesr2>=3)+(wesr3>=3)+(wesr4>=3)+(wesr5>=3);
gen wksemp = (wesr1==1|wesr1==2)+(wesr2==1|wesr2==2)+
   (wesr3==1|wesr3==2)+(wesr4==1|wesr4==2)+(wesr5==1|wesr5==2);
gen searchwks = (wesr1==4)+(wesr2==4)+(wesr3==4)+(wesr4==4)+(wesr5==4);
gen unempmth = wksunemp==wks;

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

*Add weeks remaining in a wave for seam calculation;
gen unempwk = (wesr1>=3)*1
   +(wesr1<3&wesr2>=3)*2
   +(wesr1<3&wesr2<3&wesr3>=3)*3
   +(wesr1<3&wesr2<3&wesr3<3&wesr4>=3)*4
   +(wesr1<3&wesr2<3&wesr3<3&wesr4<3&wesr5>=3)*5;

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

***COLLAPSE dataset into spells -- note that all cross-sectional data, e.g. wave, refers to date of job sep;
keep if jobsep==1;
count;

keep suid pnum panel wave mth year refmth seamth qtr state 
     p5wgt age sex race ethncty mardum ed htype ws1ind ws1occ kids
     qearn_l* cv_earn bpw hq1w hq2w annwg fanninc spanninc
     ui_yn totuiamt suppui_yn suppuiamt otherui_yn othuiamt
     spell dur spwork_yn templayoff censrd tenure empcens
     seambeg seamend nextwage wks_f* earn_f* inc_f* spinc_f* finc_f*
     ui_yn2 uireceipt uhours searchdur qwks_l* ws1qearn_l* mthsinsamp
     seam1wks seam2wks seam3wks;

order suid pnum panel wave mth year refmth seamth qtr state 
     p5wgt age sex race ethncty mardum ed htype ws1ind ws1occ kids
     qearn_l* cv_earn bpw hq1w hq2w annwg fanninc spanninc
     ui_yn totuiamt suppui_yn suppuiamt otherui_yn othuiamt
     spell dur spwork_yn templayoff censrd tenure empcens
     seambeg seamend nextwage wks_f* earn_f* inc_f* spinc_f* finc_f*
     ui_yn2 uireceipt uhours searchdur qwks_l* ws1qearn_l* mthsinsamp
     seam1wks seam2wks seam3wks;

save spells$Y, replace;

log close;
