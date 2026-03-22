# Data Sources

The data files for this project are not committed to this repository due to size constraints.
Download them from the sources below and place them in this `data/` directory before rendering.

---

## 1. American Community Survey (ACS)
**File name:** `census_data_state_2008-2023.csv`
**Source:** U.S. Census Bureau via the `tidycensus` R package
**Coverage:** 52 U.S. states and territories, 2008–2023
**Dimensions:** 781 rows × 26 variables

Download via tidycensus:
```r
library(tidycensus)
# See https://walker-data.com/tidycensus/ for API key setup
```

Or download directly from:
[United States Census Bureau](https://www.census.gov/programs-surveys/acs)

---

## 2. Gun Violence Archive
**File name:** `gun_violence_geo.csv`
**Source:** [Gun Violence Archive](https://www.gunviolencearchive.org/)
**Coverage:** 100,000+ gun violence incidents across U.S. states, 2014–2023
**Key variables:** Incident date, state, city, county, victims killed/injured,
suspects arrested/injured, incident characteristics, latitude, longitude

Download from:
[Gun Violence Archive Data Portal](https://www.gunviolencearchive.org/methodology)

---

## Variable Descriptions

### ACS Dataset (26 variables)
| Variable | Type | Description |
|---|---|---|
| geoid | character | State FIPS code |
| county_state | character | State name |
| year | double | Year |
| population | double | Total population |
| median_income | double | Median household income ($) |
| median_monthly_rent_cost | double | Median monthly rent ($) |
| median_monthly_home_cost | double | Median monthly homeowner cost ($) |
| prop_female / prop_male | double | Gender proportions |
| prop_white/black/native/asian/... | double | Race/ethnicity proportions |
| prop_highschool through prop_doctoral | double | Education level proportions |
| prop_poverty | double | Proportion below poverty threshold |

### Gun Violence Dataset (16 variables)
| Variable | Type | Description |
|---|---|---|
| geoid | character | FIPS code (matches ACS) |
| incident_id | double | Unique incident identifier |
| date | character | Incident date (ISO 8601) |
| state | character | U.S. state |
| city | character | City of incident |
| county | character | County (if available) |
| number_victims_killed | double | Victims killed |
| number_victims_injured | double | Victims injured |
| number_suspects_killed | double | Suspects killed |
| number_suspects_injured | double | Suspects injured |
| number_suspects_arrested | double | Suspects arrested |
| incident_characteristics | character | Incident type description |
| latitude / longitude | double | Geographic coordinates |
