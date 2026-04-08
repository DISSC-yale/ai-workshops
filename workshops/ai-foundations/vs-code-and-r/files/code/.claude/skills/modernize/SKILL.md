---
name: modernize
description: Convert R code to modern tidyverse style
---

Refactor the given R script to modern tidyverse conventions:
- Use the native pipe `|>` instead of `%>%` or nested calls
- Replace `$` column access with `dplyr::pull()` or tidy eval
- Replace `for` loops with `purrr::map()` or vectorized alternatives
- Use `read_csv()` instead of `read.csv()`
- Use `tibble()` instead of `data.frame()`
- Use `snake_case` for all variable and function names
- Use `.by` argument in `summarise()`/`mutate()` instead of `group_by() |> ... |> ungroup()`
- Add `library()` calls at the top for any new packages

Preserve the original logic. Add comments where the refactored
version behaves differently (e.g., stringsAsFactors defaults).
