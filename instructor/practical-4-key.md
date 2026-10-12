# Practical 4 instructor key: edge cases in `check_numeric_range`

**Do not distribute this file to participants.** It contains the reference
defect, the expected test and the reference fix.

`find_duplicates` and the longitudinal-data example must not be changed. The
defect below is entirely inside `check_numeric_range`.

## Candidate A (selected): non-finite values are reported as out-of-range

**Intended contract.** A measurement that parses as a float but is not finite
(`nan`, `inf`, `-inf`) is *invalid*, not *out of range*. The checker must not
claim that `nan` lies "outside [min, max]".

**Current behaviour.** `float("nan")`, `float("inf")` and `float("-inf")`
succeed; `in_range` returns `False` for each; a `range` issue is appended, for
example `measurement=nan is outside [0.0, 100.0]`.

**Failing test.**

```python
from research_check.checks import check_numeric_range


def test_non_finite_measurements_are_invalid_not_range():
    rows = [{"measurement": "nan"}, {"measurement": "inf"}, {"measurement": "-inf"}]
    issues = check_numeric_range(rows, "measurement", 0.0, 100.0)
    assert [issue.kind for issue in issues] == ["invalid", "invalid", "invalid"]
```

Currently returns `["range", "range", "range"]`, so the test fails.

**Smallest implementation change.** Add `import math` and, between the
`float(raw)` call and the `in_range` check:

```python
if not math.isfinite(value):
    issues.append(Issue("invalid", f"Non-finite value in {column}: {raw}", row_number))
    continue
```

## Optional extension (Candidate B): inverted bounds

An inverted range (`minimum > maximum`) currently flags every row as
out-of-range. A stricter contract rejects it:

**Failing test.**

```python
import pytest
from research_check.checks import check_numeric_range


def test_inverted_range_is_rejected():
    with pytest.raises(ValueError):
        check_numeric_range([{"measurement": "50"}], "measurement", 100.0, 0.0)
```

**Smallest implementation change.**

```python
if minimum > maximum:
    raise ValueError("minimum must not exceed maximum")
```

This becomes relevant once Practical 2 makes the limits configurable.
