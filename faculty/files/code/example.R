# =============================================================================
# Difference-in-Differences Example
# Dataset: Organ Donation Rates (Kessler & Roth, 2014)
#
# The question:
#   Did California's 2011 "active choice" organ donation policy affect
#   organ donor registration rates?
#
# The idea:
#   In Q3 2011, California started requiring residents to answer Yes or No
#   about organ donation when renewing their driver's license. Other states
#   did not change their policy. By comparing how donation rates changed in
#   California versus other states before and after the policy, we can
#   estimate whether the policy itself caused the change (rather than
#   background trends that would have happened anyway).
#
# The method:
#   Difference-in-Differences (DiD) compares two differences:
#     1. How much did California's donation rate change from before to after?
#     2. How much did the control states' rate change over the same period?
#   The difference between these two differences isolates the policy effect.
#
# Source: causaldata R package; featured in "The Effect" by N. Huntington-Klein
# =============================================================================

# Load packages:
#   tidyverse: data manipulation and plotting
#   broom:     converts regression output into tidy tables
library(tidyverse)
library(broom)

# --- 1. Load the data --------------------------------------------------------
# Each row is a state-quarter observation with an organ donation rate (Rate).
# Quarter_Num counts from 1 (Q4 2010) to 6 (Q1 2012).

organ <- read_csv("files/code/data/organ_donations.csv", show_col_types = FALSE)

# Preview the data: see column names, types, and first few values
glimpse(organ)

# What to look for:
#   Each row is one state in one quarter. The key columns are:
#     State       : which state (California, Alaska, etc.)
#     Quarter_Num : time period (1 through 6)
#     Rate        : the organ donation rate for that state and quarter
#   The full dataset has 162 rows (27 states including DC, x 6 quarters).

# --- 2. Create DiD variables -------------------------------------------------
# DiD needs two key variables:
#   treated_state: was this state affected by the policy? (California vs. Control)
#   post:          did this observation happen after the policy took effect?

organ <- organ |>
  mutate(
    # Label each state as "California" (treated) or "Control" (not treated).
    # Setting "Control" as the first factor level makes it the reference group
    # in the regression, so coefficients measure effects relative to controls.
    treated_state = factor(
      if_else(State == "California", "California", "Control"),
      levels = c("Control", "California")
    ),
    # The policy took effect in Q3 2011, which is Quarter_Num 4.
    # TRUE for quarters 4, 5, 6 (after the policy); FALSE for 1, 2, 3 (before).
    post = Quarter_Num >= 4
  )

# --- 3. Visualise parallel trends & treatment effect -------------------------
# Before running the regression, we plot the data to check a critical
# assumption: that California and the control states were following similar
# trends BEFORE the policy. If the lines move roughly in parallel before the
# dashed line, DiD is a plausible strategy.

# Quarter labels for the x-axis
quarter_labels <- c(
  "1" = "Q4\n2010", "2" = "Q1\n2011", "3" = "Q2\n2011",
  "4" = "Q3\n2011", "5" = "Q4\n2011", "6" = "Q1\n2012"
)

# Compute average donation rate per group per quarter
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
  # Vertical dashed line marking when the policy took effect
  geom_vline(xintercept = 3.5, linetype = "dashed", colour = "grey50") +
  # Lines and points showing donation rates over time
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
        "active-choice organ donation policy."
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

# How to read the plot:
#   Look at the two lines BEFORE the dashed vertical line (the pre-treatment
#   period). If they move roughly in parallel, it suggests both groups were on
#   similar trajectories before California's policy. This is the "parallel
#   trends" assumption, and it's what makes DiD credible.
#
#   Now look AFTER the dashed line. If California's line diverges from the
#   control line, that gap is the visual estimate of the policy's effect.

# --- 4. Estimate the DiD model -----------------------------------------------
# The regression below estimates four things at once:
#
#   Rate = B0 + B1(treated_state) + B2(post) + B3(treated_state x post) + error
#
#   B0 (Intercept)            = average rate for Control states, before the policy
#   B1 (treated_state)        = how much higher/lower California was before the policy
#   B2 (post)                 = how much rates changed over time in Control states
#   B3 (treated_state x post) = the DiD estimate: the extra change in California
#                                beyond what the control states experienced
#
# B3 is what we care about. If it is significantly different from zero,
# the policy changed donation rates beyond the background trend.

did_model <- lm(Rate ~ treated_state * post, data = organ)

# --- 5. Tidy regression output -----------------------------------------------
# tidy() converts the model into a clean table with one row per coefficient,
# including the estimate, standard error, p-value, and confidence interval.

tidy(did_model, conf.int = TRUE)

# How to read the regression output:
#   The table has one row per coefficient. Focus on the last row:
#     "treated_stateCalifornia:postTRUE" is the interaction term (B3).
#     This is the DiD estimate of the policy's causal effect.
#
#   If B3 is significantly different from zero (p-value below 0.05), the
#   policy had a detectable effect on donation rates beyond the background
#   trend observed in control states.
#
#   The other rows provide context:
#     (Intercept)             : baseline rate for control states before the policy
#     treated_stateCalifornia : California's rate vs. controls before the policy
#     postTRUE                : change in control states' rate after Q3 2011
