# Instructor setup and rehearsal

All keys are deliberately public in this unassessed course.

1. Publish the Git repository with its **full history**, `main`, `recovery/p2`, `recovery/p3`, `recovery/p4`, and `review/exercise` branches. Do not use a GitHub template (it loses the history).
2. Verify the devcontainer starts on Python 3.12 and installs the package and pytest with NumPy 1.x. Verify `python -m research_check examples/observations.csv` succeeds.
3. Verify Practical 2 reference on `recovery/p2`: both CLI commands work, with the custom maximum producing more range issues.
4. Verify Practical 3: a second virtual environment with NumPy 2 fails with an `np.float_` API error; `deactivate` restores the baseline interpreter.
5. Verify Practical 4: a human-written test fails on baseline and passes on `recovery/p4`. Configure/authenticate the selected CLI agent **before class**; confirm Plan/Build or equivalent is available.
6. Run `tools/recover.sh p4` from a clean participant checkout. Verify it leaves changed files unstaged and the new test file untracked. Test stash/backup recovery with dirty participant files.
7. Publish a **prepared PR** from `review/exercise` into canonical `main` and link it in the teaching slides. The branch changes a README plus a CLI behaviour: green CI does not justify accepting the scope change.
8. Open two instructor demonstration PRs: `demo/ci-failing` (expected red CI) and `demo/ci-passing` (expected green CI). Do not merge the failing example. Walk through Code, Issues, PRs, Actions.
9. Rehearse the participant workflow with a separate GitHub account: Codespace without forking, fork later, enable Issues if needed, web edit on new branch, PR into own fork, see Actions CI.
10. Confirm public repository URL, licensing policy, CI on Python 3.12, and access to any agent service.

The reveal uses `examples/longitudinal.csv` and the unmodified `find_duplicates` function. Do not spoil this during earlier teaching.
