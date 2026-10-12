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
2. dependency management and reproducible environments
3. software testing
4. version control and safe change
5. collaborative software development with GitHub and CI

The starter repository intentionally leaves the NumPy dependency underspecified. This is used to demonstrate that dependency versions are part of the software and can affect behaviour even when source code is unchanged.

The starter code also contains a deliberately simplistic interpretation of duplicate sample IDs. This supports a later lesson about the limits of tests and the need for domain knowledge.
