# Practical / repository map

## One repository, one Codespace

Each participant should work from a copy/template of this repository and keep the same Codespace open throughout the day.

## Practical 1: Software design

The practical does not require repository changes. Participants choose a research context, form an initial view, use AI chat to challenge and extend it, and record a lightweight design. The common repository is introduced at the end of the practical.

Expected artefact: `DESIGN.md` or equivalent design notes in the participant's workspace.

## Practical 2: Dependencies & environments

The starter `pyproject.toml` deliberately declares a loose NumPy dependency (`numpy>=1.0`). `summary.py` uses `np.float_`, so a fresh installation resolving NumPy 2.x should fail when the CLI runs.

Target sequence:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install numpy pytest
python -m research_check.cli examples/observations.csv
```

Then pin NumPy 1.26.4, create `requirements.txt`, install from it, and rerun the program.

Suggested final `requirements.txt`:

```text
numpy==1.26.4
pytest>=8,<10
```

The exercise should demonstrate that source code can remain unchanged while dependency versions change software behaviour.

## Practical 3: Testing

Start with the two starter tests already in the repository. Participants add a unit test for `in_range`, deliberately break and repair the implementation, then extend the suite with boundary/edge cases.

After they understand the mechanics, ask AI to suggest additional tests for already specified behaviour.

Finally, ask AI to characterise the existing `find_duplicates` behaviour. The resulting test should be retained without yet deciding whether repeated sample IDs are scientifically valid. The later reveal uses `examples/longitudinal.csv`.

## Practical 4: Version control

Participants use the same repository and their actual morning changes.

Suggested sequence:

```bash
git status
git log --oneline
git diff
```

Make a small manual report change, inspect and commit it. Create a feature branch. Make a second change, inspect it, then recover the earlier state.

After the manual Git exercise, give the coding agent a bounded task. The agent should be explicitly prohibited from staging, committing, pushing, opening PRs/issues, or merging. The participant reviews the working-tree diff and runs the tests before deciding what to do next.

## Practical 5: Collaborative development

Use the same GitHub repository. Instructor should create the issue from `instructor/github-issue.md` before the session.

Participant sequence:

```text
issue -> branch -> implement -> test -> commit -> push -> PR -> CI
```

The PR demonstrates the shared repository as the source of truth and CI as a gate around proposed changes.

For the final agent step, the agent again works only in the working tree. The participant decides when to commit, push and open the PR.

## Final reveal

Run:

```bash
python -m research_check.cli examples/longitudinal.csv
```

Repeated sample IDs are reported as duplicates. The characterisation test still passes, Git history still looks coherent, and CI can be green. The issue is a domain/specification assumption: longitudinal observations are uniquely identified by `(sample_id, timepoint)`, not `sample_id` alone.
