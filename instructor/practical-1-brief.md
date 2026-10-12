# Practical 1 brief: Research Data Checker

## The brief (deliberately incomplete)

> Build a small tool that checks research data for potential problems before
> the data are analysed.

The data are supplied as CSV files. We have **not** yet decided:

- which columns are required, and what a missing value means;
- what "valid" means for a measurement;
- whether repeated sample IDs are a problem;
- which checks should be fixed and which should be configurable;
- what the tool should output, and who reads it.

## Task

Work in an ordinary chat assistant. Provide the research context you have in
mind. Ask the assistant to:

- identify the information that is missing from this brief;
- propose clarifying questions;
- challenge assumptions that different researchers would make differently;
- distinguish domain decisions from engineering decisions.

Do **not** ask the assistant to write the software yet.

## Convergence

Before Practical 2 we converge on a shared, minimal specification for one
bounded feature:

> **Configurable minimum and maximum measurement limits.**

Record the shared specification in `DESIGN.md`. That document becomes reusable
context for later AI conversations and coding tasks.
