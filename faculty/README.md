# Faculty Workshop

A hands-on workshop for university faculty exploring AI-assisted data analysis using R and the Positron IDE. Participants work through a Difference-in-Differences analysis of organ donation rates (Kessler & Roth, 2014) while using an LLM assistant to explain, iterate on, and improve the example code.

## Getting Started

1. Follow the [machine setup instructions](files/slides/00-machine-setup.pdf) to install R, Positron, and configure your credentials
2. Open this `faculty` folder in Positron (`File > Open Folder`)
3. Work through the [workshop guide](files/slides/01-workshop.pdf)

## Directory Structure

```
faculty/
├── files/
│   ├── code/
│   │   ├── example.R                # Example R script (DiD analysis)
│   │   └── data/
│   │       └── organ_donations.csv  # Organ donation rates dataset
│   ├── prompts/
│   │   └── examples.md              # Ready-to-use prompts for the assistant
│   ├── machine-setup/
│   │   ├── positron/
│   │   │   └── settings.json        # Positron editor settings
│   │   └── user/
│   │       └── zprofile.txt         # Shell profile template for credentials
│   └── slides/
│       ├── 00-machine-setup.pdf     # Setup instructions
│       └── 01-workshop.pdf          # Workshop guide
├── 00-machine-setup.md              # Setup slide source
└── 01-workshop.md                   # Workshop slide source
```
