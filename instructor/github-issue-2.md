# Document how to run the checker on your own data

## Interface

Add a short subsection to `README.md` titled **Running on your own data** that
shows how to point the checker at a CSV file:

```bash
python -m research_check.cli path/to/your-data.csv
```

## Boundary

- Do not change validator behaviour, defaults or example data.
- Do not change any source files.
- Do not change existing tests.

## Acceptance

- `README.md` contains the new subsection and the example command.
- `pytest -q` still passes.
- `git diff` touches only `README.md`.
