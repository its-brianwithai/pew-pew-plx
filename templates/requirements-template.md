---
name: requirements-template
description: Use this template to document functional and non-functional requirements for a system or feature.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 📑 Requirements: [Title]
> 💡 *Detailed requirements specification for a system or feature, documenting functional and non-functional requirements. Captures actors, components, activities, behaviors, and properties to ensure all aspects are thoroughly defined and testable.*

[Brief introduction to the requirements document]

## 🧩 Actors & Components (Who or what)
> 💡 *List all actors (people or systems that perform actions) and components (elements that are acted upon). Start by listing nouns from your feature description, then expand by considering who uses it, what they interact with, what shows information, and what stores or processes data.*

<example>
- [[example-parent-component]]
    - [[example-actor-child]]
    - [[example-component-child]]
- [[example-standalone-actor]]
</example>

## 🎬 Activities (Who or what does what?)
> 💡 *List everything each Actor and Component can do, must do, or should do automatically. Start each activity with a verb (e.g., create, update, delete) and be specific. Think about user interactions, system automations, periodic tasks, and data operations.*

<example>
- [[example-actor]]
    - [Create item]
    - [Delete item]
- [[example-component]]
    - [Display confirmation message]
</example>

## 🌊 Activity Flows & Scenarios (What in which order?)
> 💡 *For each Activity, map out the sequence of steps to complete it. Define the ideal path (Happy Flow), potential failure paths (Error Flows), and edge cases (e.g., no connection, empty states). Break each flow into atomic, testable actions using Gherkin keywords (GIVEN, WHEN, THEN).*

<example>
- **[Activity Name]**
    - **Happy Flow:**
        - GIVEN [User] is at [[Home Screen]]
        - WHEN [User] [taps create item button]
        - THEN [[System]] [shows create item feedback]
        - AND [[System]] [creates database item]
    - **Error Flow (e.g., Invalid Input):**
        - GIVEN [User] is at [[Create Item Screen]]
        - WHEN [User] [enters an invalid email]
        - THEN [[System]] [shows an error message]
    - **Mermaid Diagram:**
        ```mermaid
        graph TD
            Start[User at Home Screen] --> TapButton[User taps create item button];
            TapButton --> ShowFeedback[System shows create item feedback];
            ShowFeedback --> CreateItem[System creates database item];
        ```
</example>

## 📝 Properties (Which values?)
> 💡 *For each object in your system (Actor, Component, etc.), describe its data properties. Think about identity (unique identifiers), configuration (changeable settings), and state (variable data). Specify a name and data type for each property.*

<example>
- [[example-user-actor]]
    - [user_id : string]
    - [is_enabled : boolean]
- [[example-button-component]]
    - [label : string]
    - [color : hex_code]
</example>

## 🛠️ Behaviours (How does it act?)
> 💡 *Define how an object looks, works, and performs under specific conditions. Focus on testable rules and constraints related to UI/UX, validation, limits, security, performance, and scalability.*

<example>
- [[example-input-field]]
    - [Should show an error state when validation fails.]
    - [Should not allow more than 280 characters.]
- [[example-list-view]]
    - [Should display a loading spinner while data is being fetched.]
    - [Should display an empty state message when there are no items to show.]
</example>