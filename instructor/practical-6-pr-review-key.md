# Practical 6 instructor key: pull request review

**Reference solution (available to participants).**

## The requested change

`instructor/github-issue-2.md` asks for a README subsection and nothing else.
The boundary is explicit: no source changes, no behaviour changes.

## The prepared pull request (`review/exercise` branch)

The branch makes the requested README change, but it also:

1. changes the default maximum measurement in `src/research_check/cli.py` from
   `100.0` to `120.0` — an unrequested behaviour change (boundary violation);
2. adds no test, so the behaviour change is not covered (acceptance gap);
3. leaves the README and the code disagreeing about the default range.

CI remains green, because no existing test checks the range count. This is the
point: green CI is not sufficient review.

## What a substantive review should identify

- The scope creep in `cli.py`: the diff is not limited to `README.md`.
- The silent behaviour change: a measurement of 120 is now accepted.
- The missing test / missing acceptance evidence.
- The documentation/code mismatch.
- A reasonable response: request changes, or ask for the `cli.py` edit to be
  removed or split into a separate, tested issue.

## Peer-review preference

Where possible, participants should review one another's pull requests. Use the
prepared branch only as a fallback.
