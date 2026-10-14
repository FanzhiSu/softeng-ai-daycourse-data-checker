# Known limitations (instructor/reference)

- The CLI summary conversion uses `float()` directly for nonblank measurement strings. An arbitrary nonnumeric string may raise `ValueError` even though the lower-level validation reports an `invalid` issue. This is intentionally out of scope for the core practicals; it could be a Going further exercise.
- The NumPy 2 environment is intentionally incompatible with the baseline source. Do not install the project into that environment using `pip install -e .`, because the project declares NumPy <2.
- GitHub may require approval to run Actions for first-time fork PRs. Test this before class.
