*3-25-03 This program merges rich asset data on commitments from /assets directory to spells data
*Requires individual spellX.do files to be run immediately before in order to work properly (so run within dospells.do)
*Merges 1985-87, 1990-93, and 1996 asset data onto corresponding spells files
*Merges rent/util data for 1991 and 1993 as well (from TM #4)

clear
set mem 200m

/*

use assets/1985/rt3asset85.dta
sort suid pnum
save, replace

use spells85
sort suid pnum
merge suid pnum using assets/1985/rt3asset85.dta, nokeep
save, replace

*/

use assets/1986/rt4asset86.dta
sort suid pnum
save, replace

use spells86
sort suid pnum
merge suid pnum using assets/1986/rt4asset86.dta, nokeep
save, replace

use assets/1987/rt4asset87.dta
sort suid pnum
save, replace

use spells87
sort suid pnum
merge suid pnum using assets/1987/rt4asset87.dta, nokeep
save, replace

/*

use assets/1990/t4asset90.dta
sort suid pnum
save, replace

use spells90
sort suid pnum
merge suid pnum using assets/1990/t4asset90.dta, nokeep
save, replace

use assets/1991/t7asset91.dta
sort suid pnum
save, replace
use assets/1991/t4asset91.dta
sort suid pnum
save, replace

use spells91
sort suid pnum
merge suid pnum using assets/1991/t7asset91.dta, nokeep
drop _merge
sort suid pnum
merge suid pnum using assets/1991/t4asset91.dta, nokeep
save, replace

use assets/1992/t4asset92.dta
sort suid pnum
save, replace

use spells92
sort suid pnum
merge suid pnum using assets/1992/t4asset92.dta, nokeep
save, replace

use assets/1993/t7asset93.dta
sort suid pnum
save, replace
use assets/1993/t4asset93.dta
sort suid pnum
save, replace

use spells93
sort suid pnum
merge suid pnum using assets/1993/t7asset93.dta, nokeep
drop _merge
sort suid pnum
merge suid pnum using assets/1993/t4asset93.dta, nokeep
save, replace

use assets/1996/t3asset96.dta
sort suid pnum
save, replace

use spells96
sort suid pnum
merge suid pnum using assets/1996/t3asset96.dta, nokeep
save, replace

*/


