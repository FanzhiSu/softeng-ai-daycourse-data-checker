# Practical / repository map

## One repository, one Codespace

Each participant should fork this repository and keep the same Codespace open
throughout the day. The canonical repository is intended to live under the
OxfordRSE GitHub organisation.

## Practical 1: Software design

The practical does not require repository changes. Participants use the
incomplete brief (`instructor/practical-1-brief.md`), explore requirements with
AI chat, and converge on the shared feature: configurable measurement limits.

Expected artefact: `DESIGN.md` updated with the shared specification.

## Practical 2: Coding a bounded change

Target feature (`instructor/practical-2-brief.md`): configurable minimum and
maximum limits, as function arguments with defaults.

Reference change to `src/research_check/cli.py`:

```python
def check_file(
    path: Path,
    *,
    minimum: float = 0.0,
    maximum: float = 100.0,
) -> tuple[int, list[Issue]]:
    ...
    issues.extend(check_numeric_range(rows, "measurement", minimum, maximum))
    ...
```

A reference solution and test live on the `recovery/p2` branch.

## Practical 3: Environments and dependencies

The baseline declares `numpy>=1.26,<2` and works. Participants create a second
environment with NumPy 2.x:

```bash
python -m venv .venv2
source .venv2/bin/activate
python -m pip install "numpy>=2" pytest
PYTHONPATH=src python -m research_check.cli examples/observations.csv
```

This should fail with an `AttributeError` for `np.float_`. Make the distinction
explicit: the NumPy 2.x environment deliberately conflicts with the project's
declared `numpy<2` requirement, so this is an API incompatibility rather than
something isolation resolves.

Participants record both environments, observed behaviour, the selected
constraint and the rationale in `ENVIRONMENT.md`. A reference record lives on
the `recovery/p3` branch.

## Practical 4: Software testing

Participants add a test for current behaviour and a failing test for the
non-finite edge case in `check_numeric_range`. The instructor key is
`instructor/practical-4-key.md`.

Reference solution: `recovery/p4` (failing test plus the `math.isfinite` fix).

`find_duplicates` must not change. The longitudinal reveal uses
`examples/longitudinal.csv`.

## Practical 5: Version control

Participants use their actual morning changes.

Suggested sequence:

```bash
git status
git log --oneline
git diff
```

Stage selectively, make coherent commits, create a branch, push it, then make a
small unwanted change and recover it with `tools/recover.sh`.

After the manual Git exercise, give the coding agent a bounded task. The agent
must not stage, commit, push, open PRs/issues, or merge.

## Practical 6: Collaborative development

Participants work in their own forks. They open an issue from
`instructor/github-issue-2.md` (a tiny documentation change with an explicit
interface, boundary and acceptance criterion), then branch, commit, push, open a
pull request and inspect CI.

Review is substantive. Participants review one another's pull requests where
possible. A prepared fallback pull request on the `review/exercise` branch
contains a deliberate scope/acceptance problem; the answer is in
`instructor/practical-6-pr-review-key.md`.

## Final reveal

Run:

```bash
python -m research_check.cli examples/longitudinal.csv
```

Repeated sample IDs are reported as duplicates. The characterisation test still
passes, Git history still looks coherent, and CI can be green. The issue is a
domain/specification assumption: longitudinal observations are uniquely
identified by `(sample_id, timepoint)`, not `sample_id` alone.

## Recovery checkpoints

`tools/recover.sh <baseline|p2|p3|p4>` restores a checkpoint into the working
tree as **unstaged** changes, so Practical 5 still has real work to inspect.
It backs up and stashes existing work first, and never discards it.
