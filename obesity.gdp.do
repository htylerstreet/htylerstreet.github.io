clear all
set more off

cd "C:\Users\htyle\OneDrive - University of Bristol\YEAR 3\Data Science\Project\Data"

capture log close
log using "obesity_gdp.log", replace

*First data set
import delimited using "ObesityDeaths.csv"

drop code
drop year

save obesity.deaths.dta, replace

*Second data set
import delimited using "ObesityPrevalence.csv"

*Removing countries that aren't in Europe
drop if country=="Australia"
drop if country=="Brazil"
drop if country=="Canada"
drop if country=="Chile"
drop if country=="Israel"
drop if country=="United States"

save obesity.europe.dta, replace

merge 1:1 country using obesity.deaths.dta

keep if _merge==3

drop _merge

save obesity.europe.deaths.dta, replace

*Third data set
import delimited using "EuropeGDPStatista.csv"

save europe.gdp.dta, replace

merge 1:1 country using obesity.europe.deaths.dta

keep if _merge==3

drop _merge

rename men Men
rename women Women

save obesity.europe.deaths.gdp.dta, replace

export delimited obesity_gdp.csv

log close









