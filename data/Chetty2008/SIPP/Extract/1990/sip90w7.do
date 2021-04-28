log using sip90w7, replace
set mem 400m
*This program reads the 1990 SIPP Wave 7 Core Data File
*by Jean Roth Thu Jul 11 16:11:51 EDT 2002
*Please report errors to jroth@nber.org
*run with do sip90w7
*Change output file name/location as desired in the first line of the .dct file
*If you are using a PC, you may need to change the direction of the slashes, as in C:\
* The following changes in variable names have been made, if necessary:
*      '$' to 'd';            '-' to '_';              '%' to 'p';
*      ($ = unedited data;     - = edited data;         % = allocated data)
* Note:  Variable names in Stata are case-sensitive
clear
quietly infile using sip90w7

*Everything below this point are value labels

#delimit ;

;
label values sustate  P101L;  
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
label values surgc    P102L;  
label define P102L   
	0           "Not applicable for coverage"   
;
label values htype    P103L;  
label define P103L   
	0           "Not in household"              
	1           "Married couple family household"
	2           "Male householder family"       
	3           "Female householder family"     
	4           "Male householder nonfamily"    
	5           "Female householder nonfamily"  
	6           "Group quarters"                
;
label values hstate   P104L;  
label define P104L   
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
label values hmetro   P105L;  
label define P105L   
	0           "Not applicable"                
	1           "Metro"                         
	2           "Residual"                      
;
label values hmsa     P106L;  
label define P106L   
	0           "Not in universe or not"        
	7           "Boston-Lawrence-Salem, MA-NH"  
	10          "Buffalo-Niagara Falls, NY"     
	14          "Chicago-Gary Lake County, IL-IN"
	21          "Cincinnati-Hamilton, OH-KY"    
	28          "Cleveland-Akron-Lorraine, OH"  
	31          "Dallas-Fort Worth, TX"         
	34          "Denver-Boulder, CO"            
	35          "Detroit-Ann Arbor, MI"         
	41          "Hartford-New Britain-"         
	42          "Houston, TX"                   
	49          "Los Angeles-Anaheim-"          
	56          "Miami-Ft. Lauderdale, FL"      
	63          "Milwaukee-Racine, WI"          
	70          "New York-New Jersey-Long"      
	77          "Philadelphia-Wilmington-"      
	78          "Pittsburgh-Beaver Valley, PA"  
	79          "Portland-Vancouver, OR"        
	84          "San Francisco-Oakland-"        
	91          "Seattle-Tacoma, WA"            
	160         "Albany-Schenectady-Troy, NY"   
	200         "Albequerque, NM"               
	520         "Atlanta, CA"                   
	640         "Austin, TX"                    
	680         "Bakersfield, CA"               
	760         "Baton Rouge, LA"               
	840         "Beaumont-Port Arthur, TX"      
	1000        "Birmingham, AL"                
	1520        "Charlotte-Gastonia-"           
	1720        "Colorado Springs, CO"          
	1840        "Columbus, OH"                  
	1880        "Corpus Christi, TX"            
	2000        "Dayton-Springfield, OH"        
	2320        "El Paso, TX"                   
	2400        "Eugene-Springfield, OR"        
	2560        "Fayetteville, NC"              
	2700        "Ft. Myers, FL"                 
	2760        "Fort Wayne, IN"                
	2840        "Fresno, CA"                    
	3120        "Greensboro--Winston-Salem--"   
	3160        "Greensville-Spartanburg, SC"   
	3240        "Harrisburg-Lebanon-Carlisle, PA"
	3320        "Honolulu, HI"                  
	3480        "Indianapolis, IN"              
	3600        "Jacksonville, FL"              
	3840        "Knoxville, TN"                 
	3980        "Lakeland-Winterhaven, FL"      
	4040        "Lansing-East Lansing, MI"      
	4720        "Madison, WI"                   
	4880        "McCallen-Edinburg-Mission, TX" 
	4900        "Melbourne-Titusville-"         
	4920        "Memphis, TN"                   
	5120        "Minneapolis-St. Paul, MN"      
	5160        "Mobile, AL"                    
	5360        "Nashville, TN"                 
	5480        "New Haven-Meriden, CT"         
	5560        "New Orleans, LA"               
	5720        "Norfolk-VA Beach-Newport"      
	5880        "Oklahoma City, OK"             
	5960        "Orlando, FL"                   
	6080        "Pensacola,  FL"                
	6200        "Phoenix, AZ"                   
	6640        "Raleigh-Durham, NC"            
	6840        "Rochester, NY"                 
	6880        "Rockford, IL"                  
	6920        "Sacramento, CA"                
	7040        "St. Louis, Mo"                 
	7120        "Salinas-Seaside-Monterey, CA"  
	7160        "Salt Lake City-Ogden, UT"      
	7240        "San Antonio, TX"               
	7320        "San Diego, CA"                 
	7560        "Scranton--Wilkes-Barre, PA"    
	8000        "Springfield, MA"               
	8120        "Stockton, CA"                  
	8160        "Syracuse, NY"                  
	8280        "Tampa-St.Petersburg-"          
	8400        "Toledo, Oh"                    
	8520        "Tucson, AZ"                    
	8560        "Tulsa, OK"                     
	8680        "Utica-Rome, NY"                
	8840        "Washington, DC-MD-VA"          
	8960        "West Palm Beach-Boca Raton-"   
	9240        "Worcester, MA"                 
;
label values hnssr    P107L;  
label define P107L   
	0           "Not applicable"                
;
label values haccess  P108L;  
label define P108L   
	0           "Not applicable"                
	1           "Direct - skip to housing unit" 
	2           "Through another unit"          
;
label values hlvqtr   P109L;  
label define P109L   
	0           "Not applicable"                
	1           "House, apartment, flat"        
	2           "HU in nontransient hotel,"     
	3           "HU, permanent in transient"    
	4           "HU in rooming house"           
	5           "Mobile home or trailer with no"
	6           "Mobile home or trailer with one"
	7           "HU not specified above"        
	8           "Quarters not HU in rooming or" 
	9           "Unit not permanent in transient"
	10          "Unoccupied site for mobile home,"
	11          "Other unit not specified above"
;
label values hunits   P110L;  
label define P110L   
	0           "Not applicable"                
	1           "Only 'other' units"            
	2           "Mobile home or trailer"        
	3           "One, detached"                 
	4           "One, attached"                 
	5           "Two"                           
	6           "3-4"                           
	7           "5-9"                           
	8           "10-19"                         
	9           "20-49"                         
	10          "50 or more"                    
;
label values htenure  P111L;  
label define P111L   
	0           "Not applicable"                
	1           "Owned or being bought by you or"
	2           "Rented for cash"               
	3           "Occupied without payment of"   
;
label values hpubhs   P112L;  
label define P112L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values hlornt   P113L;  
label define P113L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values htenureu P114L;  
label define P114L   
	0           "Not answered (Types B and C)"  
	1           "Owned or being bought by you or"
	2           "Rented for cash"               
	3           "Occupied without payment of"   
	9           "Not answered"                  
;
label values hpubhsu  P115L;  
label define P115L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
	3           "Don't know"                    
;
label values hlorntu  P116L;  
label define P116L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
	3           "Don't know"                    
;
label values hitm36b  P117L;  
label define P117L   
	1           "Interviewed"                   
	2           "No one home"                   
	3           "Temporarily absent"            
	4           "Refused"                       
	5           "Unable to locate"              
	6           "Other Type A"                  
	9           "Vacant"                        
	10          "Occupied by persons with URE"  
	11          "Unfit or to be demolished"     
	12          "Under construction, not ready" 
	13          "Converted to temporary business"
	14          "Unoccupied site for mobile home,"
	15          "Permit granted, construction"  
	17          "Demolished"                    
	18          "House or trailer moved"        
	19          "Converted to permanent business"
	20          "Merged"                        
	21          "Condemned"                     
	23          "Entire household deceased, moved"
	24          "Moved, address unknown"        
	25          "Moved within country beyond limit"
	26          "All sample persons relisted on"
	28          "Merged households across panels"
;
label values hmeans   P118L;  
label define P118L   
	0           "Not in universe or no persons" 
	1           "One or more persons in household"
	2           "No person in household received"
;
label values hcash    P119L;  
label define P119L   
	1           "One or more persons in"        
	2           "No person in household received"
;
label values hncash   P120L;  
label define P120L   
	1           "One or more persons in household"
	2           "One or more persons in household"
	3           "No person in hhld. received"   
;
label values phrent   P121L;  
label define P121L   
	0           "None, or not in universe"      
;
label values utils    P122L;  
label define P122L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
	3           "Don't know"                    
;
label values henrgy   P123L;  
label define P123L   
	0           "No energy assistance"          
	1           "Checks sent to household"      
	2           "Coupons or vouchers sent to"   
	3           "Payments sent elsewhere"       
	4           "Checks and coupons or vouchers"
	5           "Checks sent to household and"  
	6           "Coupons or voucher sent to"    
	7           "All three types of assistance" 
;
label values eastamt  P124L;  
label define P124L   
	0           "Not in universe"               
;
label values lunch    P125L;  
label define P125L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values nkidshl  P126L;  
label define P126L   
	0           "Not in universe"               
;
label values lchtot   P127L;  
label define P127L   
	0           "Not in universe"               
;
label values lchpt    P128L;  
label define P128L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values lchfree  P129L;  
label define P129L   
	0           "Not in universe"               
	1           "Free lunch"                    
	2           "Reduced-price lunch"           
	3           "Full-price lunch"              
;
label values lchcost  P130L;  
label define P130L   
	0           "Not in universe"               
;
label values breakf   P131L;  
label define P131L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values nkidsbf  P132L;  
label define P132L   
	0           "Not in universe"               
;
label values bftot    P133L;  
label define P133L   
	-1          "Don't know"                    
	0           "Not in universe"               
;
label values bffree   P134L;  
label define P134L   
	0           "Not in universe"               
	1           "Free breakfast"                
	2           "Reduced-price breakfast"       
	3           "Full-price breakfast"          
;
label values iphrent  P135L;  
label define P135L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iutils   P136L;  
label define P136L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ihenrgy  P137L;  
label define P137L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ieastamt P138L;  
label define P138L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ilunch   P139L;  
label define P139L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values inkidshl P140L;  
label define P140L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ilchtot  P141L;  
label define P141L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ilchpt   P142L;  
label define P142L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ilchfree P143L;  
label define P143L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ilchcost P144L;  
label define P144L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ibreakf  P145L;  
label define P145L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values inkidsbf P146L;  
label define P146L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ibftot   P147L;  
label define P147L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ibffree  P148L;  
label define P148L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values h5ref    P149L;  
label define P149L   
	0           "Not in household in interview" 
;
label values h5np     P150L;  
label define P150L   
	0           "Not in household in interview" 
;
label values h5mis    P151L;  
label define P151L   
	0           "Not in household in interview" 
	1           "Interview"                     
	2           "Non-interview"                 
	3           "Not in sample"                 
;
label values h5addid  P152L;  
label define P152L   
	0           "Not in household in interview" 
;
label values h5wgt    P153L;  
label define P153L   
	0           "Not in household in interview" 
;
label values fid2     P154L;  
label define P154L   
	0           "Not in universe"               
;
label values ftype    P155L;  
label define P155L   
	1           "Primary family"                
	3           "Unrelated subfamily"           
	4           "Primary individual"            
	5           "Secondary individual"          
;
label values fkind    P156L;  
label define P156L   
	1           "Headed by husband/wife"        
	2           "Male reference person"         
	3           "Female reference person"       
;
label values fnkids   P157L;  
label define P157L   
	0           "None"                          
	1           "One"                           
	2           "Two"                           
	30          "Thirty or more"                
;
label values fownkid  P158L;  
label define P158L   
	0           "None"                          
	1           "One"                           
	2           "Two"                           
	30          "Thirty or more"                
;
label values foklt18  P159L;  
label define P159L   
	0           "None"                          
	1           "One"                           
	2           "Two"                           
	30          "Thirty or more"                
;
label values fnssr    P160L;  
label define P160L   
	0           "None"                          
;
label values fssunit  P161L;  
label define P161L   
	0           "No Social Security recipient"  
	1           "Husband, wife, and minor child"
	2           "Parent and minor child"        
	3           "Individual recipient"          
	4           "Husband, wife only"            
	5           "Minor child only"              
	6           "Other"                         
;
label values sid      P162L;  
label define P162L   
	0           "Not in sub family"             
;
label values stype    P163L;  
label define P163L   
	0           "Not in related subfamily"      
	2           "Related subfamily"             
;
label values skind    P164L;  
label define P164L   
	0           "Not applicable"                
	1           "Headed by husband/wife"        
	2           "Male reference person"         
	3           "Female reference person"       
;
label values sownkid  P165L;  
label define P165L   
	0           "None"                          
	1           "One"                           
	2           "Two"                           
	30          "Thirty or more"                
;
label values soklt18  P166L;  
label define P166L   
	0           "None"                          
	1           "One"                           
	2           "Two"                           
	30          "Thirty or more"                
;
label values intvw    P167L;  
label define P167L   
	0           "Not applicable (children"      
	1           "Interview (self)"              
	2           "Interview (proxy)"             
	3           "Noninterview - Type Z refusal" 
	4           "Noninterview - Type Z other"   
	5           "Noninterview - left before"    
;
label values mis5     P168L;  
label define P168L   
	1           "Interview"                     
	2           "Non-interview"                 
;
label values rrp      P169L;  
label define P169L   
	1           "Household reference person,"   
	2           "Household reference person"    
	3           "Spouse of household reference" 
	4           "Child of household reference"  
	5           "Other relative of household"   
	6           "Non-relative of household"     
	7           "Non-relative of household"     
;
label values rrpu     P170L;  
label define P170L   
	1           "Reference person with"         
	2           "Reference person with no"      
	3           "Husband/wife of reference"     
	4           "Natural/adopted child of"      
	5           "Stepchild of reference person" 
	6           "Foster child of reference person"
	7           "Grandchild of reference person"
	8           "Parent of reference person"    
	9           "Brother/sister of reference"   
	10          "Other relative of reference"   
	11          "Non-relative of reference person"
	12          "Partner/roommate of reference" 
	13          "Non-relative of reference person"
;
label values age      P171L;  
label define P171L   
	0           "Less than 1 full year"         
	1           "1 year"                        
	85          "85 years or older"             
;
label values popstat  P172L;  
label define P172L   
	1           "Adult  (15 years of age or"    
	2           "Child  (under 15 at interview)"
;
label values sex      P173L;  
label define P173L   
	1           "Male"                          
	2           "Female"                        
;
label values race     P174L;  
label define P174L   
	1           "White"                         
	2           "Black"                         
	3           "American Indian, Eskimo or"    
	4           "Asian or Pacific Islander"     
;
label values ethncty  P175L;  
label define P175L   
	1           "German"                        
	2           "English"                       
	3           "Irish"                         
	4           "French"                        
	5           "Italian"                       
	6           "Scottish"                      
	7           "Polish"                        
	8           "Dutch"                         
	9           "Swedish"                       
	10          "Norwegian"                     
	11          "Russian"                       
	12          "Ukrainian"                     
	13          "Welsh"                         
	14          "Mexican-American"              
	15          "Chicano"                       
	16          "Mexican"                       
	17          "Puerto Rican"                  
	18          "Cuban"                         
	19          "Central or South American"     
	20          "Other Spanish"                 
	21          "Afro-American (Black or Negro)"
	30          "Another group not listed"      
	39          "Don't know"                    
;
label values ms       P176L;  
label define P176L   
	0           "Not a sample person this month"
	1           "Married, spouse present"       
	2           "Married, spouse absent"        
	3           "Widowed"                       
	4           "Divorced"                      
	5           "Separated"                     
	6           "Never married"                 
;
label values msu      P177L;  
label define P177L   
	0           "Not applicable"                
	1           "Married, spouse present"       
	2           "Married, spouse absent"        
	3           "Widowed"                       
	4           "Divorced"                      
	5           "Separated"                     
	6           "Never married"                 
	9           "Not answered"                  
;
label values ewid     P178L;  
label define P178L   
	0           "Not in universe"               
	1           "Widowed"                       
	2           "Divorced"                      
	3           "Both widowed and divorced"     
	4           "No"                            
;
label values famtyp   P179L;  
label define P179L   
	0           "Primary family or not in"      
	1           "Secondary individual (not a"   
	2           "Unrelated sub (secondary)"     
	3           "Related subfamily"             
	4           "Primary individual"            
;
label values famrel   P180L;  
label define P180L   
	0           "Not applicable or not in"      
	1           "Reference person of family"    
	2           "Spouse of family reference person"
	3           "Child of family reference person"
;
label values pnsp     P181L;  
label define P181L   
	0           "Not in sample this month"      
	999         "Not applicable"                
;
label values pnspu    P182L;  
label define P182L   
	0           "Not answered"                  
	999         "Not applicable"                
;
label values pnpt     P183L;  
label define P183L   
	0           "Not in sample this month"      
	999         "Not applicable"                
;
label values pnptu    P184L;  
label define P184L   
	0           "Not answered"                  
	999         "Not applicable"                
;
label values pngdu    P185L;  
label define P185L   
	0           "Not answered / not applicable" 
	999         "No parent or guardian"         
;
label values desgpnpt P186L;  
label define P186L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values realft   P187L;  
label define P187L   
	0           "Not applicable or not answered"
	5           "Left - deceased"               
	6           "Left - institutionalized"      
	7           "Left - living in Armed Forces" 
	8           "Left - moved outside of country"
	9           "Left - separation or divorce"  
	10          "Left - person #201+  no"       
	11          "Left - other"                  
	12          "Left - entered merged household"
	25          "Left - deceased"               
	26          "Left - institutionalized"      
	27          "Left - living in Armed Forces" 
	28          "Left - moved outside of country"
	29          "Left - separation or divorce"  
	30          "Left - 201+ person no longer"  
	31          "Left - other"                  
	99          "Listed in error"               
;
label values reaent   P188L;  
label define P188L   
	0           "Not applicable or not answered"
	1           "Entered - birth"               
	2           "Entered - marriage"            
	3           "Entered - other"               
	4           "Entered (before sample people)"
	13          "Reentered household after"     
	16          "Entered - from institution"    
	17          "Entered - from Armed Forces"   
	18          "Entered - from outside the"    
	19          "Entered - due to separation or"
	21          "Entered - birth"               
	22          "Entered - marriage"            
	23          "Entered - other"               
	24          "Entered - sample person added" 
	36          "Entered - from institution"    
	37          "Entered - from Armed Forces"   
	38          "Entered - from outside the"    
	39          "Entered - due to separation"   
;
label values hchange  P189L;  
label define P189L   
	1           "Yes"                           
	2           "No"                            
;
label values fchange  P190L;  
label define P190L   
	1           "Yes"                           
	2           "No"                            
;
label values schange  P191L;  
label define P191L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values sc1000   P192L;  
label define P192L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values esr      P193L;  
label define P193L   
	0           "Not applicable"                
	1           "With a job entire month,"      
	2           "With a job entire month,"      
	3           "With a job entire month,"      
	4           "With job one or more weeks, no"
	5           "With job one or more weeks,"   
	6           "No job during month, spent"    
	7           "No job during month, spent one"
	8           "No job during month, no time"  
;
label values weeks    P194L;  
label define P194L   
	4           "Four weeks"                    
	5           "Five weeks"                    
;
label values wesr1    P195L;  
label define P195L   
	0           "Not in universe"               
	1           "With a job this week"          
	2           "With a job, absent without pay,"
	3           "With a job, absent without pay,"
	4           "Looking for a job this week"   
	5           "Without a job, not looking for"
;
label values wesr2    P196L;  
label define P196L   
	0           "Not in universe"               
	1           "With a job this week"          
	2           "With a job, absent without pay,"
	3           "With a job, absent without pay,"
	4           "Looking for a job this week"   
	5           "Without a job, not looking for"
;
label values wesr3    P197L;  
label define P197L   
	0           "Not in universe"               
	1           "With a job this week"          
	2           "With a job, absent without pay,"
	3           "With a job, absent without pay,"
	4           "Looking for a job this week"   
	5           "Without a job, not looking for"
;
label values wesr4    P198L;  
label define P198L   
	0           "Not in universe"               
	1           "With a job this week"          
	2           "With a job, absent without pay,"
	3           "With a job, absent without pay,"
	4           "Looking for a job this week"   
	5           "Without a job, not looking for"
;
label values wesr5    P199L;  
label define P199L   
	0           "Not in universe or no week 5"  
	1           "With a job this week"          
	2           "With a job, absent without pay,"
	3           "With a job, absent without pay,"
	4           "Looking for a job this week"   
	5           "Without a job, not looking for"
;
label values wksjob   P200L;  
label define P200L   
	0           "None, or not in universe"      
	1           "1 week"                        
	5           "5 weeks"                       
;
label values wkswop   P201L;  
label define P201L   
	0           "None, or not in universe"      
	1           "1 week"                        
	5           "5 weeks"                       
;
label values wkslok   P202L;  
label define P202L   
	0           "None, or not in universe"      
	1           "1 week"                        
	5           "5 weeks"                       
;
label values reasab   P203L;  
label define P203L   
	0           "Not in universe"               
	1           "On layoff"                     
	2           "Own illness"                   
	3           "On vacation"                   
	4           "Bad weather"                   
	5           "Labor dispute"                 
	6           "New job to begin within 30 days"
	7           "Other"                         
;
label values takjob   P204L;  
label define P204L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values takjobn  P205L;  
label define P205L   
	0           "Not in universe"               
	1           "Already had a job"             
	2           "Temporary illness"             
	3           "School"                        
	4           "Other"                         
;
label values cwork    P206L;  
label define P206L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values uhours   P207L;  
label define P207L   
	0           "Not in universe or none"       
;
label values wkspt    P208L;  
label define P208L   
	0           "None, or not in universe"      
	1           "1 week"                        
	5           "5 weeks"                       
;
label values wksptr   P209L;  
label define P209L   
	0           "Not in universe"               
	1           "Could not find a full-time job"
	2           "Wanted to work part-time"      
	3           "Health condition or disability"
	4           "Normal working hours are less" 
	5           "Slack work or material shortage"
	6           "Other"                         
;
label values empled   P210L;  
label define P210L   
	0           "Not in universe"               
	1           "Worked for employer only"      
	2           "Self-employed only"            
	3           "Worked for both employer and"  
;
label values disab    P211L;  
label define P211L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values rhcdis   P212L;  
label define P212L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values vetstat  P213L;  
label define P213L   
	0           "Not applicable (under 15) or"  
	1           "Yes"                           
	2           "No"                            
;
label values inaf     P214L;  
label define P214L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values spinaf   P215L;  
label define P215L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values usrvdt1  P216L;  
label define P216L   
	0           "Not applicable"                
	1           "Vietnam era (Aug'64-Apr'75)"   
	2           "Korean conflict (June'50-Jan'55)"
	3           "World War II (Sept'40-July'47)"
	5           "May 1975 to August 1980"       
	6           "September 1980 or later"       
	7           "Other service (all other periods)"
	9           "Not answered"                  
;
label values usrvdt2  P217L;  
label define P217L   
	0           "Not applicable"                
	1           "Vietnam era (Aug'64-Apr'75)"   
	2           "Korean conflict (June'50-Jan'55)"
	3           "World War II (Sept'40-July'47)"
	5           "May 1975 to August 1980"       
	6           "September 1980 or later"       
	7           "Other service (all other periods)"
	9           "Not answered"                  
;
label values usrvdt3  P218L;  
label define P218L   
	0           "Not applicable"                
	1           "Vietnam era (Aug'64-Apr'75)"   
	2           "Korean conflict (June'50-Jan'55)"
	3           "World War II (Sept'40-July'47)"
	5           "May 1975 to August 1980"       
	6           "September 1980 or later"       
	7           "Other service (all other periods)"
	9           "Not answered"                  
;
label values aftime   P219L;  
label define P219L   
	0           "Not in universe"               
	1           "Less than 6 months"            
	2           "6 to 23 months"                
	3           "2 to 19 years"                 
	4           "20 or more years"              
	5           "Don't know"                    
;
label values afdsab   P220L;  
label define P220L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
	3           "Don't know"                    
;
label values afdpct   P221L;  
label define P221L   
	0           "Not in universe"               
	1           "1-10   percent"                
	2           "11-29  percent"                
	3           "30-49  percent"                
	4           "50     percent"                
	5           "51-89  percent"                
	6           "90-99  percent"                
	7           "100    percent"                
;
label values spdaf    P222L;  
label define P222L   
	0           "Not in universe"               
	1           "Yes, in the service"           
	2           "Yes, from service-related"     
	3           "No"                            
;
label values vets     P223L;  
label define P223L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values vetsmt   P224L;  
label define P224L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
	3           "Don't know"                    
;
label values vetnum   P225L;  
label define P225L   
	0           "Not applicable"                
;
label values retird   P226L;  
label define P226L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values socsec   P227L;  
label define P227L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values sspnum   P228L;  
label define P228L   
	0           "Not applicable"                
;
label values socsr1   P229L;  
label define P229L   
	0           "Not in universe"               
	1           "Retired"                       
	2           "Disabled"                      
	3           "Widow(ed) or surviving child"  
	4           "Spouse or dependent child"     
	5           "Some other reason"             
	6           "Don't know"                    
;
label values socsr2   P230L;  
label define P230L   
	0           "Not in universe"               
	1           "Retired"                       
	2           "Disabled"                      
	3           "Widow(ed) or surviving child"  
	4           "Spouse or dependent child"     
	5           "No other reason"               
	6           "Don't know"                    
;
label values disage   P231L;  
label define P231L   
	0           "Not in universe"               
;
label values railrd   P232L;  
label define P232L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rrpnum   P233L;  
label define P233L   
	0           "Not applicable"                
;
label values carecov  P234L;  
label define P234L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values medcode  P235L;  
label define P235L   
	0           "Not in universe"               
	1           "Retired or disabled worker"    
	2           "Spouse of retired or disabled" 
	3           "Widow of retired or disabled"  
	4           "Adult disabled as a child"     
	5           "Uninsured"                     
	7           "Other or invalid code"         
	9           "Missing code"                  
;
label values mcopt    P236L;  
label define P236L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values foodstp  P237L;  
label define P237L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values fspnum   P238L;  
label define P238L   
	0           "Not applicable"                
;
label values afdc     P239L;  
label define P239L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values afdcpnum P240L;  
label define P240L   
	0           "Not applicable"                
;
label values genasst  P241L;  
label define P241L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values gapnum   P242L;  
label define P242L   
	0           "Not applicable"                
;
label values fostkid  P243L;  
label define P243L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values fkpnum   P244L;  
label define P244L   
	0           "Not applicable"                
;
label values othwelf  P245L;  
label define P245L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values owpnum   P246L;  
label define P246L   
	0           "Not applicable"                
;
label values wiccov   P247L;  
label define P247L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values wicval   P248L;  
label define P248L   
	0           "None"                          
;
label values wicpnum  P249L;  
label define P249L   
	0           "Not applicable"                
;
label values caidcov  P250L;  
label define P250L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values mcdpnum  P251L;  
label define P251L   
	0           "Not applicable"                
;
label values hiind    P252L;  
label define P252L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values hipnum   P253L;  
label define P253L   
	0           "Not applicable"                
;
label values hinonh   P254L;  
label define P254L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values champ    P255L;  
label define P255L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values chpnum   P256L;  
label define P256L   
	0           "Not applicable"                
;
label values hiown    P257L;  
label define P257L   
	0           "Not in universe"               
	1           "Plan in own name"              
	2           "Someone else's plan"           
	3           "Both"                          
;
label values hisrc    P258L;  
label define P258L   
	0           "Not in universe"               
	1           "Current employer or union"     
	2           "Former employer"               
	3           "CHAMPUS"                       
	4           "CHAMPVA"                       
	5           "Military"                      
	6           "Other"                         
;
label values hipay    P259L;  
label define P259L   
	0           "Not in universe"               
	1           "All"                           
	2           "Part"                          
	3           "None"                          
;
label values hitype   P260L;  
label define P260L   
	0           "Not in universe"               
	1           "Individual"                    
	2           "Family"                        
;
label values hifam    P261L;  
label define P261L   
	0           "Not applicable"                
	1           "Yes, All persons covered"      
	2           "No, some persons covered"      
	3           "No one else covered"           
;
label values nonhhi   P262L;  
label define P262L   
	0           "Not applicable"                
	1           "Yes, spouse"                   
	2           "Yes, child(ren)"               
	3           "Yes, someone else"             
	4           "Yes, spouse and child(ren)"    
	5           "Yes, spouse and someone else"  
	6           "Yes, child(ren) and someone"   
	7           "Yes, spouse, children, and"    
	8           "No"                            
;
label values higrade  P263L;  
label define P263L   
	0           "Not applicable if under 15,"   
;
label values grdcmpl  P264L;  
label define P264L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values enrold   P265L;  
label define P265L   
	0           "Not in universe"               
	1           "Yes, full-time"                
	2           "Yes, part-time"                
	3           "No"                            
;
label values level    P266L;  
label define P266L   
	0           "Not in universe"               
	1           "Elementary grades 1-8"         
	2           "High school grades 9-12"       
	3           "College year 1"                
	4           "College year 2"                
	5           "College year 3"                
	6           "College year 4"                
	7           "College year 5"                
	8           "College year 6"                
	9           "Vocational school"             
	10          "Technical school"              
	11          "Business school"               
;
label values edasst   P267L;  
label define P267L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values othinc   P268L;  
label define P268L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values noinc    P269L;  
label define P269L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pwsuid   P270L;  
label define P270L   
	0           "Not in universe"               
;
label values pwentry  P271L;  
label define P271L   
	0           "Not in universe"               
;
label values pwpnum   P272L;  
label define P272L   
	0           "Not in universe"               
;
label values pwrrp    P273L;  
label define P273L   
	0           "Not applicable"                
	1           "Reference person with"         
	2           "Reference person with no rel." 
	3           "Husband/wife of reference person"
	4           "Natural/adopted child of"      
	5           "Stepchild of reference person" 
	6           "Foster child of reference"     
	7           "Grandchild of reference person"
	8           "Parent of reference person"    
	9           "Brother/sister of reference"   
	10          "Other relative of reference"   
	11          "Non-relative of reference person"
	12          "Partner/roommate of reference" 
	13          "Non-relative of reference person"
;
label values pwaddid  P274L;  
label define P274L   
	0           "Not applicable"                
;
label values isex     P275L;  
label define P275L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values irace    P276L;  
label define P276L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values iethncty P277L;  
label define P277L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values ihigrade P278L;  
label define P278L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values igrdcmpl P279L;  
label define P279L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values iewid    P280L;  
label define P280L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iwksjob  P281L;  
label define P281L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iwkswop  P282L;  
label define P282L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iwkslok  P283L;  
label define P283L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ireasab  P284L;  
label define P284L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values itakjob  P285L;  
label define P285L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values itakjobn P286L;  
label define P286L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values icwork   P287L;  
label define P287L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iuhours  P288L;  
label define P288L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iwkspt   P289L;  
label define P289L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iwksptr  P290L;  
label define P290L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values idisab   P291L;  
label define P291L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values idisage  P292L;  
label define P292L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values irhcdis  P293L;  
label define P293L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ivetstat P294L;  
label define P294L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values iinaf    P295L;  
label define P295L   
	0           "Not changed"                   
	1           "Changed"                       
;
label values ispinaf  P296L;  
label define P296L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ispdaf   P297L;  
label define P297L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iretird  P298L;  
label define P298L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values icarecov P299L;  
label define P299L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values imcopt   P300L;  
label define P300L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values icaidcov P301L;  
label define P301L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ihiind   P302L;  
label define P302L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ihiown   P303L;  
label define P303L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ihisrc   P304L;  
label define P304L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ihipay   P305L;  
label define P305L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ihitype  P306L;  
label define P306L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values inonhhi  P307L;  
label define P307L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ienrold  P308L;  
label define P308L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ilevel   P309L;  
label define P309L   
	0           "Not Imputed"                   
	1           "Imputed"                       
;
label values iedasst  P310L;  
label define P310L   
	0           "Not Imputed"                   
	1           "Imputed"                       
;
label values igibill  P311L;  
label define P311L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iothvet  P312L;  
label define P312L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iwkstdy  P313L;  
label define P313L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ipell    P314L;  
label define P314L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values isupped  P315L;  
label define P315L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values indsl    P316L;  
label define P316L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values istloan  P317L;  
label define P317L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ijtpa    P318L;  
label define P318L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iemplyr  P319L;  
label define P319L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ifsship  P320L;  
label define P320L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iothaid  P321L;  
label define P321L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values njobs    P322L;  
label define P322L   
	0           "Not in universe"               
	1           "Only 1 job"                    
	2           "Dual jobs all month"           
	3           "Dual jobs not all month"       
	4           "Dual jobs without overlapping" 
;
label values ws12003  P323L;  
label define P323L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws12004  P324L;  
label define P324L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws1occ   P325L;  
label define P325L   
	0           "Not in universe"               
;
label values ws1ind   P326L;  
label define P326L   
	0           "Not in universe"               
;
label values ws1wks   P327L;  
label define P327L   
	0           "None, or not in universe"      
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks"                       
;
label values ws1amt   P328L;  
label define P328L   
	0           "None, or not in universe"      
;
label values ws12002  P329L;  
label define P329L   
	0           "Not in universe"               
;
label values ws12012  P330L;  
label define P330L   
	0           "Not in universe"               
	1           "A private for-profit company or"
	2           "A private not-for-profit,"     
	3           "Federal government ?"          
	4           "State government ?"            
	5           "Local government ?"            
	6           "Armed Forces ?"                
	7           "Unpaid in family business or"  
;
label values ws1chg   P331L;  
label define P331L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws12018  P332L;  
label define P332L   
	0           "Not in universe"               
;
label values ws12016  P333L;  
label define P333L   
	0           "Not in universe"               
;
label values ws12022  P334L;  
label define P334L   
	0           "Not in universe"               
;
label values ws12020  P335L;  
label define P335L   
	0           "Not in universe"               
;
label values ws12023  P336L;  
label define P336L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws12024  P337L;  
label define P337L   
	0           "Not in universe"               
	1           "Laid off"                      
	2           "Retired"                       
	3           "Discharged"                    
	4           "Job was temporary and ended"   
	5           "Quit to take another job"      
	6           "Quit for some other reason"    
;
label values ws12025  P338L;  
label define P338L   
	0           "Not in universe / none"        
;
label values ws12026  P339L;  
label define P339L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws12028  P340L;  
label define P340L   
	0           "Not in universe"               
;
label values ws12029  P341L;  
label define P341L   
	0           "Not in universe"               
	1           "Once a week"                   
	2           "Once each 2 weeks"             
	3           "Once a month"                  
	4           "Twice a month"                 
	5           "Unpaid in family business or"  
	6           "Some other way"                
;
label values ws12031  P342L;  
label define P342L   
	0           "Not in universe"               
	32          "Not paid during reference"     
;
label values ws12030  P343L;  
label define P343L   
	0           "Not in universe"               
	13          "Not paid during reference"     
;
label values ws12044  P344L;  
label define P344L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws12046  P345L;  
label define P345L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values iws1occ  P346L;  
label define P346L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws1ind  P347L;  
label define P347L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12012 P348L;  
label define P348L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12024 P349L;  
label define P349L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12026 P350L;  
label define P350L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12028 P351L;  
label define P351L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12029 P352L;  
label define P352L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12031 P353L;  
label define P353L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12030 P354L;  
label define P354L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12044 P355L;  
label define P355L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws12046 P356L;  
label define P356L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ws1calc  P357L;  
label define P357L   
	0           "Not calculated"                
	1           "Imputed input"                 
	2           "No imputed input"              
;
label values ws22103  P358L;  
label define P358L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws22104  P359L;  
label define P359L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws2occ   P360L;  
label define P360L   
	0           "Not in universe"               
;
label values ws2ind   P361L;  
label define P361L   
	0           "Not in universe"               
;
label values ws2wks   P362L;  
label define P362L   
	0           "None, or not in universe"      
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks"                       
;
label values ws2amt   P363L;  
label define P363L   
	0           "None, or not in universe"      
;
label values ws22102  P364L;  
label define P364L   
	0           "Not in universe"               
;
label values ws22112  P365L;  
label define P365L   
	0           "Not in universe"               
	1           "A private for-profit company or"
	2           "A private not-for-profit,"     
	3           "Federal government"            
	4           "State government ?"            
	5           "Local government ?"            
	6           "Armed Forces ?"                
	7           "Unpaid in family business or"  
;
label values ws2chg   P366L;  
label define P366L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws22118  P367L;  
label define P367L   
	0           "Not in universe"               
;
label values ws22116  P368L;  
label define P368L   
	0           "Not in universe"               
;
label values ws22122  P369L;  
label define P369L   
	0           "Not in universe"               
;
label values ws22120  P370L;  
label define P370L   
	0           "Not in universe"               
;
label values ws22123  P371L;  
label define P371L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws22124  P372L;  
label define P372L   
	0           "Not in universe"               
	1           "Laid off"                      
	2           "Retired"                       
	3           "Discharged"                    
	4           "Job was temporary and ended"   
	5           "Quit to take another job"      
	6           "Quit for some other reason"    
;
label values ws22125  P373L;  
label define P373L   
	0           "Not in universe / none"        
;
label values ws22126  P374L;  
label define P374L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws22128  P375L;  
label define P375L   
	0           "Not in universe"               
;
label values ws22129  P376L;  
label define P376L   
	0           "Not in universe"               
	1           "Once a week"                   
	2           "Once each 2 weeks"             
	3           "Once a month"                  
	4           "Twice a month"                 
	5           "Unpaid in family business or"  
	6           "Some other way"                
;
label values ws22131  P377L;  
label define P377L   
	0           "Not in universe"               
	32          "Not paid during reference"     
;
label values ws22130  P378L;  
label define P378L   
	0           "Not in universe"               
	13          "Not paid during reference period"
;
label values ws22144  P379L;  
label define P379L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ws22146  P380L;  
label define P380L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values iws2occ  P381L;  
label define P381L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws2ind  P382L;  
label define P382L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22112 P383L;  
label define P383L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22124 P384L;  
label define P384L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22126 P385L;  
label define P385L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22128 P386L;  
label define P386L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22129 P387L;  
label define P387L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22131 P388L;  
label define P388L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22130 P389L;  
label define P389L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22144 P390L;  
label define P390L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iws22146 P391L;  
label define P391L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ws2calc  P392L;  
label define P392L   
	0           "Not calculated"                
	1           "Imputed input"                 
	2           "No imputed input"              
;
label values se12202  P393L;  
label define P393L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12203  P394L;  
label define P394L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se1ind   P395L;  
label define P395L   
	0           "Not in universe"               
	1           "Agriculture,forestry,fisheries"
	2           "Mining (040-050)"              
	3           "Construction (060)"            
	4           "Manufacturing-nondurable goods"
	5           "Manufacturing-durable goods"   
	6           "Transportation,communications,"
	7           "Wholesale trade-durable goods" 
	8           "Wholesale trade-nondurable"    
	9           "Retail trade (580-691)"        
	10          "Finance,insurance,real estate" 
	11          "Business and repair services"  
	12          "Personal services (761-791)"   
	13          "Entertainment and recreation"  
	14          "Professional and related"      
	15          "Public administration (900-932)"
	16          "Industry not reported (990)"   
;
label values se1occ   P396L;  
label define P396L   
	0           "Not in universe"               
;
label values se1wks   P397L;  
label define P397L   
	0           "None"                          
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks"                       
	9           "Not in universe"               
;
label values se1amt   P398L;  
label define P398L   
	0           "None, or not in universe"      
;
label values se12201  P399L;  
label define P399L   
	0           "Not answered"                  
;
label values se12212  P400L;  
label define P400L   
	0           "Not in universe / none"        
;
label values se12214  P401L;  
label define P401L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12218  P402L;  
label define P402L   
	0           "Not in universe"               
	3           "3 - 5 employees"               
	4           "6 or more employees"           
;
label values se12220  P403L;  
label define P403L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12222  P404L;  
label define P404L   
	0           "Not in universe"               
	1           "Sole proprietorship"           
	2           "Partnership"                   
;
label values se12224  P405L;  
label define P405L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12226  P406L;  
label define P406L   
	0           "Not in universe"               
;
label values se12228  P407L;  
label define P407L   
	0           "Not in universe"               
;
label values se12230  P408L;  
label define P408L   
	0           "Not in universe"               
;
label values se12232  P409L;  
label define P409L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12234  P410L;  
label define P410L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12252  P411L;  
label define P411L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12254  P412L;  
label define P412L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se12256  P413L;  
label define P413L   
	0           "None, or not in universe"      
;
label values se12260  P414L;  
label define P414L   
	0           "None, or not in universe"      
;
label values ise1occ  P415L;  
label define P415L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise1ind  P416L;  
label define P416L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12214 P417L;  
label define P417L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12218 P418L;  
label define P418L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12220 P419L;  
label define P419L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12222 P420L;  
label define P420L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12232 P421L;  
label define P421L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12234 P422L;  
label define P422L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12254 P423L;  
label define P423L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12256 P424L;  
label define P424L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise12260 P425L;  
label define P425L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise1amt  P426L;  
label define P426L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values se22302  P427L;  
label define P427L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22303  P428L;  
label define P428L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se2ind   P429L;  
label define P429L   
	0           "Not in universe"               
	1           "Agriculture,forestry,fisheries"
	2           "Mining (040-050)"              
	3           "Construction (060)"            
	4           "Manufacturing-nondurable"      
	5           "Manufacturing-durable"         
	6           "Transportation,communications,"
	7           "Wholesale trade-durable"       
	8           "Wholesale trade-nondurable"    
	9           "Retail trade (580-691)"        
	10          "Finance,insurance,real estate" 
	11          "Business and repair services"  
	12          "Personal services (761-791)"   
	13          "Entertainment and recreation"  
	14          "Professional and related"      
	15          "Public administration (900-932)"
	16          "Industry not reported (990)"   
;
label values se2occ   P430L;  
label define P430L   
	0           "Not in universe"               
;
label values se2wks   P431L;  
label define P431L   
	0           "None"                          
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks"                       
	9           "Not in universe"               
;
label values se2amt   P432L;  
label define P432L   
	0           "None, or not in universe"      
;
label values se22301  P433L;  
label define P433L   
	0           "Not answered"                  
;
label values se22312  P434L;  
label define P434L   
	0           "Not in universe / none"        
;
label values se22314  P435L;  
label define P435L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22318  P436L;  
label define P436L   
	0           "Not in universe"               
	3           "3 - 5 employees"               
	4           "6 or more employees"           
;
label values se22320  P437L;  
label define P437L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22322  P438L;  
label define P438L   
	0           "Not in universe"               
	1           "Sole proprietorship"           
	2           "Partnership"                   
;
label values se22324  P439L;  
label define P439L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22326  P440L;  
label define P440L   
	0           "Not in universe"               
;
label values se22328  P441L;  
label define P441L   
	0           "Not in universe"               
;
label values se22330  P442L;  
label define P442L   
	0           "Not in universe"               
;
label values se22332  P443L;  
label define P443L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22334  P444L;  
label define P444L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22352  P445L;  
label define P445L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22354  P446L;  
label define P446L   
	0           "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values se22356  P447L;  
label define P447L   
	0           "Not in universe"               
;
label values se22360  P448L;  
label define P448L   
	0           "None, or not in universe"      
;
label values ise2occ  P449L;  
label define P449L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise2ind  P450L;  
label define P450L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22314 P451L;  
label define P451L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22318 P452L;  
label define P452L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22320 P453L;  
label define P453L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22322 P454L;  
label define P454L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22332 P455L;  
label define P455L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22334 P456L;  
label define P456L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22354 P457L;  
label define P457L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22356 P458L;  
label define P458L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise22360 P459L;  
label define P459L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ise2amt  P460L;  
label define P460L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values r01a     P461L;  
label define P461L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r01k     P462L;  
label define P462L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r02a     P463L;  
label define P463L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r02k     P464L;  
label define P464L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r03      P465L;  
label define P465L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r05      P466L;  
label define P466L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r06      P467L;  
label define P467L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r07      P468L;  
label define P468L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r08      P469L;  
label define P469L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r10      P470L;  
label define P470L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r12      P471L;  
label define P471L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r13      P472L;  
label define P472L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r20      P473L;  
label define P473L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r21      P474L;  
label define P474L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r23      P475L;  
label define P475L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r24      P476L;  
label define P476L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r25      P477L;  
label define P477L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r27      P478L;  
label define P478L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r28      P479L;  
label define P479L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r29      P480L;  
label define P480L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r30      P481L;  
label define P481L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r31      P482L;  
label define P482L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r32      P483L;  
label define P483L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r34      P484L;  
label define P484L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r35      P485L;  
label define P485L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r36      P486L;  
label define P486L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r37      P487L;  
label define P487L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r38      P488L;  
label define P488L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r40      P489L;  
label define P489L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r41      P490L;  
label define P490L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r50      P491L;  
label define P491L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r51      P492L;  
label define P492L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r52      P493L;  
label define P493L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r53      P494L;  
label define P494L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r54      P495L;  
label define P495L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r55      P496L;  
label define P496L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r56      P497L;  
label define P497L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values r75      P498L;  
label define P498L   
	0           "Not applicable"                
	1           "Yes, recipiency this month"    
	2           "No recipiency this month"      
;
label values s01amta  P499L;  
label define P499L   
	0           "None"                          
;
label values s01amtk  P500L;  
label define P500L   
	0           "None"                          
;
label values s02amta  P501L;  
label define P501L   
	0           "None"                          
;
label values s02amtk  P502L;  
label define P502L   
	0           "None"                          
;
label values s03amt   P503L;  
label define P503L   
	0           "None"                          
;
label values s05amt   P504L;  
label define P504L   
	0           "None"                          
;
label values s06amt   P505L;  
label define P505L   
	0           "None"                          
;
label values s07amt   P506L;  
label define P506L   
	0           "None"                          
;
label values s08amt   P507L;  
label define P507L   
	0           "None"                          
;
label values s10amt   P508L;  
label define P508L   
	0           "None"                          
;
label values s12amt   P509L;  
label define P509L   
	0           "None"                          
;
label values s13amt   P510L;  
label define P510L   
	0           "None"                          
;
label values s20amt   P511L;  
label define P511L   
	0           "None"                          
;
label values s21amt   P512L;  
label define P512L   
	0           "None"                          
;
label values s23amt   P513L;  
label define P513L   
	0           "None"                          
;
label values s24amt   P514L;  
label define P514L   
	0           "None"                          
;
label values s27amt   P515L;  
label define P515L   
	0           "None"                          
;
label values s28amt   P516L;  
label define P516L   
	0           "None"                          
;
label values s29amt   P517L;  
label define P517L   
	0           "None"                          
;
label values s30amt   P518L;  
label define P518L   
	0           "None"                          
;
label values s31amt   P519L;  
label define P519L   
	0           "None"                          
;
label values s32amt   P520L;  
label define P520L   
	0           "None"                          
;
label values s34amt   P521L;  
label define P521L   
	0           "None"                          
;
label values s35amt   P522L;  
label define P522L   
	0           "None"                          
;
label values s36amt   P523L;  
label define P523L   
	0           "None"                          
;
label values s37amt   P524L;  
label define P524L   
	0           "None"                          
;
label values s38amt   P525L;  
label define P525L   
	0           "None"                          
;
label values s40amt   P526L;  
label define P526L   
	0           "None"                          
;
label values s41amt   P527L;  
label define P527L   
	0           "None"                          
;
label values s50amt   P528L;  
label define P528L   
	0           "None"                          
;
label values s51amt   P529L;  
label define P529L   
	0           "None"                          
;
label values s52amt   P530L;  
label define P530L   
	0           "None"                          
;
label values s53amt   P531L;  
label define P531L   
	0           "None"                          
;
label values s54amt   P532L;  
label define P532L   
	0           "None"                          
;
label values s55amt   P533L;  
label define P533L   
	0           "None"                          
;
label values s56amt   P534L;  
label define P534L   
	0           "None"                          
;
label values s75amt   P535L;  
label define P535L   
	0           "None"                          
;
label values ir01a    P536L;  
label define P536L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir01k    P537L;  
label define P537L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir02a    P538L;  
label define P538L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir03     P539L;  
label define P539L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir05     P540L;  
label define P540L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir06     P541L;  
label define P541L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir07     P542L;  
label define P542L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir08     P543L;  
label define P543L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir10     P544L;  
label define P544L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir12     P545L;  
label define P545L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir13     P546L;  
label define P546L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir20     P547L;  
label define P547L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir21     P548L;  
label define P548L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir23     P549L;  
label define P549L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir24     P550L;  
label define P550L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir25     P551L;  
label define P551L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir27     P552L;  
label define P552L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir28     P553L;  
label define P553L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir29     P554L;  
label define P554L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir30     P555L;  
label define P555L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir31     P556L;  
label define P556L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir32     P557L;  
label define P557L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir34     P558L;  
label define P558L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir35     P559L;  
label define P559L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir36     P560L;  
label define P560L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir37     P561L;  
label define P561L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir38     P562L;  
label define P562L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir40     P563L;  
label define P563L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir41     P564L;  
label define P564L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir50     P565L;  
label define P565L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir51     P566L;  
label define P566L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir52     P567L;  
label define P567L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir53     P568L;  
label define P568L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir54     P569L;  
label define P569L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir55     P570L;  
label define P570L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir56     P571L;  
label define P571L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is01a    P572L;  
label define P572L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is01k    P573L;  
label define P573L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is02a    P574L;  
label define P574L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is02k    P575L;  
label define P575L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is03     P576L;  
label define P576L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is05     P577L;  
label define P577L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is06     P578L;  
label define P578L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is07     P579L;  
label define P579L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is08     P580L;  
label define P580L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is10     P581L;  
label define P581L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is12     P582L;  
label define P582L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is13     P583L;  
label define P583L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is20     P584L;  
label define P584L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is21     P585L;  
label define P585L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is23     P586L;  
label define P586L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is24     P587L;  
label define P587L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is27     P588L;  
label define P588L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is28     P589L;  
label define P589L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is29     P590L;  
label define P590L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is30     P591L;  
label define P591L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is31     P592L;  
label define P592L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is32     P593L;  
label define P593L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is34     P594L;  
label define P594L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is35     P595L;  
label define P595L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is36     P596L;  
label define P596L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is37     P597L;  
label define P597L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is38     P598L;  
label define P598L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is40     P599L;  
label define P599L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is41     P600L;  
label define P600L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is50     P601L;  
label define P601L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is51     P602L;  
label define P602L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is52     P603L;  
label define P603L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is53     P604L;  
label define P604L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is54     P605L;  
label define P605L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is55     P606L;  
label define P606L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is56     P607L;  
label define P607L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values is75     P608L;  
label define P608L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values r100     P609L;  
label define P609L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r101     P610L;  
label define P610L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r102     P611L;  
label define P611L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r103     P612L;  
label define P612L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj10003  P613L;  
label define P613L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro10003  P614L;  
label define P614L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r104     P615L;  
label define P615L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r105     P616L;  
label define P616L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r106     P617L;  
label define P617L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r107     P618L;  
label define P618L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj10407  P619L;  
label define P619L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro10407  P620L;  
label define P620L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r110     P621L;  
label define P621L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj110    P622L;  
label define P622L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro110    P623L;  
label define P623L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj110ri  P624L;  
label define P624L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro110ri  P625L;  
label define P625L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r120     P626L;  
label define P626L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj120    P627L;  
label define P627L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro120    P628L;  
label define P628L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj120ot  P629L;  
label define P629L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r130     P630L;  
label define P630L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values rj130    P631L;  
label define P631L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro130    P632L;  
label define P632L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r140     P633L;  
label define P633L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values r150     P634L;  
label define P634L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values ro14050  P635L;  
label define P635L   
	0           "Not applicable"                
	1           "Yes"                           
	2           "No"                            
;
label values j10003   P636L;  
label define P636L   
	0           "None"                          
;
label values o10003   P637L;  
label define P637L   
	0           "None"                          
;
label values j10407   P638L;  
label define P638L   
	0           "None"                          
;
label values o10407   P639L;  
label define P639L   
	0           "None"                          
;
label values j110     P640L;  
label define P640L   
	0           "None"                          
;
label values o110     P641L;  
label define P641L   
	0           "None"                          
;
label values j110ri   P642L;  
label define P642L   
	0           "None"                          
;
label values o110ri   P643L;  
label define P643L   
	0           "None"                          
;
label values jgrent   P644L;  
label define P644L   
	0           "Not in universe"               
;
label values jnrent   P645L;  
label define P645L   
	0           "Not in universe"               
;
label values ogrent   P646L;  
label define P646L   
	0           "Not in universe"               
;
label values onrent   P647L;  
label define P647L   
	0           "Not in universe"               
;
label values j120ot   P648L;  
label define P648L   
	0           "None"                          
;
label values j130     P649L;  
label define P649L   
	0           "None"                          
;
label values o130     P650L;  
label define P650L   
	0           "None"                          
;
label values o14050   P651L;  
label define P651L   
	0           "None"                          
;
label values cj10003  P652L;  
label define P652L   
	0           "No, not calculated"            
	1           "Yes, interest was calculated"  
;
label values co10003  P653L;  
label define P653L   
	0           "No, not calculated"            
	1           "Yes, calculated"               
;
label values cj10407  P654L;  
label define P654L   
	0           "No, not calculated"            
	1           "Yes, interest was calculated"  
;
label values co10407  P655L;  
label define P655L   
	0           "No, not calculated"            
	1           "Yes, calculated"               
;
label values ir100    P656L;  
label define P656L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir101    P657L;  
label define P657L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir102    P658L;  
label define P658L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir103    P659L;  
label define P659L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values irj10003 P660L;  
label define P660L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iro10003 P661L;  
label define P661L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir104    P662L;  
label define P662L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir105    P663L;  
label define P663L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir106    P664L;  
label define P664L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir107    P665L;  
label define P665L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values irj10407 P666L;  
label define P666L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iro10407 P667L;  
label define P667L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir110    P668L;  
label define P668L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ijo110   P669L;  
label define P669L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ijo110ri P670L;  
label define P670L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir120    P671L;  
label define P671L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values irj120   P672L;  
label define P672L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iro120   P673L;  
label define P673L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values irj120ot P674L;  
label define P674L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir130    P675L;  
label define P675L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values irj130   P676L;  
label define P676L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iro130   P677L;  
label define P677L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir140    P678L;  
label define P678L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ir150    P679L;  
label define P679L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ij10003  P680L;  
label define P680L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values io10003  P681L;  
label define P681L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ij10407  P682L;  
label define P682L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values io10407  P683L;  
label define P683L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ij110    P684L;  
label define P684L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values io110    P685L;  
label define P685L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ij110ri  P686L;  
label define P686L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values io110ri  P687L;  
label define P687L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ijgrent  P688L;  
label define P688L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ijnrent  P689L;  
label define P689L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values iogrent  P690L;  
label define P690L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ionrent  P691L;  
label define P691L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ij120ot  P692L;  
label define P692L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ij130    P693L;  
label define P693L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values io130    P694L;  
label define P694L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values io14050  P695L;  
label define P695L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values vettyp   P696L;  
label define P696L   
	0           "Not in universe"               
	1           "Service connected disability"  
	2           "Survivor benefits"             
	3           "Veterans' pension"             
	4           "Other veterans' payments"      
;
label values ivettyp  P697L;  
label define P697L   
	0           "Not imputed"                   
	1           "Imputed"                       
;
label values ssunit   P698L;  
label define P698L   
	0           "Not in universe"               
	1           "Individual husband-wife"       
	2           "Joint husband-wife benefits and"
	3           "Individual husband-wife"       
	4           "Joint husband-wife benefits, no"
	5           "Individual adult benefits"     
	6           "Individual adult benefits and" 
	7           "Child benefits only"           
;
label values senvelop P699L;  
label define P699L   
	0           "Not in universe"               
	1           "Service connected disability"  
	2           "Survivor benefits"             
	3           "Veterans' pension"             
	4           "Other veterans' payments"      
	-1          "Don't know"                    
;
label values ssday    P700L;  
label define P700L   
	0           "Not in universe"               
	1           "First"                         
	2           "Third"                         
	3           "Other"                         
	-1          "Don't know"                    
;
label values renvelop P701L;  
label define P701L   
	0           "Not in universe"               
	1           "Service connected disability"  
	2           "Survivor benefits"             
	3           "Veterans' pension"             
	4           "Other veterans' payments"      
	-1          "Don't know"                    
;
label values rrday    P702L;  
label define P702L   
	0           "Not in universe"               
	1           "First"                         
	2           "Third"                         
	3           "Other"                         
	-1          "Don't know"                    
;

