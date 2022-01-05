clear all
set more off

cd "C:\Users\htyle\OneDrive - University of Bristol\YEAR 3\Data Science\Project\Data"

capture log close
log using "mortality_gdp.log", replace

*First data set
import delimited using "historic_gdp.csv"

drop subject
drop v4
drop measure
drop v6
drop frequency
drop v8
drop period
drop unitcode
drop unit
drop powercodecode
drop powercode
drop referenceperiodcode
drop referenceperiod
drop flagcodes
drop flags

rename time year

save historic.gdp.dta, replace

*Second data set
import delimited using "infant_mortality.csv"

save infant.mortality.dta, replace

merge 1:1 year using historic.gdp.dta

keep if _merge==3

drop _merge

save mortality.gdp.dta, replace

export delimited using "mortality_gdp.csv"

log close