*THIS PROGRAM MUST BE CALLED AFTER GLOBAL Y IS DEFINED

log using unemp96, replace
#delimit;

set more off;
clear;
set mem 1000m;

*9-03-02 This program takes the baseY.dta extract from the SIPP to the unempY.dta file
 The unempY file consists only of those who become unemployed and satisfy other restrictions
 It also includes several constructed variables e.g. job-sep according to various measures.  
 These datasets are the basis for the spellsY.dta files used in spells.do;

use ~pbouzagl/bulk/base$Y.dta, clear;


*1. Keep only those who experience a job separation;

sort suid pnum year mth;
gen jobsep=0;
by suid pnum: replace jobsep = esr[_n-1]==1&esr>=3;
by suid pnum: egen mark=sum(jobsep);
keep if mark>0;
drop mark;

STOP

*Other eliminations;

keep if age>=18&age<65;

*2. Drop repeats;
sort suid pnum wave refmth;
drop if suid==suid[_n-1]&pnum==pnum[_n-1]&panel==panel[_n-1]&wave==wave[_n-1]&refmth==refmth[_n-1];

*3. Generate variable that will count month in sample and drop any second interviews ;
sort suid pnum wave refmth;
gen count=1;
replace count=count[_n-1]+1 if
 suid==suid[_n-1]&pnum==pnum[_n-1]&
  ((mth==(mth[_n-1]+1)&year==year[_n-1])|(year==(year[_n-1]+1)&mth==1)) in 2/l;
gen index=0 ;
replace index=1 if count==1 ;
replace index=2 if count==1&suid==suid[_n-1]&pnum==pnum[_n-1] ;
qui by suid pnum: replace index=index[_n-1] if index==0 ;
tab index ;
drop if index>1 ;
 label var count "month in panel" ;

* OLD EXCLUSIONS FROM JACULLEN;

*4. getting rid of anyone not there for at least 3 months;
egen mark=sum(index), by (suid pnum) ;
drop if mark<3;
drop mark index;

*5. Now sorting according to month and locating first 3 consecutive months
 where individual is working, defined as esr=1|2, ws1amt>0 (NO SELFEMP VAR)
 Get rid of those with less than three months work history;
gen mark=0;
replace mark=1 if (esr==1|esr==2)&ws1amt>=0&ws1amt~=.;
sort suid pnum panel wave refmth;
replace mark=mark[_n-1]+1 if suid==suid[_n-1]&pnum==pnum[_n-1]&mark[_n-1]>0&mark>0 in 2/l;
qui by suid pnum: replace mark=0 if mark==1&mark[_n+2]~=3;
qui by suid pnum: replace mark=0 if mark==2&mark[_n+1]~=3;
qui by suid pnum: replace mark=0 if mark~=1;
replace mark=mark[_n-1] if mark[_n-1]>0&suid==suid[_n-1]&pnum==pnum[_n-1] in 2/l;
drop if mark==0;
drop mark;

***GENERATE NEW VARIABLES;

*months in sample;
gen mark=1;
by suid pnum: egen mthsinsamp = sum(mark);
drop mark;

*kids;
rename nkidshl kids;

*NEED TO CODE EDUCATION DIFFERENTLY IN 1996 -- look at codebooks for translation

*education;
gen ed=higrade;
replace ed=1 if ed==31;
replace ed=3 if ed==32;
replace ed=5 if ed==33;
replace ed=7 if ed==34;
replace ed=ed-26 if ed>34&ed<=38;
replace ed=12 if ed==39|ed==40;
replace ed=13 if ed>=41&ed<=43;
replace ed=16 if ed==44;
replace ed=18 if ed>44;
drop higrade;

*marital dummy and other indicators;
gen mardum=0; 
replace mardum=1 if ms==1|ms==2 ;
gen white=1;
replace white=0 if race>1 ;
gen seamth=0;
replace seamth=1 if refmth==4 ;
gen fulltime = uhours1[_n-1]>35;


*generate calendar qtr indicator;

gen calqtr=0;
replace calqtr=1 if mth>=1&mth<=3;
replace calqtr=2 if mth>=4&mth<=6;
replace calqtr=3 if mth>=7&mth<=9;
replace calqtr=4 if mth>=10&mth<=12;
  label var calqtr "calendar quarter";

*generate quarter in sample (calendar quarter #1-8 for each obs so we can collapse);

replace count=1;
sort suid pnum panel wave refmth;
replace count=count[_n-1]+1 if suid==suid[_n-1]&pnum==pnum[_n-1] in 2/l;

gen mark=1;
egen check=sum(mark), by (suid pnum panel year calqtr);
gen qtr=1 if count==1;
replace qtr=0 if count==1&check<3;
drop check mark;
gen mark=0;
replace mark=1 if qtr~=.;
replace mark=1 if suid==suid[_n-1]&pnum==pnum[_n-1]&panel==panel[_n-1]&calqtr~=calqtr[_n-1] in 2/l;
sort suid pnum panel mark count;
qui by suid pnum panel:replace qtr=qtr[_n-1]+1 if mark==1&mark[_n-1]==1;
drop mark;
sort suid pnum panel count;
replace qtr=qtr[_n-1] if qtr==.;
 label var qtr "quarter in sample";

sort suid pnsp year mth;
save ~/bulk/unemp$Y, replace;

*generate spwork_yn and spinc (spouse working dummy and spouse total income in each month);
use ~pbouzagl/bulk/base$Y;
gen spwork_yn = (esr==1|esr==2|esr==3);
gen spinc=totinc;
keep suid pnum year mth spwork_yn spinc;
rename pnum pnsp;
keep if pnsp>100&pnsp<900;
sort suid pnsp year mth;
save temp, replace;
use ~/bulk/unemp$Y, clear;
merge suid pnsp year mth using temp, nokeep;
tabulate _merge;
tab mardum;
drop _merge;

***CREATE WEEKLY INCOME PROFILE LOOKING FORWARD FOR FUTURE USE;

sort suid pnum;

for num 1/6: 
   qui by suid pnum: gen wks_fX=wks[_n+X] \
   qui by suid pnum: gen earn_fX=earn[_n+X]/wks_fX \
   qui by suid pnum: gen inc_fX=totinc[_n+X]/wks_fX \
   qui by suid pnum: gen spinc_fX=spinc[_n+X]/wks_fX \
   qui by suid pnum: gen finc_fX=finc[_n+X]/wks_fX ;

save ~/bulk/unemp$Y, replace;


***CREATE QUARTERLY WAGE HISTORY AND DEFINE INPUTS FOR UI LAWS
 -own earnings, total income
  spouse total income, and family total income are all computed;
*nominal wages;
*Note: use info only from ws1 for own earn because 2nd job is usually job gotten after unemp ends;

use ~/bulk/unemp$Y, clear;

egen qearn=sum(ws1amt), by (suid pnum qtr);
egen fqinc=sum(finc), by (suid pnum qtr);
egen spqinc = sum(spinc), by (suid pnum qtr);

*generate 3-month sums if agent loses job before calendar quarter of info;
gen mark=0;
replace mark=1 if count<4;
egen temp1=sum(ws1amt), by (suid pnum panel mark);
egen temp2=sum(finc), by (suid pnum panel mark);
egen temp3=sum(spinc), by (suid pnum panel mark);
replace qearn=temp1 if qtr==0;
replace fqinc=temp2 if qtr==0;
replace spqinc=temp3 if qtr==0;
drop temp1 temp2 temp3 mark count;

collapse (mean) qearn fqinc spqinc, by (suid pnum qtr);

*generate lagged quarterly wages;
for num 1/5: qui by suid pnum: gen qearn_lX=qearn[_n-X] ;

*Compute base period wage, but ignore the lag when data limits it;
gen bpw=4*qearn_l1 if qtr==2;
replace bpw=2*(qearn_l1+qearn_l2) if qtr==3;
replace bpw=(4/3)*(qearn_l1+qearn_l2+qearn_l3) if qtr==4;
replace bpw=(qearn_l1+qearn_l2+qearn_l3+qearn_l4) if qtr==5;
replace bpw=(qearn_l2+qearn_l3+qearn_l4+qearn_l5) if qtr>=6;

gen annwg=bpw if qtr<=4;
replace annwg=(qearn_l1+qearn_l2+qearn_l3+qearn_l4) if qtr>=5;

gen hq1w=qearn_l1 if qtr==2;
replace hq1w=max(qearn_l1,qearn_l2) if qtr==3;
replace hq1w=max(qearn_l1,qearn_l2,qearn_l3) if qtr==4;
replace hq1w=max(qearn_l1,qearn_l2,qearn_l3,qearn_l4) if qtr>=5;

gen hq2w=qearn_l1 if qtr==2;
replace hq2w=min(qearn_l1,qearn_l2) if qtr==3;
replace hq2w=max((qearn_l1<hq1w)*qearn_l1,(qearn_l2<hq1w)*qearn_l2,(qearn_l3<hq1w)*qearn_l3) if qtr==4;
replace hq2w=max((qearn_l1<hq1w)*qearn_l1,(qearn_l2<hq1w)*qearn_l2,
		     (qearn_l3<hq1w)*qearn_l3,(qearn_l4<hq1w)*qearn_l4) if qtr>=5;

gen cv_earn=sqrt(((qearn_l1-bpw/4)^2+(qearn_l2-bpw/4)^2)/2)/(bpw/4) if qtr==3;
replace cv_earn=sqrt(((qearn_l1-bpw/4)^2+(qearn_l2-bpw/4)^2+(qearn_l3-bpw/4)^2)/3)/(bpw/4) if qtr==4;
replace cv_earn=sqrt(((qearn_l1-bpw/4)^2+(qearn_l2-bpw/4)^2+
		(qearn_l3-bpw/4)^2+(qearn_l4-bpw/4)^2)/4)/(bpw/4) if qtr==5;

*Generate annual family info;

for num 1/4: qui by suid pnum: gen fqinc_lX=fqinc[_n-X] ;
gen fanninc=4*fqinc_l1 if qtr==2;
replace fanninc=2*(fqinc_l1+fqinc_l2) if qtr==3;
replace fanninc=(4/3)*(fqinc_l1+fqinc_l2+fqinc_l3) if qtr==4;
replace fanninc=(fqinc_l1+fqinc_l2+fqinc_l3+fqinc_l4) if qtr>=5;

for num 1/4: qui by suid pnum: gen spqinc_lX=spqinc[_n-X] ;
gen spanninc=4*spqinc_l1 if qtr==2;
replace spanninc=2*(spqinc_l1+spqinc_l2) if qtr==3;
replace spanninc=(4/3)*(spqinc_l1+spqinc_l2+spqinc_l3) if qtr==4;
replace spanninc=(spqinc_l1+spqinc_l2+spqinc_l3+spqinc_l4) if qtr>=5;


keep suid pnum qtr fanninc spanninc qearn_l* bpw hq1w hq2w annwg cv_earn;
save temp, replace;
use ~/bulk/unemp$Y, clear;
sort suid pnum qtr;
merge suid pnum qtr using temp;
tabulate _merge;
drop _merge;
save ~/bulk/unemp$Y, replace;
rm temp.dta;

log close;
