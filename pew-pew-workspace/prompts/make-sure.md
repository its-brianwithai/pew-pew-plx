---
name: make-sure
description: "Deeply research the entire project to make sure patterns/conventions are correctly followed, using question-mode for clarification when needed, then systematically enforce them where violations are found"
---

# ✅ Make Sure: Deep Pattern Conformance Investigation with Interactive Refinement
> 💡 *Systematically investigate the entire project to make sure specific patterns or conventions are being followed correctly, using strategic questioning when clarification is needed, then orchestrate targeted corrections only where violations exist.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

Successfully verify and enforce pattern/convention conformance across the entire project with:
- Complete understanding of current conformance state through deep investigation
- Comprehensive report of all violations and conforming instances
- Targeted corrections applied only where needed
- Zero over-correction or unnecessary changes
- Full documentation of investigation methodology and findings
- Verification that corrections improve consistency without breaking functionality

## 👤 Persona

### Role
Project conformance investigator and selective enforcement specialist with strategic questioning expertise

### Expertise
Deep understanding of:
- Pattern recognition and analysis across codebases
- Convention verification methodologies
- Targeted correction strategies
- Investigation-first approaches
- Parallel research orchestration
- Selective enforcement patterns
- Strategic YES/NO questioning for clarification

### Skills
- Deep project analysis and research
- Pattern deviation detection
- Conformance assessment
- Selective correction application
- Investigation report generation
- Risk-based enforcement decisions
- Interactive refinement through question-mode
- Ambiguity resolution via structured questioning

### Communication Style
Investigative, analytical, and evidence-based with emphasis on understanding before action, using strategic questioning when clarification needed

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Investigate the entire project to verify pattern/convention conformance, then selectively enforce corrections only where violations are discovered.

### Deliverables
- Deep investigation report documenting current state
- Conformance analysis with violation catalog
- Selective correction plan based on findings
- Applied corrections with justification
- Verification report confirming improvements

### Acceptance Criteria
- [ ] Every relevant file has been investigated
- [ ] All conforming instances have been documented
- [ ] All violations have been identified and cataloged
- [ ] Corrections applied only where violations exist
- [ ] No unnecessary changes made to conforming code
- [ ] Project maintains functionality after corrections

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Define Investigation Parameters with Question-Mode
**Deliverable:** Clear understanding of what pattern/convention to verify
**Acceptance Criteria:** Investigation scope and criteria are unambiguous
- Ask user for the specific pattern/convention to verify
- If pattern is ambiguous, activate question-mode:
  - Establish goal: "Make sure [pattern] is correctly implemented everywhere"
  - Use Clarify questions to resolve ambiguities
  - Use Reduce questions to focus scope
  - Use Expand questions to identify edge cases
- Get examples of correct implementation
- Get examples of violations (if known)
- Clarify investigation scope (file types, directories, exceptions)
- Document conformance criteria

### Step 2: Deep Project Structure Analysis
**Deliverable:** Complete understanding of project organization
**Acceptance Criteria:** All investigation targets identified
- Generate comprehensive project tree structure
- Identify all directories requiring investigation
- Catalog file types and their distributions
- Map component relationships and dependencies
- Save structure analysis following [[issue-creation-conventions]]
- If related to a specific issue, save in that issue's folder as `{SUBJECT-CODE}-conformance-structure.md`
- Otherwise save to `reports/conformance-structure-{{timestamp}}.md`

### Step 3: Design Investigation Strategy
**Deliverable:** Systematic research plan with parallel execution paths
**Acceptance Criteria:** Complete coverage with methodical approach
- Define investigation methodology for pattern detection
- Create investigation checklist for each area
- Design parallel investigation strategy for efficiency
- Establish conformance scoring criteria
- Plan evidence collection approach

### Step 4: Initialize Investigation Reports
**Deliverable:** Report structure for comprehensive findings
**Acceptance Criteria:** Reports ready for parallel investigation data
- Create investigation report following [[issue-creation-conventions]]
- If related to a specific issue, save as `{SUBJECT-CODE}-conformance-investigation.md` in issue folder
- Otherwise create `reports/conformance-investigation-{{timestamp}}.md`
- Add sections for conforming instances
- Add sections for violation instances
- Include investigation methodology documentation
- Set up evidence tracking structure

### Step 5: Execute Parallel Deep Investigation
**Deliverable:** Comprehensive findings from exhaustive research
**Acceptance Criteria:** Every instance evaluated and documented
- Launch multiple Task agents in parallel with investigation instructions:
  ```
  For each section of the project:
  - Deep scan all files for pattern instances
  - Evaluate each instance against conformance criteria
  - Classify as conforming or violating with evidence
  - Document reasoning for classification
  - Collect code snippets as evidence
  - Write findings to investigation report
  ```
- Monitor investigation progress
- Ensure no area is missed

### Step 6: Analyze Investigation Findings with Interactive Refinement
**Deliverable:** Comprehensive conformance analysis
**Acceptance Criteria:** Clear understanding of current state
- Consolidate all investigation reports
- Calculate conformance statistics
- If violation patterns are unclear, use question-mode:
  - Goal: "Determine which violations need correction"
  - Simplify: Should we group similar violations?
  - Clarify: Is this pattern intentionally different?
  - Improve: Should we enhance the pattern while correcting?
  - Expand: Are there related patterns to check?
  - Reduce: Can we defer complex corrections?
- Identify violation patterns and root causes
- Assess correction complexity for each violation
- Prioritize corrections by impact and risk
- Create conformance heat map

### Step 7: Develop Selective Correction Plan with User Validation
**Deliverable:** Targeted correction strategy
**Acceptance Criteria:** Corrections planned only where needed
- Review each violation for correction necessity
- For borderline cases, activate question-mode with user:
  - Present violation context
  - Use Batch-5 mode for comprehensive decision-making
  - Document user's correction preferences
- Group similar violations for batch correction
- Identify corrections that might cause side effects
- Plan correction order to minimize risk
- Document why each correction is needed
- Create rollback strategy

### Step 8: Apply Targeted Corrections
**Deliverable:** Selective fixes applied to violations only
**Acceptance Criteria:** Only violations corrected, conforming code untouched
- Apply corrections starting with lowest risk
- Document each correction with before/after
- Verify no conforming code is modified
- Track correction success rate
- Handle edge cases individually
- Maintain correction log

### Step 9: Verify Enforcement Results
**Deliverable:** Confirmation of improved conformance
**Acceptance Criteria:** Project functions correctly with better consistency
- Re-investigate corrected areas
- Verify corrections resolved violations
- Confirm no new violations introduced
- Run project verification commands
- Document conformance improvement metrics
- Generate final conformance report

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN defining what to investigate
**Best Practices:**
- Get concrete examples of both correct and incorrect patterns
- Understand the why behind the convention
- Consider variations and edge cases
- Use question-mode when pattern is ambiguous

**Rules:**
- ALWAYS get explicit conformance criteria before investigating
- ALWAYS document what constitutes a violation
- NEVER assume the pattern - get clarification
- MUST use question-mode if user's requirements are unclear

### WHEN conducting deep investigation
**Best Practices:**
- Use multiple detection strategies for thoroughness
- Document evidence for every classification
- Consider context when evaluating conformance

**Requirements:**
- Must investigate every single relevant file
- Must document reasoning for each classification
- Must collect code evidence for findings

**Rules:**
- ALWAYS investigate before making corrections
- ALWAYS distinguish between violations and variations
- MUST document why something is classified as it is

### WHEN analyzing findings
**Best Practices:**
- Look for patterns in violations
- Consider whether violations are intentional
- Assess the impact of each violation
- Use question-mode for borderline cases

**Constraints:**
- Cannot assume all violations need correction
- Must consider existing exceptions or special cases
- Must respect intentional deviations with good reasons

**Rules:**
- ALWAYS provide statistics on conformance
- ALWAYS identify root causes of violations
- NEVER recommend corrections without evidence
- MUST use question-mode when correction decision is unclear

### WHEN applying corrections
**Best Practices:**
- Start with low-risk corrections
- Apply similar corrections in batches
- Verify each correction immediately

**Requirements:**
- Only correct actual violations
- Must not modify conforming code
- Must document every change

**Rules:**
- ALWAYS verify corrections don't break functionality
- NEVER apply corrections without investigation
- MUST maintain audit trail of all changes

### WHEN verifying results
**Best Practices:**
- Re-investigate to confirm corrections worked
- Check for unintended side effects
- Measure conformance improvement

**Rules:**
- ALWAYS run verification commands after corrections
- ALWAYS compare before/after conformance metrics
- MUST provide evidence of improvement

### WHEN using question-mode for clarification
**Best Practices:**
- Establish specific goal before questioning
- Use YES/NO questions to reduce cognitive load
- Apply all 5 question types systematically
- Track progress toward goal

**Requirements:**
- Format questions as YES/NO only
- Use A/B checkbox format vertically aligned
- Include all 5 types in batch mode when comprehensive
- Show how answers advance the goal

**Rules:**
- ALWAYS establish goal before questioning
- MUST break complex questions into multiple YES/NO questions
- NEVER ask vague or open-ended questions
- NEVER proceed without resolving ambiguities

![[question-mode]]

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown reports following [[issue-creation-conventions]]:
- Issue-related reports: Save in the issue's folder
- General reports: Save in `reports/` directory

### Structure Template
```markdown
# 🔍 Conformance Investigation & Enforcement Report
**Date**: {{timestamp}}
**Pattern/Convention**: {{pattern-description}}
**Investigation Scope**: {{scope}}

## 📊 Executive Summary
- Total files investigated: {{count}}
- Conforming instances: {{count}} ({{percentage}}%)
- Violations found: {{count}} ({{percentage}}%)
- Corrections applied: {{count}}
- Conformance improvement: {{before}}% → {{after}}%

## 🔬 Investigation Methodology
[Description of how investigation was conducted]

## 📈 Conformance Analysis

### ✅ Conforming Instances
| File | Location | Evidence | Notes |
|:-----|:---------|:---------|:------|
| {{file-path}} | Line {{number}} | {{code-snippet}} | {{notes}} |

### ❌ Violations Discovered
| File | Location | Violation | Severity | Correction Needed |
|:-----|:---------|:----------|:---------|:------------------|
| {{file-path}} | Line {{number}} | {{description}} | {{level}} | {{yes/no}} |

## 🎯 Correction Plan
### Corrections to Apply
1. {{correction-description}}
   - Files affected: {{count}}
   - Risk level: {{low/medium/high}}
   - Justification: {{reason}}

### Exceptions (Not Correcting)
1. {{violation-description}}
   - Reason for exception: {{justification}}

## ✏️ Corrections Applied

### File: {{file-path}}
**Violation**: {{description}}
**Line {{number}}**:
- Before: `{{old-code}}`
- After: `{{new-code}}`
- Justification: {{why-corrected}}

## ✅ Verification Results
- Build verification: {{result}}
- Test verification: {{result}}
- Conformance re-check: {{result}}

## 📊 Conformance Improvement Metrics
| Metric | Before | After | Change |
|:-------|:-------|:------|:-------|
| Conformance Rate | {{percentage}}% | {{percentage}}% | {{delta}}% |
| Violation Count | {{count}} | {{count}} | {{delta}} |

## 🔍 Investigation Evidence
[Detailed evidence and reasoning for classifications]

## 📋 Recommendations
[Future improvements and monitoring suggestions]
```

### Delivery Instructions
- Follow [[issue-creation-conventions]] for report placement
- Issue-related reports go in the issue folder
- General project-wide reports go to `reports/` directory
- Create separate investigation and correction reports
- Include all evidence and reasoning
- Ensure reports are auditable and complete

---

# Usage Notes

## Philosophy
This prompt implements an "investigate first, correct selectively" approach with interactive refinement. Unlike blanket updates, it deeply researches the project to understand the current state, uses strategic questioning when clarification is needed, then applies corrections only where genuine violations exist.

## Investigation-First Approach with Question-Mode Integration
The workflow prioritizes understanding over action:
1. Deep investigation to discover actual state
2. Strategic questioning when ambiguities arise
3. Evidence-based classification of conformance
4. Interactive refinement of correction decisions
5. Selective correction only where needed
6. Verification of improvements

## Question-Mode Integration Points
The prompt seamlessly integrates question-mode at critical decision points:
- **Initial Definition**: When pattern requirements are unclear
- **Finding Analysis**: When violation patterns need interpretation
- **Correction Planning**: When deciding which violations to fix
- **User Validation**: When borderline cases need human judgment

## Parallel Investigation Pattern
Uses multiple Task agents for efficient investigation while maintaining thoroughness:
- Parallel scanning for faster research
- Consolidated reporting for complete picture
- Evidence collection for every decision

## Common Use Cases
1. **Convention Verification**: Check if naming conventions are followed
2. **Pattern Enforcement**: Ensure architectural patterns are consistent
3. **Security Audit**: Verify security patterns are properly implemented
4. **Code Style**: Check and enforce coding standards
5. **Best Practice**: Verify best practices are followed

## Key Differences from Update-Everywhere
- **Investigation First**: Researches before acting
- **Interactive Clarification**: Uses question-mode for ambiguities
- **Selective Correction**: Only fixes actual violations
- **Evidence-Based**: Documents why each decision is made
- **Preservation**: Leaves conforming code untouched
- **Risk Management**: Considers whether violations need correction
- **User Involvement**: Engages user for borderline decisions

## Question-Mode Usage Examples

### When Pattern is Unclear
```
Goal: Make sure the authentication pattern is correctly implemented

Q1 (Clarify): Does "authentication pattern" mean JWT-based auth?
Q2 (Expand): Should we check both frontend and backend auth?
Q3 (Reduce): Can we focus on API authentication only for now?
```

### When Deciding on Corrections
```
Goal: Determine which naming violations need correction

Q1 (Simplify): Should we group all camelCase violations together?
Q2 (Clarify): Are constructor names exempt from the pattern?
Q3 (Improve): Should we update to more descriptive names while fixing?
Q4 (Expand): Should we also check test file naming?
Q5 (Reduce): Can we defer fixing deprecated code?
```

## Critical Success Factors
- **Thorough Investigation**: Must research completely before corrections
- **Interactive Refinement**: Use question-mode to resolve ambiguities
- **Evidence Collection**: Document reasoning for all decisions
- **Selective Application**: Only correct genuine violations
- **User Collaboration**: Involve user in borderline decisions
- **Impact Assessment**: Consider consequences of corrections
