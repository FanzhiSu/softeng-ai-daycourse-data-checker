from research_check.checks import in_range


def test_in_range_inside_value():
    assert in_range(15, 10, 20)
