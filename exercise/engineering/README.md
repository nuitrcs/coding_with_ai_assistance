# Engineering: Do code comments help people understand programs?

## Project background

Comments can explain a program's purpose or draw attention to a tricky step, but they can also be redundant or distracting. In this study, computer-science students completed short Java program-comprehension tasks while seeing code snippets either with inline comments or without them. The researchers recorded whether each answer was correct and how long the participant took to respond.

## Research question

For these Java program-comprehension tasks, how do accuracy and response time differ between the **comments-present** and **comments-missing** conditions? Does the apparent pattern differ across code snippets?

Use the data to describe the experimental results. A useful analysis might compare the percentage of correct answers and a typical response time for each condition, then visualize those comparisons by task.

## Study design

Twenty computer-science students completed comprehension questions about 12 short Java snippets. Each snippet had two versions:

- `CP` (comments present): the code included inline comments.
- `CM` (comments missing): the same code did not include those comments.

This was a partially crossover, within-subjects design. Each participant completed every underlying task, but saw a given task in only one condition. For example, a participant who saw Task 1 with comments did not also see Task 1 without comments. Assignment and task order were balanced across the study.

The experimental observation is one participant's response to one code snippet. The 12 snippets differ in topic and difficulty, so do not treat all task rows as interchangeable. When pooling across tasks, account for task in your summaries or visualization; examining each task separately is a useful way to see whether the pattern is consistent.

For this workshop, focus on behavioral performance rather than the raw eye-tracking data. Eye-tracking measures require specialized preprocessing and are outside the scope of the exercise.

## Data files

### Raw data

`raw_data/` contains 20 semicolon-delimited files named `Results_<participant-id>.csv`, one for each participant, plus `solutions.csv`. Each result file records one participant's answers in the order they completed the tasks. Across the 20 files, there are 260 response rows: 20 `WarmUp` rows and 240 study-task rows. One study-task row records one participant's answer to one presented code snippet.

| Column | Description |
| --- | --- |
| `Number` | Order in which that participant completed the task. |
| `Task` | Snippet identifier, such as `Task1CP` or `Task1CM`; `WarmUp` is not part of the analysis. |
| `Answer_Out` | The participant's submitted answer. Answers can be numbers, Boolean values, or lists. |
| `Time` | Response time in milliseconds. |
| `TimeOut` | Whether the task reached the study's time limit. |
| `SubjectID` | An anonymized participant identifier. |

`solutions.csv` is also semicolon-delimited. It has `Task` and `Solution` columns and gives the correct answer for the warm-up and for both versions of each of the 12 tasks.

To produce an analysis dataset, read and combine the 20 result files, remove the `WarmUp` rows, join the answer key by `Task`, derive correctness, extract the task number and condition from `Task`, and convert response time to seconds. Inspect the data as you work: the source files use both uppercase and title-case forms of Boolean values (for example, `FALSE` and `False`). Decide how you will handle timeouts.

### Clean data

`clean_data/program_comprehension_clean.csv` contains the 240 study-task observations in analysis-ready form. It is the original replication package's combined performance-results output, renamed for this exercise.

| Column | Description |
| --- | --- |
| `Task` | Snippet identifier, such as `Task1CP` or `Task1CM`. |
| `Task_Number` | Underlying task number, from 1 to 12. |
| `Task_Type` | `CP` for comments present or `CM` for comments missing. |
| `Answer_Out` | The participant's submitted answer. |
| `Solution` | The answer specified in the task key. |
| `Correct` | Whether `Answer_Out` matches `Solution`. |
| `Time` | Response time in seconds. |
| `TimeOut` | Whether the task reached the time limit. |
| `Correct_Only_Time` | Response time for a correct answer, otherwise 0. |
| `SubjectID` | Anonymized participant identifier. |
| `TaskBase` | Task identifier without the condition, such as `Task1`. |
| `min`, `max` | Minimum and maximum response time for that task across both conditions. |
| `Normalized_Time`, `Time_Score` | Time transformations from the original analysis pipeline, used to construct its performance score. |

For the core exercise, `Task_Number`, `Task_Type`, `Correct`, `Time`, `TimeOut`, and `SubjectID` are the most useful columns. You may ignore the score-related columns unless you choose to explore the original authors' scoring approach.

## Source

The exercise data are adapted from Abdelsalam, Y., N. Peitek, A. Bergum, and S. Apel (2026), “[The Effect of Comments on Program Comprehension: An Eye-Tracking Study](https://doi.org/10.1007/s10664-025-10721-2),” *Empirical Software Engineering* 31, Article 94. The original replication package, including the Java snippets, task key, raw eye-tracking files, and analysis scripts, is available on [GitHub](https://github.com/brains-on-code/eyetracking-program-comprehension-comments).

This exercise simplifies the original workflow. It does not reproduce the study's eye-tracking preprocessing, mixed-effects models, or qualitative analysis of participant questionnaires.
