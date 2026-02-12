---
marp: true
theme: yale-dissc
paginate: true
footer: '![w:80](../assets/Yale-logo.png)'
header: 'Data-Intensive Social Science Center (DISSC) | https://dissc.yale.edu'
---

# AI Faculty Workshop

<br>

**Nicholas Warren**
Lead, Artificial Intelligence & Machine Learning program, DISSC
nick.warren@yale.edu

**Maurice Dalton**
Lead, Data Engineering and Solution Team, DISSC

---

## Prerequisites

Complete the [setup instructions](00-machine-setup.md) before starting.

---

## Goals

- Learn how an LLM assistant can support your research workflow in R
- Practice using AI to explain, iterate on, and extend a real statistical analysis
- Understand the end-to-end setup so you can use these tools independently after the workshop

---

## How it works

In this workshop you use **Positron**, a data-science IDE built by the makers of RStudio, with a built-in chat assistant. The assistant is powered by **Claude Opus 4.6**, a large language model made by Anthropic.

Your prompts and code are sent to Claude through **AWS Bedrock**, Amazon's managed AI service, running on Yale's AWS account.

---

## Data security

- **Your data is not used for training.** AWS Bedrock does not use your prompts or outputs to train any models.
- **Your data is not shared.** Model providers (including Anthropic) do not have access to your inputs, outputs, or logs. Models run in isolated AWS accounts that providers cannot access.
- **Enterprise compliance.** AWS Bedrock is HIPAA eligible, SOC and ISO certified, and GDPR compliant.

In short: you get the benefits of a frontier LLM without research data leaving Yale's AWS environment or being used to improve future models.

---

## 1. Run the example

The example script (`files/code/example.R`) runs a Difference-in-Differences analysis on organ donation rates. It examines whether California's Q3 2011 "active choice" policy (requiring residents to indicate Yes/No on organ donation when renewing their driver's license) caused an increase in donation rates, using other states as controls.

**Data source:** Kessler, Judd B. and Alvin E. Roth. 2014. "Don't Take 'No' For An Answer: An Experiment With Actual Organ Donor Registrations." NBER Working Paper 20378. Dataset via the `causaldata` R package, featured in *The Effect* by Nick Huntington-Klein.

---

## 1. Run the example (continued)

1. Loads `files/code/data/organ_donations.csv`
2. Creates treatment/control and pre/post indicators
3. Plots average donation rates over time for California vs. control states
4. Estimates a DiD regression model
5. Outputs a tidy table of coefficients

To run it:
- Open `files/code/example.R` from the file explorer
- Click the **Run** button (play icon) and view the output in the Console and Plots pane

---

## 2. Use the Assistant

- Make sure `files/code/example.R` is open in the editor so the Assistant has context
- Click the `Chat` icon in the left sidebar (glasses icon)
- Try the example prompts in `files/prompts/examples.md` (copy and paste them into the Assistant)
- You can also highlight code in the editor, right-click, and send it to the Assistant for explanation

---

## Example Prompts

Copy and paste these prompts into the Assistant. Each builds on the `files/code/example.R` script.

---

### 1. Explain the code

> Walk me through what this script does step by step. Explain the statistical method and what each section of the code is doing.

---

### 2. Interpret the regression output

> Explain the coefficients from the DiD regression model in plain language. What does the interaction term tell us? Is the effect statistically significant?

---

### 3. Check the parallel trends assumption

> Add a formal parallel trends test to this script. Before the policy intervention, are the trends in donation rates for California and the control states statistically indistinguishable?

---

### 4. Add robust standard errors

> Update the DiD regression to use clustered standard errors at the state level. Explain why this matters for difference-in-differences estimation.

---

### 5. Create a summary statistics table

> Add a table of summary statistics for the organ donation data, broken down by treatment group and pre/post period. Format it so it could be included in a paper.

---

### 6. Add a placebo test

> Implement a placebo test using a fake treatment date (e.g., one quarter earlier). If the placebo DiD estimate is significant, what would that imply about our research design?

---

### 7. Improve the plot for publication

> Restyle the existing plot so it is suitable for an academic journal submission. Use a clean black-and-white theme, make sure it would be readable in grayscale, and add a caption with the DiD point estimate.

---

### 8. Export results to a file

> Save the regression results and the plot to an output/ folder. Export the coefficient table as a CSV and the plot as a high-resolution PNG.

---

### 9. Explain a concept

> I'm teaching Difference-in-Differences to undergraduates next week. Give me a simple, non-technical analogy I can use to explain the method and its key assumption.

---

### 10. Adapt the analysis for a new dataset

> I have a dataset with columns state, year, outcome, and treated. The treatment began in 2015 for states in the treatment group. Adapt this script to work with my data instead.
