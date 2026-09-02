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

`raw_data/program_comprehension_raw.csv` contains 240 observations (plus a header): 20 participants completing 12 tasks. It combines the study's original per-participant result files. One row records one participant's answer to one presented code snippet.

| Column | Description |
| --- | --- |
| `Task` | Snippet identifier, such as `Task1CP` or `Task1CM`. |
| `Number` | Order in which that participant completed the task. |
| `Answer_Out` | The participant's submitted answer. Answers can be numbers, Boolean values, or lists. |
| `Time` | Response time in milliseconds. |
| `TimeOut` | Whether the task reached the study's time limit. |
| `SubjectID` | An anonymized participant identifier. |

The raw file does not itself identify the correct answer. Determining whether an answer is correct requires matching `Task` to the answer key supplied with the original replication package. Before analysis, inspect how `Task` encodes both the task number and the condition, convert response time to seconds, and decide how you will handle timeouts.

### Clean data

`clean_data/program_comprehension_clean.csv` contains the same 240 participant-task observations in analysis-ready form. It retains the original response information and adds derived variables needed for the exercise.

| Column | Description |
| --- | --- |
| `participant_id` | Anonymized participant identifier. |
| `task` | Underlying task number, from 1 to 12. |
| `condition` | `CP` for comments present or `CM` for comments missing. |
| `answer` | The participant's submitted answer. |
| `correct_answer` | The answer specified in the study's task key. |
| `correct` | Whether `answer` matches `correct_answer`. |
| `response_time_seconds` | Response time in seconds. |
| `timed_out` | Whether the task reached the time limit. |
| `presentation_order` | Order in which the participant completed the task. |

## Source

The exercise data are adapted from Abdelsalam, Y., N. Peitek, A. Bergum, and S. Apel (2026), “[The Effect of Comments on Program Comprehension: An Eye-Tracking Study](https://doi.org/10.1007/s10664-025-10721-2),” *Empirical Software Engineering* 31, Article 94. The original replication package, including the Java snippets, task key, raw eye-tracking files, and analysis scripts, is available on [GitHub](https://github.com/brains-on-code/eyetracking-program-comprehension-comments).

This exercise simplifies the original workflow. It does not reproduce the study's eye-tracking preprocessing, mixed-effects models, or qualitative analysis of participant questionnaires.
