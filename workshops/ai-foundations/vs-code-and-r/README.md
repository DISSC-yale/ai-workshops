# AI Foundations: VS Code + R

A hands-on workshop exploring AI-assisted data analysis using R, Visual Studio Code, and Claude Code. Participants work through a Difference-in-Differences analysis of organ donation rates (Kessler & Roth, 2014) while using Claude Code to explain, iterate on, and improve the example code.

## Getting Started

1. Follow the [machine setup instructions](files/slides/00-machine-setup.pdf) to install R, VS Code, Quarto, Claude Code, and configure your credentials
2. Open this `vs-code-and-r` folder in VS Code (`File > Open Folder`)
3. Work through the [workshop guide](files/slides/01-workshop.pdf)

## Directory Structure

```
vs-code-and-r/
├── files/
│   ├── code/
│   │   ├── example.qmd              # Workshop Quarto notebook
│   │   └── data/
│   │       └── organ_donations.csv  # Organ donation rates dataset
│   ├── prompts/
│   │   └── examples.md              # Ready-to-use prompts for Claude Code
│   ├── machine-setup/
│   │   ├── vscode/
│   │   │   └── settings.json        # VS Code editor settings
│   │   └── user/
│   │       └── zprofile.txt         # Shell profile template for credentials
│   └── slides/
│       ├── 00-machine-setup.pdf     # Setup instructions
│       └── 01-workshop.pdf          # Workshop guide
├── 00-machine-setup.md              # Setup slide source
└── 01-workshop.md                   # Workshop slide source
```
