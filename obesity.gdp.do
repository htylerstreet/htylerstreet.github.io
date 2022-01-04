clear all
set more off

cd "C:\Users\htyle\OneDrive - University of Bristol\YEAR 3\Data Science\Project\Data"

capture log close
log using "obesity_gdp.log", replace

*First data set
import delimited using "ObesityStats - Copy.csv"

*Removing countries that aren't in Europe
drop if country=="Australia"
drop if country=="Brazil"
drop if country=="Canada"
drop if country=="Chile"
drop if country=="Israel"
drop if country=="United States"

save obesity.europe.dta, replace

*Second dataset
*Cleaning the gdp file to only contain values for 2020
import delimited using "SNA_TABLE1_04012022091940280.csv"

drop if year==2016
drop if year==2017
drop if year==2018
drop if year==2019

save gdp.dta, replace

*Merging the two datasets
merge 1:1 country using obesity.europe.dta

*Drop any that didn't have a match
drop if country=="Lithuania"
drop if country=="Russia"

save obesity.gdp.dta, replace

*Remove any unnecassary variables
drop ïlocation
drop transact
drop transaction
drop measure
drop v6
drop time
drop unitcode
drop unit
drop powercodecode
drop powercode
drop referenceperiodcode
drop referenceperiod
drop flagcodes
drop flags

rename value gdp

export delimited obesity_gdp.csv, replace

log close



