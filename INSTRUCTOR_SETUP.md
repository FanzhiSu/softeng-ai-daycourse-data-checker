# Instructor setup

## One repository all day

Use a template repository so each participant gets a personal copy. They should launch one Codespace from that repository and keep it open throughout the day.

Suggested initial state:

- `requirements.txt` is intentionally absent.
- `pyproject.toml` declares `numpy>=1.0`, so a fresh install may select NumPy 2.x.
- `src/research_check/summary.py` uses `np.float_`, creating a clear NumPy 2 compatibility failure.
- `.github/workflows/tests.yml` is present but will become useful once participants create `requirements.txt` during the dependency exercise.
- `tests/test_smoke.py` contains one simple test; participants extend the suite later.

## Practical 2 instructor sequence

1. Ask participants to open the Codespace and run:

```bash
python -m research_check.cli examples/observations.csv
```

2. The starter environment should fail with an `AttributeError` referring to `np.float_` under NumPy 2.x.
3. Demonstrate creation of a virtual environment and installation of `numpy==1.26.4`.
4. Rerun successfully.
5. Have participants create `requirements.txt` containing `numpy==1.26.4` and `pytest>=8,<9`.
6. Ask them to remove/recreate the environment and install from the requirements file.

## Practical 3 instructor sequence

The duplicate-ID behaviour is intentionally simplistic. Participants can ask AI to characterise it after they have learned the mechanics of writing/running tests. Do not explain the domain issue yet.

## Practical 4 instructor sequence

Participants should have several genuine files changed from the morning. This is intentional: Git is introduced as a way to understand and manage work they have already done.

## Practical 5 instructor sequence

The GitHub workflow should be performed in the same repository. Create a prepared GitHub issue such as: “Add a configurable warning threshold for out-of-range measurements”. The CI workflow installs from `requirements.txt`, then runs `pytest -q`.

Agent boundary for the coding task:

```text
Modify the working tree and run the tests.
Do not stage or commit changes.
Do not push changes.
Do not create issues or pull requests.
Do not merge anything.
Stop when the requested work is complete.
```
