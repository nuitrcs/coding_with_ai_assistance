# Workshop outline

## Schedule

9:30am–4:00pm, 1-hr lunch at noon, three ~10-min breaks.

| Time | Duration | Segment |
|---|---|---|
| 9:30–9:45 | 15 min | 1. Welcome & introductions |
| 9:45–10:10 | 25 min | 2. Context from consults / real-world stories |
| 10:10–10:55 | 45 min | 3. Lecture: key best practices |
| 10:55–11:05 | 10 min | Break |
| 11:05–11:20 | 15 min | Exercise kickoff (groups, dataset, bingo, expectations) |
| 11:20–12:00 | 40 min | 4a. Exercise — Plan the project |
| 12:00–1:00 | 60 min | **Lunch** |
| 1:00–1:40 | 40 min | 4b. Exercise — Explore & clean the data |
| 1:40–2:10 | 30 min | 4c. Exercise — Work with existing code |
| 2:10–2:20 | 10 min | Break |
| 2:20–3:00 | 40 min | 4d. Exercise — Analyze & visualize |
| 3:00–3:15 | 15 min | 4e. Group readouts |
| 3:15–3:25 | 10 min | Break |
| 3:25–4:00 | 35 min | 5. Final debrief, bingo, takeaways |

---

## 1. Welcome & introductions (15 min)

- Who we are and what RCDS does
- What this workshop is / isn't (tool-agnostic, human-in-the-loop coding assistance — not agents, etc.)
- Logistics: schedule for the day, prerequisites check (everyone has access to a chatbot), where materials live

## 2. Context: what we're seeing (25 min)

- Real-world stories from consults — issues we see researchers run into with AI-assisted coding
- Brief, informal show-of-hands / quick share: "What are you already using AI for in your coding?" 

## 3. Lecture: key best practices (45 min)

Focus on the key best practices; more best practices get introduced during the exercise and added to the bingo card. Organized around the four main messages:

**A. Ask for code, not conclusions / analysis**
- Have the AI write code you run yourself — don't ask it to analyze your data or hand you conclusions directly
- The code an AI writes tends to be verbose and trained more for software engineering than data science/research workflows — use it with that in mind

**B. Break it down yourself**
- Decompose into small chunks (function/script-sized), not "build my whole pipeline"
- Ask the AI to propose a plan or pseudocode and check in before it generates code

**C. Human in the loop — you drive**
- Understand and review every piece of code before you run or trust it
- Cross-check unfamiliar library usage against the documentation
- Iterate — one prompt rarely gets it right; use follow-ups or different conversations

**D. Research and data practices still apply**
- Reproducibility and documentation (comments, docstrings, README)
- Know your data before and while you clean/analyze it
- Test on small examples / toy data; think about edge cases
- Keep code complexity matched to the project's actual scale and goals

## Exercise kickoff (15 min)

- Split into groups of 3–4
- Each group gets assigned one of the 3 research-question/dataset tracks (social science, bio, engineering)
- Hand out: the project summary for their track, a project-folder starter template, and the best-practices bingo card
- Explain the deliverable: by 3:00pm, each group gives a ~3-min readout of their approach and findings
- We'll be circulating throughout to help and to call out best practices as they happen (tie-in to bingo)

### Best-practices bingo

- A grid mixing (a) the practices just covered in the lecture and (b) additional ones seeded during the exercise — e.g. "asked two different chatbots the same question and compared," "caught the AI making something up," "rewrote a vague prompt after a bad first answer," "asked the AI to explain unfamiliar code before using it"
- Groups (or individuals) mark a square when they catch themselves — or a teammate — doing it; we also point out squares as we walk around

---

## 4. Exercise: one project, start to finish (~3 hrs total)

Each group works one continuous project simulation on their assigned dataset/research question, moving through the real research pipeline. Checkpoints between phases are short group debriefs (facilitator-led, whole room or per-table) tying what just happened back to the best practices. We circulate around.

(Datasets/research questions aren't chosen yet. Everything below is written to be dataset-agnostic so it drops in once we have them.)

### 4a. Plan the project (40 min, pre-lunch)

**Goal:** translate the research question into a computational task and set project up before touching data.

- Prompt the AI to help translate the research question into a concrete computational task
- Break the project into smaller steps/milestones
- Ask the AI to propose 2–3 candidate methodological approaches; group discusses and picks one, sanity-checking against what they actually know about the domain
- Sketch a project folder structure (with AI help) — where scripts, data, outputs will live
- **Deliverable:** a short written plan + a folder skeleton
- **Checkpoint:** quick round — one thing that surprised them when asking the AI for a plan; we can highlight message #2 (break it down) and #3 (human in the loop) as observed in the room

### 4b. Explore & clean the data (40 min)

**Goal:** know the data before analyzing it.

- Use AI-assisted code (not AI-generated summaries) to load and explore the data
- Identify data-quality issues and edge cases as a group 
- Write and run AI-assisted cleaning code
- **Checkpoint:** groups share one data-quality issue they found and how they verified the AI's cleaning code actually worked

### 4c. Work with existing code (30 min) — embedded pre-existing-code step

**Goal:** the "inheriting someone else's code" use case that Colby suggested.

- Each group gets handed a chunk of pre-existing, partially-working code framed as coming from "a postdoc in the lab" (or a prior collaborator) that supposedly performs some next step of the analysis
- Task: use the AI to help understand what the code does and why, identify hidden assumptions it makes about the data, decide whether it's actually correct/appropriate for their dataset, and adapt or rewrite it as needed
- **Checkpoint:** groups share one assumption they found buried in the "postdoc's" code

### 4d. Analyze & visualize (40 min)

**Goal:** produce findings using AI-assisted code, with the group verifying code and outputs.

- Use AI-assisted code (building on/adapting the code from 4c) to run the analysis
- Visualize results — again, ask the AI for plotting code
- Check code
- Sanity-check outputs against what the group expects from the domain/data
- Draft a 2–3 sentence summary of findings for the readout

### 4e. Group readouts (15 min)

- Each group gives a ~3-min informal readout: research question, approach, one finding, one best-practice moment (tie-in to bingo)

---

## 5. Final debrief & takeaways (35 min)

- Bingo review: which squares did people fill? Any best practices that came up that weren't on the card?
- Reflection question: what are three things from today people will try in their own work this week?
- Recap the four main messages
- Point to resources
- Q&A
