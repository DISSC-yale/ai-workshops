# Faculty Workshop

Complete the [setup instructions](machine-setup.md) before starting.

## Goals

- Learn how an LLM assistant can support your research workflow in R
- Practice using AI to explain, iterate on, and extend a real statistical analysis
- Understand the end-to-end setup so you can use these tools independently after the workshop

## How it works

In this workshop you use **Positron**, a data-science IDE built by the makers of RStudio, with a built-in chat assistant. The assistant is powered by **Claude Opus 4.6**, a large language model made by Anthropic.

Your prompts and code are sent to Claude through **AWS Bedrock**, Amazon's managed AI service, running on Yale's AWS account. This matters for data security:

- **Your data is not used for training.** AWS Bedrock does not use your prompts or outputs to train any models.
- **Your data is not shared.** Model providers (including Anthropic) do not have access to your inputs, outputs, or logs. Models run in isolated AWS accounts that providers cannot access.
- **Enterprise compliance.** AWS Bedrock is HIPAA eligible, SOC and ISO certified, and GDPR compliant.

In short: you get the benefits of a frontier LLM without your research data leaving your institution's AWS environment or being used to improve future models.

## 1. Run the example

The example script (`files/code/example.R`) runs a Difference-in-Differences analysis on organ donation rates. It examines whether California's Q3 2011 "active choice" policy (requiring residents to indicate Yes/No on organ donation when renewing their driver's license) caused an increase in donation rates, using other states as controls.

**Data source:** Kessler, Judd B. and Alvin E. Roth. 2014. "Don't Take 'No' For An Answer: An Experiment With Actual Organ Donor Registrations." NBER Working Paper 20378. <https://doi.org/10.3386/w20378>. Dataset via the [`causaldata`](https://cran.r-project.org/package=causaldata) R package, featured in *The Effect* by Nick Huntington-Klein.

The script:
1. Loads `files/code/data/organ_donations.csv`
2. Creates treatment/control and pre/post indicators
3. Plots average donation rates over time for California vs. control states
4. Estimates a DiD regression model
5. Outputs a tidy table of coefficients

To run it:
- Open `files/code/example.R` from the file explorer
- Click the **Run** button (play icon) to run the code
- View the output in the Console and Plots pane

## 2. Use the Assistant

- Make sure `files/code/example.R` is open in the editor so the Assistant has context
- Click the `Chat` icon in the left sidebar (glasses icon)
- Try the example prompts in `files/prompts/examples.md` (copy and paste them into the Assistant)
- You can also highlight code in the editor, right-click, and send it to the Assistant for explanation
