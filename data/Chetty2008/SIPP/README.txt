Why do Unemployment Benefits Raise Unemployment Durations?
Moral Hazard vs. Liquidity 
(do-files)
 The attached stata do-files and datasets contain information on the 1985-1987, 1990-1993, 
and 1996 panels of the Survey of Income and Program Participation (SIPP) as well as various 
state characteristics used in the paper. Different exclusions are made in order to produce 
the final sample used in the analysis. 

The pre-90 SIPPs are downloaded in wide format from ICPSR. The following variables need to
be included in the wide$Y.dta files before using the extract.do file:
suid pnum wave refmth suseqnum mth year state finc fearn
intvw fnlwgt age sex race ms pnsp higrade grd_cmpl ethnicty
inc earn esr wks wksjb wkslok ws1_occ ws1_ind ws1wks ws1amt
ws1uhours ws1hrwg ws1freqpay ui_yn uiamt suppui_yn suppuia

In order to produce this final sample, The do-files should be run in the following order:

The program run.do runs the loop for all the panels
    run.do

(1) Extract 
    reshape.do    (reshapes pre-90 SIPPs data)
    extract9Y.do  (note that the sip9Yw*.do are called within these do-files to produce
                   the base9Y.dta files)
    rt*asset$Y.do (extracts asset info)
    marital9Y.do  (extract marital info for 90s panels)


(2) Unemp
    unemp80s.do
    unemp.
    unemp96.do

(3) Spells
    spells80s.do
    spells.do
    spells96.do

(4) full_asset_merge.do
    
(5) merge_marital.do

(6) allmerge.do  (this will also call the lawassign.do file included in the 
		  sub-directory uicalc)

(7) cox_dataprep.do

(8) SIPP_durs_dataprep.do

 - this do file produces the dataset SIPP_durations.dta, which is the final dataset used for the regression and graphical analysis below

(9) SIPP_regs.do -- produces output for figures and tables

(10) survival_graphs.do -- draws figures

Self-explanatory notes are included in all these files. Also note that do-files with an 
asterisk produce auxiliary data sets that are to be appended to the master dataset. 
These auxiliary datasets contain information on household assets, marital status, UI laws 
and eligibility and various economic indicators. These last datasets are included in the 
subdirectory uicalc_for_others. Raw data is taken from the publicly available files 
provided by the SIPP.


The pre-90 SIPPs are downloaded in wide format from ICPSR. The following variables need to
be included in the wide$Y.dta sample before using the extract.do file:
suid pnum wave refmth suseqnum mth year state finc fearn
intvw fnlwgt age sex race ms pnsp higrade grd_cmpl ethnicty
inc earn esr wks wksjb wkslok ws1_occ ws1_ind ws1wks ws1amt
ws1uhours ws1hrwg ws1freqpay ui_yn uiamt suppui_yn suppuiamt

The folder Sevpay contains data and do-files for section 4 of the paper. 
