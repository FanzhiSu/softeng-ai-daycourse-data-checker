"""Small numerical helper used to make the dependency version matter."""

from __future__ import annotations

import numpy as np


def mean_as_float(values: list[float]) -> float:
    """Return a mean using a NumPy scalar dtype."""
    array = np.asarray(values, dtype=np.float_)
    return float(array.mean())
