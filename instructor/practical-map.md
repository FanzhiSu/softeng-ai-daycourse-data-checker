# Instructor map — guided exercises and repository states

This unassessed course intentionally publishes reference solutions and instructor notes.

| Module | Guided core exercise | Prepared support |
| --- | --- | --- |
| 1 Design | Ask AI about missing context; write a few DESIGN.md bullets | `instructor/practical-1-brief.md`, template |
| 2 Coding | Explore CLI, ask VS Code Chat for `--minimum` / `--maximum`, run manually, use Ruff | `instructor/practical-2-brief.md`, `recovery/p2` |
| 3 Environments | Run same source with NumPy 1 and NumPy 2; record observations | `ENVIRONMENT.md`, `recovery/p3` |
| 4 Testing | Add one failing non-finite test manually; agent Plan/Build fixes it | `tests/test_numeric_range.py`, `recovery/p4` |
| 5 Git | Inspect changes, branch, stage, commit, restore | `tools/recover.sh p4`, meaningful history |
| 6 GitHub | Web fork, issue, prepared PR review, README change on web branch, PR and CI | `instructor/github-issue-2.md`, `review/exercise`, `demo/ci-*` |

## Practical 1 handoff

Participants can draft their design in AI chat before opening Codespaces. They can paste a short version into the supplied `DESIGN.md` template when they open the repository for Practical 2. No GitHub operation is required in Module 1.

## Practical 2 reference

`recovery/p2` exposes the options through `python -m research_check examples/observations.csv --maximum 9`. The default remains 0–100. Do not require automated tests in this practical; run manually.

## Practical 3 reference

The project supports NumPy 1.x. NumPy 2.x is deliberately incompatible because `np.float_` was removed. Two virtual environments demonstrate the difference without modifying source. `recovery/p3` contains a sample completed record.

## Practical 4 reference

The baseline has a passing test in `tests/test_numeric_range.py`. The new participant-written test should fail on `main`; the reference `recovery/p4` adds the test and the `math.isfinite` implementation. `find_duplicates` is unchanged.

## Practical 5 recovery

`tools/recover.sh p4` reconstructs the cumulative changes as unstaged working-tree modifications. Switching to a solution branch is different: it checks out committed source. Have participants commit or stash before exploring solution branches.

## Practical 6 demonstrations

Open PRs from `review/exercise`, `demo/ci-passing`, and `demo/ci-failing` against the canonical `main`. Do not merge the planted bad PR or failing CI demo. Participants make their own documentation change using the GitHub web editor on their own fork; no terminal remote setup is required.
