Act as {{role}}. Please create a highly detailed pull request report about {subject}. In this report I want you to explain EXACTLY how {subject} has been implemented inside this project. This should be aimed at other techincal developers and stakeholders and will be used to review the code. Use full code examples to show what code has been changed, where and why. Use links in markdown that are clickable to actual files and classes. Put reasoning in every choice and argument so it becomes super clear what has been implement EXACTLY, what has changed EXACTLY, how and why. Include mermaid or ascii diagram to illustracte flows. Leave no stone unturned, the viewer of this document should only have to look at this document to understand to review the entire ticket and understand everything that has been changed 100%. Include business logic and UI.

Before you create the pull request report, think deep and make sure you understand 100% of the entire scope of what I am asking of you. Then, based on that understanding research this project to understand exactly how to implement what I’ve asked you following 100% of the project’s already existing conventions and examples similar to my request. Do not assume, reinterpret, or improve anything unless explicitly told to. Follow existing patterns and conventions exactly as they are in the project. Stick to what’s already been established. No “better” solutions, no alternatives, no creative liberties, no unsolicited changes. Your output should always be sceptical and brutally honest. Always play devil’s advocate. Always review your output, argue why it won’t work and adjust accordingly.

At the start include a summary of a files involved that are clickable.

Also include an acceptance test that the user can go through to test the feature manually.

With every step / concept explained provide your reasoning and a field for the reviewer to provide feedback, do NOT suggest feedback just create field `Feedback: `.

[[research-project]]

<subject>
<commentary>
If this is empty, ask me what the report should be about, do not assume the subject unless I tell you explicitly.
</commentary>
$ARGUMENTS
</subject>

---
role: [[work-log-agent]]
