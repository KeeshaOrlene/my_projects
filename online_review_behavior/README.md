# A Bayesian Approach to Understanding Customer Perceptions of Reviews

 **Year:** 2024  
**Author:** Keesha Orlène Ngombo Mouelet  
**Project:** Amazon Consumer Behavior Study (Bayesian Modeling)
---

## Overview
This research explores how Amazon shoppers perceive the importance of **customer reviews** when making purchase decisions. Using a Bayesian ordinal logistic regression model, it investigates how behaviors like **browsing frequency**, **purchase frequency**, and **age** influence the **importance assigned to reviews**.
---

## Dataset Summary
- Source: [Kaggle – Amazon Consumer Behavior](https://www.kaggle.com/datasets/swathiunnikrishnan/amazon-consumer-behaviour-dataset)
- 602 survey responses, 23 variables  
- Target variable: `Customer_Reviews_Importance` (ordinal: 1–5 scale)  
- Key predictors: `Age`, `Purchase_Frequency`, `Browsing_Frequency`
---

##  Methodology

**Model Used:**  
Bayesian **Ordinal Logistic Regression** using the `brms` package in R (built on Stan).

**Key Steps:**
- Preprocessed categorical predictors to numeric scales
- Applied **informative and weakly-informative priors**
- Ensured model assumptions:
  - Ordinal response
  - No multicollinearity
  - Proportional odds assumption

**Priors:**  
Based on *Doing Bayesian Data Analysis* (Kruschke), using default weakly informative priors where needed.

**Diagnostics:**
- Posterior predictive checks  
- Interaction effects explored  
- Sensitivity analysis under alternative priors

---

## Key Insights

- Younger users and those who browse/purchase more frequently tend to rate reviews as more important
- Behavioral variables (not just demographics) are strong predictors of reliance on reviews
- Predictive distribution provides a framework for understanding future consumer decision-making under uncertainty


---

## References

- Cswenson. *How Online Reviews Influence Sales.* [Medill Spiegel Research Center, 2021](https://spiegel.medill.northwestern.edu/how-online-reviews-influence-sales/)
- Shaw, N. et al. *Online Shopping Continuance after COVID-19.* [Journal of Retailing and Consumer Services, 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9216200/)
- Fernandes, S. et al. *Impact of Online Reviews on Consumer Decisions.* [ScienceDirect, 2022](https://www.sciencedirect.com/science/article/abs/pii/S096969892200159X)
- [CNBC – Amazon E-Commerce Insights](https://www.cnbc.com/2021/06/18/as-e-commerce-sales-proliferate-amazon-holds-on-to-top-onliNe-retail-spot.htm)
- [BrightData – Amazon Datasets](https://brightdata.com/cp/datasets/browse/gd_l7q7dkf244hwjntr0?id=hl_a48e367b&tab=sample)

---

**Conclusion:**  
This project helps decode how customers make trust-based decisions online—equipping marketers and platforms with deeper behavioral insights to shape better review strategies.



---

## 📂 Folder Structure

