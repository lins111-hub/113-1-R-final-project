# Load the necessary libraries (tidyverse includes dplyr)
library(tidyverse)

# Load the data
finance <- read_csv("finance.csv")

# Check the structure of the data
glimpse(finance)

library(dplyr)

# Check column names to ensure they match
colnames(finance)

# Rename columns if necessary
# Rename columns to more manageable names
finance <- finance %>%
  rename(
    year = `年度`,
    inspection_type = `檢查性質`,
    financial_industry = `金融業別`,
    inspection_count = `家數`
  )


# Check the type of '家數' column
str(finance$inspection_count)

# Convert '家數' to numeric if it's a factor or character
finance <- finance %>%
  mutate(inspection_count = as.numeric(as.character(inspection_count)))

glimpse(finance)

# Group by year and financial industry, then summarize total inspections
inspection_summary <- finance %>%
  group_by(year, financial_industry) %>%
  summarise(total_inspections = sum(inspection_count, na.rm = TRUE), .groups = "drop")

# View the summarized data
print(inspection_summary)

# Check the number of rows in your dataset
nrow(finance)



# Load necessary libraries
library(tidyverse)

# Load the data
finance <- read_csv("finance.csv")

# Rename columns to more manageable names
finance <- finance %>%
  rename(
    year = `年度`,
    inspection_type = `檢查性質`,
    financial_industry = `金融業別`,
    inspection_count = `家數`
  )

colnames(finance)

library(ggplot2)

# Convert '家數' to numeric if it's a factor or character
finance <- finance %>%
  mutate(inspection_count = as.numeric(as.character(inspection_count)))

# Group by year and financial industry, then summarize total inspections
inspection_summary <- finance %>%
  group_by(year, financial_industry) %>%
  summarise(total_inspections = sum(inspection_count, na.rm = TRUE), .groups = "drop")

# Create a bar chart of total inspections by year and financial industry
ggplot(inspection_summary, aes(x = year, y = total_inspections, fill = financial_industry)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Total Inspections by Year and Financial Industry",
    x = "Year",
    y = "Total Inspections"
  ) +
  theme_minimal()

