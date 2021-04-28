#delimit;
log using extract, replace;

*Run using UNIX version of Stata;

*7-26-02 This program creates the base96 dataset from SIPP ascii files;
*Only variables relevant for this project are retained;
*Some variables renamed at the end and binary response vars recoded;
*datasets: original sipp extracts must be unzipped into p96puw*.dat
*temp files, and base96 is output;

* Notes about variables:
 EEDUCATE was renamed higrade but codes do not correspond to pre-96 SIPP panels
 EJBIND1  EJBIND2  TJBOCC1  TJBOCC2  were renamed: ws1ind ws2ind ws1occ ws2occ 
 but the codes don't correspond


set more off;
set mem 1200m;

*The first two commands extract zipfiles and move to raw extension; 

*All waves done in one loop;

log close;

for num 1/12: 
log using extract, append \
!pkunzip /home/data/sipp/1996/p96puwX.zip \ !mv p96puwX.dat sipp96wX.raw \ 
log close \ do p96wX \
keep ssuseq ssuid spanel swave srotaton srefmon
	rhcalmn rhcalyr tfipsst ehhnumpp
	rhtype whfnwgt thtotinc thearn tmthrnt
	rfid efnp tftotinc tfearn rsid
	esfnp tstotinc epppnum eppintvw
	wpfinwgt tage esex erace eorigin ems epnspous
	tptotinc tpearn rmesr rwksperm rwkesr1
	rwkesr2 rwkesr3 rwkesr4 rwkesr5 rmwkwjb eeducate
	epdjbthn emax ejobcntr ersnowrk eawop eabre eptwrk
	eptresn elkwrk elayoff rtakjob rnotake emoonlit
	rmwksab rmwklkg rmhrswk 
	eeno1 estlemp1 tsjdate1	tejdate1 ersend1 ejbhrs1 tpmsum1
	tpyrate1 rpyper1 ejbind1 tjbocc1 ecntrc1
	eeno2 estlemp2 tsjdate2 tejdate2 ersend2 ejbhrs2 tpmsum2
	tpyrate2 rpyper2 ejbind2 tjbocc2 
	euectyp5 auectyp5 euectyp7 
	elmptyp2 elmptyp3 rwcmprsn 
	t05amt t07amt t10amt t15amt
	emrtjnt emrtown tmiown rfnkids etenure\
save ~/scratch1/96wX, replace \ log close \ 
rm sipp96wX.raw \ clear;

log using extract, append;

use ~/scratch1/96w1;
for num 2/12: append using ~/scratch1/96wX;


*Variable renaming: all except rnotake eeno1 eeno2 emax;

rename ssuseq suseqnum;
rename ssuid suid;
rename spanel panel;
rename swave wave;
rename srotaton rot;
rename srefmon refmth;
rename rhcalmn mth;
rename rhcalyr year;
rename tfipsst state;
rename ehhnumpp hnp;
rename rhtype htype;
rename whfnwgt hwgt;
rename thtotinc hinc;
rename thearn hearn;
rename tmthrnt phrent;
rename rfid famid;
rename efnp fnp;
rename tftotinc finc;
rename tfearn fearn;
rename rsid subfid;
rename esfnp snp;
rename tstotinc sinc;
rename epppnum pnum;
rename eppintvw intvw;
rename wpfinwgt p5wgt;
rename tage age;
rename esex sex;
rename erace race;
rename eorigin ethncty;
rename ems ms;
rename epnspous pnsp;
rename tptotinc totinc;
rename tpearn earn;
rename rmesr esr;
rename rwksperm wks;
rename rwkesr1 wesr1;
rename rwkesr2 wesr2;
rename rwkesr3 wesr3;
rename rwkesr4 wesr4;
rename rwkesr5 wesr5;
rename rmwkwjb wksjob;
rename eeducate higrade;
rename epdjbthn job_yn;
rename ejobcntr numjobs;
rename ersnowrk whynotwork;
rename eawop fullweekout_yn;
rename eabre whyabsent;
rename eptwrk less35_yn;
rename eptresn whyless35;
rename elkwrk lookwork_yn;
rename elayoff layoff_yn;
rename rtakjob takjob_yn;
rename emoonlit moonlit_yn;
rename rmwksab wksabs;
rename rmwklkg wkslok;
rename rmhrswk uhrs_code;
rename estlemp1 stlemp1_yn;
rename tsjdate1 stdate1;
rename tejdate1 enddate1;
rename ersend1 whystop1;
rename ejbhrs1 uhours1;
rename ecntrc1 union_yn;
rename tpmsum1 ws1amt;
rename tpyrate1 ws1hrwg;
rename rpyper1 ws1freqpay;
rename ejbind1 ws1ind;
rename tjbocc1 ws1occ;
rename estlemp2 stlemp2_yn; 
rename tsjdate2 stdate2;
rename tejdate2 enddate2;
rename ersend2 whystop2;
rename ejbhrs2 uhours2;
rename tpmsum2 ws2amt;
rename tpyrate2 ws2hrwg;
rename rpyper2 ws2freqpay;
rename ejbind2 ws2ind;
rename tjbocc2 ws2occ;
rename euectyp5 ui_yn;
rename auectyp5 ui_flag;
rename euectyp7 suppui_yn;
rename elmptyp2 sevpay_yn;
rename elmptyp3 lumpsum_yn;
rename rwcmprsn whywc;
rename t05amt uiamt;
rename t07amt suppuiamt;
rename t10amt wcamt;
rename t15amt sevpayamt;
rename emrtjnt mtg_yn;
rename emrtown ownmtg_yn;
rename tmiown intpd_mtg;
rename rfnkids nkidshl;
rename etenure hownstat;


*Recode binary vars;

replace sex=sex-1;

label define sexlabel 0 M 1 F;
label values sex sexlabel;


for var job_yn fullweekout_yn less35_yn lookwork_yn layoff_yn takjob_yn moonlit_yn stlemp1_yn union_yn
	stlemp2_yn ui_yn suppui_yn sevpay_yn lumpsum_yn mtg_yn ownmtg_yn:
	replace X=. if X==-1 \ replace X=-(X-2);

label define yesno 0 no 1 yes;

for var job_yn fullweekout_yn less35_yn lookwork_yn layoff_yn takjob_yn moonlit_yn stlemp1_yn union_yn
	stlemp2_yn ui_yn suppui_yn sevpay_yn lumpsum_yn mtg_yn ownmtg_yn:
	label values X yesno;


save ~/bulk/base96, replace;

for num 1/12: rm ~/scratch1/96wX;

log close;
