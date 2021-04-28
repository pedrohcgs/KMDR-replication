*  Build on Chetty (2008) files to process the data
clear all
cap log close
set more off
*----------------------------------------------------------------------------------------------------------------------------
*----------------------------------------------------------------------------------------------------------------------------
*----------------------------------------------------------------------------------------------------------------------------
*----------------------------------------------------------------------------------------------------------------------------
*** Working directory and load data
cd "/Users/santanph/Dropbox/Projects/KM Distributional Regression/EJ/data/raw"
use SIPP_durations
*----------------------------------------------------------------------------------------------------------------------------
*----------------------------------------------------------------------------------------------------------------------------
* Generate some additional data and labels
gen hasmortg = hh_mortg>0 if hh_mortg<.
label var hasmortg "Has Mortgage"

gen l_hh_twlth = log(hh_twlth)
label var l_hh_twlth "log of household total wealth"

gen l_hh_netliq = log(hh_netliq)
label var l_hh_netliq "log of household net liquid wealth"

gen maxwba = exp(l_maxwba)
label var maxwba "maximum benefits amount"

gen l_annwg = log(annwg)
label var l_annwg "log  of pre-unemployment annual wage"

gen unemprate2 = unemprate^2
label var unemprate2 "unemployment rate squared"

gen year1 = (year<1990) if year<.
label var year1 "Year < 1990"
gen year2 = (1989<year & year<1996 ) if year<.
label var year2 " 1990<=Year <=1995"
gen year3 = (year>1995) if year<.
label var year3 "Year>1995"
gen ind99 = (gind==99) if gind<.
label var ind99  "Industry = 99"
gen ind4 = (gind==4) if gind<.
label var ind4  "Industry = 4"

* Generate some labels
label var l_avgwba "log of average unemployment benefits"
label var gind "industry"
label var occ "occupation"
label var annwg "pre-unemployment annual wage"
label var avgwba "average unemployment benefits"
label var censrd "censoring: 1 if censor, 0 if not"
label var dur "non-employment duration"
label var id "id"
label var sippst "state"
label var spell "spell #"
label var year "year"
label var wba "weakly benefits amount"
label var hh_theq "home equity"
label var hh_netliq "household net liquid wealth"
label var hh_liq "household liquid wealth"
label var l_maxwba "log of Maximum benefits amount"
label var l_wba "log of weakly unemployment benefits"

gen delta = 1-censrd if censrd!=.
label var delta "non-censoring indicator: 1 if observed, 0 if not"
*----------------------------------------------------------------------------------------------------------------------------
*----------------------------------------------------------------------------------------------------------------------------
*Drop obs to save memory - same restriction as Chetty (2008)
keep if ui_yn==1&templay==0

* Keep variables of interest

keep dur censrd delta avgwba l_avgwba maxwba l_maxwba wba l_wba spell annwg  l_annwg age mardum ed  race unemprate year ///
	occ gind sippst id hh_twlth hh_netliq hh_theq hh_liq l_hh_twlth hasmortg l_annwg_sp* ui_yn templayoff seam1wks seam2wks ///
	unemprate2 year1 year2 year3 ind99 ind4
*---------------------------------------------------------------------------------------------------------------------------- 
*----------------------------------------------------------------------------------------------------------------------------
* Drop ofbservations with missing total wealth or zero or negative pre-unemployment annual wage (annwg) 
drop if l_annwg_spl1==.
drop if hh_twlth==.
*----------------------------------------------------------------------------------------------------------------------------
* Save processed file
save "../processed/sipp-processed.dta", replace
