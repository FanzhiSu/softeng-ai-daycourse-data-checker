# Optional extension: command-line flags for configurable limits

The required Practical 2 feature is expressed as **function arguments with
sensible defaults**; see `instructor/practical-2-brief.md`. Configuration files
and extensive CLI changes are out of scope.

If time allows, participants may optionally expose the same limits on the
command line, for example:

```bash
python -m research_check.cli examples/observations.csv --min-measurement 0 --max-measurement 100
```

This is an extension, not a requirement. It should preserve the defaults and
must not change any existing behaviour.
