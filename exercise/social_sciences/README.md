# Social sciences: Outcomes in federal environmental litigation

## Project background

Environmental lawsuits can shape how environmental laws are enforced, but different types of plaintiffs may bring cases with different outcomes. This exercise uses federal district-court civil cases coded as environmental matters in the Federal Judicial Center (FJC) Integrated Database.

The original study classified the parties in these cases and examined litigation patterns across the United States. This exercise uses a small subset of that processed data.

## Research question

How do plaintiff outcomes differ for cases brought by environmental advocacy organizations (`NGO`), the federal government (`FED`), and businesses and trade associations (`BIZ`)?

Describe the distribution of plaintiff outcomes within each group and create one visualization that makes the comparison clear.

## Study design and scope

Each row represents one federal civil district-court case, not an individual person or organization. The source data cover cases coded as “environmental matters” (`NOS == 893`) in the FJC Integrated Database.

For this exercise, we selected a random sample of 300 cases from the original processed data, including:

- 100 cases for each focal plaintiff type: `BIZ`, `FED`, and `NGO`;
- filing years 1988–2022;
- cases with a recorded settlement or judgment-related resolution (`jud_or_set == 1`); and

The sample is balanced across plaintiff types. Therefore, compare outcome proportions *within* plaintiff types, but do not use the number of cases in this sample to estimate how common each plaintiff type is in all environmental litigation. These observational data also cannot show that plaintiff type causes a case outcome.

## Data files

### Raw data

`raw_data/environmental_cases_raw.csv` contains 300 cases and 64 columns. It is a pre-processed exercise extract, not the untouched FJC administrative source. It already includes the replication authors’ classification of plaintiff and defendant types, but it does not include the outcome and geographic fields added to the clean data.

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
| `JUDGMENT` | For cases resolved by a final judgment: `1` = plaintiff, `2` = defendant, `3` = both, `4` = unknown; `0` and `-8` = missing. |
| `DISTRICT` | FJC code for the federal court district. |

Use the raw data to inspect variables, dates, missing values, and coding. This file includes many original Federal Judicial Center (FJC) fields retained for context. For the raw-data exercise, use the variables in the table above; you do not need to interpret the other numeric columns. Treat codes such as -8 and 9999 as missing or unavailable unless the table says otherwise.

`PLT_wl` is **not** in the raw data. It is a derived variable included only in `clean_data/environmental_cases_clean.csv` and is described in the clean-data table below. Use `PLT_wl` for the outcome comparison in the main analysis.

#### How the plaintiff-outcome code was created

`PLT_wl` is not an original FJC variable. It is a three-category outcome created by the original study's authors from the raw-data fields `JUDGMENT`, which identifies the prevailing side when a final judgment is recorded, and `DISP`, which describes how the case was disposed.

The workflow applies the following rules in order:

| Condition in the raw data | `PLT_wl` value | Interpretation used for this exercise |
| --- | --- | --- |
| `JUDGMENT` is `1` (plaintiff) or `3` (both parties), **or** `DISP` is `13` (settled) | `w` | Plaintiff win |
| Otherwise, `JUDGMENT` is `2` (defendant), **or** `DISP` is `2`, `3`, or `14` (dismissal for want of prosecution or lack of jurisdiction), or `12` (voluntary dismissal) | `l` | Plaintiff loss |
| Any other combination | `n` | Neither/uncoded |

In particular, the authors treated every settlement (`DISP == 13`) as a plaintiff win. A settlement does not necessarily mean that a court ruled for the plaintiff; this is the study's coding convention for making a common outcome measure. Conversely, voluntary and other non-settlement dismissals are counted as plaintiff losses. Because the win rule is evaluated first, a case meeting both a win and a loss condition would be coded `w`. You can create the `PLT_wl` column yourself or use the supplied `PLT_wl` column for the main analysis.

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

## Source

The source records are from the [Federal Judicial Center Integrated Database](https://www.fjc.gov/research/idb). The exercise data are adapted from Rea, C., Merten, A., and Rife, A. (2024), “[Outcomes and policy focus of environmental litigation in the United States](https://doi.org/10.1038/s41893-024-01456-x),” *Nature Sustainability* 7, 1469–1480. The authors’ [replication repository](https://github.com/guscrea/Nature_Sustainability_2024) contains the original processing and analysis code.

This exercise simplifies the original workflow. It does not ask you to reproduce the authors’ full-scale data processing, manual party coding, regression models, or geographic analysis.
