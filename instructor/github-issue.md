# Make the measurement range configurable

The checker currently assumes that a measurement is valid when it lies between 0 and 100.

Please make the minimum and maximum measurement values configurable from the command line, while retaining those values as the defaults.

For example:

```bash
python -m research_check.cli examples/observations.csv --min-measurement 0 --max-measurement 100
```

Add tests covering the new behaviour and preserve the existing behaviour when the options are omitted.
