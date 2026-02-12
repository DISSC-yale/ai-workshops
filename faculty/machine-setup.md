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

## 8. Install packages

- In the R Console, run:

  ```r
  install.packages("tidyverse")
  ```