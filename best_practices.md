# Best practices for coding with AI assistance

## Before you start

- Know your problem before you write code — your data, your field's standards, existing implementations you can use
- Drive the problem-solving yourself: understand the domain and decompose the problem without delegating to the AI 
- Pick the right AI tool for the task — chatbots, IDE-integrated tools, agents
- Have a project description ready that you can copy-paste into a new conversation
- Have your coding guidelines/style preferences ready to copy-paste
- Consider the privacy/sensitivity level of your data before sharing anything with the tool
- Consider what model to use and whether "extra reasoning" is worth it for the task — more complex tasks may warrant a more capable (often paid) model
- Set the tool's settings intentionally — memory, whether your data trains the model, personalization

## While you work with the AI

- Ask for code, not conclusions or analysis 
- Break the problem into small, independently checkable chunks before you prompt
- Manage context deliberately — give it the background it needs up front (error messages in full, data structure, package versions, expected output, what you've already tried), and restate as needed
- Write down what the code should do (inputs, outputs, edge cases) before asking the AI to build or test it, so you have something concrete to check it against
- Ask the AI to help you think of edge cases and failure modes you might not have considered — then verify those yourself
- Ask the chatbot to write a plan and check in with you before it generates code
- Ask the chatbot to state its assumptions before generating code
- Ask the chatbot to ask you clarifying questions
- Create pseudocode before code
- Invest real effort in your instructions — a vague prompt gets a vague (or wrong) answer
- Iterate — refine over several turns rather than expecting one perfect answer
- Start a new conversation when a thread gets muddled or drifts off track

## Before you trust the output

- Review the code
- Understand the code before you use it
- Test the code as relevant
- Validate outputs against known-correct results whenever you have something to check against
- Be skeptical when the AI says something works or is correct — including its own self-assessments of its code. Verify independently through documentation, testing, or a colleague
- Ask the tool to explain code you don't fully understand
- Cross-check unfamiliar library usage against the documentation or other reliable sources — you can ask the chatbot for URLs
- Use a second AI tool for a second opinion when it matters, or try the same prompt in a fresh conversation — responses vary across tools and even across conversations with the same tool

## Keeping it manageable

- Refine incrementally with one focused goal at a time (e.g., "make this faster") rather than an open-ended "make it better"
- Keep the complexity of the code matched to your project's goals and scale
- Use the tool in a way that helps you learn, not just to get output faster — ask it to explain its code, discuss alternative approaches, and give feedback on code you wrote yourself
- Stay current — the tools change quickly and yesterday's limitations may no longer apply, so it's worth periodically revisiting what a tool can do and comparing notes with colleagues on what's working for them

## When you're done

- Document which AI tool(s) you used and roughly how, including the model name and version if available, the same way you'd cite any other resource
- Document the code itself — docstrings, a README, the environment it runs in, a worked example
- Give credit/attribution for AI-generated code or content
- Check your target journal's policy on disclosing AI use before you submit 
- Remember you're accountable for the code — its correctness and quality are on you, not the AI
