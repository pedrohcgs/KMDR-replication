log using extract, replace

#delimit;

*Run using UNIX version of Stata;

*7-26-02 This program creates the base92 dataset from SIPP ascii files;
*Only variables relevant for this project are retained;
*Some variables renamed at the end and binary response vars recoded;
*datasets: original sipp extracts must be unzipped into sip92w*.dat temp
*files and base92 is output;

set more off;
set mem 1000m;

*The first two commands extract zipfiles and move to raw extension; 

*All waves done in one loop;

log close;

for num 1/9: 
log using extract, append \
!pkunzip /home/data/sipp/1992/sipp92wX.zip \ !mv sipp92wX.dat sipp92wX.raw \ 
log close \ do sip92wX \
	keep  suseqnum suid panel wave month year rot refmth sustate 
	hnp htype hwgt htotinc hearn phrent 
     	fid fnp ftotinc fearn 
	sid snp stotinc
	entry pnum intvw p5wgt age sex race ethncty ms pnsp totinc earn 
	esr weeks wesr1 wesr2 wesr3 wesr4 wesr5 wksjob wkswop wkslok reasab takjob
	takjobn cwork uhours wkspt wksptr empled rhcdis higrade grdcmpl
	ws1occ ws1ind ws1wks ws1amt ws12023 ws12024 ws12025 ws12028 ws12029
	ws2occ ws2ind ws2wks ws2amt ws22123 ws22124 ws22125 ws22128 ws22129
	r05 r06 r07 r10 s05amt s06amt s07amt s10amt
	famrel nkidshl\
save ~/scratch1/92wX, replace \ log close \ 
rm sipp92wX.raw \ clear;

log using extract, append;

use ~/scratch1/92w1;
for num 2/9: append using ~/scratch1/92wX;

*CONCATENATE entry and pnum to generate new, unique pnum;
        
replace pnum = 1000*entry+pnum;
drop entry;

rename month mth;

rename sustate state;
rename htotinc hinc;
rename fid famid;
rename ftotinc finc;
rename sid subfid;
rename stotinc sinc;

rename weeks wks;
rename cwork caswork_yn;
rename wkspt wksless35;
rename wksptr whyless35;
rename empled selfemp;

rename ws12023 w1stop;
rename ws22123 w2stop;
rename ws12024 ws1whystop;
rename ws22124 ws2whystop;
rename ws12025 job1hrs;
rename ws22125 job2hrs;
rename ws12028 ws1hrwg;
rename ws22128 ws2hrwg;
rename ws12029 ws1freqpay;
rename ws22129 ws2freqpay;

rename r05 ui_yn;
rename r06 suppui_yn;
rename r07 otherui_yn;
rename r10 wc_yn;
rename s05amt uiamt;
rename s06amt suppuiamt;
rename s07amt othuiamt;
rename s10amt wcamt;

*Recode binary vars sex takjob caswork_yn w1stop w2stop ui_yn suppui_yn otherui_yn wc_yn;

replace sex=sex-1;

label define sexlabel 0 M 1 F;
label values sex sexlabel;

rename takjob takjob_yn;
rename w1stop w1stop_yn;
rename w2stop w2stop_yn;

for var takjob_yn caswork_yn w1stop_yn w2stop_yn ui_yn suppui_yn otherui_yn wc_yn: 
	replace X=. if X==0 \ replace X=-(X-2);

label define yesno 0 no 1 yes;

for var takjob_yn caswork_yn w1stop_yn w2stop_yn ui_yn suppui_yn otherui_yn wc_yn:
	label values X yesno;

save ~/bulk/base92, replace;

for num 1/9: rm ~/scratch1/92wX.dta;

clear;

log close;
