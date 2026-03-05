# Example Prompts for Claude Code

Type these prompts directly into Claude Code. They follow the four phases of the workshop and build on `files/code/example.qmd`.

---

## Phase 1: Concept & Idea Generation

### 1. Explain the method

```
What is Difference-in-Differences? When is it appropriate to use, and what are its key assumptions?
```

### 2. Discuss the research design

```
I have organ donation rate data for 27 states across 6 quarters. California introduced an "active choice" policy in Q3 2011. How would I set up a DiD analysis to estimate the policy's effect?
```

---

## Phase 2: Script Creation

### 3. Import and prepare data

```
Read in data/organ_donations.csv and prepare it for a DiD analysis. Write the code in the Phase 2 section of files/code/example.qmd.
```

### 4. Preview the data

```
Run the setup and import chunks in example.qmd and show me a summary of the data. How many states, quarters, and observations are there?
```

---

## Phase 3: Analysis & Visualization

### 5. Interpret the regression output

```
Look at the DiD model in example.qmd. Explain the coefficients in plain language. What does the interaction term tell us? Is the effect statistically significant?
```

### 6. Change the plot scales

```
Change the y-axis in the parallel trends plot to show values from 0% to 100% instead of the current zoomed-in range.
```

### 7. Restyle for publication

```
Switch the plot in example.qmd to a black-and-white theme suitable for an academic journal. Make sure it would be readable in grayscale and add a caption with the DiD point estimate.
```

### 8. Add robust standard errors

```
Update the DiD regression in example.qmd to use clustered standard errors at the state level. Explain why this matters for DiD estimation.
```

### 9. Create a summary statistics table

```
Add a summary statistics table to example.qmd, broken down by treatment group and pre/post period. Format it so it could be included in a paper.
```

### 10. Export results

```
Save the regression results and the plot from example.qmd to an output/ folder. Export the coefficient table as a CSV and the plot as a high-resolution PNG.
```

---

## Phase 4: Debugging

### 11. Find and fix bugs

```
Look at the Phase 4 section of files/code/example.qmd. Each chunk has one or more bugs. Find and fix all of them.
```

### 12. Explain what went wrong

```
For each bug you fixed in Phase 4, explain what the error was and how a beginner could recognize the same mistake in their own code.
```

---

## Bring your own question

### 13. Apply to your own research

```
I have a dataset with [describe your columns]. I want to test whether [describe your research question]. What analysis approach would you recommend, and can you sketch out the R code?
```
