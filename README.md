# Research Data Checker — AI-assisted software engineering course

A deliberately small Python research-data checker, prepared for **six guided practicals**. The baseline works; some enhancements and edge cases are deliberately left for participants. Instructor keys and recovery solutions are public: this course is **not assessed**.

## Getting started (Codespaces is your development computer)

Open a Codespace on the canonical course repository. The devcontainer installs the project and pytest with NumPy 1.x. You do **not** need to fork until Practical 6. In the Codespace terminal:

```bash
python -m research_check examples/observations.csv
```

If working locally instead, use Python 3.12, `python -m pip install -e '.[test]'`, then run the same command.

## The six practicals

1. **Design (AI chat):** use [`instructor/practical-1-brief.md`](instructor/practical-1-brief.md) to discuss missing information, then fill in a few bullets in [`DESIGN.md`](DESIGN.md).
2. **Coding (VS Code Chat):** explore CLI/range-check code, then use [`instructor/practical-2-brief.md`](instructor/practical-2-brief.md) to implement `--minimum` / `--maximum`. Run the checker **manually** with defaults and custom limits. Install Ruff and run `ruff check .` / `ruff format .`.
3. **Environments (manual):** compare the baseline NumPy 1.x environment with a separate NumPy 2.x environment using the **same source**; record observations in [`ENVIRONMENT.md`](ENVIRONMENT.md). See commands below.
4. **Testing (manual → agent):** open `tests/test_numeric_range.py` and add a test requiring `nan`, `inf`, `-inf` to be reported as `invalid`, not `range`. Run `pytest -q` and observe the failure. Then use your CLI coding agent's **Plan** mode to propose the smallest fix, review it, and use **Build** to implement without editing the test or `find_duplicates`. Run all tests.
5. **Local Git:** inspect `git status`, `git diff`, and `git log`; create `my-changes`; stage, inspect and commit accepted work. Make a deliberate unwanted edit, inspect it, and discard it with `git restore <file>`. **Do not push.**
6. **GitHub (web interface):** fork the canonical repository now; use [`instructor/github-issue-2.md`](instructor/github-issue-2.md) to create a small issue in your fork, review the instructor's prepared PR, then edit README in your fork via GitHub's pencil icon, create a new branch, and open a PR **into your fork's main**. Inspect CI. No `git remote add` or `git push` needed.

### Practical 3: exact commands

The devcontainer's project environment is A. Run:

```bash
python -c 'import sys, numpy; print(sys.executable, numpy.__version__)'
python -m research_check examples/observations.csv
```

Create environment B (a deliberately incompatible environment):

```bash
python -m venv .venv2
source .venv2/bin/activate
python -m pip install 'numpy>=2,<3'
python -c 'import sys, numpy; print(sys.executable, numpy.__version__)'
python -m research_check examples/observations.csv
```

The final command should fail because the existing code uses `np.float_`, removed in NumPy 2. This is an **intentional incompatibility demonstration**, not a supported project environment. The Codespace sets `PYTHONPATH=src` so the package can be imported in either environment. Return to A with `deactivate`. If NumPy 2 has not yet been installed in B, the environment will not reproduce the intended error.

### Practical 4: test scaffold

`tests/test_numeric_range.py` includes a passing test. Add another test for the stated non-finite requirement, using the existing example as a model. The requirement is supplied; your task is to express it as an assertion. The expected failing result on `main` is `range` issues, not `invalid` issues.

### Practical 5: recovery and branching

If you fall behind, from the repo root run `tools/recover.sh p2`, `p3`, or `p4` to reconstruct cumulative exercise work as **unstaged** changes. The script backs up/stashes current work first. These commands are different from `git switch recovery/p2`, which switches to a committed solution branch. **Only switch branches when your working tree is clean.**

### Practical 6: prepared PR and CI

The instructor will provide a direct URL to a pre-opened PR from `review/exercise`, with a deliberately out-of-scope change. Review the issue, changed files and CI result; decide what you would request before merging. The instructor will demonstrate Code, Issues, PRs and Actions tabs, and show a passing and a failing CI run.

If Issues are disabled on your fork, enable them in your fork's **Settings → General → Features → Issues** (GitHub's interface may vary).

## Going further

Compare alternative AI implementations, add further numeric edge-case tests, inspect solution branches in Git Graph, or ask AI to review the prepared PR and compare its findings with yours. Avoid changing `find_duplicates` before the final wrap-up.

## Scientific-assumption reveal

After the course practicals, run:

```bash
python -m research_check examples/longitudinal.csv
```

Repeated sample IDs are flagged even when each row is a distinct timepoint. The tests can pass and the code can meet its specification while the domain assumption is unsuitable.
