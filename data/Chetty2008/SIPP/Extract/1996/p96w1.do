log using sip96w1d, replace
*This program reads the 1996 SIPP Wave 1 Core Data File
*by Jean Roth Mon Mar 25 12:42:30 EST 2002

*Please report errors to jroth@nber.org
*E-mail jroth@nber.org to be notfied of updates
*run with do sip96w1d
*Change output file name/location as desired in the first line of the .dct file
*If you are using a PC, you may need to change the direction of the slashes, as in C:\
* The following changes in variable names have been made, if necessary:
*      '$' to 'd';            '-' to '_';              '%' to 'p';
*      ($ = unedited data;     - = edited data;         % = allocated data)
* Note:  Variable names in Stata are case-sensitive
clear
quietly infile using p96w1

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
label values eoutcome P104L;  
label define P104L   
	201         "Completed interview"           
	203         "Compl. parital- missing data; no"
	207         "Complete parital - Type Z's; No"
;
label values rhtype   P105L;  
label define P105L   
	1           "Family hh - Married couple"    
	2           "Family hh - Male householder"  
	3           "Family hh - Female householder"
	4           "Nonfamily hh - Male hhlder"    
	5           "Nonfamily hh - Female hhlder"  
	6           "Group Quarters"                
;
label values tmetro   P106L;  
label define P106L   
	1           "Metro"                         
	2           "Residual"                      
;
label values rhchange P107L;  
label define P107L   
	1           "Change occurred"               
	2           "No change occurred"            
;
label values eaccess  P108L;  
label define P108L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aaccess  P109L;  
label define P109L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eunits   P110L;  
label define P110L   
	1           "One, detached"                 
	2           "One, attached"                 
	3           "Two"                           
	4           "3:4"                           
	5           "5-9"                           
	6           "10-19"                         
	7           "20-49"                         
	8           "50 or more"                    
;
label values aunits   P111L;  
label define P111L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values elivqrt  P112L;  
label define P112L   
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
label values alivqrt  P113L;  
label define P113L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical Imputation (Derivation)"
;
label values etenure  P114L;  
label define P114L   
	1           "Owned or being bought by you or"
	2           "Rented for cash"               
	3           "Occupied without payment of cash"
;
label values atenure  P115L;  
label define P115L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epubhse  P116L;  
label define P116L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apubhse  P117L;  
label define P117L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values egvtrnt  P118L;  
label define P118L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agvtrnt  P119L;  
label define P119L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amthrnt  P120L;  
label define P120L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eutilyn  P121L;  
label define P121L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values autilyn  P122L;  
label define P122L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eegyast  P123L;  
label define P123L   
	1           "Yes"                           
	2           "No"                            
;
label values aegyast  P124L;  
label define P124L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eegypmt1 P125L;  
label define P125L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values eegypmt2 P126L;  
label define P126L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values eegypmt3 P127L;  
label define P127L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aegypmt  P128L;  
label define P128L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values aegyamt  P129L;  
label define P129L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehotlunc P130L;  
label define P130L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahotlunc P131L;  
label define P131L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rnklun   P132L;  
label define P132L   
	-1          "Not in universe"               
;
label values efreelun P133L;  
label define P133L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afreelun P134L;  
label define P134L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values efrerdln P135L;  
label define P135L   
	-1          "Not in universe"               
	1           "Free lunch"                    
	2           "Reduced-price lunch"           
;
label values afrerdln P136L;  
label define P136L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ebrkfst  P137L;  
label define P137L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abrkfst  P138L;  
label define P138L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation"            
;
label values rnkbrk   P139L;  
label define P139L   
	-1          "Not in universe"               
;
label values efreebrk P140L;  
label define P140L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afreebrk P141L;  
label define P141L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values efrerdbk P142L;  
label define P142L   
	-1          "Not in universe"               
	1           "Free breakfast"                
	2           "Reduced-price breakfast"       
;
label values afrerdbk P143L;  
label define P143L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rhnbrf   P144L;  
label define P144L   
	1           "Yes"                           
	2           "No"                            
;
label values rhcbrf   P145L;  
label define P145L   
	1           "Yes"                           
	2           "No"                            
;
label values rhmtrf   P146L;  
label define P146L   
	1           "Yes"                           
	2           "No"                            
;
label values efspouse P147L;  
label define P147L   
	9999        "Persons with EFKIND=2 or 3"    
;
label values eftype   P148L;  
label define P148L   
	1           "Primary family (including those"
	3           "Unrelated Subfamily"           
	4           "Primary Individual"            
	5           "Secondary Individual"          
;
label values rfchange P149L;  
label define P149L   
	1           "Change occurred"               
	2           "No change occurred"            
;
label values efkind   P150L;  
label define P150L   
	1           "Headed by Husband/Wife"        
	2           "Male Headed"                   
	3           "Female Headed"                 
;
label values rsid     P151L;  
label define P151L   
	-1          "Not in universe"               
;
label values esfnp    P152L;  
label define P152L   
	-1          "Not in universe"               
;
label values esfrfper P153L;  
label define P153L   
	-1          "Not in universe"               
;
label values esfspse  P154L;  
label define P154L   
	-1          "Not in universe"               
	9999        "No spouse in subfamily"        
;
label values esftype  P155L;  
label define P155L   
	-1          "Not in universe"               
	2           "Related Subfamily"             
;
label values esfkind  P156L;  
label define P156L   
	-1          "Not in universe"               
	1           "Headed by Husband/Wife"        
	2           "Male Headed"                   
	3           "Female Headed"                 
;
label values rschange P157L;  
label define P157L   
	-1          "Not in universe"               
	1           "Change occurred"               
	2           "No change occurred"            
;
label values esownkid P158L;  
label define P158L   
	-1          "Not in universe"               
;
label values esoklt18 P159L;  
label define P159L   
	-1          "Not in universe"               
;
label values wsfinwgt P160L;  
label define P160L   
	-1          "Not in universe"               
;
label values eppintvw P161L;  
label define P161L   
	1           "Interview (self)"              
	2           "Interview (proxy)"             
	3           "Noninterview - Type Z"         
	4           "Nonintrvw = pseudo Type Z.  Left"
	5           "Children under 15 during"      
;
label values epopstat P162L;  
label define P162L   
	1           "Adult (15 years of age or older)"
	2           "Child (Under 15 years of age)" 
;
label values abmnth   P163L;  
label define P163L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values abyear   P164L;  
label define P164L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esex     P165L;  
label define P165L   
	1           "Male"                          
	2           "Female"                        
;
label values asex     P166L;  
label define P166L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values erace    P167L;  
label define P167L   
	1           "White"                         
	2           "Black"                         
	3           "American Indian, Aleut, or"    
	4           "Asian or Pacific Islander"     
;
label values arace    P168L;  
label define P168L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values aorigin  P169L;  
label define P169L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values uevrwid  P170L;  
label define P170L   
	1           "Yes"                           
	2           "No"                            
	6           "Don't know"                    
	7           "Refused"                       
;
label values uevrdiv  P171L;  
label define P171L   
	1           "Yes"                           
	2           "No"                            
	6           "Don't know"                    
	7           "Refused"                       
;
label values eafnow   P172L;  
label define P172L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aafnow   P173L;  
label define P173L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eafever  P174L;  
label define P174L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aafever  P175L;  
label define P175L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values uaf1     P176L;  
label define P176L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	6           "Don't know"                    
	7           "Refused"                       
;
label values uaf2     P177L;  
label define P177L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values uaf3     P178L;  
label define P178L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values uaf4     P179L;  
label define P179L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values uaf5     P180L;  
label define P180L   
	1           "August 1990 to present"        
	2           "September 1980 to July 1990"   
	3           "May 1975 to Ausust 1980"       
	4           "Vietnam Era (Aug '64 - April"  
	5           "Other service  (All other"     
	8           "No other periods of service"   
;
label values evayn    P181L;  
label define P181L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values avayn    P182L;  
label define P182L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values evettyp  P183L;  
label define P183L   
	-1          "Not in universe"               
	1           "Service-connected disability"  
	2           "Survivor Benefits"             
	3           "Veteran's Pension"             
	4           "Other Veteran's Payments"      
;
label values avettyp  P184L;  
label define P184L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values evaques  P185L;  
label define P185L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values avaques  P186L;  
label define P186L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eafsrvdi P187L;  
label define P187L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aafsrvdi P188L;  
label define P188L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esfr     P189L;  
label define P189L   
	1           "Reference person of a rel. or" 
	2           "Spouse of reference person of a"
	3           "Child (under 18) of reference" 
;
label values esft     P190L;  
label define P190L   
	1           "Secondary indiv (not a family" 
	2           "Unrelated subfamily"           
	3           "Related subfamily"             
	4           "Primary individual"            
;
label values aage     P191L;  
label define P191L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values errp     P192L;  
label define P192L   
	1           "Reference person w/ rel. persons"
	2           "Reference Person w/out rel."   
	3           "Spouse of reference person"    
	4           "Child of reference person"     
	5           "Grandchild of reference person"
	6           "Parent of reference person"    
	7           "Brother/Sister of reference"   
	8           "Other relative of reference"   
	9           "Foster child of reference person"
	10          "Unmarried Partner of reference"
	11          "Housemate/Roommate"            
	12          "Roomer/Boarder"                
	13          "Other Non-relative of reference"
;
label values arrp     P193L;  
label define P193L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ems      P194L;  
label define P194L   
	1           "Married, spouse present"       
	2           "Married, Spouse absent"        
	3           "Widowed"                       
	4           "Divorced"                      
	5           "Separated"                     
	6           "Never Married"                 
;
label values ams      P195L;  
label define P195L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epnspous P196L;  
label define P196L   
	9999        "Spouse not in hhld or person not"
;
label values apnspous P197L;  
label define P197L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epnmom   P198L;  
label define P198L   
	9999        "No mother in household"        
;
label values apnmom   P199L;  
label define P199L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epndad   P200L;  
label define P200L   
	9999        "No father in household"        
;
label values apndad   P201L;  
label define P201L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epnguard P202L;  
label define P202L   
	-1          "Not in universe"               
	9999        "Guardian not in household"     
;
label values apnguard P203L;  
label define P203L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values etypmom  P204L;  
label define P204L   
	-1          "Not in universe"               
	1           "Biological or natural child"   
	2           "Stepchild"                     
	3           "Adopted child"                 
	4           "Foster child"                  
;
label values atypmom  P205L;  
label define P205L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values etypdad  P206L;  
label define P206L   
	-1          "Not in universe"               
	1           "Biological or natural child"   
	2           "Stepchild"                     
	3           "Adopted child"                 
	4           "Foster child"                  
;
label values atypdad  P207L;  
label define P207L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rdesgpnt P208L;  
label define P208L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehtlnyn  P209L;  
label define P209L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahtlnyn  P210L;  
label define P210L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ebkfsyn  P211L;  
label define P211L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abkfsyn  P212L;  
label define P212L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rcutyp01 P213L;  
label define P213L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp03 P214L;  
label define P214L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp04 P215L;  
label define P215L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp08 P216L;  
label define P216L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp20 P217L;  
label define P217L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp21 P218L;  
label define P218L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp23 P219L;  
label define P219L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp24 P220L;  
label define P220L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp25 P221L;  
label define P221L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp27 P222L;  
label define P222L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp57 P223L;  
label define P223L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values rcutyp58 P224L;  
label define P224L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values renroll  P225L;  
label define P225L   
	-1          "Not in universe"               
	1           "Enrolled full-time"            
	2           "Enrolled part-time"            
	3           "Not enrolled"                  
;
label values arenroll P226L;  
label define P226L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eenrlm   P227L;  
label define P227L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aenrlm   P228L;  
label define P228L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values renrlma  P229L;  
label define P229L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values eenlevel P230L;  
label define P230L   
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
label values aenlevel P231L;  
label define P231L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eedfund  P232L;  
label define P232L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aedfund  P233L;  
label define P233L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values easst01  P234L;  
label define P234L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst03  P235L;  
label define P235L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst04  P236L;  
label define P236L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst05  P237L;  
label define P237L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst06  P238L;  
label define P238L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst07  P239L;  
label define P239L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst08  P240L;  
label define P240L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst09  P241L;  
label define P241L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst10  P242L;  
label define P242L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values easst11  P243L;  
label define P243L   
	-1          "Not in universe"               
	1           "Received"                      
	2           "Did not receive"               
;
label values aedasst  P244L;  
label define P244L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eeducate P245L;  
label define P245L   
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
label values aeducate P246L;  
label define P246L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epdjbthn P247L;  
label define P247L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apdjbthn P248L;  
label define P248L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emax     P249L;  
label define P249L   
	-1          "Not in universe"               
;
label values ebuscntr P250L;  
label define P250L   
	-1          "Not in universe"               
;
label values ejobcntr P251L;  
label define P251L   
	-1          "Not in universe"               
;
label values eeveret  P252L;  
label define P252L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aeveret  P253L;  
label define P253L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values edisabl  P254L;  
label define P254L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values adisabl  P255L;  
label define P255L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values edisprev P256L;  
label define P256L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values adisprev P257L;  
label define P257L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ersnowrk P258L;  
label define P258L   
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
label values arsnowrk P259L;  
label define P259L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eawop    P260L;  
label define P260L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aawop    P261L;  
label define P261L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eabre    P262L;  
label define P262L   
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
label values aabre    P263L;  
label define P263L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eptwrk   P264L;  
label define P264L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aptwrk   P265L;  
label define P265L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eptresn  P266L;  
label define P266L   
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
label values aptresn  P267L;  
label define P267L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values elkwrk   P268L;  
label define P268L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values alkwrk   P269L;  
label define P269L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values elayoff  P270L;  
label define P270L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values alayoff  P271L;  
label define P271L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values rtakjob  P272L;  
label define P272L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values rnotake  P273L;  
label define P273L   
	-1          "Not in universe"               
	1           "Waiting for a new job to begin"
	2           "Own temporary illness"         
	3           "School"                        
	4           "Other"                         
;
label values emoonlit P274L;  
label define P274L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amoonlit P275L;  
label define P275L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values amlmsum  P276L;  
label define P276L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ebflag   P277L;  
label define P277L   
	-1          "Not in universe or not"        
	1           "Yes"                           
;
label values ecflag   P278L;  
label define P278L   
	-1          "Not in universe"               
	1           "Yes"                           
;
label values rmesr    P279L;  
label define P279L   
	1           "With a job entire month, worked"
	2           "With a job all month, absent"  
	3           "With job all month, absent from"
	4           "With a job at least 1 but not" 
	5           "With job at least 1 but not all"
	6           "No job all month, on layoff or"
	7           "No job, at least one but not all"
	8           "No job, no time on layoff and no"
;
label values rwkesr1  P280L;  
label define P280L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr2  P281L;  
label define P281L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr3  P282L;  
label define P282L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr4  P283L;  
label define P283L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rwkesr5  P284L;  
label define P284L   
	-1          "Not in universe"               
	1           "With job/bus - working"        
	2           "With job/bus - not on layoff," 
	3           "With job/bus - on layoff, absent"
	4           "No job/bus - looking for work or"
	5           "No job/bus - not looking and not"
;
label values rmwkwjb  P285L;  
label define P285L   
	-1          "Not in universe"               
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks (if applicable)"       
;
label values rmwksab  P286L;  
label define P286L   
	-1          "Not in universe"               
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks (if applicable)"       
;
label values awksab   P287L;  
label define P287L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values rmwklkg  P288L;  
label define P288L   
	-1          "Not in universe"               
	1           "1 week"                        
	2           "2 weeks"                       
	3           "3 weeks"                       
	4           "4 weeks"                       
	5           "5 weeks (if applicable)"       
;
label values awklkg   P289L;  
label define P289L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values rmhrswk  P290L;  
label define P290L   
	-1          "Not in universe"               
	1           "All weeks 35+"                 
	2           "All weeks 1-34 hours"          
	3           "Some weeks 35+ and some weeks" 
	4           "Some weeks 35+, some 1-34 hours,"
	5           "At least 1, but not all, weeks"
	6           "At least 1 week, but not all"  
;
label values rwksperm P291L;  
label define P291L   
	-1          "Not in universe"               
	4           "four weeks"                    
	5           "five weeks"                    
;
label values eeno1    P292L;  
label define P292L   
	-1          "Not in universe"               
;
label values estlemp1 P293L;  
label define P293L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values astlemp1 P294L;  
label define P294L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tsjdate1 P295L;  
label define P295L   
	-1          "Not in universe"               
;
label values asjdate1 P296L;  
label define P296L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tejdate1 P297L;  
label define P297L   
	-1          "Not in universe"               
;
label values aejdate1 P298L;  
label define P298L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ersend1  P299L;  
label define P299L   
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
label values arsend1  P300L;  
label define P300L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ejbhrs1  P301L;  
label define P301L   
	-1          "Not in universe"               
;
label values ajbhrs1  P302L;  
label define P302L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eemploc1 P303L;  
label define P303L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aemploc1 P304L;  
label define P304L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tempall1 P305L;  
label define P305L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25 to 99 employees"            
	3           "100+ employees"                
;
label values aempall1 P306L;  
label define P306L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tempsiz1 P307L;  
label define P307L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25 to 99 employees"            
	3           "100+ employees"                
;
label values aempsiz1 P308L;  
label define P308L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eocctim1 P309L;  
label define P309L   
	-1          "Not in universe"               
;
label values aocctim1 P310L;  
label define P310L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eclwrk1  P311L;  
label define P311L   
	-1          "Not in universe"               
	1           "Private for profit employee"   
	2           "Private not for profit employee"
	3           "Local government worker"       
	4           "State government worker"       
	5           "Federal government worker"     
	6           "Family worker without pay"     
;
label values aclwrk1  P312L;  
label define P312L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eunion1  P313L;  
label define P313L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aunion1  P314L;  
label define P314L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ecntrc1  P315L;  
label define P315L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acntrc1  P316L;  
label define P316L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values apmsum1  P317L;  
label define P317L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epayhr1  P318L;  
label define P318L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apayhr1  P319L;  
label define P319L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values apyrate1 P320L;  
label define P320L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values rpyper1  P321L;  
label define P321L   
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
label values ajbind1  P322L;  
label define P322L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ajbocc1  P323L;  
label define P323L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eeno2    P324L;  
label define P324L   
	-1          "Not in universe"               
;
label values estlemp2 P325L;  
label define P325L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values astlemp2 P326L;  
label define P326L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tsjdate2 P327L;  
label define P327L   
	-1          "Not in universe"               
;
label values asjdate2 P328L;  
label define P328L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tejdate2 P329L;  
label define P329L   
	-1          "Not in universe"               
;
label values aejdate2 P330L;  
label define P330L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ersend2  P331L;  
label define P331L   
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
label values arsend2  P332L;  
label define P332L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ejbhrs2  P333L;  
label define P333L   
	-1          "Not in universe"               
;
label values ajbhrs2  P334L;  
label define P334L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eclwrk2  P335L;  
label define P335L   
	-1          "Not in universe"               
	1           "Private for profit employee"   
	2           "Private not for profit employee"
	3           "Local government worker"       
	4           "State government worker"       
	5           "Federal government worker"     
	6           "Family worker without pay"     
;
label values aclwrk2  P336L;  
label define P336L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eunion2  P337L;  
label define P337L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aunion2  P338L;  
label define P338L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ecntrc2  P339L;  
label define P339L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acntrc2  P340L;  
label define P340L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values apmsum2  P341L;  
label define P341L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epayhr2  P342L;  
label define P342L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apayhr2  P343L;  
label define P343L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values apyrate2 P344L;  
label define P344L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values rpyper2  P345L;  
label define P345L   
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
label values ajbind2  P346L;  
label define P346L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ajbocc2  P347L;  
label define P347L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ebno1    P348L;  
label define P348L   
	-1          "Not in universe"               
;
label values ebiznow1 P349L;  
label define P349L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abiznow1 P350L;  
label define P350L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tsbdate1 P351L;  
label define P351L   
	-1          "Not in universe"               
;
label values asbdate1 P352L;  
label define P352L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tebdate1 P353L;  
label define P353L   
	-1          "Not in universe"               
;
label values aebdate1 P354L;  
label define P354L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values erendb1  P355L;  
label define P355L   
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
label values arendb1  P356L;  
label define P356L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ehrsbs1  P357L;  
label define P357L   
	-1          "Not in universe"               
;
label values ahrsbs1  P358L;  
label define P358L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values egrosb1  P359L;  
label define P359L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrosb1  P360L;  
label define P360L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values egrssb1  P361L;  
label define P361L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrssb1  P362L;  
label define P362L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tempb1   P363L;  
label define P363L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25:99 employees"               
	3           "100+ employees"                
;
label values aempb1   P364L;  
label define P364L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eincpb1  P365L;  
label define P365L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aincpb1  P366L;  
label define P366L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epropb1  P367L;  
label define P367L   
	-1          "Not in universe"               
	1           "alone"                         
	2           "partnership"                   
;
label values apropb1  P368L;  
label define P368L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ehprtb1  P369L;  
label define P369L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahprtb1  P370L;  
label define P370L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eslryb1  P371L;  
label define P371L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aslryb1  P372L;  
label define P372L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eoincb1  P373L;  
label define P373L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aoincb1  P374L;  
label define P374L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values aprftb1  P375L;  
label define P375L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values abmsum1  P376L;  
label define P376L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epartb11 P377L;  
label define P377L   
	-1          "Not in universe"               
;
label values apartb11 P378L;  
label define P378L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epartb21 P379L;  
label define P379L   
	-1          "Not in universe"               
;
label values apartb21 P380L;  
label define P380L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epartb31 P381L;  
label define P381L   
	-1          "Not in universe"               
;
label values apartb31 P382L;  
label define P382L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tbsind1  P383L;  
label define P383L   
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
label values absind1  P384L;  
label define P384L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values absocc1  P385L;  
label define P385L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ebno2    P386L;  
label define P386L   
	-1          "Not in universe"               
;
label values ebiznow2 P387L;  
label define P387L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abiznow2 P388L;  
label define P388L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tsbdate2 P389L;  
label define P389L   
	-1          "Not in universe"               
;
label values asbdate2 P390L;  
label define P390L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tebdate2 P391L;  
label define P391L   
	-1          "Not in universe"               
;
label values aebdate2 P392L;  
label define P392L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values erendb2  P393L;  
label define P393L   
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
label values arendb2  P394L;  
label define P394L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ehrsbs2  P395L;  
label define P395L   
	-1          "Not in universe"               
;
label values ahrsbs2  P396L;  
label define P396L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values egrosb2  P397L;  
label define P397L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrosb2  P398L;  
label define P398L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values egrssb2  P399L;  
label define P399L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agrssb2  P400L;  
label define P400L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tempb2   P401L;  
label define P401L   
	-1          "Not in universe"               
	1           "Under 25 employees"            
	2           "25:99 employees"               
	3           "100+ employees"                
;
label values aempb2   P402L;  
label define P402L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eincpb2  P403L;  
label define P403L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aincpb2  P404L;  
label define P404L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epropb2  P405L;  
label define P405L   
	-1          "Not in universe"               
	1           "alone"                         
	2           "partnership"                   
;
label values apropb2  P406L;  
label define P406L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values ehprtb2  P407L;  
label define P407L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahprtb2  P408L;  
label define P408L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eslryb2  P409L;  
label define P409L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aslryb2  P410L;  
label define P410L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values eoincb2  P411L;  
label define P411L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aoincb2  P412L;  
label define P412L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values aprftb2  P413L;  
label define P413L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values abmsum2  P414L;  
label define P414L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epartb12 P415L;  
label define P415L   
	-1          "Not in universe"               
;
label values apartb12 P416L;  
label define P416L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epartb22 P417L;  
label define P417L   
	-1          "Not in universe"               
;
label values apartb22 P418L;  
label define P418L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values epartb32 P419L;  
label define P419L   
	-1          "Not in universe"               
;
label values apartb32 P420L;  
label define P420L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values tbsind2  P421L;  
label define P421L   
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
label values absind2  P422L;  
label define P422L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values absocc2  P423L;  
label define P423L   
	1           "Statistical imputation(hot deck)"
	2           "Cold deck imputation"          
	3           "Logical imputation(derivation)"
;
label values euectyp5 P424L;  
label define P424L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values auectyp5 P425L;  
label define P425L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values euectyp7 P426L;  
label define P426L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values auectyp7 P427L;  
label define P427L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values elmptyp1 P428L;  
label define P428L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values almptyp1 P429L;  
label define P429L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values elmptyp2 P430L;  
label define P430L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values almptyp2 P431L;  
label define P431L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values elmptyp3 P432L;  
label define P432L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values almptyp3 P433L;  
label define P433L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values essself  P434L;  
label define P434L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values assself  P435L;  
label define P435L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esschild P436L;  
label define P436L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asschild P437L;  
label define P437L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values essichld P438L;  
label define P438L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values assichld P439L;  
label define P439L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values essiself P440L;  
label define P440L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values assiself P441L;  
label define P441L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values estssi   P442L;  
label define P442L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values astssi   P443L;  
label define P443L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rwcmprsn P444L;  
label define P444L   
	-1          "Not in universe"               
	1           "Disability"                    
	3           "Suvivor"                       
	5           "Disability and Suvivor"        
	8           "No payment"                    
;
label values awcmprsn P445L;  
label define P445L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rinsrsn  P446L;  
label define P446L   
	-1          "Not in universe"               
	1           "Disability"                    
	8           "No payment received"           
;
label values ainsrsn  P447L;  
label define P447L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rempdrsn P448L;  
label define P448L   
	-1          "Not in universe"               
	1           "Disability"                    
	8           "No payment"                    
;
label values aempdrsn P449L;  
label define P449L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rpensrsn P450L;  
label define P450L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survior"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values apensrsn P451L;  
label define P451L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rfcsrsn  P452L;  
label define P452L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survior"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values afcsrsn  P453L;  
label define P453L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rstatrsn P454L;  
label define P454L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survior"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values astatrsn P455L;  
label define P455L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rlgovrsn P456L;  
label define P456L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survior"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values algovrsn P457L;  
label define P457L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rmilrsn  P458L;  
label define P458L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survior"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values amilrsn  P459L;  
label define P459L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rrrsn    P460L;  
label define P460L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Survior"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values arrrsn   P461L;  
label define P461L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rblklrsn P462L;  
label define P462L   
	-1          "Not in universe"               
	1           "Disability"                    
	3           "Survivor"                      
	5           "Disability and survivor"       
	8           "No payment received"           
;
label values ablklrsn P463L;  
label define P463L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rothrrsn P464L;  
label define P464L   
	-1          "Not in universe"               
	1           "Disability"                    
	2           "Retirement"                    
	3           "Suvivor"                       
	4           "Disability and retirement"     
	5           "Disability and survivor"       
	6           "Retirement and survivor"       
	7           "Disability, retirement, and"   
	8           "No payment received"           
;
label values aothrrsn P465L;  
label define P465L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rlifirsn P466L;  
label define P466L   
	-1          "Not in universe"               
	2           "Retirement"                    
	3           "Suvivor"                       
	6           "Retirement and survivor"       
	8           "No payment received"           
;
label values alifirsn P467L;  
label define P467L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rvetsrsn P468L;  
label define P468L   
	-1          "Not in universe"               
	3           "Suvivor"                       
	8           "No payment received"           
;
label values avetsrsn P469L;  
label define P469L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values restarsn P470L;  
label define P470L   
	-1          "Not in universe"               
	3           "Suvivor"                       
	8           "No payment received"           
;
label values aestarsn P471L;  
label define P471L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values efccyn   P472L;  
label define P472L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afccyn   P473L;  
label define P473L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ecsagree P474L;  
label define P474L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acsagree P475L;  
label define P475L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ecsyn    P476L;  
label define P476L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acsyn    P477L;  
label define P477L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ealiyn   P478L;  
label define P478L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aaliyn   P479L;  
label define P479L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values efsyn    P480L;  
label define P480L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values afsyn    P481L;  
label define P481L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epssthru P482L;  
label define P482L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apssthru P483L;  
label define P483L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ewicyn   P484L;  
label define P484L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values awicyn   P485L;  
label define P485L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epatyn   P486L;  
label define P486L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyn   P487L;  
label define P487L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epatyp1  P488L;  
label define P488L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp1  P489L;  
label define P489L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epatyp2  P490L;  
label define P490L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp2  P491L;  
label define P491L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epatyp3  P492L;  
label define P492L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp3  P493L;  
label define P493L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values epatyp4  P494L;  
label define P494L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values apatyp4  P495L;  
label define P495L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values easetdrw P496L;  
label define P496L   
	-1          "Not in universe"               
	1           "Lump Sum"                      
	2           "Regular distribution"          
	3           "Both"                          
	4           "No"                            
;
label values aasetdrw P497L;  
label define P497L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eresnss1 P498L;  
label define P498L   
	-1          "Not in universe"               
	1           "Retired"                       
	2           "Disabled"                      
	3           "Widowed or surviving child"    
	4           "Spouse or dependent child"     
	5           "Some other reason"             
;
label values aresnss1 P499L;  
label define P499L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eresnss2 P500L;  
label define P500L   
	-1          "Not in universe"               
	1           "Retired"                       
	2           "Disabled"                      
	3           "Widowed or surviving child"    
	4           "Spouse or dependent child"     
	5           "Some other reason"             
;
label values aresnss2 P501L;  
label define P501L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values tagess   P502L;  
label define P502L   
	-1          "Not in universe"               
;
label values aagess   P503L;  
label define P503L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
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
;
label values a01amta  P588L;  
label define P588L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a01amtk  P589L;  
label define P589L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a02amt   P590L;  
label define P590L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a03amta  P591L;  
label define P591L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a03amtk  P592L;  
label define P592L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a04amt   P593L;  
label define P593L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a05amt   P594L;  
label define P594L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a07amt   P595L;  
label define P595L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a08amt   P596L;  
label define P596L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a09amt   P597L;  
label define P597L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a10amt   P598L;  
label define P598L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a12amt   P599L;  
label define P599L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a13amt   P600L;  
label define P600L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a14amt   P601L;  
label define P601L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a15amt   P602L;  
label define P602L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a20amt   P603L;  
label define P603L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a21amt   P604L;  
label define P604L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a23amt   P605L;  
label define P605L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a24amt   P606L;  
label define P606L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a25amt   P607L;  
label define P607L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a26amt   P608L;  
label define P608L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a27amt   P609L;  
label define P609L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a28amt   P610L;  
label define P610L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a29amt   P611L;  
label define P611L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a30amt   P612L;  
label define P612L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a31amt   P613L;  
label define P613L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a32amt   P614L;  
label define P614L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a34amt   P615L;  
label define P615L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a35amt   P616L;  
label define P616L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a36amt   P617L;  
label define P617L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a37amt   P618L;  
label define P618L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a38amt   P619L;  
label define P619L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a39amt   P620L;  
label define P620L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a42amt   P621L;  
label define P621L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a50amt   P622L;  
label define P622L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a51amt   P623L;  
label define P623L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a52amt   P624L;  
label define P624L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a53amt   P625L;  
label define P625L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a55amt   P626L;  
label define P626L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a56amt   P627L;  
label define P627L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values a75amt   P628L;  
label define P628L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values acsagy   P629L;  
label define P629L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
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
;
label values arollamt P634L;  
label define P634L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east1a   P635L;  
label define P635L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast1a   P636L;  
label define P636L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east1b   P637L;  
label define P637L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast1b   P638L;  
label define P638L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east1c   P639L;  
label define P639L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast1c   P640L;  
label define P640L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east2a   P641L;  
label define P641L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2a   P642L;  
label define P642L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east2b   P643L;  
label define P643L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2b   P644L;  
label define P644L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east2c   P645L;  
label define P645L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2c   P646L;  
label define P646L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east2d   P647L;  
label define P647L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast2d   P648L;  
label define P648L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east3a   P649L;  
label define P649L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3a   P650L;  
label define P650L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east3b   P651L;  
label define P651L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3b   P652L;  
label define P652L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east3c   P653L;  
label define P653L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3c   P654L;  
label define P654L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east3d   P655L;  
label define P655L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3d   P656L;  
label define P656L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east3e   P657L;  
label define P657L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast3e   P658L;  
label define P658L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east4a   P659L;  
label define P659L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast4a   P660L;  
label define P660L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east4b   P661L;  
label define P661L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast4b   P662L;  
label define P662L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values east4c   P663L;  
label define P663L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aast4c   P664L;  
label define P664L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ejntrnt  P665L;  
label define P665L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ajntrnt  P666L;  
label define P666L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ajarnt   P667L;  
label define P667L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ajaclr   P668L;  
label define P668L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eownrnt  P669L;  
label define P669L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values aownrnt  P670L;  
label define P670L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values aoarnt   P671L;  
label define P671L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values aoaclr   P672L;  
label define P672L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ejrnt2   P673L;  
label define P673L   
	-1          "Not universe"                  
	1           "Yes"                           
	2           "No"                            
;
label values ajrnt2   P674L;  
label define P674L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ajaclr2  P675L;  
label define P675L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emrtjnt  P676L;  
label define P676L   
	-1          "Not universe"                  
	1           "Yes"                           
	2           "No"                            
;
label values amrtjnt  P677L;  
label define P677L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amijnt   P678L;  
label define P678L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emrtown  P679L;  
label define P679L   
	-1          "Not universe"                  
	1           "Yes"                           
	2           "No"                            
;
label values amrtown  P680L;  
label define P680L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amiown   P681L;  
label define P681L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values arndup1  P682L;  
label define P682L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values arndup2  P683L;  
label define P683L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eckjt    P684L;  
label define P684L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ackjt    P685L;  
label define P685L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ackjtint P686L;  
label define P686L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values eckoast  P687L;  
label define P687L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ackoast  P688L;  
label define P688L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ackoint  P689L;  
label define P689L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esvjt    P690L;  
label define P690L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asvjt    P691L;  
label define P691L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values asvjtint P692L;  
label define P692L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esvoast  P693L;  
label define P693L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asvoast  P694L;  
label define P694L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values asvoint  P695L;  
label define P695L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emdjt    P696L;  
label define P696L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amdjt    P697L;  
label define P697L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amdjtint P698L;  
label define P698L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emdoast  P699L;  
label define P699L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amdoast  P700L;  
label define P700L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amdoint  P701L;  
label define P701L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ecdjt    P702L;  
label define P702L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acdjt    P703L;  
label define P703L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values acdjtint P704L;  
label define P704L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ecdoast  P705L;  
label define P705L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values acdoast  P706L;  
label define P706L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values acdoint  P707L;  
label define P707L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ebdjt    P708L;  
label define P708L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abdjt    P709L;  
label define P709L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values abdjtint P710L;  
label define P710L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ebdoast  P711L;  
label define P711L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values abdoast  P712L;  
label define P712L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values abdoint  P713L;  
label define P713L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values egvjt    P714L;  
label define P714L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agvjt    P715L;  
label define P715L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values agvjtint P716L;  
label define P716L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values egvoast  P717L;  
label define P717L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values agvoast  P718L;  
label define P718L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values agvoint  P719L;  
label define P719L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emanychk P720L;  
label define P720L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amanychk P721L;  
label define P721L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amjntdiv P722L;  
label define P722L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amowndiv P723L;  
label define P723L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values emothdiv P724L;  
label define P724L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values amothdiv P725L;  
label define P725L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amjadiv  P726L;  
label define P726L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values amownadv P727L;  
label define P727L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esanychk P728L;  
label define P728L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asanychk P729L;  
label define P729L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values asjntdiv P730L;  
label define P730L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values asowndiv P731L;  
label define P731L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values esothdiv P732L;  
label define P732L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values asothdiv P733L;  
label define P733L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values asjadiv  P734L;  
label define P734L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values asownadv P735L;  
label define P735L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ecrmth   P736L;  
label define P736L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values acrmth   P737L;  
label define P737L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rmedcode P738L;  
label define P738L   
	-1          "Not in universe"               
	1           "Retired or disabled worker"    
	2           "Spouse of retired or disabled" 
	3           "Widow of retired or disabled"  
	4           "Adult disabled as a child"     
	5           "Uninsured"                     
	7           "Other or invalid code"         
	9           "Missing code"                  
;
label values ecdmth   P739L;  
label define P739L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values acdmth   P740L;  
label define P740L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ecdunt1  P741L;  
label define P741L   
	-1          "Not in universe"               
;
label values ecdunt2  P742L;  
label define P742L   
	-1          "Not in universe"               
;
label values ecdunt3  P743L;  
label define P743L   
	-1          "Not in universe"               
;
label values ehimth   P744L;  
label define P744L   
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahimth   P745L;  
label define P745L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehiowner P746L;  
label define P746L   
	1           "Covered in own name"           
	2           "Covered by someone else's plan"
	3           "Covered both in own name and by"
	4           "Not covered"                   
;
label values ahiowner P747L;  
label define P747L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rchampm  P748L;  
label define P748L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
;
label values ehiunt1  P749L;  
label define P749L   
	-1          "Not in universe"               
;
label values ehiunt2  P750L;  
label define P750L   
	-1          "Not in universe"               
;
label values ehiunt3  P751L;  
label define P751L   
	-1          "Not in universe"               
;
label values ehemply  P752L;  
label define P752L   
	-1          "Not in universe"               
	1           "Current employer or work"      
	2           "Former employer"               
	3           "Union"                         
	4           "CHAMPUS"                       
	5           "CHAMPVA"                       
	6           "Military/VA health care"       
	7           "Other"                         
;
label values ahemply  P753L;  
label define P753L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehicost  P754L;  
label define P754L   
	-1          "Not in universe"               
	1           "All"                           
	2           "Part"                          
	3           "None"                          
;
label values ahicost  P755L;  
label define P755L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehiother P756L;  
label define P756L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahiother P757L;  
label define P757L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehispse  P758L;  
label define P758L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahispse  P759L;  
label define P759L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehioldkd P760L;  
label define P760L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahioldkd P761L;  
label define P761L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehiyngkd P762L;  
label define P762L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahiyngkd P763L;  
label define P763L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehiothr  P764L;  
label define P764L   
	-1          "Not in universe"               
	1           "Yes, covered"                  
	2           "No, not covered"               
;
label values ahiothr  P765L;  
label define P765L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values ehirsn01 P766L;  
label define P766L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn02 P767L;  
label define P767L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn03 P768L;  
label define P768L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn04 P769L;  
label define P769L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn05 P770L;  
label define P770L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn06 P771L;  
label define P771L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn07 P772L;  
label define P772L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn08 P773L;  
label define P773L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn09 P774L;  
label define P774L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn10 P775L;  
label define P775L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn11 P776L;  
label define P776L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ehirsn12 P777L;  
label define P777L   
	-1          "Not in universe"               
	1           "Yes"                           
	2           "No"                            
;
label values ahirsn   P778L;  
label define P778L   
	1           "Statistical imputation (hot"   
	2           "Cold deck imputation"          
	3           "Logical imputation (derivation)"
;
label values rprvhi   P779L;  
label define P779L   
	-1          "Not in universe"               
	1           "Employer or union provided"    
	2           "Privately purchased"           
;

