# Setup

> **Note:** These instructions cover macOS and Windows. Platform-specific steps are noted where they differ.

## 1. Install R

**macOS Option A: Homebrew**

```
brew install r
```

**macOS Option B: CRAN installer**

- Download the latest `.pkg` from <https://cran.r-project.org/bin/macosx/>
- Open the installer and follow the prompts

**Windows**

- Download the latest `.exe` from <https://cran.r-project.org/bin/windows/base/>
- Run the installer and follow the prompts

## 2. Request an API key

Email Nicholas Warren at DISSC (dissc@yale.edu) to request an AWS Bedrock API key for Claude. **Request this before the workshop;** you'll need the key in Step 3.

## 3. Configure AWS Bedrock credentials

**macOS**

Copy the contents of `files/machine-setup/user/zprofile.txt` into `~/.zprofile`, replacing `TOKEN_HERE` with the API key from the previous step, then run:

```
source ~/.zprofile
```

**Windows**

Open System Properties > Environment Variables > User variables and add the following, replacing `TOKEN_HERE` with your API key:

| Variable | Value |
|---|---|
| `AWS_REGION` | `us-east-1` |
| `AWS_BEARER_TOKEN_BEDROCK` | your API key |

After saving, restart any open terminals or applications so they pick up the new variables.

## 4. Install Positron

- Download and install from <https://positron.posit.co/>

## 5. Configure Positron

> **Note:** If Positron is already open, restart it after configuring credentials so it picks up the new values.

- Open Positron
  - macOS: from the Dock or Finder
  - Windows: from the Start Menu or desktop shortcut
- `File > Open Folder` and select the `faculty` folder (not the repository root)
- Open the Command Palette (`Cmd + Shift + P` on macOS, `Ctrl + Shift + P` on Windows) and select `Preferences: Open User Settings (JSON)`
- If the file is empty, paste the full contents of `files/machine-setup/positron/settings.json` and save. If you already have settings, merge the keys from that file into your existing JSON.

## 6. Set up Positron Assistant

- Click the `Chat` icon in the left sidebar
- Click `Configure Model Providers`
- Select `Provider` as `Amazon Bedrock`
- Click `Sign In` under `Authentication` (credentials from Step 3 will load automatically)
- Select `Claude Opus 4.6` from the `Manage Models` dropdown at the bottom of the Chat panel

## 7. Start an R session

- Open an `.R` file from the project
- Select the R installation when prompted
- If not prompted: open the Command Palette (`Cmd + Shift + P` on macOS, `Ctrl + Shift + P` on Windows) and select `Interpreter: Select`, then choose R

## 8. Install packages

- In the R Console, run:

  ```r
  install.packages("tidyverse")
  ```

  The example script also uses `broom` and `scales`, which are installed automatically as part of `tidyverse`.
