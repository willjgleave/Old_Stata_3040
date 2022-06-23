clear all
cap log close
set more off

/*
Will Gleave u1173446
Econometrics 2
*/

*Change Working Directory	
	cd "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS2"

*Start a log file
	log using ps02.log, replace

* (1)Load in Datasets and merge
use "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS2\Guns.dta" 

***1.
xtset stateid year
*a.
gen lnvio = ln(vio)
*-----------REG 1------------
xtreg lnvio shall
*-----------REG 2------------
xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029

*b.
xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe vce(cluster stateid)
*c.
xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, fe 

*d.
gen lnrob = ln(rob)
gen lnmur = ln(mur)
xtreg lnrob shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe vce(cluster stateid)
xtreg lnrob shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, fe 
xtreg lnmur shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe vce(cluster stateid)
xtreg lnmur shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, fe 

