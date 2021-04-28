*JPE revision, prepare dataset for cox analysis with censoring at 50 weeks
*This program takes previous allmerged dataset (from old version of project) and creates a new dataset for hazard regs + graphs

clear
set mem 650m
set matsize 250
use ../../sipp/allmerged

egen pid = group(panel suid pnum)


***FINAL DATA PREP

keep if dur>0
keep if age<65
count if searchdur==0
count if templayoff==1&searchdur==0
keep if searchdur>0
keep if sex==0

gen l_dur = log(dur)
gen l_avgwba = log(avgwba)
gen rlwbamax = wba_max*cpi
gen l_maxwba = log(rlwbamax)
gen l_wba = log(wba)
gen l_annwg = log(annwg)
mkspline l_annwg_spl 10 = l_annwg, pct

replace spwork_yn = spwork_yn==1
replace ui_yn=ui_yn==1

#delimit;

keep avgwba l_avgwba wba l_wba rlwbamax l_maxwba unemprate dur censrd seambeg panel age mardum ed spwork_yn
  censrd l_annwg_spl* year mth occ gind annwg annwg_hat uirec ui_yn ui_yn2 waitper wave a_wave
  spanninc kids hh_mortg hh_netliq hh_liq sippst templayoff seam1 seam2 seam3
  sex pid race cv_earn spell hh_mortg hh_vehcl hh_beq hh_intbk hh_stk hh_ore hh_otast hh_twlth hh_usdbt hh_theq hh_ira;

#delimit cr

gen id=_n

save SIPP_durations_pre_split, replace
