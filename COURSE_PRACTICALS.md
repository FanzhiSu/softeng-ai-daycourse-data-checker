# Course practical design

The practicals are designed around one repository and one Codespace for the day.

## 1. Software design

Starting brief: build a tool that checks research data for potential problems
before analysis. The brief is deliberately incomplete.

Participants use a chat assistant to identify what is missing, challenge
assumptions, and distinguish domain decisions from engineering decisions. They
converge on one shared, minimal specification: configurable minimum and maximum
measurement limits. The result is recorded in `DESIGN.md`.

## 2. Coding a bounded change

Participants open the prepared repository in GitHub Codespaces and implement the
specification from Practical 1: configurable measurement limits, expressed as
function arguments with sensible defaults.

They identify the relevant code, decide what must not change, give the IDE chat
assistant the relevant context, then inspect the resulting implementation
against `DESIGN.md`.

## 3. Environments and dependencies

The project declares `numpy>=1.26,<2`, so the baseline environment works.
Participants create a second environment containing NumPy 2.x and observe the
same source code fail with an `AttributeError` for `np.float_`.

The NumPy 2.x environment deliberately conflicts with the project's declared
`numpy<2` requirement: this is an API incompatibility, not a problem that
isolation solves. Participants record versions, observed behaviour, the selected
constraint and the rationale in `ENVIRONMENT.md`, and discuss restoring the
historical environment versus updating the code for a newer dependency.

## 4. Software testing

Participants write tests against the existing code. They write one test that
confirms current behaviour, then a failing test for an edge case the
implementation does not handle correctly in `check_numeric_range`.

After the mechanics are established, they hand the failing test and relevant
context to a CLI coding agent in Plan mode, review the plan, then allow
implementation in Build mode. The agent must not modify the test, and the
participant inspects the result.

The repository includes `find_duplicates()` with deliberately simplistic
behaviour. Participants characterise its current behaviour and retain that test
for the later reveal that repeated sample IDs can be legitimate across
timepoints.

## 5. Version control

Participants learn the local Git model using the changes they have already made:

- inspect `git status`, `git log --oneline` and `git diff`;
- stage selectively and make coherent commits;
- create a branch;
- push the branch;
- make a small unwanted change and recover it safely.

Only after the manual Git exercise do they give a coding agent a bounded task
with no commit, push or merge authority. The participant inspects the diff and
decides what enters history.

## 6. Collaborative development

Participants work in their own forks of the repository on GitHub. They create a
branch, implement a tiny change with an explicit interface, boundary and
acceptance criterion, run the tests, commit, push, open a pull request, inspect
CI, and review.

Review is substantive: participants review one another's changes (or a prepared
pull request containing a deliberate scope or acceptance problem) and must
identify issues before merging. The engineering point is that the remote
repository is the agreed source of truth and that changes enter it through a
visible gate.

For any agent step, the agent is explicitly prohibited from committing, pushing,
creating issues/PRs or merging. Participants inspect its working-tree changes
and decide what happens next.

## Final reveal

Run the longitudinal example and investigate why valid repeated sample IDs are
rejected. Trace the failure back to the characterisation test. Discuss what the
tests, Git history, review and CI did establish, and what they could not
establish without domain knowledge.
