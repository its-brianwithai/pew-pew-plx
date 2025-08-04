
```
<todo-1>
phase 1 output a filled in discovery template
turn these into an discovery-template.md 

it has these blocks:

1. [[initial-request-block]]
2. [[actors-components-block]]
3. [[high-level-requirements-block]]

so we start with an intial request from the user which can include just the user request and or research, best practices whatever, but we keep it as 1 section called initial request
then we disect all mentioned and indirect actors and components we're going to need for our high levelities, we do this back and forth between coming up with high level requreiemtsn and updating the actos and components
then the high level requirements block per actors and components as parents, 

</todo-1>
```

---

```
<todo-2>
phase 2 output a filled in high-level-requirements template
we focus high level states and abilities and the deliverable we need to create or have for each step / requirement in total
so per high level requirement we'll define the actvity flows and its de

4. [[activity-flows-block]]
    5. [[deliverables-block]]

</todo-2>
```

---

```
<todo-3>
phase 3
here we focus on converting the previous input into milestone with user stories
first we group user stories into parts that can be delivered together as one testable and releasable unit called a milestone
then we create the user stories that focus on delivering the deliverable where each user story is max 3 story points
[[milestone-block]] (needs to be created)
[[user-story-block]]
</todo-3>
```

```
<todo-4>
phase 4
then we focus on creating high level crud plans for each user stories
very bluntly put we look at the deliverables for that user story and come up with the high level crud plan following the [[high-level-crud-block]]
then we create the [[detailed-action-plan-block]] where we specify exactly which steps to take and how to implement them following parts of the refinement workflow
</todo-4>
```


```
<initial-draft>
1. Initial Request 
2. Actors & Components: Who and what? 
3. High Level Requirements (per actor/component): What should be? What can do?
    1. Abilities
        1. Able to
        2. Can do
    2. States
        1. Is
        2. Has
4. Activity Flows (per high level requirement): Which happy flow of actors and components prove acceptance criteria is met?
    1. Step: [Actor or component] [a verb] [subject]
    2. [Another step, add more as needed]
    3. [...] 
5. Deliverables (per Activity Flow (step)): What needs to exist / be created per step? By who?
    1. Sub deliverables (per deliverable): Which deliverables can be made even smaller aiming for a deliverable that can be delivered within a 3 story point ticket max?
6. User Stories: Which user stories belong to which (set of) deliverables)
7. High level plan: What high level CRUD steps need to be taken for each user story.
8. Action Plan (per high level crud step): What exact steps need to be taken? Which files? What content?

</initial-draft>
```

