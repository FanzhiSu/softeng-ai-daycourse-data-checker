# Prepared upstream issues — instructor publication checklist

Publish 4–5 separate issues in the canonical upstream repository before class. Each is intentionally small enough to implement using GitHub's web editor. Give participants direct links. Duplicate PRs are fine: the objective is review, not merging.

## Issue A — Document custom CLI limits
**Interface:** Add a README example showing `--maximum 9`. **Boundary:** README only. **Acceptance:** Command matches the reference implementation and is clearly marked as available after Practical 2.

## Issue B — Explain report output
**Interface:** Add a short README explanation of the checker issue summary and counts. **Boundary:** README only. **Acceptance:** Accurate against the baseline output; no code changes.

## Issue C — Explain blank measurements
**Interface:** Add a short README note describing how blank measurements are handled. **Boundary:** README only. **Acceptance:** Confirm the description against existing behaviour; no change to validation.

## Issue D — Document environment constraints
**Interface:** Clarify in ENVIRONMENT.md why NumPy 1.x is used for the baseline and why NumPy 2.x is a separate demonstration. **Boundary:** ENVIRONMENT.md only. **Acceptance:** Does not suggest NumPy 2 is supported by the baseline.

## Issue E — Improve running-on-own-data instructions
**Interface:** Add a short README example `python -m research_check path/to/your-data.csv`. **Boundary:** README only. **Acceptance:** Correct command and a note about expected CSV column names.

**Instructor check:** avoid publishing an issue whose expected text is already present on main; verify each issue against the final repository before class. Do not merge duplicate workshop PRs into the canonical source.
