## 🎬 Scenario: [Scenario Name]
> 💡 *What steps do which actors take? Sequence of actions that [[actors]] perform to achieve a specific outcome.*

### 🎯 Goal

[What is the end goal or outcome this scenario achieves]

```
<example>
Enable [[actor]] to [[primary-action]] so they can [[desired-outcome]]
</example>
```

### 👥 Actors Involved

[List the actors who participate in this scenario]

```
<example>
- [[primary-actor]] - Main actor driving the scenario
- [[secondary-actor]] - Supporting actor in the process
- [[system-actor]] - Automated system or component involved
</example>
```

### 📋 Gherkin Steps

```
<example>
**Happy Flow:**
- **GIVEN** [[actor]] is in [[initial-state]] 
- **AND** [[precondition]] exists
- **WHEN** [[actor]] performs [[action]]
- **AND** [[actor]] interacts with [[component]]
- **THEN** [[expected-outcome]] occurs
- **AND** [[system-actor]] responds with [[system-response]]

**Alternative Flow ([Alternative Name]):**
- **GIVEN** [[actor]] is in [[alternative-state]]
- **WHEN** [[actor]] chooses [[alternative-action]]
- **THEN** [[alternative-outcome]] occurs

**Error Flow ([Error Type]):**
- **GIVEN** [[actor]] encounters [[error-condition]]
- **WHEN** [[actor]] attempts [[failed-action]]
- **THEN** [[error-message]] is displayed
- **AND** [[actor]] can [[recovery-action]]
</example>
```

### 📊 Mermaid Diagram

``````
<example>
```mermaid
sequenceDiagram
    participant Actor1 as [[primary-actor]]
    participant Actor2 as [[system-actor]]
    Actor1->>Actor2: [[action]]
    Actor2-->>Actor1: [[response]]
```
</example>
``````
