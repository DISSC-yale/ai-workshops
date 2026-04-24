# AI Foundations: VS Code + R

A hands-on workshop exploring AI-accelerated data analysis using R, Visual Studio Code, and Claude Code. Participants work through a Difference-in-Differences analysis of organ donation rates (Kessler & Roth, 2014) while using Claude Code to explain, iterate on, and improve the example code.

The workshop runs in a sandboxed Docker container ([claude-sandbox](https://github.com/DISSC-yale/claude-sandbox)) with R, Python, and Claude Code pre-installed. Two 45-minute sessions separated by a 45-minute lunch break:

- **AI Foundations I: Setup & Tools** | Installing Docker, VS Code, and Claude Code; orientation to the tools
- **AI Foundations II: AI-Accelerated Research** | Hands-on exercises and best practices with Claude Code

## Getting Started

1. Follow [AI Foundations I](files/slides/ai-foundations-i-setup-and-tools.pdf) to install Docker Desktop, VS Code, and configure your credentials
2. Open the `claude-sandbox` folder in VS Code and reopen in a container
3. Work through [AI Foundations II](files/slides/ai-foundations-ii-ai-accelerated-research.pdf)

## Directory Structure

```
vs-code-and-r/
├── files/
│   ├── code/                          # Workshop files (placed in claude-sandbox/workspace/)
│   │   ├── example.qmd               # Workshop Quarto notebook
│   │   ├── data/
│   │   │   └── organ_donations.csv   # Organ donation rates dataset
│   │   └── .claude/
│   │       └── skills/
│   │           └── modernize/
│   │               └── SKILL.md      # Custom Claude Code skill
│   ├── prompts/
│   │   └── examples.md               # Ready-to-use prompts for Claude Code
│   ├── machine-setup/
│   │   ├── claude/
│   │   │   ├── settings.json         # Claude Code safety settings (reference)
│   │   │   └── settings-README.md    # Documentation of safety settings
│   │   ├── vscode/
│   │   │   └── settings.json         # VS Code editor settings (reference)
│   │   └── user/
│   │       └── zprofile.txt          # Shell profile template for credentials
│   └── slides/
│       ├── ai-foundations-i-setup-and-tools.pdf
│       └── ai-foundations-ii-ai-accelerated-research.pdf
├── ai-foundations-i-setup-and-tools.md       # AI Foundations I slide source
└── ai-foundations-ii-ai-accelerated-research.md  # AI Foundations II slide source
```
