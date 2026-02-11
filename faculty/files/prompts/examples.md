# Example Prompts for the Positron Assistant

Copy and paste these prompts into the Positron Assistant to explore how AI can help with your R workflow. Each builds on the `files/code/example.R` script.

---

## 1. Explain the code

```
Walk me through what this script does step by step. Explain the statistical method and what each section of the code is doing.
```

## 2. Interpret the regression output

```
Explain the coefficients from the DiD regression model in plain language. What does the interaction term tell us? Is the effect statistically significant?
```

## 3. Check the parallel trends assumption

```
Add a formal parallel trends test to this script. Before the policy intervention, are the trends in donation rates for California and the control states statistically indistinguishable?
```

## 4. Add robust standard errors

```
Update the DiD regression to use clustered standard errors at the state level. Explain why this matters for difference-in-differences estimation.
```

## 5. Create a summary statistics table

```
Add a table of summary statistics for the organ donation data, broken down by treatment group and pre/post period. Format it so it could be included in a paper.
```

## 6. Add a placebo test

```
Implement a placebo test using a fake treatment date (e.g., one quarter earlier). If the placebo DiD estimate is significant, what would that imply about our research design?
```

## 7. Improve the plot for publication

```
Restyle the existing plot so it is suitable for an academic journal submission. Use a clean black-and-white theme, make sure it would be readable in grayscale, and add a caption with the DiD point estimate.
```

## 8. Export results to a file

```
Save the regression results and the plot to an output/ folder. Export the coefficient table as a CSV and the plot as a high-resolution PNG.
```

## 9. Explain a concept

```
I'm teaching Difference-in-Differences to undergraduates next week. Give me a simple, non-technical analogy I can use to explain the method and its key assumption.
```

## 10. Adapt the analysis for a new dataset

```
I have a dataset with columns state, year, outcome, and treated. The treatment began in 2015 for states in the treatment group. Adapt this script to work with my data instead.
```
