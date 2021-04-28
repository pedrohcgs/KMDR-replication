*This file produces regs and graphs for moral hazard vs. liquidity UI paper
*Dataset prepared by SIPP_durations_dataprep.do
*Note that this dataset is NOT stset or stsplit, so this program does it here

clear
cap log close
set more off
set mem 750m
set matsize 600

***0 Setup

use SIPP_durations_pre_split

gen hasmortg = hh_mortg>0 if hh_mortg<.
gen l_hh_twlth = log(hh_twlth)
gen l_hh_netliq = log(hh_netliq)
gen renter = hh_theq==0&hh_mortg==0 if hh_theq~=.&hh_mortg~=.
gen reprate = wba*52/annwg_hat

*Censor at 50, stset and split data
replace censrd = 1 if dur>50&dur<.
replace dur=50 if dur>50&dur<.
stset dur, id(id) failure(censrd==0)
stsplit, at(failures) nopreserve
bys id: egen totaldur=max(dur)

gen onseam = dur==seam1wks|dur==seam2wks

gen durmaxwba = l_maxwba*dur
gen duravgwba = l_avgwba*dur
gen duractwba = l_wba*dur

xtile netliq_qtile = hh_netliq if uirec==1&templayoff==0, nq(4)
xtile avgwba_qtile = avgwba if templayoff==0&uirec==1, nq(2)

*xtile netliq_qtile = hh_netliq if ui_yn==1&templayoff==0, nq(4)
*xtile avgwba_qtile = avgwba if ui_yn==1&templayoff==0, nq(2)

xtile netliq_cntrl_qtile = hh_netliq if uirec==0, nq(4)
xtile homeeq_qtile = hh_theq if uirec==1&templayoff==0&hh_theq>0, nq(4)

***1 SUMMARY STATISTICS

*Make usdbt into a real var since it wasn't done in original file
sort year
merge year using ..\..\sipp\cpiseries.dta, nokeep
rename hh_usdbt hh_usdbt_nom
gen hh_usdbt = hh_usdbt_nom*cpi

gen compdur = min(totaldur,26)

log using summary_stats, smcl replace
set more off

**Table 1 

*Pooled summary stats
*Note that wba measure here is indiv ben based on predicted wage
sum totaldur compdur wba annwg ed age mardum spwork_yn renter hasmortg hh_liq hh_usdbt hh_theq reprate if _t==1&ui_yn==1&templayoff==0
centile totaldur compdur annwg hh_liq hh_usdbt hh_theq if _t==1&ui_yn==1&templayoff==0

*Quartile breakdown
table netliq_q, c(mean totaldur mean compdur mean wba mean annwg mean hh_liq), if _t==1&ui_yn==1&templayoff==0
table netliq_q, c(mean hh_usdbt mean ed mean age mean mardum mean spwork_yn), if _t==1&ui_yn==1&templayoff==0
table netliq_q, c(mean renter mean hasmortg mean hh_theq mean reprate), if _t==1&ui_yn==1&templayoff==0

*Quartile Medians, to be listed below means
table netliq_q, c(median totaldur median compdur median annwg), if _t==1&ui_yn==1&templayoff==0
table netliq_q, c(median hh_liq median hh_usdbt median hh_theq), if _t==1&ui_yn==1&templayoff==0

log close

log using nonparam_results, smcl replace
set more off

***Non-parametric graphs/tests

*Actual benefits and rep rates by quartile to be listed in graphs 
table netliq_q avgwba_qtile, c(mean wba), if ui_yn==1&templayoff==0&a_wave<wave&_t==1
table netliq_q avgwba_qtile, c(mean reprate), if ui_yn==1&templayoff==0&a_wave<wave&_t==1

*Fig 1 Graphs by quartile of asset holdings
sts list if ui_yn==1&templayoff==0&netliq_qtile==1&a_wave<wave, adjustfor(onseam) by(avgwba_qtile) compare at(1(1)50)
sts list if ui_yn==1&templayoff==0&netliq_qtile==2&a_wave<wave, adjustfor(onseam) by(avgwba_qtile) compare at(1(1)50)
sts list if ui_yn==1&templayoff==0&netliq_qtile==3&a_wave<wave, adjustfor(onseam) by(avgwba_qtile) compare at(1(1)50)
sts list if ui_yn==1&templayoff==0&netliq_qtile==4&a_wave<wave, adjustfor(onseam) by(avgwba_qtile) compare at(1(1)50)

*Non-parametric Wilcoxon tests by asset class: find significant differences only for first two groups.
sts test avgwba_qtile if ui_yn==1&templayoff==0&netliq_qtile==1&a_wave<wave, wilcoxon
sts test avgwba_qtile if ui_yn==1&templayoff==0&netliq_qtile==2&a_wave<wave, wilcoxon
sts test avgwba_qtile if ui_yn==1&templayoff==0&netliq_qtile==3&a_wave<wave, wilcoxon
sts test avgwba_qtile if ui_yn==1&templayoff==0&netliq_qtile==4&a_wave<wave, wilcoxon

*Actual benefits and avg benefits by mortgage status to be listed in graphs 
table hasmortg avgwba_qtile, c(mean wba), if ui_yn==1&templayoff==0&a_wave<wave&_t==1
table hasmortg avgwba_qtile, c(mean reprate), if ui_yn==1&templayoff==0&a_wave<wave&_t==1

*Fig 2 Mortgage graph and tests
sts list if ui_yn==1&templayoff==0&hasmortg==0&a_wave<wave, adjustfor(onseam) by(avgwba_qtile) compare at(1(1)50)
sts list if ui_yn==1&templayoff==0&hasmortg==1&a_wave<wave, adjustfor(onseam) by(avgwba_qtile) compare at(1(1)50)

sts test avgwba_qtile if ui_yn==1&templayoff==0&hasmortg==0&a_wave<wave, wilcoxon
sts test avgwba_qtile if ui_yn==1&templayoff==0&hasmortg==1&a_wave<wave, wilcoxon

log close

***3 Hazard Model Estimates

*Drop obs to save memory
keep if ui_yn==1&templay==0

**Define Quartile benefit interactions
#delimit;
foreach num of numlist 1/4 {;
   gen int_netliq`num'wba = (netliq_q==`num')*l_avgwba if netliq_q~=.;
   gen int_netliq`num'durwba = (netliq_q==`num')*duravgwba if netliq_q~=.;
};

#delimit;
foreach x of numlist 1/4 {;
   foreach y of numlist 1/10 {;
   gen netliq`x'_wg`y' = (netliq_q==`x')*l_annwg_spl`y' if netliq_q~=.;
   };
};
#delimit cr


xi i.year i.occ i.gind i.sippst

set more off
log using table2_sipp_results, smcl replace

*Includes full occ, ind, and wage interacts with netliq_q for 2.2 on

*2.1 Pooled Cox regression
stcox l_avgwba duravgwba onseam age mardum ed _I* l_annwg_spl* if ui_yn==1&templayoff==0, cluster(sippst) nohr

drop _I*
xi i.year i.occ*i.netliq_q i.gind*i.netliq_q i.sippst

*2.2 Interaction regress with all four asset quartiles, no controls
stcox int_netliq* if ui_yn==1&templayoff==0&netliq_q~=., strata(netliq_q) cluster(sippst) nohr
test int_netliq1wba=int_netliq4wba
test int_netliq1wba+ int_netliq2wba=int_netliq3wba+ int_netliq4wba

*2.3 Interaction regress with all four asset quartiles, full controls
stcox int_netliq* onseam  age mardum ed _I* netliq*wg* l_hh_twlth if ui_yn==1&templayoff==0&netliq_q~=., strata(netliq_q) cluster(sippst) nohr
test int_netliq1wba=int_netliq4wba
test int_netliq1wba+ int_netliq2wba=int_netliq3wba+ int_netliq4wba

*2.4 Alternative ben measure 1: maxes
drop int_netliq*
#delimit;
foreach num of numlist 1/4 {;
   gen int_netliq`num'wba = (netliq_q==`num')*l_maxwba if netliq_q~=.;
   gen int_netliq`num'durwba = (netliq_q==`num')*durmaxwba if netliq_q~=.;
};
#delimit cr
stcox int_netliq* onseam  age mardum ed _I* netliq*wg* l_hh_twlth if ui_yn==1&templayoff==0, strata(netliq_q) cluster(sippst) nohr
test int_netliq1wba=int_netliq4wba
test int_netliq1wba+ int_netliq2wba=int_netliq3wba+ int_netliq4wba

*2.5 Alternative ben measure 2: actual bens
drop int_netliq*
#delimit;
foreach num of numlist 1/4 {;
   gen int_netliq`num'wba = (netliq_q==`num')*l_wba if netliq_q~=.;
   gen int_netliq`num'durwba = (netliq_q==`num')*duractwba if netliq_q~=.;
};
#delimit cr
stcox int_netliq* onseam netliq*wg*  age mardum ed _I* l_hh_twlth if ui_yn==1&templayoff==0, strata(netliq_q) cluster(sippst) nohr
test int_netliq1wba=int_netliq4wba
test int_netliq1wba+ int_netliq2wba=int_netliq3wba+ int_netliq4wba


drop int_netliq*

*2.6 Mortgage cut: conditioned on a_wave<wave
drop _I*
xi i.year i.occ*hasmortg i.gind*hasmortg i.sippst
#delimit;
foreach num of numlist 0/1 {;
   gen int_hasmortg`num'wba = (hasmortg==`num')*l_avgwba if hasmortg~=.;
   gen int_hasmortg`num'durwba = (hasmortg==`num')*duravgwba if hasmortg~=.;
};
#delimit;
foreach x of numlist 0/1 {;
   foreach y of numlist 1/10 {;
   gen mortg`x'_wg`y' = (hasmortg==`x')*l_annwg_spl`y' if hasmortg~=.;
   };
};
#delimit cr
stcox int_hasmortg* onseam  age mardum ed _I* mortg*wg* l_hh_twlth if ui_yn==1&templayoff==0&hh_mortg~=.&a_wave<wave, strata(hasmortg) cluster(sippst) nohr
test int_hasmortg0wba=int_hasmortg1wba

log close
