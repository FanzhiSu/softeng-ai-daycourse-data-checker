# Practical 2 — CLI configurable measurement limits

The checker currently accepts a CSV filename and uses limits of 0–100.

**Task for VS Code Chat:** Add optional `--minimum` and `--maximum` command-line options, with defaults 0 and 100. Pass them to `check_file` and the range checker. Preserve all other behaviour.

**Manual checks (no pytest yet):**

```bash
python -m research_check examples/observations.csv
python -m research_check examples/observations.csv --maximum 9
```

The second command should report more out-of-range measurements. Inspect the diff before accepting the AI change.

**Ruff:** `python -m pip install ruff`, `ruff check .`, `ruff format .`.

**Going further:** Add `--minimum 11` and compare output.
