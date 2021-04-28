*This is an omnibus program that attaches various variables to the original spells data and generates
*the final dataset for empirical analysis, allmerged.dta
*NOTE: MUST RUN unemp*.do, spells*.do, full_asset_merge.do, and merge_marital.do before running this program
*NOTE: after merging panels, need to merge by panel suid pnum, since suid/pnum not unique across panels

set more off

clear
set mem 100m

use uilaws
sort year part sippst
keep if sippst~=.
save, replace

use statecodes
sort sippst
keep if sippst~=.
save, replace

use cpiseries
sort year
save, replace

use spells85, clear
for num 86/93: append using spellsX
replace year=year+1900

append using spells96

drop _merge
rename state sippst
keep if sippst<60

sort sippst
merge sippst using statecodes, nokeep
tab _merge
keep if _merge==3
drop _merge

gen part=1
replace part=2 if mth>=7
gen nndate=year*10000+mth*100+1 

sort year part sippst
merge year part sippst using uilaws, nokeep
tab _merge
keep if _merge==3
drop _merge

sort sippst year mth
merge sippst year mth using unemprates, nokeep
rename unemp unemprate
drop _merge

sort year
merge year using cpiseries, nokeep
drop _merge cpi_levels

sort year mth
merge year mth using ~/Research/freelunch/interestrates, nokeep
drop _merge

rename ws1ind indly
rename ws1occ occly
do indocc

sort sippst year
merge sippst year using avguibens, nokeep
drop _merge

replace annwg=4*qearn_l1 if annwg==.

save allmerged, replace


***Now merge data for instruments to housing purchase/mrtg date and veh purchase/mrtg date

use ~/Research/freelunch/annintrates, clear
rename mortg_rate Mrtg1_avgrate
rename bank_car_rate MVeh1_avgrate
gen MVeh2_avgrate = MVeh1_avgrate
gen Mrtg1Year = year
gen MVeh1Year = year
gen MVeh2Year = year
sort Mrtg1Year
save temp, replace

use allmerged
rename Mrtg1YearOb Mrtg1Year
sort Mrtg1Year
merge Mrtg1Year using temp, keep(Mrtg1_avgrate) nokeep
drop _merge
save, replace

use temp
sort MVeh1Year
save, replace
use allmerged
sort MVeh1Year
merge MVeh1Year using temp, keep(MVeh1_avgrate) nokeep
drop _merge
save, replace

use temp
sort MVeh2Year
save, replace
use allmerged
sort MVeh2Year
merge MVeh2Year using temp, keep(MVeh2_avgrate) nokeep
drop _merge

save allmerged, replace

*Merge intrate monthly series for marriage data
use ~/Research/freelunch/interestrates, clear
rename fincomp mar_avgcarrate
rename mortg mar_avgmortgrate
rename year maryr
rename mth marmth
keep mar*
sort maryr marmth
save temp, replace

use allmerged
sort maryr marmth
merge maryr marmth using temp, nokeep
drop _merge

save, replace

*Merge birthdate interest rate data
use temp
rename mar_avgcarrate brth1_avgcarrate
rename mar_avgmortgrate brth1_avgmortgrate
rename maryr brth1yr
rename marmth brth1mth
sort brth1yr brth1mth
save, replace

use allmerged
sort brth1yr brth1mth
merge brth1yr brth1mth using temp, nokeep
drop _merge


***LAWASSIGN WITH TRUE WAGES

gen tao=.1
do lawassign
do elig
rename wba wba_act
drop maxdur

***CALL LAWASSIGN AGAIN AFTER PREDICTING WAGES

set matsize 100
gen l_annwg = log(annwg)
replace occ=99 if occ==.
replace ind=99 if ind==.
replace gind=99 if gind==.
gen usable = sex==0&templayoff==0&ui_yn==1&searchdur>0
xi: areg l_annwg tenure empcens i.year i.occ i.ind i.mth age ed unemprate if usable==1, absorb(sippst)
predict l_annwg_hat
gen annwg_hat = exp(l_annwg_hat)
drop l_annwg l_annwg_hat usable _I*

rename hq1w hq1w_saved
rename hq2w hq2w_saved
rename bpw bpw_saved
rename annwg annwg_saved
gen annwg=annwg_hat
gen bpw=annwg  
gen hq1w=bpw/4  
gen hq2w=bpw/4  
do lawassign
drop hq1w
drop hq2w
drop bpw
drop annwg
rename hq1w_saved hq1w
rename hq2w_saved hq2w
rename bpw_saved bpw
rename annwg_saved annwg


***DEFINE REAL VARIABLES in 1990 dollars

gen hh_liq = hh_twlth-hh_theq-hh_vehcl
gen hh_netliq=hh_liq-hh_usdbt

rename annwg annwg_nom
rename annwg_hat annwg_hat_nom
rename wba wba_nom
rename wba_act wba_act_nom
rename hh_theq hh_theq_nom
rename hh_liq hh_liq_nom
rename hh_netliq hh_netliq_nom

gen annwg = annwg_nom*cpi
gen annwg_hat = annwg_hat_nom*cpi
gen wba = wba_nom*cpi
gen wba_act = wba_act_nom*cpi
gen avgwba = avgwba_nom*cpi
gen hh_theq = hh_theq_nom*cpi
gen hh_liq = hh_liq_nom*cpi
gen hh_netliq = hh_netliq_nom*cpi

*bys sippst year: egen samp_avgwba = mean(wba)

save allmerged, replace

***RELABEL STATES
#delimit;

label values sippst  P101L;  
label define P101L   
	1           "Alabama"                       
	4           "Arizona"                       
	5           "Arkansas"                      
	6           "California"                    
	8           "Colorado"                      
	9           "Connecticut"                   
	10          "Delaware"                      
	11          "District of Columbia"          
	12          "Florida"                       
	13          "Georgia"                       
	15          "Hawaii"                        
	17          "Illinois"                      
	18          "Indiana"                       
	20          "Kansas"                        
	21          "Kentucky"                      
	22          "Louisiana"                     
	24          "Maryland"                      
	25          "Massachusetts"                 
	26          "Michigan"                      
	27          "Minnesota"                     
	28          "Mississippi"                   
	29          "Missouri"                      
	31          "Nebraska"                      
	32          "Nevada"                        
	33          "New Hampshire"                 
	34          "New Jersey"                    
	35          "New Mexico"                    
	36          "New York"                      
	37          "North Carolina"                
	39          "Ohio"                          
	40          "Oklahoma"                      
	41          "Oregon"                        
	42          "Pennsylvania"                  
	44          "Rhode Island"                  
	45          "South Carolina"                
	47          "Tennessee"                     
	48          "Texas"                         
	49          "Utah"                          
	51          "Virginia"                      
	53          "Washington"                    
	54          "West Virginia"                 
	55          "Wisconsin"                     
	61          "Maine,Vermont"                 
	62          "Iowa,North Dakota,South Dakota"
	63          "Alaska,Idaho,Montana,Wyoming"  
;

save allmerged, replace;
