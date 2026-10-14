from research_check.checks import in_range


def test_inclusive_range():
    assert in_range(0.0, 0.0, 100.0)
    assert in_range(100.0, 0.0, 100.0)
