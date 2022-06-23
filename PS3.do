clear all
cap log close
set more off

/*
	Will Gleave 3040 PS3 
*/

* Change Working Directory	

	cd "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS3"

* Start a log file

	log using PS3.log, replace

* Load in Dataset (Fertility)
	use "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS3\fertility.dta", clear

* 1.
	reg weeksm1 morekids
	reg morekids samesex
	ivregress 2sls weeksm1 (morekids = samesex)
	
	*Load in Dataset (Fertility)
	use "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS3\Movies.dta", clear
*2
	gen ln_assaults = ln(assaults)
	reg ln_assaults
	regress ln_assaults year2 year3 year4 year5 year6 year7 year8 year9 year10 month2 month3 month4 month5 month6 month7 month8 month9 month10 month11 month12
	gen attend = (attend_v + attend_m + attend_n)
	regress attend year2 year3 year4 year5 year6 year7 year8 year9 year10 month2 month3 month4 month5 month6 month7 month8 month9 month10 month11 month12
	
	
	regress ln_assaults attend_m attend_n attend_v year2 year3 year4 year5 year6 year7 year8 year9 year10 month2 month3 month4 month5 month6 month7 month8 month9 month10 month11 month12 h_chris h_easter h_july4 h_labor h_mem h_newyr w_rain w_snow w_maxa w_maxb w_maxc w_mina w_minb w_minc

	ivregress 2sls ln_assaults year* month* h_* w_* (attend_v attend_m attend_n=attend_n_f attend_v_b attend_m_b attend_n_b)