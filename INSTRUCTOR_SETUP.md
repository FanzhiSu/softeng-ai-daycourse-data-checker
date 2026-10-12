# Instructor setup

## One repository all day

Publish this repository as the canonical OxfordRSE repository. Participants
**fork** it (not "Use this template": template repositories start with a single
commit and do not preserve the Git history required for Practical 5). Each
participant launches one Codespace from their fork and keeps it open throughout
the day.

## Baseline state

- `pyproject.toml` declares `numpy>=1.26,<2` and a `test` extra of `pytest>=8,<9`.
- A fresh `pip install -e ".[test]"` produces a working environment.
- Continuous integration installs the project and runs `pytest -q` on Python
  3.12, and passes from the baseline.
- `src/research_check/summary.py` uses `np.float_`, which is removed in NumPy 2.0.
- `src/research_check/checks.py` contains a deliberately simplistic duplicate
  check and an unhandled edge case in `check_numeric_range` (see
  `instructor/practical-4-key.md`).
- `tests/test_smoke.py` and `tests/test_report.py` are the starter tests.

## Practical 2 instructor sequence

Use `instructor/practical-2-brief.md`. The target change is function arguments
with defaults in `check_file`, not configuration files or CLI flags. A reference
implementation and test live on the `recovery/p2` branch.

## Practical 3 instructor sequence

1. Confirm the baseline environment works:
   `python -m research_check.cli examples/observations.csv`.
2. Create a second environment with NumPy 2.x and rerun. It should fail with an
   `AttributeError` for `np.float_`.
3. Make the distinction explicit: the second environment deliberately conflicts
   with the declared `numpy<2` requirement. This is an API incompatibility, not
   something isolation solves.
4. Discuss restoring the historical environment (`numpy>=1.26,<2`) versus
   updating the code to `np.float64`.
5. Record both environments, behaviour, the chosen constraint and rationale in
   `ENVIRONMENT.md` (reference on `recovery/p3`).

## Practical 4 instructor sequence

The `check_numeric_range` edge case is intentionally unhandled. Participants
write a passing test for current behaviour and a failing test for non-finite
values, then use a CLI agent in Plan/Build mode to fix it. Do not reveal the
duplicate-ID domain issue yet. Keep `find_duplicates` unchanged. Reference on
`recovery/p4`.

## Practical 5 instructor sequence

Participants should have several genuine files changed from the morning. This is
intentional: Git is introduced as a way to understand and manage work they have
already done. Include selective staging, coherent commits, branching and push,
then a small unwanted-change recovery exercise using `tools/recover.sh`.

Agent boundary for the coding task:

```text
Modify the working tree and run the tests.
Do not stage or commit changes.
Do not push changes.
Do not create issues or pull requests.
Do not merge anything.
Stop when the requested work is complete.
```

## Practical 6 instructor sequence

Prefer peer review: participants review one another's pull requests. As a
fallback, the `review/exercise` branch contains a tiny change with a deliberate
scope/acceptance problem; the answer key is
`instructor/practical-6-pr-review-key.md`. CI runs on `pull_request`.

## Recovery checkpoints

`tools/recover.sh <baseline|p2|p3|p4>` restores a cumulative checkpoint into the
working tree as unstaged changes. It first makes a tarball backup and a Git
stash, then applies the checkpoint without committing, so Practical 5 still has
real work to inspect. Test all recovery states before the course.
