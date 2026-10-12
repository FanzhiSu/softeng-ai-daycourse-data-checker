from research_check.checks import Issue
from research_check.report import format_report


def test_report_includes_issue_count():
    report = format_report("example.csv", 3, [Issue("missing", "Missing value", 2)])
    assert "Potential issues: 1" in report
