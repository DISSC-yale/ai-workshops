# Claude Code Safety Settings

This `settings.json` file adds safety guardrails to reduce the risk of accidental file deletion, data loss, or changes outside your project.

## What This File Does

### Commands Claude is NEVER allowed to run

Even if Claude asks, these commands are blocked:

**File operations:**
- `rm`, `rmdir`: Delete files or folders
- `mv`: Move or rename files
- `cp`: Copy files
- `> *`: Overwrite a file via shell redirect

**System and permissions:**
- `sudo`: Run commands as administrator
- `chmod`, `chown`: Change file permissions or ownership
- `kill`, `pkill`: Kill running processes

**Downloading and installing software:**
- `curl`, `wget`: Download from the internet
- `brew`: Install/uninstall software (macOS)
- `apt`: Install/uninstall software (Linux)
- `pip`: Install/uninstall Python packages
- `npm`, `npx`: Install/run Node.js packages

**Git (destructive operations):**

These are blocked because they can lose work. If you start using Git, you can remove these from the "deny" list.

- `git push`: Send changes to a remote server
- `git reset`: Undo commits (can lose changes)
- `git rebase`: Rewrite commit history
- `git branch -D`: Force-delete a branch
- `git checkout --`, `git restore`: Discard uncommitted changes
- `git clean`: Delete untracked files

**macOS-specific:**
- `open`: Open files or launch applications
- `osascript`: Run AppleScript commands
- `defaults`: Change macOS system settings

### Commands Claude can run WITHOUT asking

These are all read-only or safe to run repeatedly:

**Inspecting files:**
- `cat`, `ls`, `pwd`, `head`, `tail`, `wc`, `which`: View file contents and directories

**R and Quarto:**
- `Rscript`, `R -e`: Run R code
- `quarto render`, `quarto preview`: Render Quarto documents

**Version checks:**
- `R --version`, `quarto --version`

**Git (read-only):**
- `git status`, `git diff`, `git log`: View project history

### Commands Claude must ASK about

- `echo`: Can print text or write to files

### Everything else

Operations like editing files will PROMPT you for permission each time, so you can review before approving.

## Sandbox Protection

The sandbox confines Claude to your project folder using OS-level enforcement (macOS Seatbelt). Even if a command slips past the permission rules, the operating system will block it.

**Allowed write locations:**
- `.`: Your project directory
- `~/.claude`: Claude's configuration and memory
- `/tmp`: Temporary files (needed by R and Quarto)

**Blocked write locations:**
- `~/`: Your home folder
- `/var`, `/etc`, `/usr`: System directories

**Allowed read locations:**
- `.`: Your project files
- `~/.claude`: Claude's configuration
- `~/Library/R`, `/Library/Frameworks/R.framework`, `/usr/local/lib/R`: R packages and libraries
- `/tmp`: Temporary files

**Blocked read locations:**
- `~/`: Your home folder (documents, downloads, etc.)
- `/var`, `/etc`: System configuration and data

## Customizing the Settings

To allow a blocked command:

1. Open `~/.claude/settings.json`
2. Find the command in the `"deny"` list
3. Delete that line (or move it to `"ask"` if you want to be prompted)
4. Save the file

Claude Code will use the updated settings immediately.
