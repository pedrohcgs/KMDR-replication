*This program takes previous allmerged dataset (from old version of project) and creates a new dataset for hazard regs + graphs

clear
set mem 650m
set matsize 250
use ../sipp/allmerged

replace tmcarva1 = 0 if tmcarva1==.
replace tmcarva2 = 0 if tmcarva2==.
replace tmcarva3 = 0 if tmcarva3==.
gen totcarval12 = tmcarva1+tmcarva2

egen pid = group(panel suid pnum)


***FINAL DATA PREP

*keep if panel~=88&panel~=89
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

gen inc=waitper==0|retro>0
replace spwork_yn = spwork_yn==1
replace ui_yn=ui_yn==1

gen retro_yn=retro>0
gen weekwg = annwg/50
gen l_maxdur = log(maxdur)

bys sippst year: egen myavgwba = mean(wba_act) if ui_yn==1&templayoff==0
gen l_myavgwba = log(myavgwba)
gen l_mywba = log(wba_act)

#delimit;

keep avgwba l_avgwba wba l_wba rlwbamax l_maxwba inc unemprate dur censrd seambeg panel age mardum ed spwork_yn
  l_maxdur censrd l_annwg_spl* year mth occ gind annwg uirec ui_yn ui_yn2 waitper retro wave a_wave
  spanninc kids hh_mortg hh_netliq hh_liq sippst templayoff seam1 seam2 seam3 myavgwba l_myavgwba l_mywba
  sex pid race cv_earn suppui_yn suppuiamt spell nextwage 
  totcarval12 hh_mortg hh_vehcl hh_beq hh_intbk hh_stk hh_ore hh_otast hh_twlth hh_usdbt hh_theq hh_ira 
  Mrtg1NumYears Mrtg1Year PrimHmYear ProptyCurrVal 
  spell nextwage sevpay_yn sevpayamt suppuiamt;

#delimit cr

gen id=_n
stset dur, id(id) failure(censrd==0)
stsplit cat, at(1(1)52)
gen failure=0
bys id: egen totaldur=max(dur)
bys id: replace failure=1 if totaldur==dur&censrd==0

order id failure totaldur dur inc avgwba unemprate seambeg panel censrd

save coxtests, replace
