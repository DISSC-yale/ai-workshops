---
marp: true
theme: default
paginate: true
footer: Yale | Data-Intensive Social Science Center (DISSC)
---

# AI Pair Programming at Yale
## Beginner Workshop

Nicholas Warren
Lead, Artificial Intelligence & Machine Learning

---

# Agenda

- AI fundamentals: LLMs, agents, and tools
- Planning with AI: the product roadmap approach
- Pair programming with AI: prompts, iteration, and validation
- Hands-on: Reviewing your code for publication

---

# Prerequisites

You should have:

- VS Code installed
- Git installed with a working GitHub account
- Claude Code installed with an active Claude account
- A code project or script to work with (Python, TypeScript, R, etc.)

If you're missing any of these, pair up with someone nearby.

---

# Top 4 Workshop Takeaways

By the end of this workshop, you will have:

1. **A mental model for AI tools**: LLMs, agents, context windows, and their tradeoffs

2. **A framework for planning AI tasks**: Think like a product manager, not a programmer

3. **A pair programming workflow**: Prompts, iteration, validation, and version control

4. **A validation mindset**: Always verify AI output before trusting it

---

# AI Fundamentals

---

# What is an LLM?

**Large Language Model**

- Deep learning models trained on massive text datasets
- Predict the next word based on patterns
- Process and generate natural language

> "Statistical prediction machines that repeatedly predict the next word in a sequence."
> — [IBM](https://www.ibm.com/think/topics/large-language-models)

---

# How LLMs Work

- Trained on internet-scale text (books, code, articles, Wikipedia, Reddit)
- Learn patterns, not facts
- Generate responses token by token

**Key insight:** LLMs don't "know" things, they predict likely outputs

---

# LLM Limitations

- Only as good as training data
- Knowledge has a cutoff date
- Can confidently produce false information ("hallucinations")
- No access to real-time information (without tools)

---

# Context Windows

LLMs have a "context window": the amount of text they can consider at once

- Like short-term memory with a fixed size
- Includes your prompt and the conversation history
- When the window fills up, earlier context gets dropped

**Why this matters:** Context limits determine task size. Big tasks exhaust context, causing the AI to "forget" earlier work. This is why planning matters: your roadmap's grain size must fit within context limits.

---

# What is an Agent?

- LLM that can take actions, not just generate text
- Dynamically chooses tools and next steps
- Works toward goals with minimal supervision
- Think agency: agents have autonomy to decide how to accomplish tasks

> "Systems where LLMs dynamically direct their own processes and tool usage, maintaining control over how they accomplish tasks."
> — [Anthropic](https://www.anthropic.com/engineering/building-effective-agents)

---