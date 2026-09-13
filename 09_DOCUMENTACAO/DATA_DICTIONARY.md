# Data Dictionary

This dictionary is generated from the project source schema and must be read with the raw-data documentation where available.

| Variable | Type | Description | Transformation / role |
|---|---|---|---|
| Source columns | As supplied in CSV | Original dataset fields; exact semantics require source documentation where absent. | Names are normalised to snake_case in the pipeline. |
| Derived columns | Numeric, date or categorical | Project-specific analytical features. | Created reproducibly in `04_SCRIPTS_R`; see generated cleaned CSV header. |

Manual verification is required for units, collection method and any field whose source definition is not available locally.

