# Setup

## 1. Install R

**Option A: Homebrew**

```
brew install r
```

**Option B: CRAN installer**

- Download the latest `.pkg` from <https://cran.r-project.org/bin/macosx/>
- Open the installer and follow the prompts

## 2. Request an API key

Email Nicholas Warren at DISSC (dissc@yale.edu) to request an AWS Bedrock API key for Claude.

## 3. Configure AWS Bedrock credentials

Copy the contents of `files/machine-setup/user/zprofile.txt` into `~/.zprofile`, replacing `TOKEN_HERE` with the API key from the previous step, then run:

```
source ~/.zprofile
```

## 4. Install Positron

- Download and install from <https://positron.posit.co/>

## 5. Configure Positron

> **Note:** If Positron is already open, restart it after modifying `~/.zprofile` so it picks up the new credentials.

- Open Positron (from the Dock or via `open -a Positron`)
- `File > Open Folder` and select the project directory
- `Cmd + Shift + P` > `Preferences: Open User Settings (JSON)`
- Copy the contents of `files/machine-setup/positron/settings.json` into that file and save

## 6. Set up Positron Assistant

- Click the `Chat` icon in the left sidebar
- Click `Configure Model Providers`
- Select `Provider` as `Amazon Bedrock`
- Click `Sign In` under `Authentication` (credentials from `.zprofile` will load automatically)

## 7. Start an R session

- Open an `.R` file from the project
- Select the R installation when prompted
- If not prompted: `Cmd + Shift + P` > `Interpreter: Select` > choose R

# Course

## 1. Install packages

- In the R Console, run:

  ```r
  install.packages("tidyverse")
  ```

## 2. Run the example

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

## 3. Use the Assistant

- Make sure `files/code/example.R` is open in the editor so the Assistant has context
- Click the `Chat` icon in the left sidebar (glasses icon)
- Try the example prompts in `files/prompts/examples.md` (copy and paste them into the Assistant)
- You can also highlight code in the editor, right-click, and send it to the Assistant for explanation
