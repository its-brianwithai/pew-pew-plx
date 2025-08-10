---
name: bug-report-template
description: "Use this template when reporting a bug to ensure all necessary information is captured for effective triage and resolution."
instructions: "Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path."
---
# 🐞 Bug Report: [Concise Bug Title]
> 💡 *A detailed report of an issue found in the system, including steps to reproduce, expected vs. actual behavior, and environmental context.*

## 📝 Summary
> 💡 *A brief, one-sentence summary of the bug.*

[Provide a high-level summary of the issue.]

## 🚶 Steps to Reproduce
> 💡 *Provide a clear, step-by-step sequence of actions to reproduce the bug. Be as specific as possible.*

1. [First step]
2. [Second step]
3. [Third step]
4. ...

## ✅ Expected Behaviour
> 💡 *What did you expect to happen when you performed the steps above?*

[Describe the correct behavior.]

## ❌ Actual Behaviour
> 💡 *What actually happened when you performed the steps?*

[Describe the incorrect behavior.]

## 🖥️ Environment Details
> 💡 *Provide details about the environment where you encountered the bug.*

- **App Version:** [e.g., 1.2.3]
- **Operating System:** [e.g., iOS 15.4, Android 12, macOS Monterey]
- **Device:** [e.g., iPhone 13 Pro, Google Pixel 6]
- **Browser (if applicable):** [e.g., Chrome 101, Safari 15.4]

## 📸 Screenshots & Logs
> 💡 *Include any relevant screenshots, videos, or logs that can help diagnose the issue. Paste logs in a code block.*

[Add screenshots or video links here]

```
<logs>
[Paste any relevant logs here]
</logs>
```

## 💥 Impact & Severity
> 💡 *Describe the impact of this bug on users and the business. Assess its severity.*

- **Severity:** [Critical / High / Medium / Low]
- **Impact:** [Describe how this bug affects users. Does it block functionality? Is there a workaround?]
- **Frequency:** [How often does this bug occur? Every time / Sometimes / Rarely]

## 🎯 Triage Notes
> 💡 *Use this section for triage team assessment and preliminary analysis of the bug report.*

- **Priority Assignment:** [High / Medium / Low]  
  [Provide justification for priority level based on severity, impact, and business needs]

- **Root Cause Analysis:** [Preliminary hypothesis about what might be causing this issue]

- **Related Issues:** [List any duplicate issues or related bugs found in the backlog]

- **Recommended Action:** [Describe the next steps for addressing this bug - investigate, assign to team, escalate, etc.]
