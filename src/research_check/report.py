"""Human-readable reporting."""

from __future__ import annotations

from collections import Counter

from .checks import Issue


def format_report(filename: str, row_count: int, issues: list[Issue]) -> str:
    counts = Counter(issue.kind for issue in issues)
    lines = [f"Dataset: {filename}", f"Rows: {row_count}", ""]
    if not issues:
        lines.append("No potential data-quality issues found.")
        return "\n".join(lines)

    lines.append(f"Potential issues: {len(issues)}")
    for kind in sorted(counts):
        lines.append(f"  {kind}: {counts[kind]}")
    lines.append("")
    lines.append("Details:")
    for issue in issues:
        location = f" (row {issue.row_number})" if issue.row_number else ""
        lines.append(f"  - {issue.message}{location}")
    return "\n".join(lines)
