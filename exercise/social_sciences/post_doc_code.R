# Notes from Maya -- 2024-02-18
#
# This is the quick exploratory script I used for the coastal-permitting cases.

library(dplyr)
library(readr)
library(ggplot2)
library(scales)

permit_cases <- read_csv("data/permitting_cases_2009_2023.csv")

# I only wanted decisions where we had a clear claimant win or loss. We had a
# third category called "deferred" that I left out of the rate calculation.
group_rates <- permit_cases %>%
  filter(
    year_filed >= 2009,
    case_result %in% c("claimant_win", "claimant_loss"),
    claimant_group %in% c("conservation", "agency", "industry")
  ) %>%
  group_by(claimant_group) %>%
  summarise(
    cases_with_clear_result = n(),
    wins = sum(case_result == "claimant_win"),
    win_rate = wins / cases_with_clear_result,
    .groups = "drop"
  )

# TODO: I still need to decide whether the two refinery-related case clusters
# should be excluded. They made the industry series look oddly flat.
ggplot(group_rates, aes(x = claimant_group, y = win_rate)) +
  geom_col(fill = "#4C78A8") +
  scale_y_continuous(labels = label_percent()) +
  labs(
    x = NULL,
    y = "Claimant win rate",
    title = "Outcomes in coastal-permitting cases"
  ) +
  theme_minimal()
