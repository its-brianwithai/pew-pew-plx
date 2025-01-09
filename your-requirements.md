---
document_type: agent work document
goal: getting as clear as possible what needs to be done
gpt_action: use as a reference work to understand exactly what (still) needs to be done and document progress
---

# 👤 Actors & 🧩 Components (Who or what)
> - Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).
> - Possible Parents: Itself
---

- [ ]

# 🎬 Activities (Who or what does what?)
> - Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).
> - Possible Parents: Actors, Components
---

- [ ]

## 🌊 Activity Flows & Scenarios (What in which order?)
> - Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity. May have optional paths for both successful completion (Happy Flow), errors (Error Flow), and scenarios like no connection, empty states, loading states, etc.
> - Possible Parents: Activities, Itself
---

- [ ]

# 📝 Properties (Which values?)
> - Describes a value or configuration that belongs to an object (examples include width, color, id, name).
> - Possible Parents: Actors, Components, Activities, Activity Flows, Scenarios, Atomic Actions, Scenarios, Behaviours
---

- [ ]

# 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> - Defines how something looks, works and performs Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.
> - Possible Parents: Anything
---

- [ ]

# 💡 Ideas & 🪵 Backlog
> - Anything that could be added later, too complex now, needs more research, would be nice to have, or alternative approaches.
> - Possible Parents: Anything (optional)
---

- [ ]

# 🔖 Context
> - Optional extra information about certain concepts used to clarify 

# ❓ Questions
> - Questions that need to be answered to clarify requirements.
> - Possible Parents: Anything (optional)
---

- [ ]

# 🧪 Unit & Integration Tests  
> - Tests that verify the implementation and verifies an item as completed.
> - Possible Parents: Activities, Activity Flows, Properties, Behaviours, Tasks
---

- [ ]


# 🎯 Roles, 📝 Tasks & 🎓 Suggested Approach
> - Each behaviour, property, activity (flow), scenario, atomic action, actor, component must directly or indirectly (by parents) cascade down to a todo with assigned role. Creating a task for a parent and completing it automatically covers its children unless children have open tasks themselves.
> - Possible Parents: Anything (optional)
---

- [ ] UI/UX Designer
- [ ] Frontend Developer
- [ ] Backend Developer
- [ ] Data Engineer
- [ ] DevOps Engineer
- [ ] Project Manager
- [ ] Marketeer
