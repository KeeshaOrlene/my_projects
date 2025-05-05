#   Urban Transit Adoption Analysis
📅 **Project Year:** 2024  
👩🏽‍💻 **Authors:** Michael DeLetter, C. Dustin Hildenbr, and Keesha Orlène Ngombo Mouelet  
---

## Overview

This project investigates the drivers behind urban transit ridership in 120 U.S. metropolitan areas using data from the 2019 National Transit Database (NTD).

By modeling transit miles per capita, the study questions the long-standing belief that population density is the main determinant of ridership, revealing that per capita funding and investment are much stronger predictors of transit adoption.

---

## Background & Significance

While cities like New York are often cited as transit successes due to their density, this project shows that investment per capita plays a more crucial role than density alone.

The findings offer valuable insights for policymakers aiming to build efficient transit systems, especially in cities where density is limited but funding opportunities exist.

---

## Key Variables Explored

- Population Density  
- Transit Expenses Per Capita  
- Percent of Public Funding  
- Rail Availability (Yes/No)  
- Fleet Size per 1,000 Residents  
- Time Zone (Regional Influence)

---

## Objective

This study aims to determine which factors most significantly influence public transit ridership and construct an interpretable, reduced linear model to support evidence-based transit policies.

---

## Methodology

**Data Source:** 2019 National Transit Database (NTD)  
**Tech Stack:** R (`lm`, `car`, `MASS`, `alr3`), Excel  
**Steps:**
1. Data aggregation by Urbanized Area (UZA)
2. Feature engineering (per capita, density, categorical rail feature)
3. Box-Cox transformation for normality
4. Linear regression modeling
5. Model selection via `stepAIC`
6. Diagnostic analysis (residual plots, VIF)

---

## Final Model Summary

- **Retained Predictors:** `expenses_per_capita`, `percent_public_money`  
- **Excluded:** `density`, `rail`, `time_zone` due to insignificance  
- **Adjusted R²:** 0.8878  
- Insight: **More funding per person = more transit miles ridden**

---

## Challenges

- Limited to cities with >300K population  
- Causality cannot be proven (observational data)  
- Density may still matter outside NTD Urbanized Areas  
- Political/regional funding patterns not directly tested

---

## 🔗 References

- [National Transit Database (NTD)](https://www.transit.dot.gov/ntd)  
- Cervero & Guerra – *Urban Densities and Transit*  
- Mattson – *Transit and Household Expenditures*  
- Bertaud & Richardson – *Transit and Density: U.S. vs. Europe*  

---

**Conclusion:**  
Transit adoption is not just about the number of people living in a city—it's about **how much a city invests** in making public transit viable.




 **Key Finding:** Funding drives Transit ridership more than urban density.  
The project encourages planners and officials to invest in **funding structures**, not just infrastructure or spatial form.

---

