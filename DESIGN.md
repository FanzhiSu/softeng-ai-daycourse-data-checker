# Research Data Checker - design

This document starts intentionally sparse. During the course we record design
decisions here. It is reusable context for later AI conversations and coding
tasks.

## Purpose

Check incoming research data for potential quality issues before analysis.

## Users and use cases

<!-- Who uses the tool? What are they trying to achieve? -->

## Current starter behaviour

The starter implementation checks for missing measurements, repeated sample IDs,
and measurements outside an example numeric range (0 to 100 inclusive).

## Requirements

<!-- What must the software do? -->

## Constraints and domain decisions

<!-- Which rules come from the research domain rather than the software? -->

## Interfaces

<!-- How is the tool invoked? What are its inputs and outputs? -->

## Open questions

- Which checks are domain-specific?
- What constitutes a duplicate observation?
- Which checks should be configurable?
- How should different research contexts add checks?

## Decision log

<!-- Dated entries: what was tried, what was found, what changed. -->
