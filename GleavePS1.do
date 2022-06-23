clear all
cap log close
set more off

/*
Will Gleave u1173446
Econometrics 2
*/

*Change Working Directory	
	cd "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS1"

*Start a log file
	log using ps01.log, replace

* (1)Load in Datasets and merge
import delimited "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS1\census.csv", encoding(ISO-8859-9) clear

tempfile census
save `census'
import delimited "C:\Users\willj\OneDrive\Desktop\Econometrics 2\PS1\pres_votes_2012_2020.csv", encoding(ISO-8859-9) clear 
drop state 
merge 1:m county_fips year using `census'
drop if _merge != 3

* (2)Generate Ratio Data 
gen percent_male = male / total_population
gen percent_voters = totalvotes / total_population

* (3)Summary Statistics
by year, sort: summarize share_repub percent_male percent_voters
*(a) the mean voter share repulbican increased from .5957692  to .6500282  
*(b) the mean voter share increased from .5852375  to  .6550676 
*(b) the mean male share increased stayed about the same

* (4)ScatterPlots
twoway (scatter share_repub percent_male)
twoway (scatter share_repub percent_voters)

* (5)collapse into state rather than county 
collapse (sum) repub democ totalvotes total_population male, by(stname year)
gen percent_male_state = male / total_population
gen percent_voters_state = totalvotes / total_population

*graphs
twoway (scatter repub percent_male_state [aweight = year])
twoway (scatter repub percent_voters_state [aweight = year])


	