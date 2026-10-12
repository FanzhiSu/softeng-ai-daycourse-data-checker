# Practical 2 brief: configurable measurement limits

## Interface

Allow callers to configure the minimum and maximum measurement limits when
checking a file.

Prefer **function arguments with sensible defaults** over configuration files
or extensive command-line changes:

```python
check_file(path, *, minimum=0.0, maximum=100.0)
```

The defaults must preserve the current behaviour (0.0 to 100.0 inclusive).

## Boundary

- Do not change the existing checks, reporting or example data.
- Do not change the duplicate-detection behaviour.
- Do not change the default limits.

## Acceptance

- `check_file(path)` behaves exactly as before.
- `check_file(path, maximum=9.0)` reports more out-of-range measurements.
- A test demonstrates the configurable behaviour.
- `pytest -q` passes.
