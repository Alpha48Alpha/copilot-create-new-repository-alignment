# Prompt Testing Framework

A small toolkit demonstrating how prompts can be programmatically tested and evaluated using structured prompts and evaluation metrics.

## Overview

This framework provides lightweight utilities for systematically testing and comparing prompts across language models. It is designed for researchers and engineers who want to move beyond manual prompt tweaking toward reproducible, data-driven prompt evaluation.

## Features

- **Structured prompt templates** — Define prompts with placeholders for systematic variation
- **Evaluation metrics** — Measure output quality using configurable scoring functions
- **Batch testing** — Run multiple prompt variants against one or more test cases simultaneously
- **Result logging** — Save structured output for downstream analysis and reporting
- **Comparison utilities** — Compare prompt variants side-by-side with summary statistics

## Getting Started

### Prerequisites

- Python 3.9 or higher
- API access to a supported LLM provider (e.g., OpenAI, Anthropic, or a local model endpoint)

### Installation

```bash
git clone https://github.com/Alpha48Alpha/copilot-create-new-repository-alignment.git
cd copilot-create-new-repository-alignment/projects/prompt-testing-framework
pip install -r requirements.txt
```

### Basic Usage

1. **Define a prompt template**

   ```python
   template = "Summarize the following text in {max_words} words or fewer:\n\n{text}"
   ```

2. **Define test cases**

   ```python
   test_cases = [
       {"text": "...", "max_words": 50},
       {"text": "...", "max_words": 100},
   ]
   ```

3. **Run evaluation**

   ```python
   from framework import evaluate_prompt

   results = evaluate_prompt(template, test_cases, metrics=["length_compliance", "coherence"])
   print(results.summary())
   ```

## Evaluation Metrics

| Metric | Description |
|--------|-------------|
| `length_compliance` | Checks whether the output respects word or character constraints |
| `coherence` | Scores fluency and logical consistency of the response |
| `faithfulness` | Measures how well the output reflects the source content |
| `instruction_adherence` | Evaluates whether the model followed all explicit instructions |

## Project Structure

```
prompt-testing-framework/
├── README.md           # This file
├── requirements.txt    # Python dependencies
├── framework/
│   ├── __init__.py
│   ├── evaluate.py     # Core evaluation logic
│   ├── metrics.py      # Built-in metric implementations
│   └── templates.py    # Prompt template utilities
└── examples/
    ├── summarization.py
    └── instruction_following.py
```

## Contributing

See the root [CONTRIBUTING.md](../../CONTRIBUTING.md) for contribution guidelines.

## License

MIT License — see [LICENSE](../../LICENSE) for details.
