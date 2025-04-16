# Load libraries
library(ggplot2)
library(readr)
library(dplyr)

# Load dataset
data <- read_csv("cleaned_aircarbon_graph_ready_with_dates.csv")

# Calculate total volume by credit type and get top 5
top5_volume <- data %>%
  group_by(Credit_Type) %>%
  summarise(Total_Volume = sum(Volume, na.rm = TRUE)) %>%
  arrange(desc(Total_Volume)) %>%
  slice_head(n = 5)

# Plot
ggplot(top5_volume, aes(x = reorder(Credit_Type, Total_Volume), y = Total_Volume, fill = Credit_Type)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = round(Total_Volume, 0)), vjust = -0.5, size = 4) +
  labs(
    title = "Top 5 Traded Carbon Credit Types",
    subtitle = "Total Volume on Blockchain-Based Exchange (ACX)",
    x = "Credit Type",
    y = "Total Volume Traded"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "none")
