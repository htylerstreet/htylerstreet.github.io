*DO file for merging two data sets: rating of access to contraception in European countries and GDP for European countries, both from Statista. Both csv files used, as well as the merged file, are on my GitHub.

clear all
set more off

cd "C:\Users\htyle\OneDrive - University of Bristol\YEAR 3\Data Science\Project\Data"

capture log close
log using "contraception_gdp.log", replace

*First data set
import delimited using "AccessToContraception.csv"

save contraception.dta, replace

*Second data set
import delimited using "EuropeGDPStatista.csv"

save europe.gdp.dta, replace

*Merging the datasets
merge 1:1 country using contraception.dta

drop _merge

save contraception.gdp.dta

export delimited using "contraception_gdp.csv"

*The above file had to be further edited in Excel to split the UK into England, Northern Ireland, Scotland and Wales. It is named "contraception_gdp1.csv" and is the file used to create the rating of access to contraception map. 

log close