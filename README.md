# Gun Violence & Poverty in the United States
### Investigating the Impact of Poverty and Population on Gun Violence Rates (2014–2023)

![R](https://img.shields.io/badge/R-4.3+-276DC3?style=flat&logo=r&logoColor=white)
![Quarto](https://img.shields.io/badge/Quarto-1.3+-blue?style=flat)
![tidyverse](https://img.shields.io/badge/tidyverse-2.0-1A162D?style=flat)
![Incidents](https://img.shields.io/badge/Incidents%20Analyzed-100K+-red?style=flat)
![Years](https://img.shields.io/badge/Years-2014--2023-orange?style=flat)
![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat)

A rigorous statistical investigation into the socioeconomic drivers of gun violence across
U.S. states, combining **American Community Survey (ACS) census data** with the
**Gun Violence Archive** to analyze 100,000+ incidents over 10 years using permutation
tests, bootstrap analysis, and interactive visualizations.

> **Authors:** Cynthia Mutua *(Primary contributor)* · Kate Wema Juma
> **Course:** Statistical Computing, Grand Valley State University

---

## Live Report

 **[View Full Interactive Report](https://cece15.github.io/gun-violence-poverty-analysis)**
>
> Includes interactive plotly charts, animated gganimate visualizations,
> calendar heatmaps, and U.S. state choropleth maps.

---

## Key Findings

| Finding | Result |
|---|---|
| Poverty → Gun Violence | **Statistically significant** (permutation p < 0.05) |
| Population → Gun Violence | **Not significant** (p = 0.259) |
| Bootstrap 95% CI (High Poverty median) | **11.66 – 14.19** incidents per 100,000 |
| High Poverty SD | 210.82 vs 38.55 (Low Poverty) — high variability |
| Regional pattern | Southern states (TX, FL, GA) lead in armed robbery incidents |
| Temporal pattern | California gun deaths peak on summer weekends and holidays |

---

## Analytical Pipeline

```
┌─────────────────────────┐     ┌──────────────────────────────┐
│   ACS CENSUS DATA        │     │   GUN VIOLENCE ARCHIVE        │
│   (2008–2023)            │     │   (100K+ incidents)           │
│   52 states              │     │   2014–2023                   │
│   26 socioeconomic vars  │     │   16 incident variables       │
└───────────┬─────────────┘     └──────────────┬───────────────┘
            │                                  │
            └──────────────┬───────────────────┘
                           │  inner_join(year, county_state)
                           ▼
            ┌──────────────────────────────┐
            │   MERGED: pop_gunviolence     │
            │   gun_violence_rate per 100K  │
            │   poverty_group (High/Low)    │
            └──────────────┬───────────────┘
                           │
          ┌────────────────┼────────────────────┐
          ▼                ▼                    ▼
  ┌──────────────┐  ┌────────────────┐  ┌──────────────────┐
  │  PERMUTATION  │  │  WELCH'S       │  │  BOOTSTRAP        │
  │  TESTS        │  │  T-TEST        │  │  ANALYSIS         │
  │               │  │                │  │                   │
  │  pop vs rate  │  │  High Poverty  │  │  n=10,000 samples │
  │  p = 0.259    │  │  vs Low Poverty│  │  Median CI        │
  │               │  │  p < 0.05      │  │  [11.66, 14.19]   │
  │  poverty vs   │  │                │  │                   │
  │  rate p<0.05  │  └────────────────┘  └──────────────────┘
  └──────────────┘
```

---

## Repository Structure

```
gun-violence-poverty-analysis/
│
├── gun_violence_poverty_analysis.qmd   # Full analysis (Quarto)
├── index.html                          # Rendered report (GitHub Pages)
├── requirements.R                      # All R package dependencies
├── data/
│   └── README.md                       # Data sources & download instructions
├── outputs/
│   └── calendar_plot.png               # Saved visualizations
└── README.md
```

---

## Data Sources

### 1. American Community Survey (ACS)
- **Source:** U.S. Census Bureau via `tidycensus` R package
- **Coverage:** 52 U.S. states and territories, 2008–2023
- **Key variables:** Population, median income, poverty rate, demographic proportions,
  education levels, housing costs
- **File:** `census_data_state_2008-2023.csv` (781 rows × 26 variables)

### 2. Gun Violence Archive
- **Source:** [Gun Violence Archive](https://www.gunviolencearchive.org/)
- **Coverage:** 100,000+ incidents across U.S. states, 2014–2023
- **Key variables:** Incident date, state, city, victims killed/injured,
  suspects arrested, incident characteristics
- **File:** `gun_violence_geo.csv`

> Data files are not committed due to size. See [`data/README.md`](data/README.md)
> for download instructions.

---

## Methods & Visualizations

### Statistical Methods

| Method | Purpose | Result |
|---|---|---|
| Permutation test (1,000 iter) | Population vs gun violence rate | p = 0.259 (not significant) |
| Permutation test (1,000 iter) | Poverty rate vs gun violence rate | p < 0.05 (significant) |
| Welch's two-sample t-test | High vs Low poverty gun violence rates | Significant difference |
| Non-parametric bootstrap (10,000 iter) | Median CI for high-poverty states | 95% CI: [11.66, 14.19] |
| Density analysis | Normality assessment by poverty group | High positive skew in High Poverty group |

### Visualizations

| Figure | Type | Description |
|---|---|---|
| Fig 1–2 | Lollipop plots | Missingness analysis for both datasets |
| Fig 3 | Scatter + LOESS | Median income vs poverty rate (2019) |
| Fig 4 | Dual-axis line | Michigan income vs poverty trend (2008–2023) |
| Fig 5 | **Calendar heatmap** | Daily gun violence deaths, California 2019 |
| Fig 6 | **U.S. choropleth** | Gun violence incidents by state (2023) |
| Fig 7 | Horizontal bar | Armed robbery incidents by state (2019) |
| Fig 8 | **Animated bar chart** | Top 10 incident types in California by year |
| Fig 9 | Interactive histogram | Null distribution — population permutation test |
| Fig 10 | Density plot | Gun violence rate distribution by poverty group |
| Fig 11 | Interactive histogram | Null distribution — poverty permutation test |
| Fig 12 | Bootstrap histogram | Bootstrap distribution of median gun violence rate |

---

## How to Run

### Prerequisites
```r
R 4.3+
Quarto 1.3+
```

### Install dependencies
```bash
git clone https://github.com/cece15/gun-violence-poverty-analysis.git
cd gun-violence-poverty-analysis
Rscript requirements.R
```

### Download data
See [`data/README.md`](data/README.md) for instructions.

### Render the report
```bash
quarto render gun_violence_poverty_analysis.qmd
```

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | R 4.3+ |
| Report | Quarto (self-contained HTML) |
| Data Processing | tidyverse, dplyr, lubridate, janitor |
| Statistical Testing | Base R (permutation, bootstrap, t-test) |
| Visualization | ggplot2, plotly, gganimate, gifski |
| Mapping | usmap |
| Calendar | calendR |
| Tables | flextable, gt, gtExtras |
| Image Processing | magick |

---

## Conclusions

The analysis reveals that **poverty is a statistically significant predictor of gun
violence rates** across U.S. states, while population size alone is not. High-poverty
areas exhibit substantially higher and more variable gun violence rates (SD = 210.82)
compared to low-poverty areas (SD = 38.55). The 95% bootstrap confidence interval
confirms the median gun violence rate in high-poverty states lies between
**11.66 and 14.19 incidents per 100,000 population**.

Regional patterns show southern states — Texas, Florida, Georgia — leading in armed
robbery incidents, while California's gun violence peaks on summer weekends and holidays,
suggesting both structural (poverty) and temporal drivers of gun violence.

---

## Team & Contributions

**Cynthia Mutua**
Data dictionary (Gun Violence dataset), missingness analysis (Fig 2), string
manipulation and incident characteristics analysis (Table 4, Fig 7), calendar
heatmap (Fig 5), U.S. choropleth map (Fig 6), animated bar chart (Fig 8),
permutation tests (Figs 9 & 11), bootstrap analysis (Fig 12, Table 8),
interactive plotly visualizations, report writing (data cleaning,
statistical analysis, bootstrap sections)

**Kate Wema Juma** — Data dictionary (ACS dataset), summary tables (Tables 1 & 2),
ACS missingness analysis (Fig 1), date/time processing, introduction and
conclusion writing, code organization

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Cynthia%20Mutua-0A66C2?style=flat&logo=linkedin)](https://linkedin.com/in/cynthia-mutua)
[![GitHub](https://img.shields.io/badge/GitHub-cece15-181717?style=flat&logo=github)](https://github.com/cece15)
