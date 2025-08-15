---
name: meta-concepts
description: "Concept document explaining the idea of meta-concepts as the input documents of the framework."
---
# 💡 Concept: Meta-Concepts
> 💡 *The distinction between the framework's input documents (meta-concepts) and the output documents they generate.*

The PLX framework consists of two types of documents: **input documents** and **output documents**.

**Input documents** are the core components of the framework itself. We use these to create output. They include:
- `agents/`
- `templates/`
- `concepts/`
- `instructions/`
- `workflows/`
- `blocks/`
- and all other framework definition files.

We consider these input documents to be **meta-concepts**. This is why we have meta-agents (like [[meta-prompt-engineer]] or [[ultra-meta-agent]]) that operate on these documents. When we talk about meta-templates or meta-documents, we mean documents and concepts that can be created within the framework and used to generate output.

**Output documents** are the artifacts that users of this framework create using the input documents. For example, a user might use the `create-issue` prompt (an input document) to generate a new tech issue (an output document).