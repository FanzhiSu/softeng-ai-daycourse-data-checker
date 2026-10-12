# Research Data Checker

A small teaching project for the Oxford RSE *Software Engineering in the AI-era* daycourse.

The application checks a CSV data file for a few configurable data-quality issues and produces a human-readable report.

## Development environment

The course uses GitHub Codespaces with Python. The Codespace config exposes `src/` on `PYTHONPATH`, so the package can be run without a packaging detour:

```bash
python -m research_check.cli examples/observations.csv
```

Run tests with:

```bash
pytest
```

## Course progression

The same repository is used throughout the day:

1. software design
2. coding a bounded change
3. environments and dependencies
4. software testing
5. version control and safe change
6. collaborative software development with GitHub and CI

The project declares `numpy>=1.26,<2`, so a fresh install produces a working,
reproducible environment and continuous integration passes from the start. The
dependency exercise then deliberately creates a second environment with
NumPy 2.x to demonstrate that identical source code can behave differently in a
different environment (`summary.py` uses `np.float_`, removed in NumPy 2.0).

The starter code also contains a deliberately simplistic interpretation of
duplicate sample IDs. This supports a later lesson about the limits of tests and
the need for domain knowledge.
