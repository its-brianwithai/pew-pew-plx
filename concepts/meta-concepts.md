---
name: meta-concepts
description: "Concept document explaining the idea of meta-concepts as the input documents of the framework."
---
# 💡 Concept: Meta-Concepts
> 💡 *The distinction between the framework's input documents (meta-concepts) and the output documents they generate.*

The PLX framework consists of two types of documents: **input documents** and **output documents**.

**Input documents** are the core components of the framework itself. We use these to create output. They include:
- **Prompts** (`prompts/`): Verb-subject naming, XML structuring, chain-of-thought
- **Agents** (`agents/`): Focused expertise, tool restrictions, YAML frontmatter
- **Templates** (`templates/`): YAML frontmatter, structured markdown, blocks
- **Workflows** (`workflows/`): Multi-phase orchestration, decision logic, quality gates
- **Context** (`meta/`): Documentation for actors, components, platforms, roles, teams
- **Instructions** (`instructions/`): Event-driven conventions, guidelines, best practices
- **Modes** (`modes/`): Operational behaviors that change interaction patterns
- **Personas** (`personas/`): Character definitions with expertise attributes
- **Blocks** (`templates/blocks/`): Reusable content sections
- **Concepts** (`concepts/`): Core ideas and principles of the framework
- **Collections** (`collections/`): Curated lists of related artifacts

We consider these input documents to be **meta-concepts**. Meta agents operate on these documents. When we talk about meta-templates or meta-documents, we mean documents and concepts that can be created within the framework and used to generate output.

**Output documents** are the artifacts that users of this framework create using the input documents. For example, a user might use the `create-issue` prompt (an input document) to generate a new tech issue (an output document).
