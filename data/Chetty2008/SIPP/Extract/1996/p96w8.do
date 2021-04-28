log using sip96w8d, replace
*This program reads the 1996 SIPP Wave 8 Core Data File
*by Jean Roth Mon Mar 25 12:43:13 EST 2002

*Please report errors to jroth@nber.org
*E-mail jroth@nber.org to be notfied of updates
*run with do sip96w8d
*Change output file name/location as desired in the first line of the .dct file
*If you are using a PC, you may need to change the direction of the slashes, as in C:\
* The following changes in variable names have been made, if necessary:
*      '$' to 'd';            '-' to '_';              '%' to 'p';
*      ($ = unedited data;     - = edited data;         % = allocated data)
* Note:  Variable names in Stata are case-sensitive
clear
quietly infile using p96w8

*Everything below this point are value labels

#delimit ;

;
label values spanel   P101L;  
label define P101L   
	1996        "Panel Year"                    
;
label values srefmon  P102L;  
label define P102L   
	1           "First Reference month"         
	2           "Second Reference month"        
	3           "Third Reference month"         
	4           "Fourth Reference month"        
;
label values rhcalmn  P103L;  
label define P103L   
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values tfipsst  P104L;  
label define P104L   
	1           "Alabama"                       
	2           "Alaska"                        
	4           "Arizona"                       
	5           "Arkansas"                      
	6           "California"                    
	8           "Colorado"                      
	9           "Connecticut"                   
	10          "Delaware"                      
	11          "DC"                            
	12          "Florida"                       
	13          "Georgia"                       
	15          "Hawaii"                        
	16          "Idaho"                         
	17          "Illinois"                      
	18          "Indiana"                       
	19          "Iowa"                          
	20          "Kansas"                        
	21          "Kentucky"                      
	22          "Louisiana"                     
	24          "Maryland"                      
	25          "Massachusetts"                 
	26          "Michigan"                      
	27          "Minnesota"                     
	28          "Mississippi"                   
	29          "Missouri"                      
	30          "Montana"                       
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
	61          "Maine, Vermont"                
	62          "North Dakota, South Dakota,"   
;
label values eoutcome P105L;  
label define P105L   
	201         "Completed interview"           
	203         "Compl. partial- missing data; no"
	207         "Complete partial - TYPE-Z; no" 
	213         "TYPE-A, language problem"      
	215         "TYPE-A, insufficient parital"  
	216         "TYPE-A, no one home (noh)"     
	217         "TYPE-A, temporarily absent (ta)"
	218         "TYPE-A, hh refused"            
	219         "TYPE-A, other occupied (specify)"
	234         "TYPE-B, entire hh institut. or"
	248         "TYPE-C, other (specify)"       
	249         "TYPE-C, sample adjustment"     
	250         "TYPE-C, hh deceased"           
	251         "TYPE-C, moved out of country"  
	252         "TYPE-C, living in armed forces"
	253         "TYPE-C, on active duty in Armed"
	254         "TYPE-C, no one over age 15 years"
	255         "TYPE-C, no Wave 1 persons"     
	260         "TYPE-D, moved address unknown" 
	261         "TYPE-D, moved w/in U.S. but"   
	262         "Merged with another SIPP"      
	270         "Mover, no longer located in same"
	271         "Mover, new address located in" 
;
label values rhtype   P106L;  
label define P106L   
	1           "Family hh - Married couple"    
	2           "Family hh - Male householder"  
	3           "Family hh - Female householder"
	4           "Nonfamily hh - Male hhlder"    
	5           "Nonfamily hh - Female hhlder"  
	6           "Group Quarters"                
;
label values tmetro   P107L;  
label define P107L   
	1           "Metro"                         
	2           "Residual"                      
;
label values rhchange P108L;  
label define P108L   
	1           "Change occurred"               
	2           "No change occurred"            
;
label values eaccess  P109L;  
label define P109L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aaccess  P110L;  
label define P110L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eunits   P111L;  
label define P111L   
	-1          "Not in universe"               
	1           "One, detached"                 
	2           "One, attached"                 
	3           "Two"                           
	4           "3:4"                           
	5           "5-9"                           
	6           "10-19"                         
	7           "20-49"                         
	8           "50 or more"                    
;
label values aunits   P112L;  
label define P112L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values elivqrt  P113L;  
label define P113L   
	1           "HU in House, apartment, flat"  
	2           "HU in nontransient hotel, motel,"
	3           "HU permanent, in transient"    
	4           "HU in rooming house"           
	5           "Mobile home or trailer w/ no"  
	6           "Mobile Home or trailer w/ one or"
	7           "HU not specified above"        
	8           "GQ - Quarters not HU in rooming"
	9           "GQ - Unit not permanent in"    
	10          "GQ - Unoccupied tent or trailer"
	11          "GQ - Student quarters in college"
	12          "Group quarters unit not"       
;
label values alivqrt  P114L;  
label define P114L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical Imputation (Derivation)"
	4           "Statistical or logical"        
;
label values etenure  P115L;  
label define P115L   
	1           "Owned or being bought by you or"
	2           "Rented for cash"               
	3           "Occupied without payment of cash"
;
label values atenure  P116L;  
label define P116L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epubhse  P117L;  
label define P117L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apubhse  P118L;  
label define P118L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values egvtrnt  P119L;  
label define P119L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agvtrnt  P120L;  
label define P120L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amthrnt  P121L;  
label define P121L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eutilyn  P122L;  
label define P122L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values autilyn  P123L;  
label define P123L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eegyast  P124L;  
label define P124L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aegyast  P125L;  
label define P125L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eegypmt1 P126L;  
label define P126L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values eegypmt2 P127L;  
label define P127L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values eegypmt3 P128L;  
label define P128L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aegypmt  P129L;  
label define P129L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values aegyamt  P130L;  
label define P130L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehotlunc P131L;  
label define P131L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahotlunc P132L;  
label define P132L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rnklun   P133L;  
label define P133L   
	-1          "Not in universe"               
;
label values efreelun P134L;  
label define P134L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afreelun P135L;  
label define P135L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values efrerdln P136L;  
label define P136L   
	-1          "Not in universe"               
	1           "Free lunch"                    
	2           "Reduced-price lunch"           
;
label values afrerdln P137L;  
label define P137L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ebrkfst  P138L;  
label define P138L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abrkfst  P139L;  
label define P139L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation"            
	4           "Statistical or logical"        
;
label values rnkbrk   P140L;  
label define P140L   
	-1          "Not in universe"               
;
label values efreebrk P141L;  
label define P141L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afreebrk P142L;  
label define P142L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values efrerdbk P143L;  
label define P143L   
	-1          "Not in universe"               
	1           "Free breakfast"                
	2           "Reduced-price breakfast"       
;
label values afrerdbk P144L;  
label define P144L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rprgques P145L;  
label define P145L   
	1           "Res. this mo. was intrvwed"    
	2           "Res. this mo. in sample but"   
	3           "Res. this mo. not in sample at"
;
label values rhnbrf   P146L;  
label define P146L   
	1           "Yes"                           
	2           "No"                            
;
label values rhcbrf   P147L;  
label define P147L   
	1           "Yes"                           
	2           "No"                            
;
label values rhmtrf   P148L;  
label define P148L   
	1           "Yes"                           
	2           "No"                            
;
label values rfid2    P149L;  
label define P149L   
	-1          "Not in universe"               
;
label values efspouse P150L;  
label define P150L   
	9999        "Persons with EFKIND=2 or 3"    
;
label values eftype   P151L;  
label define P151L   
	1           "Primary family (including those"
	3           "Unrelated Subfamily"           
	4           "Primary Individual"            
	5           "Secondary Individual"          
;
label values rfchange P152L;  
label define P152L   
	1           "Change occurred"               
	2           "No change occurred"            
;
label values efkind   P153L;  
label define P153L   
	1           "Headed by Husband/Wife"        
	2           "Male Headed"                   
	3           "Female Headed"                 
;
label values rsid     P154L;  
label define P154L   
	-1          "Not in universe"               
;
label values esfnp    P155L;  
label define P155L   
	-1          "Not in universe"               
;
label values esfrfper P156L;  
label define P156L   
	-1          "Not in universe"               
;
label values esfspse  P157L;  
label define P157L   
	-1          "Not in universe"               
	9999        "No spouse in subfamily"        
;
label values esftype  P158L;  
label define P158L   
	-1          "Not in universe"               
	2           "Related Subfamily"             
;
label values esfkind  P159L;  
label define P159L   
	-1          "Not in universe"               
	1           "Headed by Husband/Wife"        
	2           "Male Headed"                   
	3           "Female Headed"                 
;
label values rschange P160L;  
label define P160L   
	1           "Change occurred"               
	2           "No change occurred"            
;
label values esownkid P161L;  
label define P161L   
	-1          "Not in universe"               
;
label values esoklt18 P162L;  
label define P162L   
	-1          "Not in universe"               
;
label values wsfinwgt P163L;  
label define P163L   
	-1          "Not in universe"               
;
label values eppintvw P164L;  
label define P164L   
	1           "Interview (self)"              
	2           "Interview (proxy)"             
	3           "Noninterview - Type Z"         
	4           "Nonintrvw - pseudo Type Z.  Left"
	5           "Children under 15 during"      
;
label values epopstat P165L;  
label define P165L   
	1           "Adult (15 years of age or older)"
	2           "Child (Under 15 years of age)" 
;
label values abmnth   P166L;  
label define P166L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values abyear   P167L;  
label define P167L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esex     P168L;  
label define P168L   
	1           "Male"                          
	2           "Female"                        
;
label values asex     P169L;  
label define P169L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values erace    P170L;  
label define P170L   
	1           "White"                         
	2           "Black"                         
	3           "American Indian, Aleut, or"    
	4           "Asian or Pacific Islander"     
;
label values arace    P171L;  
label define P171L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eorigin  P172L;  
label define P172L   
	1           "Canadian"                      
	2           "Dutch"                         
	3           "English"                       
	4           "French"                        
	5           "French-Canadian"               
	6           "German"                        
	7           "Hungarian"                     
	8           "Irish"                         
	9           "Italian"                       
	10          "Polish"                        
	11          "Russian"                       
	12          "Scandinavian"                  
	13          "Scotch-Irish"                  
	14          "Scottish"                      
	15          "Slovak"                        
	16          "Welsh"                         
	17          "Other European"                
	20          "Mexican"                       
	21          "Mexican-American"              
	22          "Chicano"                       
	23          "Puerto Rican"                  
	24          "Cuban"                         
	25          "Central American"              
	26          "South American"                
	27          "Dominican Republic"            
	28          "Other Hispanic"                
	30          "African-American or"           
	31          "American Indian, Eskimo, or"   
	32          "Arab"                          
	33          "Asian"                         
	34          "Pacific Islander"              
	35          "West Indian"                   
	39          "Another group not listed"      
	40          "American"                      
;
label values aorigin  P173L;  
label define P173L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values uevrwid  P174L;  
label define P174L   
	1           "Yes"                           
	2           "No"                            
	6           "Don't know"                    
	7           "Refused"                       
;
label values uevrdiv  P175L;  
label define P175L   
	1           "Yes"                           
	2           "No"                            
	6           "Don't know"                    
	7           "Refused"                       
;
label values eafnow   P176L;  
label define P176L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aafnow   P177L;  
label define P177L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eafever  P178L;  
label define P178L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aafever  P179L;  
label define P179L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values uaf1     P180L;  
label define P180L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	6           "Don't know"                    
	7           "Refused"                       
;
label values uaf2     P181L;  
label define P181L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values uaf3     P182L;  
label define P182L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values uaf4     P183L;  
label define P183L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values uaf5     P184L;  
label define P184L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values evayn    P185L;  
label define P185L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values avayn    P186L;  
label define P186L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values evettyp  P187L;  
label define P187L   
	-1          "Not in universe"               
	1           "Service-connected disability"  
	2           "Survivor Benefits"             
	3           "Veteran's Pension"             
	4           "Other Veteran's Payments"      
;
label values avettyp  P188L;  
label define P188L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values evaques  P189L;  
label define P189L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values avaques  P190L;  
label define P190L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eafsrvdi P191L;  
label define P191L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aafsrvdi P192L;  
label define P192L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esfr     P193L;  
label define P193L   
	1           "Reference person of a rel. or" 
	2           "Spouse of reference person of a"
	3           "Child (under 18) of reference" 
;
label values esft     P194L;  
label define P194L   
	1           "Secondary indiv (not a family" 
	2           "Unrelated subfamily"           
	3           "Related subfamily"             
	4           "Primary individual"            
;
label values aage     P195L;  
label define P195L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values errp     P196L;  
label define P196L   
	1           "Reference person w/ rel. persons"
	2           "Reference Person w/out rel."   
	3           "Spouse of reference person"    
	4           "Child of reference person"     
	5           "Grandchild of reference person"
	6           "Parent of reference person"    
	7           "Brother/sister of reference"   
	8           "Other relative of reference"   
	9           "Foster child of reference person"
	10          "Unmarried partner of reference"
	11          "Housemate/roommate"            
	12          "Roomer/boarder"                
	13          "Other non-relative of reference"
;
label values arrp     P197L;  
label define P197L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ems      P198L;  
label define P198L   
	1           "Married, spouse present"       
	2           "Married, Spouse absent"        
	3           "Widowed"                       
	4           "Divorced"                      
	5           "Separated"                     
	6           "Never Married"                 
;
label values ams      P199L;  
label define P199L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epnspous P200L;  
label define P200L   
	9999        "Spouse not in hhld or person not"
;
label values apnspous P201L;  
label define P201L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epnmom   P202L;  
label define P202L   
	9999        "No mother in household"        
;
label values apnmom   P203L;  
label define P203L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epndad   P204L;  
label define P204L   
	9999        "No father in household"        
;
label values apndad   P205L;  
label define P205L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epnguard P206L;  
label define P206L   
	-1          "Not in universe"               
	9999        "Guardian not in household"     
;
label values apnguard P207L;  
label define P207L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values etypmom  P208L;  
label define P208L   
	-1          "Not in universe"               
	1           "Biological or natural child"   
	2           "Stepchild"                     
	3           "Adopted child"                 
;
label values atypmom  P209L;  
label define P209L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values etypdad  P210L;  
label define P210L   
	-1          "Not in universe"               
	1           "Biological or natural child"   
	2           "Stepchild"                     
	3           "Adopted child"                 
;
label values atypdad  P211L;  
label define P211L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rdesgpnt P212L;  
label define P212L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ulftmain P213L;  
label define P213L   
	1           "Deceased"                      
	2           "Institutionalized"             
	3           "On active duty in the Armed"   
	4           "Moved outside of U.S."         
	5           "Separation or divorce"         
	6           "Marriage"                      
	7           "Became employed/unemployed"    
	8           "Due to job change - other"     
	9           "Listed in error in prior wave" 
	10          "Other"                         
	11          "Moved to type C household"     
;
label values uentmain P214L;  
label define P214L   
	1           "Birth"                         
	2           "Marriage"                      
	3           "Returned to hhld after missing"
	4           "Due to separation or divorce"  
	5           "From an institution"           
	6           "From Armed  Forces barracks"   
	7           "From outside the U.S."         
	8           "Should have been listed as"    
	9           "Became employed/unemployed"    
	10          "Job change - other"            
	11          "Lived at this address before"  
	12          "Other"                         
;
label values uentmon  P215L;  
label define P215L   
	13          "Entered before reference period"
;
label values ehtlnyn  P216L;  
label define P216L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahtlnyn  P217L;  
label define P217L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ebkfsyn  P218L;  
label define P218L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abkfsyn  P219L;  
label define P219L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rcutyp01 P220L;  
label define P220L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp03 P221L;  
label define P221L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp04 P222L;  
label define P222L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp08 P223L;  
label define P223L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp20 P224L;  
label define P224L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp21 P225L;  
label define P225L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp23 P226L;  
label define P226L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp24 P227L;  
label define P227L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp25 P228L;  
label define P228L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp27 P229L;  
label define P229L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp57 P230L;  
label define P230L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp58 P231L;  
label define P231L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values renroll  P232L;  
label define P232L   
	-1          "Not in universe"               
	1           "Enrolled full-time"            
	2           "Enrolled part-time"            
	3           "Not enrolled"                  
;
label values arenroll P233L;  
label define P233L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eenrlm   P234L;  
label define P234L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aenrlm   P235L;  
label define P235L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values renrlma  P236L;  
label define P236L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values eenlevel P237L;  
label define P237L   
	-1          "Not in universe"               
	1           "Elementary grades 1-8"         
	2           "High school grades 9-12"       
	3           "College year 1 (freshman)"     
	4           "College year 2 (sophomore)"    
	5           "College year 3 (junior)"       
	6           "College year 4 (senior)"       
	7           "College year 5 (first year"    
	8           "College year 6+ (second year or"
	9           "Vocational, technical, or"     
	10          "Enrolled in college, but not"  
;
label values aenlevel P238L;  
label define P238L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eedfund  P239L;  
label define P239L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aedfund  P240L;  
label define P240L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values easst01  P241L;  
label define P241L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst03  P242L;  
label define P242L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst04  P243L;  
label define P243L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst05  P244L;  
label define P244L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst06  P245L;  
label define P245L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst07  P246L;  
label define P246L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst08  P247L;  
label define P247L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst09  P248L;  
label define P248L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst10  P249L;  
label define P249L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst11  P250L;  
label define P250L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values aedasst  P251L;  
label define P251L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eeducate P252L;  
label define P252L   
	-1          "Not in universe"               
	31          "Less than 1st grade"           
	32          "1st, 2nd, 3rd or 4th grade"    
	33          "5th or 6th grade"              
	34          "7th or 8th grade"              
	35          "9th grade"                     
	36          "10th grade"                    
	37          "11th grade"                    
	38          "12th grade"                    
	39          "High school graduate - high"   
	40          "Some college but no degree"    
	41          "Diploma or certificate from a" 
	42          "Associate degree in college -" 
	43          "Associate Degree in college -" 
	44          "Bachelors degree (For example:"
	45          "Master's degree (For example:" 
	46          "Professional School Degree (For"
	47          "Doctorate degree (For example:"
;
label values aeducate P253L;  
label define P253L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epdjbthn P254L;  
label define P254L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apdjbthn P255L;  
label define P255L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eppflag  P256L;  
label define P256L   
	-1          "Not in universe or not"        
	1           "Yes"                           
;
label values emax     P257L;  
label define P257L   
	-1          "Not in universe"               
;
label values ebuscntr P258L;  
label define P258L   
	-1          "Not in universe"               
;
label values ejobcntr P259L;  
label define P259L   
	-1          "Not in universe"               
;
label values eeveret  P260L;  
label define P260L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aeveret  P261L;  
label define P261L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values edisabl  P262L;  
label define P262L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values adisabl  P263L;  
label define P263L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values edisprev P264L;  
label define P264L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values adisprev P265L;  
label define P265L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ersnowrk P266L;  
label define P266L   
	-1          "Not in universe"               
	1           "Temporarily unable to work"    
	2           "Temporarily not able to work"  
	3           "Unable to work because of"     
	4           "Retired"                       
	5           "Pregnancy/childbirth"          
	6           "Taking care of children/other" 
	7           "Going to school"               
	8           "Unable to find work"           
	9           "On layoff"                     
	10          "Not interested in working at a"
	11          "Other"                         
;
label values arsnowrk P267L;  
label define P267L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eawop    P268L;  
label define P268L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aawop    P269L;  
label define P269L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eabre    P270L;  
label define P270L   
	-1          "Not in universe"               
	1           "On layoff (temporary or"       
	2           "Slack work or business"        
	3           "Own injury"                    
	4           "Own illness/injury/medical"    
	5           "Pregnancy/childbirth"          
	6           "Taking care of children"       
	7           "On vacation/personal days"     
	8           "Bad weather"                   
	9           "Labor dispute"                 
	10          "New job to begin within 30 days"
	11          "Participated in a job-sharing" 
	12          "Other"                         
;
label values aabre    P271L;  
label define P271L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eptwrk   P272L;  
label define P272L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aptwrk   P273L;  
label define P273L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eptresn  P274L;  
label define P274L   
	-1          "Not in universe"               
	1           "Could not find full-time job"  
	2           "Wanted to work part time"      
	3           "Temporarily unable to work"    
	4           "Temporarily not able to work"  
	5           "Unable to work full-time because"
	6           "Taking care of children/other" 
	7           "Full-time work week less than 35"
	8           "Slack work or material shortage"
	9           "Participated in job sharing"   
	10          "On vacation"                   
	11          "In school"                     
	12          "Other"                         
;
label values aptresn  P275L;  
label define P275L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values elkwrk   P276L;  
label define P276L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values alkwrk   P277L;  
label define P277L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values elayoff  P278L;  
label define P278L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values alayoff  P279L;  
label define P279L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values rtakjob  P280L;  
label define P280L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values rnotake  P281L;  
label define P281L   
	-1          "Not in universe"               
	1           "Waiting for a new job to begin"
	2           "Own temporary illness"         
	3           "School"                        
	4           "Other"                         
;
label values emoonlit P282L;  
label define P282L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amoonlit P283L;  
label define P283L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values amlmsum  P284L;  
label define P284L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ebflag   P285L;  
label define P285L   
	-1          "Not in universe or not"        
	1           "Yes"                           
;
label values ecflag   P286L;  
label define P286L   
	-1          "Not in universe"               
	1           "Yes"                           
;
label values rmesr    P287L;  
label define P287L   
	-1          "Not in universe"               
	1           "With a job entire month, worked"
	2           "With a job all month, absent"  
	3           "With job all month, absent from"
	4           "With a job at least 1 but not" 
	5           "With job at least 1 but not all"
	6           "No job all month, on layoff or"
	7           "No job, at least one but not all"
	8           "No job, no time on layoff and no"
;
label values rwkesr1  P288L;  
label define P288L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr2  P289L;  
label define P289L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr3  P290L;  
label define P290L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr4  P291L;  
label define P291L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr5  P292L;  
label define P292L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rmwkwjb  P293L;  
label define P293L   
	-1          "Not in universe"               
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks (if applicable)"       
;
label values rmwksab  P294L;  
label define P294L   
	-1          "Not in universe"               
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks (if applicable)"       
;
label values awksab   P295L;  
label define P295L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values rmwklkg  P296L;  
label define P296L   
	-1          "Not in universe"               
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks (if applicable)"       
;
label values awklkg   P297L;  
label define P297L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values rmhrswk  P298L;  
label define P298L   
	-1          "Not in universe"               
	1           "All weeks 35+"                 
	2           "All weeks 1-34 hours"          
	3           "Some weeks 35+ and some weeks" 
	4           "Some weeks 35+, some 1-34 hours,"
	5           "At least 1, but not all, weeks"
	6           "At least 1 week, but not all"  
;
label values rwksperm P299L;  
label define P299L   
	-1          "Not in universe"               
	4           "four weeks"                    
	5           "five weeks"                    
;
label values eeno1    P300L;  
label define P300L   
	-1          "Not in universe"               
;
label values estlemp1 P301L;  
label define P301L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values astlemp1 P302L;  
label define P302L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tsjdate1 P303L;  
label define P303L   
	-1          "Not in universe"               
;
label values asjdate1 P304L;  
label define P304L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tejdate1 P305L;  
label define P305L   
	-1          "Not in universe"               
;
label values aejdate1 P306L;  
label define P306L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ersend1  P307L;  
label define P307L   
	-1          "Not in universe"               
	1           "On layoff"                     
	2           "Retirement or old age"         
	3           "Childcare problems"            
	4           "Other family/personal"         
	5           "Own illness"                   
	6           "Own injury"                    
	7           "School/training"               
	8           "Discharged/fired"              
	9           "Employer bankrupt"             
	10          "Employer, sold business"       
	11          "Job was temporary and ended"   
	12          "Quit to take another job"      
	13          "Slack work or business"        
	14          "Unsatisfactory work arrangements"
	15          "Quit for some other reason"    
;
label values arsend1  P308L;  
label define P308L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ejbhrs1  P309L;  
label define P309L   
	-1          "Not in universe"               
;
label values ajbhrs1  P310L;  
label define P310L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eemploc1 P311L;  
label define P311L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aemploc1 P312L;  
label define P312L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tempall1 P313L;  
label define P313L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25 to 99 employees"            
	3           "100+ employees"                
;
label values aempall1 P314L;  
label define P314L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tempsiz1 P315L;  
label define P315L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25 to 99 employees"            
	3           "100+ employees"                
;
label values aempsiz1 P316L;  
label define P316L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eclwrk1  P317L;  
label define P317L   
	-1          "Not in universe"               
	1           "Private for profit employee"   
	2           "Private not for profit employee"
	3           "Local government worker"       
	4           "State government worker"       
	5           "Federal government worker"     
	6           "Family worker without pay"     
;
label values aclwrk1  P318L;  
label define P318L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eunion1  P319L;  
label define P319L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aunion1  P320L;  
label define P320L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ecntrc1  P321L;  
label define P321L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acntrc1  P322L;  
label define P322L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values apmsum1  P323L;  
label define P323L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values epayhr1  P324L;  
label define P324L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apayhr1  P325L;  
label define P325L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values apyrate1 P326L;  
label define P326L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values rpyper1  P327L;  
label define P327L   
	-1          "Not in universe"               
	1           "Once a week"                   
	2           "Once every two weeks"          
	3           "Once a month"                  
	4           "Twice a month"                 
	5           "Unpaid in a family business or"
	6           "On commission"                 
	7           "Some other way"                
	8           "Not reported"                  
;
label values ajbind1  P328L;  
label define P328L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ajbocc1  P329L;  
label define P329L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eeno2    P330L;  
label define P330L   
	-1          "Not in universe"               
;
label values estlemp2 P331L;  
label define P331L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values astlemp2 P332L;  
label define P332L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tsjdate2 P333L;  
label define P333L   
	-1          "Not in universe"               
;
label values asjdate2 P334L;  
label define P334L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tejdate2 P335L;  
label define P335L   
	-1          "Not in universe"               
;
label values aejdate2 P336L;  
label define P336L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ersend2  P337L;  
label define P337L   
	-1          "Not in universe"               
	1           "On layoff"                     
	2           "Retirement or old age"         
	3           "Childcare problems"            
	4           "Other family/personal"         
	5           "Own illness"                   
	6           "Own injury"                    
	7           "School/training"               
	8           "Discharged/fired"              
	9           "Employer bankrupt"             
	10          "Employer, sold business"       
	11          "Job was temporary and ended"   
	12          "Quit to take another job"      
	13          "Slack work or business"        
	14          "Unsatisfactory work arrangements"
	15          "Quit for some other reason"    
;
label values arsend2  P338L;  
label define P338L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ejbhrs2  P339L;  
label define P339L   
	-1          "Not in universe"               
;
label values ajbhrs2  P340L;  
label define P340L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eemploc2 P341L;  
label define P341L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aemploc2 P342L;  
label define P342L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tempall2 P343L;  
label define P343L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25 to 99 employees"            
	3           "100+ employees"                
;
label values aempall2 P344L;  
label define P344L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tempsiz2 P345L;  
label define P345L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25 to 99 employees"            
	3           "100+ employees"                
;
label values aempsiz2 P346L;  
label define P346L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eclwrk2  P347L;  
label define P347L   
	-1          "Not in universe"               
	1           "Private for profit employee"   
	2           "Private not for profit employee"
	3           "Local government worker"       
	4           "State government worker"       
	5           "Federal government worker"     
	6           "Family worker without pay"     
;
label values aclwrk2  P348L;  
label define P348L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eunion2  P349L;  
label define P349L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aunion2  P350L;  
label define P350L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ecntrc2  P351L;  
label define P351L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acntrc2  P352L;  
label define P352L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values apmsum2  P353L;  
label define P353L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values epayhr2  P354L;  
label define P354L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apayhr2  P355L;  
label define P355L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values apyrate2 P356L;  
label define P356L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values rpyper2  P357L;  
label define P357L   
	-1          "Not in universe"               
	1           "Once a week"                   
	2           "Once every two weeks"          
	3           "Once a month"                  
	4           "Twice a month"                 
	5           "Unpaid in a family business or"
	6           "On commission"                 
	7           "Some other way"                
	8           "Not reported"                  
;
label values ajbind2  P358L;  
label define P358L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ajbocc2  P359L;  
label define P359L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ebno1    P360L;  
label define P360L   
	-1          "Not in universe"               
;
label values ebiznow1 P361L;  
label define P361L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abiznow1 P362L;  
label define P362L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tsbdate1 P363L;  
label define P363L   
	-1          "Not in universe"               
;
label values asbdate1 P364L;  
label define P364L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tebdate1 P365L;  
label define P365L   
	-1          "Not in universe"               
;
label values aebdate1 P366L;  
label define P366L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values erendb1  P367L;  
label define P367L   
	-1          "Not in universe"               
	1           "Retirement or old age"         
	2           "Childcare problems"            
	3           "Other family/personal problems"
	4           "Own illness"                   
	5           "Own injury"                    
	6           "School/training"               
	7           "Went bankrupt/business failed" 
	8           "Sold business or transferred"  
	9           "To start other business/take job"
	10          "Season ended for a seasonal"   
	11          "Quit for some other reason"    
;
label values arendb1  P368L;  
label define P368L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ehrsbs1  P369L;  
label define P369L   
	-1          "Not in universe"               
;
label values ahrsbs1  P370L;  
label define P370L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values egrosb1  P371L;  
label define P371L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrosb1  P372L;  
label define P372L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values egrssb1  P373L;  
label define P373L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrssb1  P374L;  
label define P374L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tempb1   P375L;  
label define P375L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25:99 employees"               
	3           "100+ employees"                
;
label values aempb1   P376L;  
label define P376L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eincpb1  P377L;  
label define P377L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aincpb1  P378L;  
label define P378L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values epropb1  P379L;  
label define P379L   
	-1          "Not in universe"               
	1           "alone"                         
	2           "partnership"                   
;
label values apropb1  P380L;  
label define P380L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ehprtb1  P381L;  
label define P381L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahprtb1  P382L;  
label define P382L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eslryb1  P383L;  
label define P383L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aslryb1  P384L;  
label define P384L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eoincb1  P385L;  
label define P385L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aoincb1  P386L;  
label define P386L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values aprftb1  P387L;  
label define P387L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values abmsum1  P388L;  
label define P388L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values epartb11 P389L;  
label define P389L   
	-1          "Not in universe"               
	9999        "Unable to identify person # of"
;
label values epartb21 P390L;  
label define P390L   
	-1          "Not in universe"               
	9999        "Unable to identify person # of"
;
label values epartb31 P391L;  
label define P391L   
	-1          "Not in universe"               
	9999        "Unable to identify person # of"
;
label values tbsind1  P392L;  
label define P392L   
	-1          "Not in universe"               
	1           "Agriculture, forestry and"     
	2           "Mining"                        
	3           "Construction"                  
	4           "Manufacturing: nondurable goods"
	5           "Manufacturing: durable goods"  
	6           "Transportation, communications"
	7           "Wholesale Trade: durable goods"
	8           "Wholesale trade: nondurable"   
	9           "Retail trade"                  
	10          "Finance, insurance and real"   
	11          "Business and repair services"  
	12          "Personal services"             
	13          "Entertainment and recreation"  
	14          "Professional and related"      
	15          "Public administration"         
;
label values absind1  P393L;  
label define P393L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values absocc1  P394L;  
label define P394L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ebno2    P395L;  
label define P395L   
	-1          "Not in universe"               
;
label values ebiznow2 P396L;  
label define P396L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abiznow2 P397L;  
label define P397L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tsbdate2 P398L;  
label define P398L   
	-1          "Not in universe"               
;
label values asbdate2 P399L;  
label define P399L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tebdate2 P400L;  
label define P400L   
	-1          "Not in universe"               
;
label values aebdate2 P401L;  
label define P401L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values erendb2  P402L;  
label define P402L   
	-1          "Not in universe"               
	1           "Retirement or old age"         
	2           "Childcare problems"            
	3           "Other family/personal problems"
	4           "Own illness"                   
	5           "Own injury"                    
	6           "School/training"               
	7           "Went bankrupt/business failed" 
	8           "Sold business or transferred"  
	9           "To start other business/take job"
	10          "Season ended for a seasonal"   
	11          "Quit for some other reason"    
;
label values arendb2  P403L;  
label define P403L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ehrsbs2  P404L;  
label define P404L   
	-1          "Not in universe"               
;
label values ahrsbs2  P405L;  
label define P405L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values egrosb2  P406L;  
label define P406L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrosb2  P407L;  
label define P407L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values egrssb2  P408L;  
label define P408L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrssb2  P409L;  
label define P409L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values tempb2   P410L;  
label define P410L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25:99 employees"               
	3           "100+ employees"                
;
label values aempb2   P411L;  
label define P411L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eincpb2  P412L;  
label define P412L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aincpb2  P413L;  
label define P413L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values epropb2  P414L;  
label define P414L   
	-1          "Not in universe"               
	1           "alone"                         
	2           "partnership"                   
;
label values apropb2  P415L;  
label define P415L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values ehprtb2  P416L;  
label define P416L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahprtb2  P417L;  
label define P417L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eslryb2  P418L;  
label define P418L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aslryb2  P419L;  
label define P419L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values eoincb2  P420L;  
label define P420L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aoincb2  P421L;  
label define P421L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values aprftb2  P422L;  
label define P422L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values abmsum2  P423L;  
label define P423L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values epartb12 P424L;  
label define P424L   
	-1          "Not in universe"               
	9999        "Unable to identify person # of"
;
label values epartb22 P425L;  
label define P425L   
	-1          "Not in universe"               
	9999        "Unable to identify person # of"
;
label values epartb32 P426L;  
label define P426L   
	-1          "Not in universe"               
	9999        "Unable to identify person # of"
;
label values tbsind2  P427L;  
label define P427L   
	-1          "Not in universe"               
	1           "Agriculture, forestry and"     
	2           "Mining"                        
	3           "Construction"                  
	4           "Manufacturing: nondurable goods"
	5           "Manufacturing: durable goods"  
	6           "Transportation, communications"
	7           "Wholesale Trade: durable goods"
	8           "Wholesale trade: nondurable"   
	9           "Retail trade"                  
	10          "Finance, insurance and real"   
	11          "Business and repair services"  
	12          "Personal services"             
	13          "Entertainment and recreation"  
	14          "Professional and related"      
	15          "Public administration"         
;
label values absind2  P428L;  
label define P428L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values absocc2  P429L;  
label define P429L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
	4           "Statistical or logical"        
;
label values euectyp5 P430L;  
label define P430L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values auectyp5 P431L;  
label define P431L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values euectyp7 P432L;  
label define P432L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values auectyp7 P433L;  
label define P433L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values elmptyp1 P434L;  
label define P434L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values almptyp1 P435L;  
label define P435L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values elmptyp2 P436L;  
label define P436L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values almptyp2 P437L;  
label define P437L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values elmptyp3 P438L;  
label define P438L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values almptyp3 P439L;  
label define P439L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values essself  P440L;  
label define P440L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values assself  P441L;  
label define P441L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esschild P442L;  
label define P442L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asschild P443L;  
label define P443L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values essichld P444L;  
label define P444L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values assichld P445L;  
label define P445L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values essiself P446L;  
label define P446L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values assiself P447L;  
label define P447L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values estssi   P448L;  
label define P448L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values astssi   P449L;  
label define P449L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rwcmprsn P450L;  
label define P450L   
	-1          "Not in universe"               
	1           "Disability"                    
	3           "Survivor"                      
	5           "Disability and Survivor"       
	8           "No payment"                    
;
label values awcmprsn P451L;  
label define P451L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rinsrsn  P452L;  
label define P452L   
	-1          "Not in universe"               
	1           "Disability"                    
	8           "No payment received"           
;
label values ainsrsn  P453L;  
label define P453L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rempdrsn P454L;  
label define P454L   
	-1          "Not in universe"               
	1           "Disability"                    
	8           "No payment"                    
;
label values aempdrsn P455L;  
label define P455L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rpensrsn P456L;  
label define P456L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values apensrsn P457L;  
label define P457L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rfcsrsn  P458L;  
label define P458L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values afcsrsn  P459L;  
label define P459L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rstatrsn P460L;  
label define P460L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values astatrsn P461L;  
label define P461L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rlgovrsn P462L;  
label define P462L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values algovrsn P463L;  
label define P463L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rmilrsn  P464L;  
label define P464L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values amilrsn  P465L;  
label define P465L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rrrsn    P466L;  
label define P466L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values arrrsn   P467L;  
label define P467L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rblklrsn P468L;  
label define P468L   
	-1          "Not in universe"               
	1           "Disability"                    
	3           "Survivor"                      
	5           "Disability and survivor"       
	8           "No payment received"           
;
label values ablklrsn P469L;  
label define P469L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rothrrsn P470L;  
label define P470L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survivor"                      
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values aothrrsn P471L;  
label define P471L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rlifirsn P472L;  
label define P472L   
	-1          "Not in universe"               
	2           "Retirement"                    
	3           "Survivor"                      
	6           "Retirement and survivor"       
	8           "No payment received"           
;
label values alifirsn P473L;  
label define P473L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rvetsrsn P474L;  
label define P474L   
	-1          "Not in universe"               
	3           "Survivor"                      
	8           "No payment received"           
;
label values avetsrsn P475L;  
label define P475L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values restarsn P476L;  
label define P476L   
	-1          "Not in universe"               
	3           "Survivor"                      
	8           "No payment received"           
;
label values aestarsn P477L;  
label define P477L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values efccyn   P478L;  
label define P478L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afccyn   P479L;  
label define P479L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ecsagree P480L;  
label define P480L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acsagree P481L;  
label define P481L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ecsyn    P482L;  
label define P482L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acsyn    P483L;  
label define P483L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ealiyn   P484L;  
label define P484L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aaliyn   P485L;  
label define P485L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values efsyn    P486L;  
label define P486L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afsyn    P487L;  
label define P487L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epssthru P488L;  
label define P488L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apssthru P489L;  
label define P489L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ewicyn   P490L;  
label define P490L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values awicyn   P491L;  
label define P491L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epatyn   P492L;  
label define P492L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyn   P493L;  
label define P493L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epatyp1  P494L;  
label define P494L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp1  P495L;  
label define P495L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epatyp2  P496L;  
label define P496L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp2  P497L;  
label define P497L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epatyp3  P498L;  
label define P498L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp3  P499L;  
label define P499L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values epatyp4  P500L;  
label define P500L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp4  P501L;  
label define P501L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values easetdrw P502L;  
label define P502L   
	-1          "Not in universe"               
	1           "Lump Sum"                      
	2           "Regular distribution"          
	3           "Both"                          
	4           "No"                            
;
label values aasetdrw P503L;  
label define P503L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ejntssyn P504L;  
label define P504L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ajntssyn P505L;  
label define P505L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er01a    P506L;  
label define P506L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar01a    P507L;  
label define P507L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er01k    P508L;  
label define P508L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar01k    P509L;  
label define P509L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er02     P510L;  
label define P510L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar02     P511L;  
label define P511L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er03a    P512L;  
label define P512L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar03a    P513L;  
label define P513L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er03k    P514L;  
label define P514L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar03k    P515L;  
label define P515L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er04     P516L;  
label define P516L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar04     P517L;  
label define P517L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er05     P518L;  
label define P518L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar05     P519L;  
label define P519L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er07     P520L;  
label define P520L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar07     P521L;  
label define P521L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er08     P522L;  
label define P522L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar08     P523L;  
label define P523L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er09     P524L;  
label define P524L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar09     P525L;  
label define P525L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er10     P526L;  
label define P526L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar10     P527L;  
label define P527L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er12     P528L;  
label define P528L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar12     P529L;  
label define P529L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er13     P530L;  
label define P530L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar13     P531L;  
label define P531L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er14     P532L;  
label define P532L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar14     P533L;  
label define P533L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er15     P534L;  
label define P534L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar15     P535L;  
label define P535L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er20     P536L;  
label define P536L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar20     P537L;  
label define P537L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er21     P538L;  
label define P538L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar21     P539L;  
label define P539L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er23     P540L;  
label define P540L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar23     P541L;  
label define P541L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er24     P542L;  
label define P542L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar24     P543L;  
label define P543L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er25     P544L;  
label define P544L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar25     P545L;  
label define P545L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er26     P546L;  
label define P546L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar26     P547L;  
label define P547L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er27     P548L;  
label define P548L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar27     P549L;  
label define P549L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er28     P550L;  
label define P550L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar28     P551L;  
label define P551L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er29     P552L;  
label define P552L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar29     P553L;  
label define P553L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er30     P554L;  
label define P554L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar30     P555L;  
label define P555L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er31     P556L;  
label define P556L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar31     P557L;  
label define P557L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er32     P558L;  
label define P558L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar32     P559L;  
label define P559L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er34     P560L;  
label define P560L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar34     P561L;  
label define P561L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er35     P562L;  
label define P562L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar35     P563L;  
label define P563L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er36     P564L;  
label define P564L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar36     P565L;  
label define P565L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er37     P566L;  
label define P566L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar37     P567L;  
label define P567L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er38     P568L;  
label define P568L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar38     P569L;  
label define P569L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er39     P570L;  
label define P570L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar39     P571L;  
label define P571L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er42     P572L;  
label define P572L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar42     P573L;  
label define P573L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er50     P574L;  
label define P574L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar50     P575L;  
label define P575L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er51     P576L;  
label define P576L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar51     P577L;  
label define P577L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er52     P578L;  
label define P578L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar52     P579L;  
label define P579L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er53     P580L;  
label define P580L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar53     P581L;  
label define P581L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er55     P582L;  
label define P582L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar55     P583L;  
label define P583L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er56     P584L;  
label define P584L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar56     P585L;  
label define P585L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values er75     P586L;  
label define P586L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ar75     P587L;  
label define P587L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a01amta  P588L;  
label define P588L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a01amtk  P589L;  
label define P589L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a02amt   P590L;  
label define P590L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a03amta  P591L;  
label define P591L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a03amtk  P592L;  
label define P592L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a04amt   P593L;  
label define P593L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a05amt   P594L;  
label define P594L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a07amt   P595L;  
label define P595L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a08amt   P596L;  
label define P596L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a09amt   P597L;  
label define P597L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a10amt   P598L;  
label define P598L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a12amt   P599L;  
label define P599L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a13amt   P600L;  
label define P600L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a14amt   P601L;  
label define P601L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a15amt   P602L;  
label define P602L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a20amt   P603L;  
label define P603L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a21amt   P604L;  
label define P604L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a23amt   P605L;  
label define P605L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a24amt   P606L;  
label define P606L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a25amt   P607L;  
label define P607L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a26amt   P608L;  
label define P608L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a27amt   P609L;  
label define P609L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a28amt   P610L;  
label define P610L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a29amt   P611L;  
label define P611L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a30amt   P612L;  
label define P612L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a31amt   P613L;  
label define P613L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a32amt   P614L;  
label define P614L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a34amt   P615L;  
label define P615L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a35amt   P616L;  
label define P616L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a36amt   P617L;  
label define P617L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a37amt   P618L;  
label define P618L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a38amt   P619L;  
label define P619L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a39amt   P620L;  
label define P620L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a42amt   P621L;  
label define P621L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a50amt   P622L;  
label define P622L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a51amt   P623L;  
label define P623L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a52amt   P624L;  
label define P624L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a53amt   P625L;  
label define P625L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a55amt   P626L;  
label define P626L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a56amt   P627L;  
label define P627L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values a75amt   P628L;  
label define P628L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values acsagy   P629L;  
label define P629L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values erolovr1 P630L;  
label define P630L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values arolovr1 P631L;  
label define P631L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values erolovr2 P632L;  
label define P632L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values arolovr2 P633L;  
label define P633L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values arollamt P634L;  
label define P634L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rab1r1   P635L;  
label define P635L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rab1r2   P636L;  
label define P636L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rab2r1   P637L;  
label define P637L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rab2r2   P638L;  
label define P638L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values ras1     P639L;  
label define P639L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values ras2     P640L;  
label define P640L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rwb1r1   P641L;  
label define P641L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rwb1r2   P642L;  
label define P642L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rwb2r1   P643L;  
label define P643L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rwb2r2   P644L;  
label define P644L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rws1     P645L;  
label define P645L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rws2     P646L;  
label define P646L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rfb1r1   P647L;  
label define P647L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rfb1r2   P648L;  
label define P648L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rfb2r1   P649L;  
label define P649L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rfb2r2   P650L;  
label define P650L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rfs1     P651L;  
label define P651L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rfs2     P652L;  
label define P652L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rgb1r1   P653L;  
label define P653L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rgb1r2   P654L;  
label define P654L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rgb2r1   P655L;  
label define P655L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rgb2r2   P656L;  
label define P656L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rgs1     P657L;  
label define P657L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rgs2     P658L;  
label define P658L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rob1r1   P659L;  
label define P659L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rob1r2   P660L;  
label define P660L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rob2r1   P661L;  
label define P661L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values rob2r2   P662L;  
label define P662L   
	-1          "Not in universe"               
	2           "Pregnancy/birth of child"      
	3           "Began receiving for another"   
	4           "Separated or divorced from"    
	5           "Loss of job/wages/other income"
	6           "Loss of other support income"  
	7           "Just learned about program"    
	8           "Just got around to applying"   
	9           "Became disabled"               
	10          "Other, specify"                
;
label values ros1     P663L;  
label define P663L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values ros2     P664L;  
label define P664L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rsb1r1   P665L;  
label define P665L   
	-1          "Not in universe"               
	2           "Became disabled/blind"         
	3           "Over 65"                       
	4           "Other, specify"                
;
label values rsb1r2   P666L;  
label define P666L   
	-1          "Not in universe"               
	2           "Became disabled/blind"         
	3           "Over 65"                       
	4           "Other, specify"                
;
label values rsb2r1   P667L;  
label define P667L   
	-1          "Not in universe"               
	2           "Became disabled/blind"         
	3           "Over 65"                       
	4           "Other, specify"                
;
label values rsb2r2   P668L;  
label define P668L   
	-1          "Not in universe"               
	2           "Became disabled/blind"         
	3           "Over 65"                       
	4           "Other, specify"                
;
label values rss1     P669L;  
label define P669L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values rss2     P670L;  
label define P670L   
	-1          "Not in Universe"               
	1           "Became ineligible because of"  
	2           "Because of family changes"     
	3           "Still eligible but could/chose"
	4           "Became Ineligible because"     
	5           "Eligibility ran out because of"
	6           "Other, specify"                
;
label values east1a   P671L;  
label define P671L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast1a   P672L;  
label define P672L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east1b   P673L;  
label define P673L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast1b   P674L;  
label define P674L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east1c   P675L;  
label define P675L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast1c   P676L;  
label define P676L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east2a   P677L;  
label define P677L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2a   P678L;  
label define P678L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east2b   P679L;  
label define P679L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2b   P680L;  
label define P680L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east2c   P681L;  
label define P681L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2c   P682L;  
label define P682L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east2d   P683L;  
label define P683L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2d   P684L;  
label define P684L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east3a   P685L;  
label define P685L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3a   P686L;  
label define P686L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east3b   P687L;  
label define P687L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3b   P688L;  
label define P688L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east3c   P689L;  
label define P689L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3c   P690L;  
label define P690L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east3d   P691L;  
label define P691L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3d   P692L;  
label define P692L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east3e   P693L;  
label define P693L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3e   P694L;  
label define P694L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east4a   P695L;  
label define P695L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast4a   P696L;  
label define P696L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east4b   P697L;  
label define P697L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast4b   P698L;  
label define P698L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values east4c   P699L;  
label define P699L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast4c   P700L;  
label define P700L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ejntrnt  P701L;  
label define P701L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ajntrnt  P702L;  
label define P702L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ajarnt   P703L;  
label define P703L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ajaclr   P704L;  
label define P704L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eownrnt  P705L;  
label define P705L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aownrnt  P706L;  
label define P706L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values aoarnt   P707L;  
label define P707L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values aoaclr   P708L;  
label define P708L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ejrnt2   P709L;  
label define P709L   
	-1          "Not universe"                  
	1           "Yes"                           
	2           "No"                            
;
label values ajrnt2   P710L;  
label define P710L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ajaclr2  P711L;  
label define P711L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values emrtjnt  P712L;  
label define P712L   
	-1          "Not universe"                  
	1           "Yes"                           
	2           "No"                            
;
label values amrtjnt  P713L;  
label define P713L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amijnt   P714L;  
label define P714L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values emrtown  P715L;  
label define P715L   
	-1          "Not universe"                  
	1           "Yes"                           
	2           "No"                            
;
label values amrtown  P716L;  
label define P716L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amiown   P717L;  
label define P717L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values arndup1  P718L;  
label define P718L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values arndup2  P719L;  
label define P719L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eckjt    P720L;  
label define P720L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ackjt    P721L;  
label define P721L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ackjtint P722L;  
label define P722L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values eckoast  P723L;  
label define P723L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ackoast  P724L;  
label define P724L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ackoint  P725L;  
label define P725L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esvjt    P726L;  
label define P726L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asvjt    P727L;  
label define P727L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values asvjtint P728L;  
label define P728L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esvoast  P729L;  
label define P729L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asvoast  P730L;  
label define P730L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values asvoint  P731L;  
label define P731L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values emdjt    P732L;  
label define P732L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amdjt    P733L;  
label define P733L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amdjtint P734L;  
label define P734L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values emdoast  P735L;  
label define P735L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amdoast  P736L;  
label define P736L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amdoint  P737L;  
label define P737L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ecdjt    P738L;  
label define P738L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acdjt    P739L;  
label define P739L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values acdjtint P740L;  
label define P740L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ecdoast  P741L;  
label define P741L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acdoast  P742L;  
label define P742L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values acdoint  P743L;  
label define P743L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ebdjt    P744L;  
label define P744L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abdjt    P745L;  
label define P745L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values abdjtint P746L;  
label define P746L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ebdoast  P747L;  
label define P747L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abdoast  P748L;  
label define P748L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values abdoint  P749L;  
label define P749L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values egvjt    P750L;  
label define P750L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agvjt    P751L;  
label define P751L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values agvjtint P752L;  
label define P752L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values egvoast  P753L;  
label define P753L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agvoast  P754L;  
label define P754L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values agvoint  P755L;  
label define P755L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values emanychk P756L;  
label define P756L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amanychk P757L;  
label define P757L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amjntdiv P758L;  
label define P758L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amowndiv P759L;  
label define P759L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values emothdiv P760L;  
label define P760L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amothdiv P761L;  
label define P761L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amjadiv  P762L;  
label define P762L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values amownadv P763L;  
label define P763L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esanychk P764L;  
label define P764L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asanychk P765L;  
label define P765L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values asjntdiv P766L;  
label define P766L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values asowndiv P767L;  
label define P767L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values esothdiv P768L;  
label define P768L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asothdiv P769L;  
label define P769L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values asjadiv  P770L;  
label define P770L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values asownadv P771L;  
label define P771L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ecrmth   P772L;  
label define P772L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values acrmth   P773L;  
label define P773L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rmedcode P774L;  
label define P774L   
	-1          "Not in universe"               
	1           "Retired or disabled worker"    
	2           "Spouse of retired or disabled" 
	3           "Widow of retired or disabled"  
	4           "Adult disabled as a child"     
	5           "Uninsured"                     
	7           "Other or invalid code"         
	9           "Missing code"                  
;
label values ecdmth   P775L;  
label define P775L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values acdmth   P776L;  
label define P776L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ecdunt1  P777L;  
label define P777L   
	-1          "Not in universe"               
;
label values ecdunt2  P778L;  
label define P778L   
	-1          "Not in universe"               
;
label values ecdunt3  P779L;  
label define P779L   
	-1          "Not in universe"               
;
label values ehimth   P780L;  
label define P780L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahimth   P781L;  
label define P781L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehiowner P782L;  
label define P782L   
	1           "Covered in own name"           
	2           "Covered by someone else's plan"
	3           "Covered both in own name and by"
	4           "Not covered"                   
;
label values ahiowner P783L;  
label define P783L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values enonhh   P784L;  
label define P784L   
	1           "Yes"                           
	2           "No"                            
;
label values rchampm  P785L;  
label define P785L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No"                            
;
label values ehiunt1  P786L;  
label define P786L   
	-1          "Not in universe"               
;
label values ehiunt2  P787L;  
label define P787L   
	-1          "Not in universe"               
;
label values ehiunt3  P788L;  
label define P788L   
	-1          "Not in universe"               
;
label values ehemply  P789L;  
label define P789L   
	-1          "Not in universe"               
	1           "Current employer or work"      
	2           "Former employer"               
	3           "Union"                         
	4           "CHAMPUS"                       
	5           "CHAMPVA"                       
	6           "Military/VA health care"       
	7           "Privately purchased"           
	8           "Other"                         
;
label values ahemply  P790L;  
label define P790L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehicost  P791L;  
label define P791L   
	-1          "Not in universe"               
	1           "All"                           
	2           "Part"                          
	3           "None"                          
;
label values ahicost  P792L;  
label define P792L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehiother P793L;  
label define P793L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahiother P794L;  
label define P794L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehispse  P795L;  
label define P795L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahispse  P796L;  
label define P796L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehioldkd P797L;  
label define P797L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahioldkd P798L;  
label define P798L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehiyngkd P799L;  
label define P799L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahiyngkd P800L;  
label define P800L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehiothr  P801L;  
label define P801L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahiothr  P802L;  
label define P802L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values ehirsn01 P803L;  
label define P803L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn02 P804L;  
label define P804L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn03 P805L;  
label define P805L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn04 P806L;  
label define P806L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn05 P807L;  
label define P807L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn06 P808L;  
label define P808L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn07 P809L;  
label define P809L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn08 P810L;  
label define P810L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn09 P811L;  
label define P811L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn10 P812L;  
label define P812L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn11 P813L;  
label define P813L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn12 P814L;  
label define P814L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahirsn   P815L;  
label define P815L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
	4           "Statistical or logical"        
;
label values rprvhi   P816L;  
label define P816L   
	-1          "Not in universe"               
	1           "Employer or union provided"    
	2           "Privately purchased"           
;

