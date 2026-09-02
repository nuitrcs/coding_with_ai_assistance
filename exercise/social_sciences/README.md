# Social sciences: Outcomes in federal environmental litigation

## Project background

Environmental lawsuits can shape how environmental laws are enforced, but different types of plaintiffs may bring cases with different outcomes. This exercise uses federal district-court civil cases coded as environmental matters in the Federal Judicial Center (FJC) Integrated Database.

The original study classified the parties in these cases and examined litigation patterns across the United States. This exercise uses a small, reproducible subset of that processed data. It is designed for descriptive analysis, not causal inference.

## Research question

Among the sampled, resolved federal environmental cases filed between 1988 and 2022, how do plaintiff outcomes differ for cases brought by:

- environmental advocacy organizations (`NGO`);
- the federal government (`FED`); and
- businesses and trade associations (`BIZ`)?

Describe the distribution of plaintiff outcomes within each group and create one visualization that makes the comparison clear. A useful optional summary is the plaintiff win rate: `w / (w + l)`.

## Study design and scope

Each row represents one federal civil district-court case, not an individual person or organization. The source data cover cases coded as “environmental matters” (`NOS == 893`) in the FJC Integrated Database.

For this exercise, we selected a random sample of 300 cases from the original processed data:

- 100 cases for each focal plaintiff type: `BIZ`, `FED`, and `NGO`;
- filing years 1988–2022;
- cases with a recorded settlement or judgment-related resolution (`jud_or_set == 1`); and
- no BP-related cases in the Eastern District of Louisiana or IMC-related cases in the District of South Carolina, following exclusions in the original workflow.

The sample is balanced across plaintiff types. Therefore, compare outcome proportions *within* plaintiff types, but do not use the number of cases in this sample to estimate how common each plaintiff type is in all environmental litigation. These observational data also cannot show that plaintiff type causes a case outcome.

## Data files

### Raw data

`raw_data/environmental_cases_raw.csv` contains 300 cases and 64 columns. It is a **pre-cleaned exercise extract**, not the untouched FJC administrative source. It already includes the replication authors’ classification of plaintiff and defendant types, but it does not include the outcome and geographic fields added to the clean data.

Important columns include:

| Column | Description |
| --- | --- |
| `fjc_ID` | Unique case identifier constructed by the original replication workflow. |
| `FILEDATE` / `TERMDATE` | Case filing and termination dates. |
| `yr_file` / `yr_term` | Filing and termination years. |
| `PLT` / `DEF` | Recorded lead plaintiff and defendant names. |
| `PLT_typ` / `DEF_typ` | Researcher-assigned party types. The focal plaintiff types are `BIZ`, `FED`, and `NGO`. |
| `JURIS` | Basis for federal jurisdiction, recoded into readable labels. |
| `NOS` / `NOS_t` | FJC nature-of-suit code and its label. All cases in this exercise have `NOS == 893`, environmental matters. |
| `DISP` / `DISP_t` | FJC disposition code and a descriptive label. |
| `JUDGMENT` | FJC judgment code. |
| `DISTRICT` | FJC code for the federal court district. |

Use the raw data to inspect variables, dates, missing values, and coding. The original FJC codes and party classifications are complex; do not assume that every numeric field is self-explanatory.

### Clean data

`clean_data/environmental_cases_clean.csv` contains the same 300 cases and 71 columns. It includes every column in the raw file plus the following fields created in the original replication workflow:

| Column | Description |
| --- | --- |
| `jud_or_set` | `1` when the case has a qualifying settlement or judgment-related disposition. All exercise cases have value `1`. |
| `PLT_wl` | Coded plaintiff outcome: `w` = win, `l` = loss, `n` = neither/uncoded outcome. |
| `DEF_wl` | Corresponding coded defendant outcome. |
| `STATE_TERR` | State or territory associated with the court district. |
| `REGION` | Broad US region assigned in the original workflow. |
| `OBJECTID` | Row identifier from the court-district crosswalk table used in the original replication workflow. Not analytically meaningful on its own. |
| `Judicial_2` | Sub-district name (e.g., "Eastern District") from the same crosswalk; combine with `STATE_TERR` for the full district name. |

For `PLT_wl`, the original authors treated judgments for the plaintiff or both parties, and settlements, as wins. Judgments for the defendant and most non-settlement dismissals were treated as losses. The `n` category is retained because not every qualifying resolution fits those definitions.

## Source

The source records are from the [Federal Judicial Center Integrated Database](https://www.fjc.gov/research/idb). The exercise data are adapted from Rea, C., Merten, A., and Rife, A. (2024), “[Outcomes and policy focus of environmental litigation in the United States](https://doi.org/10.1038/s41893-024-01456-x),” *Nature Sustainability* 7, 1469–1480. The authors’ [replication repository](https://github.com/guscrea/Nature_Sustainability_2024) contains the original processing and analysis code.

This exercise simplifies the original workflow. It does not ask you to reproduce the authors’ full-scale data processing, manual party coding, regression models, or geographic analysis.
