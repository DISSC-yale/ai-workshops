# =============================================================================
# Difference-in-Differences Example
# Dataset: Organ Donation Rates (Kessler & Roth, 2014)
#
# Context:
#   In Q3 2011, California introduced an "active choice" policy requiring
#   residents to indicate Yes/No on organ donation when renewing their
#   driver's license. We use other states as controls to estimate the
#   causal effect of this policy on organ donation rates.
#
# Source: causaldata R package; featured in "The Effect" by N. Huntington-Klein
# =============================================================================

library(tidyverse)

# --- 1. Load the data --------------------------------------------------------

organ <- read_csv("files/code/data/organ_donations.csv", show_col_types = FALSE)

glimpse(organ)

# --- 2. Create DiD variables -------------------------------------------------

organ <- organ |>
  mutate(
    treated_state = if_else(State == "California", "California", "Control"),
    post = Quarter_Num >= 4 # Q3 2011 onward = post-treatment
  )

# --- 3. Visualise parallel trends & treatment effect -------------------------

# Quarter labels for the x-axis
quarter_labels <- c(
  "1" = "Q4\n2010", "2" = "Q1\n2011", "3" = "Q2\n2011",
  "4" = "Q3\n2011", "5" = "Q4\n2011", "6" = "Q1\n2012"
)

# Average donation rate by group over time
group_means <- organ |>
  summarise(
    mean_rate = mean(Rate),
    .by = c(treated_state, Quarter, Quarter_Num)
  )

# Colour palette (colour-blind friendly)
palette <- c("California" = "#D55E00", "Control" = "#0072B2")

ggplot(group_means, aes(
  x = Quarter_Num, y = mean_rate,
  colour = treated_state, shape = treated_state
)) +
  # Shaded post-treatment region
  annotate(
    "rect",
    xmin = 3.5, xmax = 6.5, ymin = -Inf, ymax = Inf,
    fill = "grey90", alpha = 0.5
  ) +
  # Treatment line
  geom_vline(xintercept = 3.5, linetype = "dashed", colour = "grey50") +
  # Data
  geom_line(linewidth = 1) +
  geom_point(size = 3.5) +
  # Annotations
  annotate(
    "text",
    x = 3.4, y = max(group_means$mean_rate) + 0.005,
    label = "Policy\nenacted",
    hjust = 1, size = 3.2, colour = "grey40", lineheight = 0.9
  ) +
  annotate(
    "label",
    x = 5, y = min(group_means$mean_rate) - 0.01,
    label = "Post-treatment period",
    size = 3, fill = "grey90", label.padding = unit(0.2, "lines"), colour = "grey40"
  ) +
  # Scales
  scale_x_continuous(breaks = 1:6, labels = quarter_labels) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  scale_colour_manual(values = palette) +
  scale_shape_manual(values = c("California" = 17, "Control" = 16)) +
  # Labels
  labs(
    title = "Organ Donation Rates: California vs. Control States",
    subtitle = str_wrap(
      paste(
        "Difference-in-Differences design around California's Q3 2011",
        "active-choice organ donation policy. Parallel pre-trends support",
        "the identifying assumption."
      ),
      width = 80
    ),
    x = NULL,
    y = "Donation Rate",
    colour = NULL,
    shape = NULL,
    caption = "Source: Kessler & Roth (2014) via causaldata R package"
  ) +
  # Theme
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.title.position = "plot",
    plot.subtitle = element_text(colour = "grey30", margin = margin(b = 10)),
    plot.caption = element_text(colour = "grey50", size = 9),
    legend.position = "top",
    legend.justification = "left",
    panel.grid.minor = element_blank()
  )

# --- 4. Estimate the DiD model -----------------------------------------------

# Rate = β₀ + β₁(Treated) + β₂(Post) + β₃(Treated × Post) + ε
# β₃ is the DiD estimate — the causal effect of the active-choice policy.

did_model <- lm(Rate ~ treated_state * post, data = organ)

# --- 5. Tidy regression output -----------------------------------------------

# broom::tidy gives a clean tibble of coefficients
broom::tidy(did_model, conf.int = TRUE)
