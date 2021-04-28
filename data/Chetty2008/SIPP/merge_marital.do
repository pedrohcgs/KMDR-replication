*4-20-03 This program attaches the marriage/childbirth data to 90-96 spells datasets

clear
set mem 100m
set more off

for num 90/93: use spellsX \ drop _merge \ sort suid pnum \ merge suid pnum using marital/maritalX, nokeep \ drop _merge \ save, replace
use spells96
drop _merge
sort suid pnum
merge suid pnum using marital/marital96, nokeep
drop _merge
save, replace
