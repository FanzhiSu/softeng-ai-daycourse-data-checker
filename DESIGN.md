# Research Data Checker - design placeholder

This file starts intentionally sparse. During the course, design decisions can be recorded here.

## Purpose

Check incoming research data for potential quality issues before analysis.

## Current starter behaviour

The starter implementation checks for missing measurements, repeated sample IDs, and measurements outside an example numeric range.

## Open questions

- Which checks are domain-specific?
- What constitutes a duplicate observation?
- Which checks should be configurable?
- How should different research contexts add checks?
