# 🌊 Refinement Workflow

This approach helps you systematically break down any system or feature into its fundamental components and document them comprehensively. The methodology follows a structured hierarchy that ensures nothing is missed.

## 🎯 Core Philosophy

Refined documentation should be:
- **Systematic**: Follow a consistent structure
- **Testable**: Each requirement can be validated
- **Hierarchical**: Build from basic elements to complex behaviours
- **Complete**: Cover all aspects from actors to performance

## 🧩 The Five-Layer Approach

### 1. Actors & Components (Who or what exists?)
**Definition**: Someone or something that can perform actions or be interacted with.

**Purpose**: Identify all the "things" in your system - both active participants (actors) and passive elements (components).

**Questions to ask**:
- What benefits from this?
- Who maintains this?
- What do users interact with?
- What shows information?
- What processes data?
- What stores data?
- What external systems are involved?
- What needs to be monitored?

**Method**:
1. List all nouns from your feature description
2. Expand by considering who uses it, what they interact with, what shows information, what stores data, and what processes data
3. Categorize as Actor (can perform actions) or Component (is acted upon)
4. Break down complex components into smaller, manageable pieces
5. Organize in parent-child relationships where applicable

### 2. Activities (Who or what does what?)
**Definition**: Actions that an Actor or Component performs. Must always contain a verb + action.

**Purpose**: Define what each entity in your system can, must, or should do.

**Example Questions to ask**:
- What can each actor do?
- What should happen automatically?
- What needs user input?
- What happens periodically?
- What triggers other activities?
- What needs to be logged?
- What needs to be measured?
- What needs authorization?

**Method**:
1. Take each Actor and Component
2. List everything they can do, must do, or should do automatically
3. Start each activity with a verb (create, update, delete, etc.)
4. Make activities specific and actionable
5. Focus on what needs to happen, not how it happens

### 3. Activity Flows & Scenarios (What in which order?)
**Definition**: Sequences of atomic actions that map out the steps to complete an Activity.

**Purpose**: Define the exact sequence of steps for successful completion (Happy Flow) and potential failure paths (Error Flows).

**Questions to ask**:
- What's the ideal path?
- What could fail?
- What needs validation?
- What needs confirmation?
- What's time sensitive?
- What needs recovery steps?
- What should be cached?
- What should be retried?
- What needs rollback?

**Method**:
1. For each Activity, define the perfect scenario (Happy Flow)
2. Add Error Flows by asking "what could go wrong?" at each step
3. Consider edge cases (no connection, empty states, loading states)
4. Break each flow into atomic (indivisible) actions
5. Use BDD Gherkin keywords: GIVEN, WHEN, THEN, AND, BUT
6. Each atomic action should be clearly implementable and testable

### 4. Properties (Which values?)
**Definition**: Describes a value or configuration that belongs to an object.

**Purpose**: Define the data structure and attributes needed by each entity in your system.

**Questions to ask**:
- What identifies it?
- What describes it?
- What configures it?
- What measures it?
- What styles it?
- What formats it?
- What tracks it?
- What groups it?
- What orders it?

**Method**:
1. For each object, consider data needs in three categories:
    - Identity (what makes it unique)
    - Configuration (what can be changed)
    - State (what can vary)
2. Define what needs to be stored, displayed, measured, or tracked
3. Specify clear data types and purposes for each property

### 5. Behaviours (How does it act when... in terms of...?)
**Definition**: Defines how something looks, works, and performs in terms of UI/UX, rules & limits, data & analytics, security, performance, and scalability.

**Purpose**: Specify the rules, constraints, and performance characteristics of your system.

**Questions to ask**:
- When should it change?
- How should it respond?
- What are the limits?
- What needs validation?
- What needs animation?
- What needs protection?
- What should be cached?
- What should be optimized?
- What should be monitored?
- What needs fallback?
- How should it scale?
- What should be logged?
- How should it fail?
- What should be measured?
- What needs authorization?

**Method**:
1. Consider each object's rules and constraints in terms of:
    - Limits (max/min values, allowed inputs)
    - Timing (when, how often)
    - Security (who can access)
    - Performance (what needs to be fast)
    - Scalability (how to handle more users)
    - Security (who can access)
    - Data (what data is needed)
    - Analytics (what data to track)
    - UI/UX (how it looks and feels)
    - Rules (what rules apply)
2. Focus on behaviours that can be clearly tested
3. If you can't write a test for it, make it more specific

## 🔄 Implementation Process

1. **Start with the big picture**: Identify your main actors and components
2. **Define capabilities**: What can each actor/component do?
3. **Map the flows**: How do activities actually happen step by step?
4. **Specify the data**: What information is needed at each step?
5. **Define the rules**: How should everything behave under different conditions?

## 🎯 Key Success Factors

- **Be systematic**: Work through each layer completely before moving to the next
- **Think hierarchically**: Build parent-child relationships where they make sense
- **Focus on testability**: Every requirement should be verifiable
- **Use consistent language**: Stick to the established vocabulary (actors, components, activities, etc.)
- **Link everything**: Show how different elements relate to each other
- **Stay atomic**: Break complex items into simple, indivisible pieces

This approach ensures comprehensive coverage of your system while maintaining clarity and testability throughout the requirements documentation process.
