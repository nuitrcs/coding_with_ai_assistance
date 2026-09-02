# Social sciences: Outcomes in federal environmental litigation

## Project background

Environmental lawsuits can shape how environmental laws are enforced, but different kinds of organizations may bring different cases and obtain different results. This exercise uses a collection of US federal district-court environmental decisions assembled by the Rea Environment and Society Lab (RESL). The underlying decisions were identified in LexisNexis, then read and coded by researchers.

The exercise is deliberately narrower than the original study. You will work with decision-level records, not the full universe of federal environmental lawsuits.

## Research question

For federal environmental decisions issued from 1988 through 2020, how do recorded outcomes differ for cases brought by:

- environmental advocacy organizations (`ngo`);
- the federal government (`fed`); and
- firms or trade associations (`industry` and `trade_assn`)?

Start with a descriptive comparison: calculate the share of decisions with a plaintiff, defendant, or mixed outcome for each plaintiff group. Create one visualization that makes the comparison easy to interpret. If time permits, examine how the pattern changes over time or by broad policy focus.

An outcome in this dataset is the researchers' coding of a judicial decision. It is not a complete measure of every benefit, cost, settlement, appeal, or later development in a case.

## Study design and scope

The original RESL Environmental Law Database is a date-randomized sample of US federal civil district-court judicial decisions that referred to federal environmental statutes. It contains researcher-coded information about the parties, outcome, location, statutes, and the topic and aim of the dispute.

For this exercise:

- one row represents one judicial decision, not necessarily one unique lawsuit or plaintiff;
- the clean data are limited to decisions dated 1988--2020, matching the period used for the exercise;
- a case can have more than one plaintiff or defendant type in the source data; and
- the core comparison uses decisions with one of the selected lead-plaintiff types. Decisions with combined or other plaintiff-type codes are retained in the data but are outside the core comparison unless your group makes and documents a different rule.

## Data files

### Raw data

`raw_data/environmental_decisions_raw.csv` is an exercise-sized extract of the RESL database. It preserves the original coding values and is intended for exploration and cleaning. Each row is a decision. Important columns include:

| Column | Description |
| --- | --- |
| `ID` | Source database identifier for the decision. |
| `case_name` | Name of the case. |
| `case_date` | Date of the decision, in `YYYY-MM-DD` format. |
| `court` | Federal district court that issued the decision. |
| `plt` / `def` | Text identifying the plaintiff(s) and defendant(s). |
| `plt_typ` / `def_typ` | Researcher-assigned party type(s). Multiple codes are separated by `%`. |
| `outcome` | Coded result: `plaintiff`, `defendant`, `mixed`, `none`, or `unknown`. |
| `location` | Coded state or broader location associated with the decision. |
| `statute` | Environmental statute(s) associated with the decision; multiple values may be separated by `%`. |
| `AIM` | Coded aim of the plaintiff(s), such as seeking damages or stopping pollution. |
| `TON` | Coded topic-of-nature term(s), such as hazardous waste, water, or fauna. |
| `OOC` | Coded object-of-conflict term(s), giving a more specific description of the dispute. |
| `climate_count` / `ej_count` | Counts of coding terms related to climate or environmental justice. |

The text and topic fields are human-coded research data, not standardized administrative categories. Inspect their values before grouping or interpreting them.

### Clean data

`clean_data/environmental_decisions_clean.csv` is the analysis-ready version. It keeps the fields needed for the core question and adds a decision year derived from `case_date`. It retains the original `plt_typ` and `outcome` values so that your analysis choices are visible.

Before analyzing, verify:

1. the date range and number of rows;
2. the possible values and missingness in `plt_typ` and `outcome`;
3. how many records have multiple plaintiff types; and
4. exactly which plaintiff-type codes your group will include.

For the core comparison, do not silently recode `mixed` as a plaintiff win or a plaintiff loss. Report it as its own category. If you choose a binary outcome for an optional extension, state and justify how you handled `mixed`, `none`, and `unknown` outcomes.

## Source

The exercise data are adapted from Rea, C., Merten, A., and Rife, A. (2024), “[Outcomes and policy focus of environmental litigation in the United States](https://doi.org/10.1038/s41893-024-01456-x),” *Nature Sustainability* 7, 1469–1480. The authors' code and data documentation are available in their [replication repository](https://github.com/guscrea/Nature_Sustainability_2024) and the [RESL Environmental Law Database](https://dataverse.harvard.edu/dataverse/resl_eld).

This exercise simplifies the original workflow. It does not ask you to reproduce the study's full data collection, party coding, geographic analysis, or regression models.
