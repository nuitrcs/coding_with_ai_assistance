# Life sciences: Humidity, temperature, and mosquito development

## Project background

*Anopheles stephensi* is a mosquito species that can transmit malaria. Like other insects, mosquitoes are ectotherms: environmental conditions can affect their development and survival. In this laboratory experiment, researchers raised mosquito larvae at different temperatures and relative-humidity levels. They also compared two water-management conditions: trays in which water volume was maintained and trays in which evaporation was allowed.

## Research question

Under the **water-volume-maintained** condition, how are temperature and relative humidity associated with:

1. the proportion of mosquito larvae that survive to adult emergence; and
2. the time required for surviving mosquitoes to develop?

Use the data to describe patterns, not to make causal claims beyond this controlled experiment. Consider whether the relationship between temperature and each outcome appears to differ across relative-humidity levels.

## Study design

The researchers reared first-instar *An. stephensi* larvae in trays containing 100 larvae each. They recorded pupation, adult emergence, deaths, and water additions daily. The experiment included:

- temperatures from 16 to 41 degrees C in the raw daily data; the provided clean analysis files use treatments from 16 to 40 degrees C;
- relative humidity (RH) levels of 30%, 45%, 60%, 75%, and 90%;
- two water-management conditions: `C` (water volume controlled) and `E` (evaporation allowed); and
- replicate trays across experimental blocks.

The tray is the experimental unit. Individual larvae within a tray shared the same environment, so do not treat them as fully independent experimental replicates.

For this exercise, filter to `Evaporation == "C"`. The evaporation-allowed condition is included in the supplied data because it is part of the original experiment, but it is outside the core analysis question. You may examine it as an optional extension.

## Data files

### Raw data

`raw_data/daily_tray_observations.csv` contains 4,005 daily observations (plus a header), one row per tray per observation day. Its columns are:

| Column | Description |
| --- | --- |
| `Day` | Day of observation in the source workbook. |
| `Date` | Calendar date of the observation. |
| `Temperature` | Temperature treatment, in degrees C. |
| `RH` | Relative-humidity treatment, as a percent. |
| `Evaporation` | Water-management condition: `C` = water volume controlled; `E` = evaporation allowed. |
| `Block` | Experimental block (a temporally independent cohort). |
| `Tray` | Tray identifier within a block and treatment. |
| `Pupae_count` | Number of pupae recorded that day. |
| `Adult_count` | Number of adults that emerged that day. |
| `Water_added(ml)` | Water added to the tray that day, in milliliters. |
| `Dead` | Number of dead mosquitoes recorded that day. Missing values occur in this column. |
| `Exp.Day` | Experimental-day index. |

Counts in this file are daily counts, not cumulative totals. Before using it for a summary, decide how you will combine repeated daily records for each tray and check that the result is sensible.

### Clean data

`clean_data/juvenile_tray_survival.csv` contains one row per tray (249 rows plus a header). It is designed for the survival outcome.

| Column | Description |
| --- | --- |
| `replicate` | Unique tray/treatment identifier. |
| `block` | Experimental block. |
| `temp` | Temperature treatment, in degrees C. |
| `rh` | Relative humidity, as a percent. |
| `evap` | Water-management condition: `C` or `E`. |
| `tray_no` | Tray number. |
| `n_survivors` | Number of mosquitoes that emerged as adults from the original 100 larvae. |

Calculate survival proportion as `n_survivors / 100`.

`clean_data/juvenile_development_data.csv` contains one row per mosquito that emerged as an adult (9,349 rows plus a header). It is designed for the development-time outcome.

| Column | Description |
| --- | --- |
| `replicate`, `block`, `temp`, `rh`, `evap`, `tray_no` | Tray and treatment identifiers, defined above. |
| `development_time` | Day of adult emergence, in days. |
| `development_rate` | Reciprocal of development time (`1 / development_time`), in days^-1. |

Development time is observed only for mosquitoes that survived to adult emergence. Keep that limitation in mind when interpreting it alongside survival.

## Source

The exercise data are adapted from Huxley, P. J., J. J. Brown, B. St. Laurent, et al. (2026), “[Beyond Temperature: Relative Humidity Systematically Shifts Juvenile Thermal Performance and Projected Population Growth in a Malaria Vector](https://doi.org/10.1111/ele.70416),” *Ecology Letters* 29(6), 1-13. The original data and replication package are available from [Dryad](https://doi.org/10.5061/dryad.6q573n6db).

This exercise simplifies the original workflow. It does not ask you to reproduce the study’s thermal-performance curves, Bayesian models, or population-growth projections.
