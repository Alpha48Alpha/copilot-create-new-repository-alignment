# LLM Failure Analysis Dataset

A research-style dataset documenting common failure patterns in language models.

## Overview

This dataset catalogs real-world and synthetic examples of large language model failures, organized by failure type. It is intended to support evaluation research, benchmark development, and the study of model reliability.

## Failure Categories

### Reasoning Errors

Cases where the model arrives at an incorrect conclusion through flawed logical or inferential steps:

- Invalid deductive chains
- Arithmetic mistakes in multi-step problems
- Incorrect application of rules to novel scenarios
- Contradictory statements within a single response

### Hallucinated Citations

Instances where the model confidently references non-existent or inaccurate sources:

- Fabricated paper titles, authors, or publication venues
- Incorrect DOIs, URLs, or ISBNs
- Real papers misattributed to wrong authors or dates
- Fictional quotes attributed to real people

### Instruction-Following Failures

Examples where the model does not adhere to explicit user instructions:

- Ignoring format constraints (e.g., word limits, output structure)
- Incomplete task completion
- Performing unrequested operations
- Losing track of instructions in long contexts

### Prompt Injection Vulnerabilities

Cases where adversarial input causes the model to override its intended behavior:

- System prompt leakage via user-turn injections
- Role-play jailbreaks
- Indirect injection through external content (e.g., documents, web pages)
- Data exfiltration attempts via crafted inputs

## Dataset Format

Each entry includes:

| Field | Description |
|-------|-------------|
| `id` | Unique identifier |
| `category` | Failure type (see categories above) |
| `prompt` | The input provided to the model |
| `model_response` | The model's actual output |
| `expected_behavior` | Description of the correct or safe response |
| `failure_description` | Explanation of what went wrong and why |
| `severity` | Low / Medium / High |

## Applications

- Training evaluation classifiers
- Red-teaming and safety research
- Prompt engineering case studies
- Benchmark construction

## Contributing

See the root [CONTRIBUTING.md](../../CONTRIBUTING.md) for contribution guidelines.

## License

MIT License — see [LICENSE](../../LICENSE) for details.
