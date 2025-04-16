# Load necessary libraries
library(ggplot2)
library(readr)
library(dplyr)
library(lubridate)

# Load the cleaned dataset
data <- read_csv("cleaned_aircarbon_graph_ready.csv")

# Convert Timestamp to Date
data$Date <- as.Date(data$Timestamp, format = "%b %d %Y %I:%M:%S %p")

# Aggregate average price per day
daily_avg_price <- data %>%
  group_by(Date) %>%
  summarise(Average_Price = mean(Price, na.rm = TRUE))

# Plot the daily average price trend
ggplot(daily_avg_price, aes(x = Date, y = Average_Price)) +
  geom_line(color = "steelblue", size = 1.2) +
  geom_point(color = "black", size = 1.5) +
  labs(title = "Daily Average Carbon Credit Price",
       subtitle = "Based on Blockchain-Based Transactions (ACX)",
       x = "Date",
       y = "Average Price (USD)") +
  theme_minimal()

