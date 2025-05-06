#loading the library
data0 <- read.csv("/cloud/project/entrepreneurship_decision_dataset.csv")
library(dplyr)
library(stringr) # if you also need stringr functions
library(ggplot2) # if you are plotting
library(scales)
library(GGally)

#EDA
str(data0)
summary(data0)
missing_summary <- sapply(data0, function(x) sum(is.na(x)))
print(missing_summary)
# --- Remove Company_ID ---
data0 <- data0 %>% select(-Company_ID)

# --- Convert specified columns to numeric ---
cols_to_numeric <- c("Employee_Count","Historical_Sales", "Risk_Tolerance", "Investment_Availability")

for (col in cols_to_numeric) {
  data0[[col]] <- as.numeric(data0[[col]])
}

# --- Convert specified columns to factor ---
cols_to_factor <- c("Industry_Type", "Market_Competition_Level", "Predicted_Market_Trend", "Innovation_Level")

for (col in cols_to_factor) {
  data0[[col]] <- as.factor(data0[[col]])
}

# --- Confirm the structure ---

# --- Histograms for Numerical Variables ---
numeric_vars <- data0 %>%
  select(where(is.numeric)) %>%
  names()

for (var in numeric_vars) {
  print(
    ggplot(data0, aes_string(x = var)) +
      geom_histogram(fill = "skyblue", color = "black", bins = 30) +
      theme_minimal() +
      scale_x_continuous(labels = comma)+
      ggtitle(paste("Histogram of", var))
  )
}

library(scales)

# Example for Historical_Sales histogram
ggplot(data0, aes(x = Historical_Sales)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 30) +
  theme_minimal() +
  scale_x_continuous(labels = comma) +
  ggtitle("Histogram of Historical_Sales")

# --- Boxplots for Numerical Variables by Predicted Market Trend ---
for (var in numeric_vars) {
  print(
    ggplot(data0, aes_string(x = "Predicted_Market_Trend", y = var)) +
      geom_boxplot(fill = "lightgreen") +
      theme_minimal() +
      ggtitle(paste("Boxplot of", var, "by Predicted Market Trend"))
  )
}

# --- Barplots for Categorical (Factor) Variables ---
factor_vars <- data0 %>%
  select(where(is.factor)) %>%
  names()

for (var in factor_vars) {
  print(
    ggplot(data0, aes_string(x = var)) +
      geom_bar(fill = "lightcoral", color = "black") +
      theme_minimal() +
      ggtitle(paste("Barplot of", var))
  )
}

# --- Compute correlation matrix ---
cor_matrix <- cor(data0 %>% select(where(is.numeric)), use = "complete.obs")

# --- Better corrplot ---
corrplot(cor_matrix,
         method = "color",        # Color instead of numbers
         type = "upper",          # Only upper triangle
         order = "hclust",        # Cluster similar variables together
         tl.col = "black",        # Text label color
         tl.srt = 45,             # Rotate text
         tl.cex = 0.8,            # Smaller text size
         addCoef.col = "black",   # Add correlation coefficients
         number.cex = 0.6,        # Smaller coefficient numbers
         col = colorRampPalette(c("blue", "white", "red"))(200)  # Color gradient
)
# --- Pairwise Plot (optional for deeper exploration) ---
ggpairs(data0 %>% select(where(is.numeric)))

cat("EDA Completed \n")

# --- Q-Q plots for each numeric variable ---
numeric_vars <- data0 %>%
  select(where(is.numeric)) %>%
  names()

for (var in numeric_vars) {
  print(
    ggplot(data0, aes_string(sample = var)) +
      stat_qq() +
      stat_qq_line(color = "red") +
      theme_minimal() +
      ggtitle(paste("Q-Q Plot of", var))
  )
}
#--------------------------------------------------------------------------------------------
# --- Perform Correspondence Analysis ---
ca_result <- CA(table_innovation_trend, graph = FALSE)

# --- Plot the Correspondence Analysis Map ---
fviz_ca_biplot(ca_result, repel = TRUE) +
  ggtitle("Correspondence Analysis: Innovation Level vs Predicted Market Trend") +
  theme_minimal()
#---------------------------------------------------------------------------------------

# --- Libraries ---
library(tidyr)
library(ggplot2)
library(dplyr)

# --- Step 1: Scale the numeric variables ---
scaled_vars <- c("Historical_Sales", "Growth_Rate", "Employee_Count", 
                 "Economic_Reports", "Market_Sentiment", "Investment_Availability", 
                 "Key_Feature_1", "Key_Feature_2", "Model_Confidence")

data0_scaled <- data0 %>%
  mutate(across(all_of(scaled_vars), ~ as.numeric(scale(.))))

# --- Step 2: Reshape the dataset into long format ---
profile_long <- data0_scaled %>%
  pivot_longer(
    cols = all_of(scaled_vars),
    names_to = "Variable",
    values_to = "Value"
  )

# --- Step 3: Summarize: mean and standard error per Risk_Tolerance_Group and Variable ---
profile_summary <- profile_long %>%
  group_by(Risk_Tolerance_Group, Variable) %>%
  summarise(
    mean_value = mean(Value, na.rm = TRUE),
    se_value = sd(Value, na.rm = TRUE) / sqrt(n()),
    .groups = 'drop'
  )

# --- Step 4: Now Plot ---
ggplot(profile_summary, aes(x = Variable, y = mean_value, color = Risk_Tolerance_Group, group = Risk_Tolerance_Group)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin = mean_value - 1.96 * se_value, ymax = mean_value + 1.96 * se_value), width = 0.2) +
  theme_minimal() +
  ggtitle("Standardized Profile Plot with 95% Confidence Intervals") +
  xlab("Business Metrics (Standardized)") +
  ylab("Standardized Mean Value") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_color_manual(values = c("Low" = "blue", "Medium" = "orange", "High" = "red"))
#---------------------------------------------------------------------------------------------
   profile_summary_sector <- data0_scaled %>%
  pivot_longer(
    cols = all_of(scaled_vars),
    names_to = "Variable",
    values_to = "Value"
  ) %>%
  group_by(Industry_Type, Variable) %>%
  summarise(
    mean_value = mean(Value, na.rm = TRUE),
    se_value = sd(Value, na.rm = TRUE) / sqrt(n()),
    .groups = 'drop'
  )

ggplot(profile_summary_sector, aes(x = Variable, y = mean_value, color = Industry_Type, group = Industry_Type)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin = mean_value - 1.96 * se_value, ymax = mean_value + 1.96 * se_value), width = 0.2) +
  theme_minimal() +
  ggtitle("Standardized Profile Plot by Industry Type") +
  xlab("Business Metrics (Standardized)") +
  ylab("Standardized Mean Value") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  guides(color = guide_legend(title = "Industry Type"))
#--------------------------------------------------------------------------------                       
