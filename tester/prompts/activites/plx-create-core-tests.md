Please create the following tests:

<tests>
{{LIST_OF_TESTS}}

Only create tests that confirm the core functionality of the feature. Do not create tests for edge cases, error flows or anything else that does not directly confirm just and only the core functionality.
</tests>

1. Create all tests.
2. Run all new and project existing tests together.
3. For every failed test provide the following:

<format>
# 📝 Activity: ACTOR_VERB
💎 Expected: EXPECTED
🧱 Actual: ACTUAL
💭 Reason: WHY_IT_FAILED
🔧 Proposed Fix: CODE_SNIPPET
</format>

After reporting the test results wait for further instructions on how to proceed.

---

# 👤 Actors & 🧩 Components (Who or what)
> - Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).

# 🎬 Activities (Who or what does what?)
> - Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).