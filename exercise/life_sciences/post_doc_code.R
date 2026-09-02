# Development-rate plot for the 2024 Aedes aegypti rearing experiment.
#
# The water-controlled cages are the cleanest comparison, so I am using those
# for this first pass. I calculated a mean emergence day within each cage and
# then inverted it, rather than inverting every individual observation.

library(dplyr)
library(readr)
library(ggplot2)

emergence_records <- read_csv(
  "data/aegypti_juvenile_emergence.csv",
  show_col_types = FALSE
)

cage_development_rates <- emergence_records |>
  filter(
    water_treatment == "maintained",
    !is.na(days_to_emergence)
  ) |>
  group_by(temperature_c, humidity_percent, cage_id) |>
  summarise(
    mean_emergence_day = mean(days_to_emergence),
    n_emerged = n(),
    .groups = "drop"
  ) |>
  mutate(
    development_rate = 1 / mean_emergence_day,
    humidity_percent = factor(
      humidity_percent,
      levels = c(30, 45, 60, 75, 90)
    )
  )

development_rate_plot <- ggplot(
  cage_development_rates,
  aes(
    x = temperature_c,
    y = development_rate,
    color = humidity_percent
  )
) +
  geom_point() +
  geom_line(aes(group = humidity_percent)) +
  labs(
    x = "Temperature (degrees C)",
    y = "Development rate (1 / days)",
    color = "Relative humidity (%)"
  ) +
  theme_minimal()
