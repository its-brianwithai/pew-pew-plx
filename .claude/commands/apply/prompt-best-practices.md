---
name: prompt-best-practices
description: "Best practices for designing effective modular prompts that achieve specific outcomes."
---
# Instruction Command

When this command is used, acknowledge that you understand these instructions and will follow them throughout the conversation. Then await the user's request.

---


# 🌟 Prompt Best Practices
> 💡 *Industry standards and proven approaches for creating high-quality, maintainable prompts.*

## Start with End Goal

### Define Success First
The End Goal is your north star - it determines whether any other section should exist. Write it as:
- Specific and measurable
- Outcome-focused, not process-focused
- Clear enough that success is unambiguous
- Concise but complete

### Example End Goals
- ✅ "Generate production-ready Flutter widget tests with 100% coverage"
- ✅ "Transform user stories into technical implementation plans"
- ❌ "Help with testing" (too vague)
- ❌ "Follow the testing process" (process, not outcome)

### WHEN defining End Goals
- ALWAYS make them measurable
- ALWAYS focus on the outcome
- ALWAYS keep them concise
- NEVER include process steps
- NEVER leave ambiguity

## Apply Ruthless Modularity

### Include Only What Contributes
Each section must pass the contribution test:
1. Does this section help achieve the End Goal?
2. Would the prompt fail without it?
3. Does it add more value than complexity?

If any answer is "no", exclude the section.

### Component Decision Framework
```
Persona:
- ✅ Include if: Specialized expertise improves outcome
- ❌ Exclude if: General knowledge suffices

Workflow:
- ✅ Include if: Multi-step process with dependencies
- ❌ Exclude if: Single action or simple task

Instructions:
- ✅ Include if: Specific rules prevent common failures
- ❌ Exclude if: Obvious or redundant with Request

Output Format:
- ✅ Include if: Specific structure required
- ❌ Exclude if: Standard text response works
```

### WHEN evaluating components
- ALWAYS test against End Goal
- ALWAYS document inclusion rationale
- ALWAYS prefer exclusion when uncertain
- NEVER include components by default
- NEVER add sections "just in case"

## Structure for Clarity

### Use Verb-First Requests
Start every Request section with an action verb:
- "Create comprehensive test suites..."
- "Analyze performance metrics..."
- "Transform raw data into..."
- "Generate documentation for..."

### Write Atomic Workflow Steps
Each workflow step should be:
- **Atomic**: Cannot be broken down further
- **Testable**: Has clear success criteria
- **Independent**: Can be understood in isolation
- **Deliverable-focused**: Produces specific output

### WHEN structuring prompts
- ALWAYS use clear section headers
- ALWAYS follow the template order
- ALWAYS include visual hierarchy (headers, bullets)
- NEVER mix section types
- NEVER skip standard headers

## Optimize for Reusability

### Extract at the Right Time
Follow the extraction timeline:
1. **First use**: Keep inline
2. **Second use**: Consider extraction
3. **Third use**: Extract to file
4. **Multiple variants**: Create agent

### Design Generic Components
When extracting, make components:
- Parameterizable via variables
- Context-independent
- Self-contained
- Well-documented
- Version-controlled

### WHEN extracting components
- ALWAYS wait for pattern emergence
- ALWAYS generalize for reuse
- ALWAYS document parameters
- NEVER extract single-use components
- NEVER create unnecessary dependencies

## Use Effective Language

### Write with Precision
- Use specific, technical terms
- Avoid ambiguous phrases
- Define acronyms on first use
- Provide examples for clarity
- Use consistent terminology

### Apply Positive Framing
Instead of "don't" statements, use positive instructions:
- ✅ "Always validate input before processing"
- ❌ "Don't forget to validate input"
- ✅ "Include error handling for all operations"
- ❌ "Never skip error handling"

### WHEN writing prompt content
- ALWAYS use active voice
- ALWAYS be specific and concrete
- ALWAYS provide examples
- NEVER use ambiguous language
- NEVER assume context

## Implement Smart WikiLinks

### Strategic Component Embedding
Embed components that:
- Are stable and well-tested
- Used across multiple prompts
- Represent complete units
- Have clear boundaries

### Maintain Link Hygiene
- Verify all links before committing
- Use descriptive link names
- Document what each link provides
- Keep embedded links on separate lines
- Test after sync

### WHEN implementing wikilinks
- ALWAYS verify target exists
- ALWAYS use exact file names
- ALWAYS place embeds on separate lines
- NEVER use broken links
- NEVER embed unstable components

## Apply Systematic Refinement

### Use Question-Mode Effectively
Apply all five question types:
1. **Simplify**: Can components be combined or removed?
2. **Clarify**: Are all requirements unambiguous?
3. **Improve**: What would increase quality?
4. **Expand**: What edge cases need coverage?
5. **Reduce**: What can be deferred to MVP?

### Iterate with Purpose
- First pass: Get it working
- Second pass: Make it clear
- Third pass: Make it reusable
- Fourth pass: Optimize and extract

### WHEN refining prompts
- ALWAYS apply all question types
- ALWAYS test against use cases
- ALWAYS seek external review
- NEVER over-optimize
- NEVER skip validation

## Test Conceptually

### Mental Execution
Before finalizing, mentally run through:
1. Can each step be executed?
2. Are success criteria measurable?
3. Do components work together?
4. Are edge cases handled?
5. Is the output format clear?

### Validation Scenarios
Test the prompt against:
- Happy path execution
- Error conditions
- Edge cases
- Resource constraints
- User variations

### WHEN testing prompts
- ALWAYS validate mentally first
- ALWAYS test edge cases
- ALWAYS verify output format
- NEVER assume correctness
- NEVER skip validation

## Document Evolution

### Track Component Journey
Document the evolution:
```markdown
## Evolution History
- v1.0: Inline implementation
- v1.1: Extracted workflow to @workflows/feature-workflow.md
- v1.2: Extracted persona to [[domain-expert]]
- v2.0: Composed into [[feature-agent]]
```

### Maintain Change Log
Track significant changes:
- Component additions/removals
- Major refinements
- Breaking changes
- Performance improvements

### WHEN documenting evolution
- ALWAYS track major changes
- ALWAYS note extraction decisions
- ALWAYS document breaking changes
- NEVER lose evolution history
- NEVER skip version notes

## Optimize Performance

### Minimize Cognitive Load
- Use clear, scannable structure
- Group related information
- Provide visual breaks
- Use consistent formatting
- Limit section depth

### Balance Detail vs. Brevity
- Enough detail to be unambiguous
- Not so much that it's overwhelming
- Use examples instead of long explanations
- Link to details rather than include everything

### WHEN optimizing prompts
- ALWAYS consider readability
- ALWAYS balance completeness with clarity
- ALWAYS use visual hierarchy
- NEVER sacrifice clarity for brevity
- NEVER include unnecessary detail

## Maintain Consistency

### Follow Project Patterns
- Use established naming conventions
- Apply standard structure
- Maintain consistent voice
- Use project terminology
- Follow existing examples

### Create Prompt Families
For related prompts:
- Share common components
- Use consistent structure
- Maintain naming patterns
- Apply same refinement level
- Document relationships

### WHEN ensuring consistency
- ALWAYS follow project conventions
- ALWAYS check existing patterns
- ALWAYS maintain voice and tone
- NEVER create new patterns unnecessarily
- NEVER diverge without documentation
