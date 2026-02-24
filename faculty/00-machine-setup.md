---
marp: true
theme: yale-dissc
paginate: true
footer: '![w:80](../assets/Yale-logo.png)'
header: 'Data-Intensive Social Science Center (DISSC) |&nbsp;https://dissc.yale.edu'
---

# Setup

These instructions cover macOS and Windows. Platform-specific steps are noted where they differ.

---

## 1. Download workshop files

- Go to the workshop repository on GitHub (link provided by your instructor)
- Click the green **Code** button, then click **Download ZIP**
- Extract the ZIP file to a location you'll remember (e.g., your Desktop or Documents folder)

> You do not need Git installed. The ZIP download includes everything you need.

---

## 2. Install R (macOS)

**Option A: Homebrew** (skip this if you don't already have Homebrew)

```
brew install r
```

**Option B: CRAN installer** (recommended for most users)

- Download the latest `.pkg` from https://cran.r-project.org/bin/macosx/
- Open the installer and follow the prompts

---

## 2. Install R (Windows)

- Download the latest `.exe` from https://cran.r-project.org/bin/windows/base/
- Run the installer and follow the prompts

---

## 3. Request an API key

Email Nicholas Warren at DISSC (dissc@yale.edu) to request an AWS Bedrock API key for Claude. **Request this before the workshop;** you'll need the key in Step 4. This key will expire after the workshop. For long-term access, contact dissc@yale.edu.

---

## 4. Configure AWS Bedrock credentials (macOS)

Open **Terminal** (`Cmd + Space`, type `Terminal`, press `Enter`) and run:

```
nano ~/.zprofile
```

This opens a text editor in Terminal. Add the two lines below, replacing `TOKEN_HERE` with your API key from Step 3:

```
export AWS_REGION="us-east-1"
export AWS_BEARER_TOKEN_BEDROCK="TOKEN_HERE"
```

Save with `Ctrl + O`, then press `Enter`. Exit with `Ctrl + X`.

---

## 4. Configure AWS Bedrock credentials (macOS, continued)

Back in Terminal, run this to load the new settings into your current session:

```
source ~/.zprofile
```

> `~/.zprofile` is a hidden config file in your home folder that macOS loads for new Terminal windows. If your Mac uses `bash` instead of `zsh` (check with `echo $SHELL`), use `~/.bash_profile` instead. If you use iTerm2 and the variables don't load, add the same lines to `~/.zshrc` as well.

> **Do not share your API key or commit it to version control.** Treat it like a password.

---

## 4. Configure AWS Bedrock credentials (Windows)

Click the Start menu, type `environment variables`, and select **Edit environment variables for your account**. Under **User variables**, click **New** to add each of the following:

| Variable | Value |
|---|---|
| `AWS_REGION` | `us-east-1` |
| `AWS_BEARER_TOKEN_BEDROCK` | your API key |

After saving, restart any open terminals or applications so they pick up the new variables.

> **Do not share your API key or commit it to version control.** Treat it like a password.

---

## 5. Install Positron

- Download and install from https://positron.posit.co/

---

## 6. Configure Positron

> If Positron was already open during Step 4, quit and reopen it so it picks up the new credentials.

- Open Positron
  - macOS: from the Dock or Finder
  - Windows: from the Start Menu or desktop shortcut
- `File > Open Folder` and select the `faculty` folder inside the workshop files you downloaded in Step 1
- When prompted, click `Yes, I trust the authors` to enable full functionality in the workspace

---

## 6. Configure Positron (continued)

- Open the Command Palette (`Cmd + Shift + P` on macOS, `Ctrl + Shift + P` on Windows), type `User Settings JSON`, and select `Preferences: Open User Settings (JSON)`
- If the file is empty or contains only `{}`, replace everything with the contents of `files/machine-setup/positron/settings.json` and save (`Cmd + S` / `Ctrl + S`)
- If you already have settings in this file, add the keys from `settings.json` into your existing JSON, separated by commas

---

## 7. Set up Positron Assistant

- Click the `Chat` icon in the left sidebar
- Click `Configure Model Providers`
- Select `Provider` as `Amazon Bedrock`
- Click `Sign In` under `Authentication` (credentials from Step 4 will load automatically)
- Select `Claude Opus 4.6` from the `Manage Models` dropdown at the bottom of the Chat panel

> If sign-in fails, quit Positron completely and reopen it, then try again.

---

## 8. Start an R session

- Open an `.R` file from the project
- Select the R installation when prompted
- If not prompted: open the Command Palette (`Cmd + Shift + P` on macOS, `Ctrl + Shift + P` on Windows) and select `Interpreter: Select`, then choose R

---

## 9. Install packages

- In the **R Console** (the panel at the bottom of Positron showing an `>` prompt), run:

  ```r
  install.packages("tidyverse")
  ```

  The example script also uses `broom` and `scales`, which are included when you install `tidyverse`.

---

## 10. Verify your setup

- In the R Console, run `library(tidyverse)`. You should see a startup message listing attached packages.
- In the Assistant chat panel, type `What is 2 + 2?` and confirm you get a response.
- If either step fails, restart Positron and retry. To check your credentials, run `echo $AWS_BEARER_TOKEN_BEDROCK` in Terminal (macOS) or `echo %AWS_BEARER_TOKEN_BEDROCK%` in Command Prompt (Windows) and confirm it prints your API key.
