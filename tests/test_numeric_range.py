"""Starting example for Practical 4: add one failing test of your own."""

from research_check.checks import check_numeric_range


def test_measurement_inside_range_has_no_issues():
    rows = [{"measurement": "50"}]
    assert check_numeric_range(rows, "measurement", 0.0, 100.0) == []
