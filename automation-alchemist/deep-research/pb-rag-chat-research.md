# **Project Brief: AI Chat Interface for PDF Document Querying**

## **I. Project Overview & Goals**

### **1.1. Introduction**

This document outlines the initial project brief for the development of an Artificial Intelligence (AI) powered chat interface. The primary function of this interface is to enable users to engage in conversational queries regarding information contained within a specific company-provided Portable Document Format (PDF) file. The core technological approach employed will be Retrieval-Augmented Generation (RAG), a method designed to ground the AI's responses firmly in the content of the supplied PDF, thereby significantly mitigating the risk of generating inaccurate or "hallucinated" information.1

The proposed technology stack comprises:

* **Frontend:** Flutter, providing a cross-platform user interface for web, iOS, and Android.
* **Backend Workflow & RAG Pipeline:** n8n, serving as the central orchestrator for backend logic, API endpoints, and the RAG process.
* **Database, Vector Storage & Authentication:** Supabase, leveraging PostgreSQL with the pgvector extension for data and embedding storage, along with its built-in authentication services.
* **Language Model:** OpenAI's models (or comparable alternatives) for generating text embeddings and synthesizing final answers.
* **External Chat Integrations:** Telegram and WhatsApp, integrated via n8n to offer alternative user interaction channels.

### **1.2. Problem Statement**

Organizations often possess critical information within extensive documents, such as internal reports, manuals, or knowledge bases, frequently stored in PDF format. Extracting specific details from these documents can be a laborious and inefficient process for employees or customers. Standard keyword search functionalities often lack the necessary contextual understanding to provide precise answers, requiring users to manually sift through search results. There is a clear need for an interactive, conversational interface that allows users to query document content naturally and receive accurate, context-aware answers directly derived from the source material.

### **1.3. Objectives**

The key objectives for this initial project phase are:

1. **Develop a Functional RAG Pipeline:** Implement a robust pipeline within n8n capable of ingesting a PDF document, parsing its content, chunking the text appropriately, generating vector embeddings, storing these embeddings in Supabase, and retrieving relevant chunks based on user query similarity.2
2. **Build an Intuitive Flutter Chat UI:** Create a user-friendly chat interface using Flutter, allowing users to input questions and view responses from the AI assistant.4 The UI should adhere to modern design principles and provide a seamless user experience.
3. **Implement n8n Backend Logic:** Utilize n8n to manage the entire backend process, including handling incoming chat requests via webhooks, orchestrating the RAG pipeline execution (query embedding, vector search, LLM prompting), and managing integrations with external platforms.5
4. **Leverage Supabase:** Configure and utilize Supabase for essential backend services: storing processed document chunks, managing vector embeddings via the pgvector extension, and handling user authentication and profile data for the authenticated version of the application.8
5. **Integrate External Chat Platforms:** Extend the chat functionality to Telegram and WhatsApp, enabling users to interact with the system through these popular messaging apps via n8n integration.14
6. **Create Authentication Variants:** Develop two distinct operational modes for the application: one publicly accessible without user login, and another requiring user authentication via Supabase Auth.12
7. **Establish RAG Evaluation Strategy:** Define and implement a testing methodology specifically focused on evaluating the quality of the RAG system's responses, measuring metrics such as accuracy, relevance, and faithfulness to the source PDF content.1

### **1.4. Scope**

**In-Scope:**

* Development of the initial PDF ingestion workflow (parsing, chunking, embedding, storage).
* Implementation of the core RAG query processing workflow in n8n.
* Creation of the Flutter chat UI for iOS, Android (and potentially web) with core conversational features.
* Setup and configuration of Supabase (Database schema, pgvector extension, Authentication).
* Integration with Telegram and WhatsApp via n8n nodes.
* Development of both authenticated and unauthenticated application variants.
* Setup of a framework and initial test dataset for RAG answer quality evaluation.
* This project brief document.

**Out-of-Scope (for this initial brief):**

* Implementation of advanced RAG techniques beyond standard retrieval and generation (e.g., complex agentic reasoning, multi-document querying, multi-hop retrieval) unless deemed essential for core functionality during development.
* Extensive UI customization beyond a functional and clean interface.
* Comprehensive, production-grade error handling and logging across all system components.
* Detailed design and implementation of deployment infrastructure (CI/CD, hosting environments).
* Formal plans for ongoing system maintenance and updates.

## **II. System Architecture**

### **2.1. High-Level Overview**

The system employs a decoupled architecture designed for flexibility and maintainability. User interactions originate from the Flutter application or integrated chat platforms (Telegram, WhatsApp) and are directed to an n8n webhook endpoint. n8n acts as the central orchestrator, managing the RAG pipeline, interacting with Supabase for data and vector retrieval, and communicating with an external Large Language Model (LLM) for response generation.

* **Diagram Description:** A user interacts with the frontend (Flutter app, Telegram, or WhatsApp). This interaction triggers a request (containing the user's query) to an n8n Webhook. The n8n workflow then orchestrates the RAG process: it embeds the user query, queries the Supabase database (specifically the pgvector index) to find relevant document chunks, retrieves these chunks, constructs a prompt including the query and retrieved context, sends this prompt to an external LLM API (e.g., OpenAI), receives the generated response, and finally sends this response back to the originating user interface.
* **Component Roles:**
    * **Flutter:** Provides the primary graphical user interface for chat interaction. It is responsible for sending user queries to the n8n backend via API calls and displaying the AI-generated responses. In the authenticated version, Flutter manages the user login/signup flow using Supabase Auth.12
    * **n8n:** Functions as the middleware and backend logic engine. It exposes a webhook API endpoint to receive requests.20 It executes the entire RAG pipeline, including query embedding, vector similarity search against Supabase 8, prompt engineering, and calling the external LLM for generation.2 It also handles the logic for interacting with Telegram and WhatsApp APIs 14 and manages conditional logic based on user authentication status.22
    * **Supabase:** Serves as the backend-as-a-service platform, providing the primary data persistence layer. It hosts the PostgreSQL database used to store processed document chunks and their corresponding vector embeddings (utilizing the pgvector extension 10). For the authenticated version, Supabase manages user identities, authentication, and user profile data.12 It may also be used for storing the original PDF via Supabase Storage.23
    * **External LLM (e.g., OpenAI):** Provides the core AI capabilities. This includes the embedding model used to convert text (document chunks and user queries) into vector representations 2 and the generative model used to synthesize natural language answers based on the user query and the retrieved context chunks.1 Communication occurs via API calls initiated from the n8n workflow.
    * **Telegram/WhatsApp:** Act as alternative user interfaces, allowing interaction with the RAG system through established messaging platforms. Integration is managed entirely within n8n.14

This architectural separation offers significant advantages. Placing n8n as the intermediary between the frontend (Flutter) and the backend services (Supabase, LLM) leverages n8n's strengths in workflow orchestration, API integration, and visual logic building.6 Flutter communicates via a defined API endpoint provided by n8n 29, shielding it from the complexities of the RAG process. Consequently, modifications to the RAG pipeline within n8n—such as changing the LLM provider, adjusting the chunking strategy, or refining the similarity search—can be implemented with minimal or no impact on the Flutter frontend codebase. This decoupling enhances maintainability, allows for independent scaling of the frontend and backend components, and increases overall system flexibility.

### **2.2. Data Flow**

* **Ingestion Phase:** A designated PDF document is uploaded (potentially to Supabase Storage). An n8n workflow is triggered, which retrieves the PDF, parses its text content 31, divides the text into smaller, manageable chunks based on a chosen strategy 33, generates vector embeddings for each chunk using an external LLM's embedding model 2, and finally stores these text chunks along with their vector embeddings in a designated table within the Supabase database.8
* **Query Phase:** A user submits a question through one of the interfaces (Flutter, Telegram, WhatsApp). The query is sent to the n8n webhook endpoint. The n8n workflow receives the query, generates a vector embedding for it using the same embedding model used during ingestion.2 n8n then queries the Supabase database, specifically using the pgvector extension's capabilities, to perform a similarity search and retrieve the most relevant document chunks based on vector proximity.8 The text content of these retrieved chunks is extracted. n8n constructs a new prompt containing the original user query and the retrieved contextual text chunks. This combined prompt is sent to the external LLM's generation endpoint. The LLM processes the prompt and generates a response grounded in the provided context. n8n receives this generated response and sends it back to the user interface that initiated the query.2

### **2.3. Authentication Flow (Version 2\)**

In the version requiring user authentication:

1. The user interacts with the Flutter application's login or signup screen.
2. Flutter initiates an authentication flow using the supabase\_flutter package, interacting directly with Supabase Auth (e.g., submitting email/password, handling OAuth redirects, or processing magic links).12
3. Supabase handles the authentication process and, upon success, returns a session object containing a JSON Web Token (JWT) to the Flutter application.
4. Flutter securely stores the session information.
5. When the user sends a chat message, Flutter makes an HTTP request to the n8n webhook endpoint, including the user's JWT in the Authorization: Bearer \<token\> header.29
6. The n8n workflow receives the request. An initial step (e.g., an IF node) checks for the presence of the Authorization header.22
7. (Optional but recommended) n8n can make a call to the Supabase /auth/v1/user endpoint, passing the received token, to verify its validity and retrieve the associated user ID.
8. If the token is valid, n8n proceeds with the RAG pipeline execution. The user ID can be used for logging purposes or potentially passed to Supabase database functions to enforce Row Level Security (RLS) policies.39
9. The generated response is sent back to the authenticated Flutter client.

## **III. Core RAG Pipeline (n8n & Supabase)**

The RAG pipeline is the engine of the chat interface, responsible for processing the source PDF and generating contextually relevant answers. It consists of two main n8n workflows: one for initial data ingestion and one for handling real-time user queries.

### **3.1. PDF Data Ingestion Workflow**

This workflow processes the source PDF document and populates the Supabase vector store. It is designed to run once per document or whenever the document needs updating. Running this process separately from the query workflow is essential for performance. PDF ingestion involves parsing, chunking, and embedding, which can be computationally intensive.2 Separating this ensures that the real-time query processing remains fast and responsive for users.2 This separation allows for better resource management and independent updates to the ingestion logic without impacting the live chat service.

* **Trigger:** This workflow can be triggered manually within n8n or automatically upon an event, such as a new PDF file being uploaded to a designated Supabase Storage bucket.12
* **PDF Parsing:** The initial step involves extracting text content from the PDF. n8n's built-in Extract From File node, specifically its 'Extract From PDF' operation, is the primary candidate for this task.31 However, the effectiveness of this node can vary depending on the PDF's complexity (e.g., multi-column layouts, tables, embedded images). If Extract From File yields poor results, alternative approaches should be considered, such as integrating external PDF parsing libraries (like PyMuPDF or Marker 41) via n8n's Code node or calling specialized third-party APIs using the HTTP Request node.3
* **Chunking Strategy:** Dividing the extracted text into appropriately sized, semantically meaningful chunks is critical for effective retrieval.33
    * *Analysis:* The optimal strategy depends heavily on the PDF's structure. Simple, text-heavy documents might be adequately handled by the RecursiveCharacterTextSplitter (available via n8n's LangChain integration 24), which attempts to respect paragraph and sentence boundaries.33 Complex documents with tables, figures, and varied formatting may necessitate more sophisticated approaches like semantic chunking (grouping based on meaning) 33 or layout-aware chunking tools that understand the visual structure.
    * *Recommendation:* Begin with RecursiveCharacterTextSplitter as implemented in n8n's LangChain nodes.24 Evaluate its output quality against the specific PDF. If context is poorly preserved or chunks are not coherent, investigate semantic chunking options or external layout-aware parsing tools. Key parameters like chunk\_size and chunk\_overlap must be tuned based on the chosen embedding model's limitations (e.g., input token limits) and the desired granularity of retrieved context.33 Storing relevant metadata with each chunk (e.g., page number) is also recommended.34
    * *Decision Support:* A comparison of chunking strategies is warranted:  
      **Table 3.1: Chunking Strategy Comparison**

| Strategy | Description | Pros | Cons | Context Preservation | Relevance Handling | Complexity | n8n Implementation Method |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| Fixed-Size | Splits text by fixed character/token count.33 | Simple, fast.33 | Ignores semantic boundaries, context fragmentation likely.33 | Poor | Poor | Low | LangChain CharacterTextSplitter node.33 |
| Recursive | Splits using hierarchical separators (paragraph, sentence, word).33 | Better structure awareness than fixed-size, balances simplicity.33 | Can still split mid-thought if separators don't align with semantics, uneven chunk sizes.33 | Moderate | Moderate | Medium | LangChain RecursiveCharacterTextSplitter node.33 |
| Semantic | Groups sentences based on embedding similarity.33 | High contextual relevance, adapts to content meaning.33 | Computationally expensive, depends heavily on embedding model quality, tuning needed.33 | Good | Good | High | LangChain SemanticChunker (if available in n8n nodes) or custom Code/HTTP Request node. |
| Layout-Aware (External) | Uses document structure (headings, tables, columns) from tools like Marker 41 or specific libraries. | Best for complex PDFs, preserves visual/structural context. | Requires external tools/libraries, integration complexity. | Potentially Best | Potentially Best | High | Custom Code/HTTP Request node to call external service/library. |

* **Embedding:** Utilize an n8n LangChain embedding node, such as Embeddings OpenAI or Embeddings HuggingFace, to transform the text chunks into numerical vector representations.2 The choice of embedding model (e.g., text-embedding-3-small 2, text-embedding-ada-002 45, or others) impacts dimensionality, cost, and retrieval performance. Consistency between the model used here and the one used for query embedding is crucial.
* **Vector Storage:** Employ the n8n PGVector Vector Store node or the Supabase Vector Store node, configured for the "Insert Documents" operation.8 Connect this node using the appropriate Supabase credentials. Specify the target Supabase table (e.g., document\_chunks) and ensure the vector column name in the node configuration matches the schema defined in Supabase (see Section VI).8

### **3.2. Query Processing & Response Generation Workflow**

This is the main workflow that handles live user interactions.

* **Trigger:** An n8n Webhook node configured to listen for POST requests on a specific path (e.g., /webhook/chat) from the Flutter app, Telegram, or WhatsApp.21
* **Input Processing:** Extract the user's query text from the incoming webhook request payload.
* **Query Embedding:** Use the *exact same* embedding model and corresponding n8n node (e.g., Embeddings OpenAI) as used in the ingestion workflow to convert the user's query into a vector embedding.2
* **Similarity Search:** Utilize the PGVector Vector Store or Supabase Vector Store node configured for retrieval (e.g., "Get Many" or "Retrieve Documents (As Tool for AI Agent)" operation mode 8).8 Provide the query embedding to this node. The node (or a custom function called by it) will execute a similarity search query against the document\_chunks table in Supabase, using pgvector operators like \<=\> for cosine distance.10 Retrieve the top-k most relevant text chunks (k is a tunable parameter). Consider implementing or utilizing hybrid search capabilities if available in Supabase/pgvector and deemed necessary for improved relevance, combining vector search with traditional keyword search.45
* **Context Retrieval:** Extract the raw text content (chunk\_text) from the top-k document chunks returned by Supabase.
* **Prompt Construction:** Employ an n8n node like Set or the Code node to dynamically assemble the prompt that will be sent to the generative LLM. This prompt must include both the original user query and the retrieved context chunks. A common structure is: "Based on the following context:\\n\\n\[Context Chunk 1 text\]\\n\[Context Chunk 2 text\]\\n...\\n\\nAnswer the question: \[Original User Query\]". Careful prompt engineering here is key to guiding the LLM effectively.
* **Response Generation:** Use an appropriate n8n LangChain Chat Model node (e.g., OpenAI Chat Model, HuggingFace Inference, Google Gemini) 2 to send the constructed prompt to the chosen LLM's API. Capture the generated text response.
* **Output Formatting:** Prepare the LLM's response in the format expected by the calling client (e.g., a JSON object) and send it back using the Webhook node's response mechanism or a dedicated Respond to Webhook node.28

## **IV. Frontend Interface (Flutter)**

The Flutter application serves as the primary graphical interface for users to interact with the AI chat assistant.

### **4.1. Chat UI/UX Design**

The user interface should prioritize clarity, ease of use, and responsiveness.

* **Core Components:** Implement a familiar chat layout featuring a scrollable list view to display the conversation history and a text input field accompanied by a send button for user input.4 Widgets like ListView.builder, TextField, and IconButton are fundamental.4
* **UI Packages:** Consider leveraging pre-built chat UI packages like flutter\_chat\_ui.47 This package is backend-agnostic, offers high customizability, is optimized for performance, and supports multiple platforms, potentially significantly reducing development time for the UI components.47
* **Message Display:** Clearly distinguish between messages sent by the user and responses from the AI assistant. Common conventions include different background colors, text alignment (e.g., user right, AI left), and optional avatars.4
* **User Feedback:** Implement visual cues for asynchronous operations. Display loading indicators (e.g., CircularProgressIndicator 12) while the application is waiting for a response from the backend. Clearly display any error messages returned from the backend.
* **Message Formatting:** Ensure proper handling and display of message timestamps and multi-line text messages within message bubbles.4
* **Responsiveness:** Design the UI to adapt gracefully to various screen sizes and orientations (phones, tablets, web). Utilize Flutter's responsive layout widgets and techniques (e.g., LayoutBuilder, MediaQuery, adaptive breakpoints).48 Adhere to best practices like breaking down large widgets into smaller, reusable components to simplify adaptation and improve performance.48 Avoid locking screen orientation.48

### **4.2. State Management Strategy**

Effective state management is crucial for maintaining the UI's consistency and responsiveness, especially given the asynchronous nature of chat applications.

* **Requirements:** The chosen strategy must manage the list of chat messages, the content of the text input field, the loading state during backend communication, potential error states, and, for Version 2, the user's authentication status and session data.
* **Options Analysis:**
    * *Provider:* A widely used solution, often suitable for simpler applications or primarily for dependency injection.49
    * *Riverpod:* An evolution of Provider, offering compile-time safety, enhanced testability, and independence from the Flutter widget tree, making it less prone to common pitfalls.49 It handles asynchronous states well.
    * *BLoC/Cubit:* A pattern emphasizing the separation of UI and business logic using streams. It's robust for complex state interactions and highly testable but often involves more boilerplate code.49
    * *GetIt:* Primarily a service locator, useful for decoupling dependencies. It can be used alongside other state management approaches but is less opinionated about managing UI state directly.51
* **Recommendation:** **Riverpod** is the recommended state management solution for this project.49 Its advantages in compile safety, testability, and robust handling of asynchronous operations make it well-suited for a chat application that involves network requests and potential future complexity (like authentication). It provides a good balance of power and developer experience, mitigating some of the complexities associated with BLoC while offering improvements over Provider.
* **Decision Support:**  
  **Table 4.1: Flutter State Management Comparison**

| Approach | Key Features | Pros | Cons | Compile Safety | Testability | Boilerplate | Suitability for this App |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| Provider | InheritedWidget wrapper, dependency injection.49 | Simpler setup for basic cases, widely used.49 | Runtime errors, less testable than Riverpod/BLoC.51 | Low | Moderate | Low | Possible, but Riverpod offers improvements. |
| Riverpod | Compile-safe, testable, decoupled from widget tree.49 | Improved safety & testability, good async support, flexible.49 | Slightly steeper learning curve than Provider.51 | High | High | Moderate | **Recommended**. Good balance of features, safety, and scalability for chat & auth. |
| BLoC/Cubit | Stream-based, separates UI/logic, predictable state.49 | Excellent for complex state, highly testable, reactive.49 | More boilerplate, can be overkill for simpler state.51 | High | High | High | Viable, but potentially more complex setup than needed initially. |
| GetIt | Service locator, decouples dependencies, less BuildContext dependent.51 | Simple dependency access, can complement other patterns.51 | Less opinionated on UI state management itself.51 | N/A | High (DI) | Low | Useful for dependency injection, but needs pairing for UI state. |

### **4.3. Backend Communication**

The Flutter app needs to communicate reliably with the n8n backend.

* **HTTP Client:** Use a standard Flutter HTTP client package like http or the more feature-rich dio to make network requests.
* **API Calls:** Implement functions to send POST requests to the designated n8n webhook URL (e.g., /webhook/chat).29 The request body should contain the user's message, typically formatted as JSON.
* **Authentication (Version 2):** For the authenticated version, retrieve the current user's Supabase JWT token and include it in the Authorization: Bearer \<token\> header of the HTTP request sent to n8n.29
* **Response Handling:** Process the JSON response received from the n8n webhook. Update the application state (using Riverpod) with the AI's generated message to display it in the chat UI.
* **Error Handling:** Implement robust error handling for network connectivity issues, timeouts, or error responses (e.g., 4xx, 5xx status codes) from the n8n backend. Display user-friendly error messages in the UI.

### **4.4. Performance Considerations**

Maintaining a smooth and responsive UI is critical for user satisfaction.

* **List Rendering:** Employ ListView.builder to efficiently render the chat message list, especially as the conversation history grows. This ensures only visible items are rendered.4
* **Build Method Optimization:** Avoid performing computationally expensive operations directly within widget build() methods, as they can be called frequently. Move logic to state management providers or controllers.53
* **Rebuild Control:** Leverage the chosen state management solution (Riverpod) to minimize unnecessary widget rebuilds. Ensure only widgets that depend on changed state are rebuilt.
* **Const Widgets:** Use the const keyword for widgets and constructors wherever possible to allow Flutter to cache and reuse widget instances, improving rebuild performance.48
* **Profiling:** Regularly use Flutter's DevTools to profile the application's performance, identifying and addressing any UI jank, high CPU usage, or memory issues.4 Avoid excessive use of Opacity or clipping, especially in animations.53

The asynchronous nature of the chat interaction—sending a request and awaiting a response—necessitates careful handling within Flutter. The application must remain responsive while waiting for the n8n workflow (which involves potentially time-consuming LLM calls and database queries 2) to complete. Utilizing Flutter's built-in mechanisms like FutureBuilder or StreamBuilder 12, or more sophisticated patterns offered by state management libraries like Riverpod's AsyncNotifier 50, is essential. Proper implementation involves clearly indicating loading states to the user (e.g., via spinners), handling potential errors gracefully (displaying informative messages instead of crashing), and updating the UI smoothly upon receiving the response. Failure to manage these asynchronous operations correctly will lead to a poor user experience characterized by a frozen interface or unclear application states.

## **V. Backend Workflow & Logic (n8n)**

n8n serves as the crucial link between the user interfaces, the Supabase database, and the external LLM, orchestrating the entire backend process.

### **5.1. Main Chat Workflow Design**

The primary n8n workflow handles incoming chat requests and executes the RAG pipeline.

* **Trigger:** The workflow starts with a Webhook node configured to listen for POST requests on a defined path (e.g., /webhook/chat).21 For production deployment, ensure the Production URL is used and the workflow is activated.21
* **Authentication Check (Conditional Logic):** Immediately following the trigger, an IF node should be used to differentiate between authenticated (Version 2\) and unauthenticated (Version 1\) requests.22
    * *Condition:* The IF node checks for the presence and potential basic format validity of an Authorization header containing a Bearer token in the incoming request.
    * *True Branch (Authenticated):* If a token is present, the workflow proceeds down this path. It should ideally include a step to validate the token against Supabase Auth (e.g., using an HTTP Request node to call the Supabase /auth/v1/user endpoint). The validated user ID can then be passed along for logging or potential use in RLS-aware database queries.
    * *False Branch (Unauthenticated):* If no token is present, or if the application logic allows unauthenticated access even in Version 2, the workflow proceeds down this path, executing the RAG pipeline with generic access permissions.
* **RAG Orchestration:** Following the conditional split, the workflow executes the sequence of RAG operations detailed in Section III.2: Embed User Query \-\> Perform Similarity Search (querying Supabase pgvector) \-\> Retrieve Context Chunks \-\> Construct LLM Prompt \-\> Generate Response via LLM API call.
* **Error Handling:** Implement basic error handling within the workflow. n8n's Error Trigger node can catch failures, or specific nodes' error outputs can be checked (e.g., using an IF node after an HTTP Request or database query node). If an error occurs (e.g., LLM API unavailable, database query fails), the workflow should formulate an appropriate error message to send back to the user interface.
* **Response:** The final step involves sending the generated AI answer (or an error message) back to the client that initiated the request. This is typically done using the "Respond to Webhook" option within the final node connected to the trigger or by using a dedicated Respond to Webhook node configured appropriately.28

### **5.2. API Endpoint Design (Webhook Node)**

The n8n Webhook node configuration defines the API endpoint for the chat service.

* **Path:** Define a clear and specific URL path (e.g., /webhook/chat or /api/v1/chat).
* **HTTP Method:** Configure the node to accept only POST requests, as chat messages will be sent in the request body.28
* **Authentication:** While n8n offers built-in webhook authentication methods (like Basic or Header Auth), for Version 2, the primary mechanism relies on validating the Supabase JWT token passed in the Authorization header within the workflow logic itself (using the IF node and potentially an HTTP Request to Supabase). This provides more robust user-specific authentication tied to the Supabase session.
* **Response Mode:** Configure how the response is sent back. Options include sending the output of the last executed node or using a specific Respond to Webhook node for more control over the response structure and status code.28

### **5.3. LangChain Integration**

To streamline the implementation of the RAG pipeline, leverage n8n's native LangChain integration nodes.6 These nodes provide pre-built abstractions for common LangChain components:

* **Document Loaders:** (Used in ingestion workflow) e.g., Default Data Loader.
* **Text Splitters:** (Used in ingestion workflow) e.g., RecursiveCharacterTextSplitter.
* **Embedding Models:** e.g., Embeddings OpenAI.
* **Vector Stores:** e.g., PGVector Vector Store, Supabase Vector Store.
* **Chat Models:** e.g., OpenAI Chat Model.
* **Retrievers:** e.g., Vector Store Retriever.

Using these nodes simplifies the workflow configuration compared to making manual HTTP requests to each service (like the embedding API, LLM API, or potentially vector database API) and handling the data transformations manually.

The architecture positions n8n not merely as an automation tool but as the central integration and API hub for the entire application. It connects disparate services—the Flutter frontend, Supabase database/vector store, external LLM APIs, and external chat platforms like Telegram and WhatsApp.6 By exposing its workflow via a Webhook node 20, n8n effectively provides the backend API for the frontend components. Its visual, node-based interface simplifies the orchestration of the complex RAG pipeline logic and the conditional handling required for the different authentication versions.3 This centralization significantly reduces the need for developing and maintaining custom backend code, allowing for faster prototyping and easier modification of the core business logic.

## **VI. Database & Storage (Supabase)**

Supabase provides the foundational backend infrastructure, including the database for storing structured data and vector embeddings, file storage, and authentication services.

### **6.1. Database Schema Design**

A well-designed schema is essential for storing the processed PDF data and user information efficiently.

* **documents Table:** Stores metadata about the ingested PDF(s).
    * id: Primary Key (UUID recommended for global uniqueness, or SERIAL).
    * pdf\_filename: TEXT \- The original filename of the PDF.
    * uploaded\_at: TIMESTAMP WITH TIME ZONE \- Timestamp of ingestion.
    * metadata: JSONB (Optional) \- Can store additional source information if needed.
    * owner\_id: UUID (Optional, Foreign Key to auth.users(id)) \- Necessary if implementing per-user document access control via RLS in the future.13
* **document\_chunks Table:** Stores the individual text chunks and their embeddings. This is the primary table queried during the RAG retrieval step.
    * id: Primary Key (UUID recommended or SERIAL).
    * document\_id: Foreign Key referencing documents(id).
    * chunk\_text: TEXT \- The actual text content of the chunk.
    * embedding: VECTOR(dimension) \- The vector embedding. The dimension must match the output dimension of the chosen embedding model (e.g., 1536 for OpenAI's text-embedding-ada-002 45, 384 for text-embedding-3-small 11, check model documentation). This column requires the pgvector extension.
    * chunk\_metadata: JSONB (Optional) \- Useful for storing chunk-specific metadata like page number, section heading, or positional information, which can aid in filtering or presenting results.34
    * owner\_id: UUID (Optional, Foreign Key to auth.users(id)) \- Required for implementing RLS based on user ownership or access rights.13
* **profiles Table (For Version 2 \- Authenticated):** Stores user profile information, linked to Supabase Auth users. This follows the standard Supabase user management schema.19
    * id: UUID, Primary Key, Foreign Key referencing auth.users(id).
    * username: TEXT (Unique).
    * full\_name: TEXT (Optional).
    * avatar\_url: TEXT (Optional).
    * updated\_at: TIMESTAMP WITH TIME ZONE.

### **6.2. pgvector Configuration and Usage**

Supabase's integration with the pgvector extension enables efficient vector storage and similarity search directly within the PostgreSQL database.

* **Enable Extension:** The first step is to enable the vector extension within your Supabase project's database settings. This can typically be done via the Supabase dashboard under Database \> Extensions or by running the SQL command: CREATE EXTENSION IF NOT EXISTS vector;.10
* **Table Creation:** When creating the document\_chunks table, define the embedding column using the vector type, specifying the correct dimensionality matching your embedding model (e.g., embedding vector(1536)).11
* **Indexing:** To ensure performant similarity searches, especially as the number of chunks grows, create an index on the embedding column. pgvector supports different index types (like HNSW and IVFFlat) and distance metrics (like L2 distance, inner product, or cosine distance). For semantic similarity based on orientation, cosine distance (vector\_cosine\_ops) is often preferred. An example index creation statement using HNSW (Hierarchical Navigable Small World), known for good query performance, is: CREATE INDEX ON document\_chunks USING hnsw (embedding vector\_cosine\_ops);.11 The optimal index type and parameters may require experimentation based on dataset size and query patterns.
* **Similarity Search Function:** To simplify the query logic within the n8n workflow, create a PostgreSQL function in Supabase that encapsulates the similarity search. This function accepts a query embedding, a similarity threshold, and a desired number of results (match\_count) as input, and returns the matching chunks along with their similarity scores.10  
  SQL  
  \-- Example Similarity Search Function (using Cosine Similarity)  
  create or replace function match\_document\_chunks (  
  query\_embedding vector(1536), \-- Ensure dimension matches your model  
  match\_threshold float,        \-- Minimum similarity score (0 to 1 for cosine similarity)  
  match\_count int             \-- Max number of chunks to return  
  )  
  returns table (  
  id uuid,  
  document\_id uuid,  
  chunk\_text text,  
  similarity float  
  )  
  language sql stable  
  as $$  
  select  
  dc.id,  
  dc.document\_id,  
  dc.chunk\_text,  
  1 \- (dc.embedding \<=\> query\_embedding) as similarity \-- Calculate cosine similarity (1 \- cosine distance)  
  from document\_chunks dc  
  where 1 \- (dc.embedding \<=\> query\_embedding) \> match\_threshold \-- Filter by similarity threshold  
  order by dc.embedding \<=\> query\_embedding \-- Order by cosine distance (ascending)  
  limit match\_count;  
  $$;

  The n8n workflow can then execute this function using the Supabase node or a standard PostgreSQL node, passing the query embedding and parameters, simplifying the query logic within n8n.9

### **6.3. PDF File Storage**

The source PDF document needs to be accessible to the n8n ingestion workflow.

* **Option 1 (Recommended): Supabase Storage:** Utilize Supabase's built-in object storage.12 Create a dedicated storage bucket (e.g., company\_pdfs). Upload the source PDF to this bucket. The n8n ingestion workflow can then be configured to retrieve the file directly from this bucket using the Supabase node or its URL. This approach keeps all project assets managed within the Supabase ecosystem.
* **Option 2: External Storage:** Store the PDF in an alternative location, such as a local filesystem accessible to a self-hosted n8n instance, or another cloud storage provider (e.g., AWS S3). The n8n workflow would need the appropriate path or URL to access the file.
* **Recommendation:** Using Supabase Storage is generally preferred for better integration and centralized management of project resources.

### **6.4. Row Level Security (RLS) (For Version 2 \- Authenticated)**

If the application requires restricting access to documents or chunks based on the logged-in user (either now or potentially in the future), Supabase's Row Level Security should be implemented.12

* **Enable RLS:** Ensure RLS is enabled for the relevant tables (e.g., documents, document\_chunks, profiles) using alter table \<table\_name\> enable row level security;.12
* **Define Policies:** Create RLS policies that define access rules. For instance, a policy on document\_chunks might restrict access to chunks belonging to documents owned by the currently authenticated user: create policy "User can access own document chunks" on document\_chunks for select using (auth.uid() \= owner\_id);.13 Policies can be defined for SELECT, INSERT, UPDATE, DELETE operations as needed.
* **Integration:** When n8n queries Supabase on behalf of an authenticated user, it must use the user's credentials (or a role associated with the user's permissions) for RLS policies to be applied correctly. This often involves passing the user's JWT to Supabase or using specific Supabase client configurations that respect the authenticated session.

A key architectural advantage of this stack is the use of Supabase with the pgvector extension.10 This approach consolidates vector storage and search capabilities within the primary PostgreSQL database, eliminating the need to introduce and manage a separate, dedicated vector database service (such as Pinecone 2, Milvus, or Weaviate 60). Since the project already leverages Supabase for authentication and potentially storing relational data (like user profiles or document metadata 12), integrating vector storage directly simplifies the overall system architecture. It reduces the number of external dependencies, potentially lowers operational overhead and costs, and facilitates easier data management by keeping vector embeddings and associated relational data within the same database system, enabling straightforward joins and combined queries if needed.39

## **VII. Authentication Variants**

The project requires two distinct versions catering to different access control needs.

### **7.1. Version 1: Without Authentication**

This version provides public access to the chat interface without requiring users to log in.

* **Flutter:** The application will bypass any login/signup screens and directly present the chat interface upon launch. API calls made from Flutter to the n8n webhook will not include any authentication tokens in the headers.
* **n8n:** The webhook trigger node will not expect or validate authentication tokens. Any conditional logic based on authentication (e.g., the IF node checking for a token) will consistently follow the "unauthenticated" path.
* **Supabase:** If Row Level Security (RLS) is implemented for other purposes, policies on the document\_chunks table must explicitly allow read/search access for the anonymous role (anon).12 There will be no interaction with user profiles or the auth.users table.
* **Use Case:** Ideal for scenarios where the information in the PDF is intended for public consumption, and there is no requirement to track individual user interactions or restrict access.

### **7.2. Version 2: With Supabase Authentication**

This version incorporates user authentication, requiring users to sign up and log in before accessing the chat functionality.

* **Flutter:**
    * Implement dedicated screens for user sign-up and sign-in.19
    * Integrate the supabase\_flutter package 12 to handle authentication flows. Consider using the supabase\_auth\_ui package for pre-built UI components to accelerate development.16
    * Manage the application's navigation based on the user's authentication state. Listen for authentication events (e.g., using Supabase.instance.client.auth.onAuthStateChange) to automatically redirect users between login/signup screens and the main chat interface upon successful sign-in or sign-out.19
    * Securely manage the Supabase session and JWT obtained after successful login.35
    * Include the user's JWT in the Authorization: Bearer \<token\> header for all requests made to the n8n backend webhook.29
    * Configure deep linking within the Flutter app to handle redirects back from Supabase Auth for flows like magic link verification or OAuth callbacks.12
* **n8n:**
    * The webhook trigger receives the request potentially containing the Authorization header.
    * An IF node checks for the presence of the token.22
    * **Validation (Recommended):** Add an HTTP Request node step within the "authenticated" branch of the IF node. This step should call the Supabase /auth/v1/user endpoint, passing the received Bearer token. A successful response (200 OK) validates the token and provides the user's details (including ID). An error response (e.g., 401 Unauthorized) indicates an invalid token, and the workflow should respond accordingly (e.g., with an error message).
    * The validated user ID can be passed to subsequent nodes if needed for logging or providing context for RLS-enabled database queries.
* **Supabase:**
    * Configure the desired authentication providers in the Supabase dashboard (e.g., Email/Password, Magic Link, Google, GitHub).13 Set up necessary redirect URLs.16 Optionally disable the "Confirm email" setting if users should be logged in immediately after signup.64
    * Utilize the profiles table (linked via foreign key to auth.users) to store additional user information.19
    * Implement and enable Row Level Security (RLS) policies on the document\_chunks table (and potentially documents) if access needs to be restricted based on the authenticated user.13 Policies typically involve checking auth.uid() against an owner\_id or querying a separate permissions table.
* **Use Case:** Suitable for scenarios requiring user identification, potentially enabling future features like personalized chat history, access control to specific documents based on user roles/permissions, or usage tracking.

### **7.3. Comparison Table**

The choice between these versions involves trade-offs in complexity, security, and features.

**Table 7.1: Authentication Variants Comparison**

| Feature/Aspect | Version 1 (No Authentication) | Version 2 (Supabase Authentication) |
| :---- | :---- | :---- |
| **Access Control** | Public, open access. | Restricted to logged-in users. Enables fine-grained RLS.39 |
| **User Tracking** | Anonymous usage. | Individual user interactions can be logged and tracked. |
| **Personalization** | Not possible. | Enables future personalization (e.g., chat history, preferences). |
| **Complexity** | Lower (simpler Flutter UI, n8n, Supabase). | Higher (Auth UI, state management, token handling, RLS, n8n validation). |
| **Setup Effort** | Lower. | Higher (Requires configuring Supabase Auth, Flutter UI, n8n logic). |
| **Security Considerations** | Lower inherent security (public data access). | Higher security (user accounts, potential for RLS data protection). |

This comparison highlights that while Version 1 is simpler to implement, Version 2 provides essential capabilities for user management, security, and future feature expansion, albeit at the cost of increased development complexity across the Flutter, n8n, and Supabase components.

## **VIII. External Chat Platform Integrations**

To broaden accessibility, the chat interface will be integrated with Telegram and WhatsApp, allowing users to interact via these platforms. n8n will manage these integrations.

### **8.1. Telegram Integration**

* **n8n Setup:**
    * **Receiving Messages:** Use the Telegram Trigger node in a dedicated n8n workflow. This node listens for incoming messages sent to your specific Telegram bot.14 Note that Telegram API limitations generally permit only one active trigger per bot token at a time.66
    * **Sending Responses:** Use the Telegram node with the "Send Message" operation to send the AI-generated answers back to the user who initiated the conversation.14
    * **Credentials:** Requires a Telegram Bot Token obtained by creating a bot using the "BotFather" on Telegram. This token must be configured as a secure credential within n8n.67
    * **Context:** The Telegram Trigger node provides the necessary chatId from the incoming message, which must be extracted and passed to the Telegram node's "Send Message" operation to ensure the response is sent to the correct user.14
* **Workflow Structure:** A separate n8n workflow should be created, starting with the Telegram Trigger. This workflow will receive the user's message, extract the query text, and then invoke the core RAG processing logic (ideally by calling the main RAG workflow using the Execute Workflow node 68). Once the core workflow returns the generated answer, this Telegram-specific workflow formats and sends the response back using the Telegram node.

### **8.2. WhatsApp Integration**

* **n8n Setup:**
    * **Receiving Messages:** Integration with the official WhatsApp Business API typically involves setting up a Meta App, configuring webhooks, and verifying the webhook endpoint provided by n8n.69 The WhatsApp Business Cloud Trigger node in n8n can be used if leveraging the official Cloud API. Alternatively, if using third-party WhatsApp API providers (e.g., Twilio, Evolution API 71), a standard Webhook node might be used to receive incoming message events from that provider.
    * **Sending Responses:** Use the WhatsApp Business Cloud node (with "Send Message" or potentially "Send Template" operations 15) if using the official API. If using a third-party provider, an HTTP Request node configured to call that provider's API endpoint for sending messages would be necessary.
    * **Credentials:** Requires access credentials specific to the chosen WhatsApp Business API solution (e.g., Meta App tokens, third-party provider API keys) configured securely in n8n.15
* **Workflow Structure:** Similar to the Telegram integration, a dedicated n8n workflow is recommended. This workflow is triggered by incoming WhatsApp messages (via the appropriate trigger node). It extracts the user's query, calls the central RAG processing workflow 68, receives the result, and uses the relevant WhatsApp node or HTTP Request node to send the response back to the user.

A key principle for these integrations is the reuse of the core RAG logic. The complex process of query embedding, vector search in Supabase, context retrieval, prompt construction, and LLM generation should reside in a single, central n8n workflow. Both the Telegram and WhatsApp integration workflows should act primarily as adapters: they receive platform-specific input, extract the user query, call the central RAG workflow using n8n's Execute Workflow node 68, receive the standardized response, and then format and send that response using the platform-specific n8n node (Telegram, WhatsApp Business Cloud, or HTTP Request).14 This approach avoids duplicating the complex RAG logic, ensuring consistency across all user interfaces (Flutter, Telegram, WhatsApp) and making maintenance significantly easier, as any updates to the RAG pipeline only need to be applied in one central workflow.

## **IX. Testing & RAG Evaluation Strategy**

A comprehensive testing strategy is essential to ensure the functionality, reliability, and quality of the AI chat interface, with a particular focus on the RAG component's performance.

### **9.1. Test Suite Overview**

Testing should cover different levels of the application:

* **Unit Testing:**
    * *Flutter:* Focus on testing individual widgets, state management logic (providers/notifiers), utility functions, and basic UI interactions using the flutter\_test framework.4 Mock dependencies like the HTTP client for backend calls.
    * *n8n:* Direct unit testing of individual n8n nodes is challenging. However, if complex logic is encapsulated within Code nodes (JavaScript), this code can be tested using standard JavaScript testing frameworks. Sub-workflows designed for specific, reusable tasks can be tested independently by triggering them with sample data.68
* **Integration Testing:** Verify the interactions between different components:
    * *Flutter \<-\> n8n:* Test API calls from Flutter to the n8n webhook, ensuring correct request formatting, header inclusion (for auth), and proper handling of successful and error responses.
    * *n8n \<-\> Supabase:* Test the n8n workflow's ability to correctly insert data (during ingestion) and query data/call functions (during RAG retrieval) in Supabase, including vector search operations.
    * *n8n \<-\> LLM:* Test the API calls from n8n to the external LLM for embedding and generation, handling potential API errors or rate limits.
    * *n8n \<-\> Telegram/WhatsApp:* Test the message receiving and sending capabilities through the respective n8n nodes or HTTP requests.
* **End-to-End (E2E) Testing:** Simulate a complete user journey. Start by sending a message via one of the user interfaces (Flutter, Telegram, WhatsApp), trace the request through the n8n workflow, Supabase database query, LLM interaction, and back to the UI, validating that the final response is received and displayed correctly. Automation frameworks appropriate for Flutter (like flutter\_driver or patrol) and potentially API-level testing for chat platforms can be used.

### **9.2. RAG-Specific Evaluation Plan**

Evaluating the quality of the RAG system's output is paramount.18 The goal is to quantitatively measure how accurately and relevantly the system answers questions based *only* on the information present in the source PDF document.1

* **Methodology:**
    1. **Create Test Dataset:** Develop a "golden dataset" consisting of representative questions that users might ask about the PDF's content. For each question, manually determine the correct answer based *strictly* on the PDF text. Optionally, identify the specific text passages (ground truth context) within the PDF that support each answer.72 While manual creation ensures quality, synthetic data generation tools (potentially integrated with frameworks like DeepEval 73) can be explored to augment the dataset size.
    2. **Execute RAG Pipeline:** Programmatically run the n8n RAG query workflow for each question in the test dataset. Capture the generated answer produced by the LLM and the list of context chunks retrieved from Supabase during the process.
    3. **Calculate Metrics:** Utilize a dedicated RAG evaluation framework (like Ragas or DeepEval) to compute metrics that assess both the retrieval and generation steps. This typically involves writing Python scripts that orchestrate the test execution and metric calculation.
* **Key RAG Evaluation Metrics:** Based on frameworks like Ragas and DeepEval 1:
    * **Retrieval Quality:**
        * *Context Precision:* Measures the signal-to-noise ratio in the retrieved chunks. Of the chunks retrieved, how many are actually relevant to the question? 17
        * *Context Recall:* Measures how much of the necessary information was retrieved. Did the retriever find all the relevant chunks needed to answer the question completely? 17
    * **Generation Quality:**
        * *Faithfulness:* Measures factual consistency. Does the generated answer contradict the information present in the retrieved context chunks? (Crucial for minimizing hallucination) 1
        * *Answer Relevancy:* Measures how pertinent the generated answer is to the original question, considering the retrieved context. 1
* **Recommended Framework:** **Ragas** 72 is recommended as a starting point. It is open-source and focuses specifically on evaluating the core components of RAG pipelines, offering metrics like faithfulness, answer relevancy, context precision, and context recall, many of which can be calculated without needing pre-defined ground truth answers (though ground truth context improves recall metrics). Evaluation scripts can be developed in Python to trigger the n8n workflow via its webhook/API for each test question and then feed the results (question, retrieved context, generated answer) into the Ragas library for metric calculation. DeepEval 73 is a more comprehensive alternative offering similar metrics plus features like synthetic data generation and CI/CD integration, which could be considered later.

It is critical to understand that RAG evaluation is not a one-time activity but an iterative process.17 The initial configuration of the RAG pipeline (chunking strategy, embedding model, retrieval parameters like top-k, LLM prompt) is unlikely to be optimal.81 The quantitative results from the evaluation metrics provide direct, actionable feedback. For example, low Context Recall might point to issues with the chunking strategy or the effectiveness of the embedding model for retrieval.17 Low Faithfulness suggests the LLM might be hallucinating or ignoring the provided context, potentially requiring prompt adjustments or better context relevance via improved retrieval.1 This feedback loop—evaluate, analyze metrics, tune hyperparameters (chunk size, overlap, embedding model, top-k, LLM temperature, prompt template), re-evaluate—is fundamental to achieving a high-quality, reliable RAG system. The project plan must therefore account for this iterative tuning phase.

## **X. Key Considerations & Recommendations**

Several factors require careful consideration throughout the project lifecycle.

* **10.1. LLM Selection:** The choice of Large Language Models for both embedding and generation significantly impacts performance, cost, and quality.
    * *Embedding Model:* Factors include embedding dimensionality (affecting storage and search speed), performance on similarity tasks, and cost per embedding generated. Models like OpenAI's text-embedding-3-small 2 or text-embedding-ada-002 45 are common starting points, but alternatives from HuggingFace, Cohere, or Google should be evaluated.
    * *Generation Model:* Factors include context window size (must accommodate the prompt with retrieved chunks), generation quality (coherence, instruction following), speed (latency), and cost per token. Models like OpenAI's gpt-4o-mini 2 or gpt-3.5-turbo, Anthropic's Claude series, or Google's Gemini 42 offer different trade-offs. Open-source models hosted locally or via services like HuggingFace Inference 7 are also viable but require infrastructure setup.
* **10.2. Chunking Strategy Impact:** As highlighted previously, the method used for chunking the PDF text is foundational to RAG performance.33 The initial choice should be validated early using the RAG evaluation metrics. Be prepared to iterate and potentially implement more complex strategies (semantic or layout-aware) if simple methods prove insufficient for the specific PDF structure.17
* **10.3. Scalability:** Consider potential bottlenecks as usage grows.
    * *n8n:* High concurrency might require scaling n8n instances or using queue mode (queue execution process setting).69 Self-hosting offers more control over resources compared to cloud plans.5 Monitor workflow execution times.
    * *Supabase:* Monitor database load, particularly the performance of pgvector similarity searches under concurrent requests. Ensure appropriate database indexing is in place.11 Supabase provides scaling options for its database instances.13
    * *LLM:* Be aware of API rate limits imposed by the chosen LLM provider. High traffic could necessitate requesting limit increases or implementing strategies like caching or request batching (if applicable).6
* **10.4. Security:** Maintain security throughout the stack.
    * *Credentials:* Securely store all API keys and database credentials (Supabase URL/keys, LLM API keys, Telegram/WhatsApp tokens) using n8n's built-in credential management system 9 and appropriate secure storage mechanisms in Flutter (e.g., environment variables loaded securely, flutter\_secure\_storage).35 Avoid hardcoding secrets.
    * *Input Validation:* Sanitize and validate data received via the n8n webhook to prevent potential injection attacks or unexpected behavior.
    * *Access Control:* Implement Supabase Row Level Security (RLS) rigorously for the authenticated version (Version 2\) to ensure users can only access data they are permitted to.39
    * *Webhook Security:* For Version 2, ensure the n8n workflow properly validates the incoming Supabase JWT. Consider additional measures like verifying the webhook source IP if possible, although token validation is primary.
* **10.5. Cost Management:** Monitor and manage operational costs.
    * *LLM APIs:* This is often the most significant cost factor. Track token usage for both embedding and generation calls. Optimize prompt lengths and consider using smaller/cheaper models where acceptable quality can be maintained.5 Implement caching for identical requests if applicable.
    * *n8n:* n8n Cloud plans are typically based on workflow executions.6 Self-hosting incurs infrastructure costs (server, database for n8n).
    * *Supabase:* Usage-based pricing applies to database resources, storage, authentication operations, etc. Monitor usage against the chosen plan's limits.
* **10.6. Next Steps:** Recommended immediate actions following this brief:
    1. Review and refine project requirements based on stakeholder feedback on this brief.
    2. Establish development environments for Flutter, n8n (self-hosted or cloud), and Supabase.
    3. Begin implementation by setting up the Supabase database schema (including pgvector) and the PDF ingestion workflow in n8n.
    4. Develop the core RAG query processing workflow in n8n.
    5. Build the basic Flutter chat UI and establish communication with the n8n webhook endpoint.
    6. Implement the chosen authentication version (either configuring for public access or setting up Supabase Auth in Flutter and n8n).
    7. Set up the RAG evaluation framework (e.g., Ragas scripts) and create the initial test dataset based on the source PDF.
    8. Begin the iterative cycle of testing, evaluating, and refining the RAG pipeline based on metric results.
    9. Integrate the Telegram and WhatsApp interfaces once the core RAG functionality is stable.

## **XI. Conclusion**

This project brief outlines a robust and flexible architecture for building an AI-powered chat interface capable of answering questions based on a specific PDF document. The proposed technology stack, leveraging Flutter for the frontend, n8n for backend orchestration and the RAG pipeline, and Supabase with pgvector for data and vector storage, offers a powerful combination of modern development tools and AI capabilities.

Key architectural decisions, such as the decoupled nature of the system with n8n as the central hub, the use of Supabase/pgvector to avoid a separate vector database, and the separation of ingestion and query workflows, are designed to enhance maintainability, scalability, and performance. The brief provides clear recommendations for critical implementation choices, including chunking strategies (starting with RecursiveCharacterTextSplitter) and Flutter state management (recommending Riverpod).

The inclusion of two authentication variants allows for flexibility in deployment scenarios. Furthermore, the integration points for Telegram and WhatsApp ensure broader accessibility. Crucially, a strong emphasis is placed on a rigorous testing and evaluation strategy specifically for the RAG component, utilizing frameworks like Ragas to measure performance metrics such as faithfulness, relevance, context precision, and context recall. This iterative evaluation process is vital for tuning the pipeline and achieving high-quality, trustworthy responses grounded in the source document.

Successful execution requires careful attention to LLM selection, security practices, scalability planning, and ongoing cost management. By following the outlined objectives, architecture, and recommendations, the development team can effectively build an intelligent, context-aware chat interface that efficiently unlocks the information contained within the target PDF document.

#### **Works cited**

1. RAG chatbot: What it is, benefits, challenges, and how to build one \- Tonic.ai, accessed May 2, 2025, [https://www.tonic.ai/guides/rag-chatbot](https://www.tonic.ai/guides/rag-chatbot)
2. Build a Custom Knowledge RAG Chatbot using n8n – n8n Blog, accessed May 2, 2025, [https://blog.n8n.io/rag-chatbot/](https://blog.n8n.io/rag-chatbot/)
3. Chat with PDF docs using AI (quoting sources) | n8n workflow template, accessed May 2, 2025, [https://n8n.io/workflows/2165-chat-with-pdf-docs-using-ai-quoting-sources/](https://n8n.io/workflows/2165-chat-with-pdf-docs-using-ai-quoting-sources/)
4. How to Build a Beautiful, Full-Featured Chat App UI With Flutter and Dart \- Bomberbot, accessed May 2, 2025, [https://www.bomberbot.com/flutter/how-to-build-a-beautiful-full-featured-chat-app-ui-with-flutter-and-dart/](https://www.bomberbot.com/flutter/how-to-build-a-beautiful-full-featured-chat-app-ui-with-flutter-and-dart/)
5. Can i build a RAG ai agent that process large pdf in n8n? \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1j10p1t/can\_i\_build\_a\_rag\_ai\_agent\_that\_process\_large\_pdf/](https://www.reddit.com/r/n8n/comments/1j10p1t/can_i_build_a_rag_ai_agent_that_process_large_pdf/)
6. Best Langchain apps & software integrations \- N8N, accessed May 2, 2025, [https://n8n.io/integrations/categories/langchain/](https://n8n.io/integrations/categories/langchain/)
7. Unlock the Power of AI: Effortlessly n8n LangChain Integration for Advanced Workflows, accessed May 2, 2025, [https://n8n-automation.com/2024/03/03/langchain-n8n-guide/](https://n8n-automation.com/2024/03/03/langchain-n8n-guide/)
8. PGVector Vector Store node documentation | n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.vectorstorepgvector/](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.vectorstorepgvector/)
9. Postgres PGVector Store and Supabase: Automate Workflows with n8n, accessed May 2, 2025, [https://n8n.io/integrations/postgres-pgvector-store/and/supabase/](https://n8n.io/integrations/postgres-pgvector-store/and/supabase/)
10. Build a RAG App With Descope, Supabase & pgvector: Part 1, accessed May 2, 2025, [https://www.descope.com/blog/post/rag-descope-supabase-pgvector-1](https://www.descope.com/blog/post/rag-descope-supabase-pgvector-1)
11. pgvector: Embeddings and vector similarity | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/guides/database/extensions/pgvector](https://supabase.com/docs/guides/database/extensions/pgvector)
12. Use Supabase with Flutter, accessed May 2, 2025, [https://supabase.com/docs/guides/getting-started/quickstarts/flutter](https://supabase.com/docs/guides/getting-started/quickstarts/flutter)
13. Anyone integrated supabase, how was your experience? : r/replit \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/replit/comments/1jjnzk9/anyone\_integrated\_supabase\_how\_was\_your\_experience/](https://www.reddit.com/r/replit/comments/1jjnzk9/anyone_integrated_supabase_how_was_your_experience/)
14. Telegram node Message operations documentation \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/message-operations/](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/message-operations/)
15. WhatsApp Business Cloud node documentation \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.whatsapp/](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.whatsapp/)
16. Flutter Auth UI | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/guides/auth/auth-helpers/flutter-auth-ui](https://supabase.com/docs/guides/auth/auth-helpers/flutter-auth-ui)
17. Mastering RAG Evaluation: Best Practices & Tools for 2025 | Generative AI Collaboration Platform, accessed May 2, 2025, [https://orq.ai/blog/rag-evaluation](https://orq.ai/blog/rag-evaluation)
18. Testing Your RAG-Powered AI Chatbot \- HatchWorks, accessed May 2, 2025, [https://hatchworks.com/blog/gen-ai/testing-rag-ai-chatbot/](https://hatchworks.com/blog/gen-ai/testing-rag-ai-chatbot/)
19. Build a User Management App with Flutter | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/guides/getting-started/tutorials/with-flutter](https://supabase.com/docs/guides/getting-started/tutorials/with-flutter)
20. Advice on Using n8n as an API Endpoint for AI Workflows in My First Software Project, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1i9kixq/advice\_on\_using\_n8n\_as\_an\_api\_endpoint\_for\_ai/](https://www.reddit.com/r/n8n/comments/1i9kixq/advice_on_using_n8n_as_an_api_endpoint_for_ai/)
21. Webhook node workflow development documentation \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/workflow-development/](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/workflow-development/)
22. Multiple Condition in IF statement \- Questions \- n8n Community, accessed May 2, 2025, [https://community.n8n.io/t/multiple-condition-in-if-statement/21511](https://community.n8n.io/t/multiple-condition-in-if-statement/21511)
23. CRUD folder in Supabase bucket using Flutter \- Stack Overflow, accessed May 2, 2025, [https://stackoverflow.com/questions/75349778/crud-folder-in-supabase-bucket-using-flutter](https://stackoverflow.com/questions/75349778/crud-folder-in-supabase-bucket-using-flutter)
24. LangChain in n8n | n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/advanced-ai/langchain/overview/](https://docs.n8n.io/advanced-ai/langchain/overview/)
25. Manage api tokens and respond to webhooks : r/n8n \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1j5xwx5/manage\_api\_tokens\_and\_respond\_to\_webhooks/](https://www.reddit.com/r/n8n/comments/1j5xwx5/manage_api_tokens_and_respond_to_webhooks/)
26. Step-by-Step Guide to Create Your First API Endpoint Using Webhooks and n8n, accessed May 2, 2025, [https://n8n-automation.com/2024/03/17/create-your-own-api-with-webhooks/](https://n8n-automation.com/2024/03/17/create-your-own-api-with-webhooks/)
27. Webhook and One Simple API: Automate Workflows with n8n, accessed May 2, 2025, [https://n8n.io/integrations/webhook/and/one-simple-api/](https://n8n.io/integrations/webhook/and/one-simple-api/)
28. Webhook node common issues \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/common-issues/](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/common-issues/)
29. How to set up webhooks for external services in FlutterFlow? \- Rapid Dev, accessed May 2, 2025, [https://www.rapidevelopers.com/flutterflow-tutorials/how-to-set-up-webhooks-for-external-services-in-flutterflow](https://www.rapidevelopers.com/flutterflow-tutorials/how-to-set-up-webhooks-for-external-services-in-flutterflow)
30. Webhooks Overview \- Flutter Chat Messaging Docs \- GetStream.io, accessed May 2, 2025, [https://getstream.io/chat/docs/flutter-dart/webhooks\_overview/](https://getstream.io/chat/docs/flutter-dart/webhooks_overview/)
31. Extract From File \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.extractfromfile/](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.extractfromfile/)
32. Parse a pdf and extract the text \- Questions \- n8n Community, accessed May 2, 2025, [https://community.n8n.io/t/parse-a-pdf-and-extract-the-text/81697](https://community.n8n.io/t/parse-a-pdf-and-extract-the-text/81697)
33. Chunking strategies for RAG tutorial using Granite | IBM, accessed May 2, 2025, [https://www.ibm.com/think/tutorials/chunking-strategies-for-rag-with-langchain-watsonx-ai](https://www.ibm.com/think/tutorials/chunking-strategies-for-rag-with-langchain-watsonx-ai)
34. Build an unstructured data pipeline for RAG | Databricks ..., accessed May 2, 2025, [https://docs.databricks.com/aws/en/generative-ai/tutorials/ai-cookbook/quality-data-pipeline-rag](https://docs.databricks.com/aws/en/generative-ai/tutorials/ai-cookbook/quality-data-pipeline-rag)
35. Flutter Supabase Authentication \- Complete tutorial \- Sandro Maglione, accessed May 2, 2025, [https://www.sandromaglione.com/articles/flutter-supabase-authentication-complete-tutorial](https://www.sandromaglione.com/articles/flutter-supabase-authentication-complete-tutorial)
36. Getting Started with Supabase and Flutter: An Overview \- Monterail, accessed May 2, 2025, [https://www.monterail.com/blog/getting-started-with-supabase-and-flutter](https://www.monterail.com/blog/getting-started-with-supabase-and-flutter)
37. Getting started with Flutter authentication \- Supabase, accessed May 2, 2025, [https://supabase.com/blog/flutter-authentication](https://supabase.com/blog/flutter-authentication)
38. Flutter: Introduction | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/reference/dart/introduction](https://supabase.com/docs/reference/dart/introduction)
39. RAG with Permissions | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/guides/ai/rag-with-permissions](https://supabase.com/docs/guides/ai/rag-with-permissions)
40. Upload or Save File \- FlutterFlow Documentation, accessed May 2, 2025, [https://docs.flutterflow.io/concepts/file-handling/upload-save-file/](https://docs.flutterflow.io/concepts/file-handling/upload-save-file/)
41. Best way to parse PDF? : r/n8n \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1jzrb5m/best\_way\_to\_parse\_pdf/](https://www.reddit.com/r/n8n/comments/1jzrb5m/best_way_to_parse_pdf/)
42. How to process PDFs with n8n and Gemini AI \- Getting PDF content to actually work with the AI Agent node \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1hy9no5/how\_to\_process\_pdfs\_with\_n8n\_and\_gemini\_ai/](https://www.reddit.com/r/n8n/comments/1hy9no5/how_to_process_pdfs_with_n8n_and_gemini_ai/)
43. Mastering RAG: Advanced Chunking Techniques for LLM Applications \- Galileo AI, accessed May 2, 2025, [https://www.galileo.ai/blog/mastering-rag-advanced-chunking-techniques-for-llm-applications](https://www.galileo.ai/blog/mastering-rag-advanced-chunking-techniques-for-llm-applications)
44. Effective Chunking Strategies for RAG \- Cohere Documentation, accessed May 2, 2025, [https://docs.cohere.com/v2/page/chunking-strategies](https://docs.cohere.com/v2/page/chunking-strategies)
45. RAG using Supabase \- AI Workflow Builder \- BuildShip, accessed May 2, 2025, [https://buildship.com/templates/rag-using-supabase](https://buildship.com/templates/rag-using-supabase)
46. Understanding Supabase Vector DB Querying from N8N \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1ig3dg2/understanding\_supabase\_vector\_db\_querying\_from\_n8n/](https://www.reddit.com/r/n8n/comments/1ig3dg2/understanding_supabase_vector_db_querying_from_n8n/)
47. flutter\_chat\_ui | Flutter package \- pub.dev, accessed May 2, 2025, [https://pub.dev/packages/flutter\_chat\_ui](https://pub.dev/packages/flutter_chat_ui)
48. Best practices for adaptive design \- Flutter Documentation, accessed May 2, 2025, [https://docs.flutter.dev/ui/adaptive-responsive/best-practices](https://docs.flutter.dev/ui/adaptive-responsive/best-practices)
49. Mastering State Management in Dart & Flutter in 2024 \- Social+, accessed May 2, 2025, [https://www.social.plus/tutorials/state-management-in-dart-flutter](https://www.social.plus/tutorials/state-management-in-dart-flutter)
50. State management \- Flutter Documentation, accessed May 2, 2025, [https://docs.flutter.dev/get-started/fundamentals/state-management](https://docs.flutter.dev/get-started/fundamentals/state-management)
51. List of state management approaches | Flutter, accessed May 2, 2025, [https://docs.flutter.dev/data-and-backend/state-mgmt/options](https://docs.flutter.dev/data-and-backend/state-mgmt/options)
52. FlutterWiz/flutter\_social\_chat: Real-time social chat app with Firebase & GetStream — open-source and feature-rich \- GitHub, accessed May 2, 2025, [https://github.com/FlutterWiz/flutter\_social\_chat](https://github.com/FlutterWiz/flutter_social_chat)
53. Performance best practices \- Flutter Documentation, accessed May 2, 2025, [https://docs.flutter.dev/perf/best-practices](https://docs.flutter.dev/perf/best-practices)
54. Filtering orders \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/courses/level-one/chapter-5/chapter-5.3/](https://docs.n8n.io/courses/level-one/chapter-5/chapter-5.3/)
55. Conditional logic for http request \- Questions \- n8n Community, accessed May 2, 2025, [https://community.n8n.io/t/conditional-logic-for-http-request/40448](https://community.n8n.io/t/conditional-logic-for-http-request/40448)
56. Set variable depending on IF node \- Questions \- n8n Community, accessed May 2, 2025, [https://community.n8n.io/t/set-variable-depending-on-if-node/11026](https://community.n8n.io/t/set-variable-depending-on-if-node/11026)
57. Page 2 \- Best Langchain apps & software integrations \- N8N, accessed May 2, 2025, [https://n8n.io/integrations/categories/langchain/2/](https://n8n.io/integrations/categories/langchain/2/)
58. Build a User Management App with React | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/guides/getting-started/tutorials/with-react](https://supabase.com/docs/guides/getting-started/tutorials/with-react)
59. Build a User Management App with Next.js | Supabase Docs, accessed May 2, 2025, [https://supabase.com/docs/guides/getting-started/tutorials/with-nextjs](https://supabase.com/docs/guides/getting-started/tutorials/with-nextjs)
60. Create a RAG Pipeline with PostgreSQL | Vectorize Docs, accessed May 2, 2025, [https://docs.vectorize.io/quickstart/postgresql-quickstart/](https://docs.vectorize.io/quickstart/postgresql-quickstart/)
61. Supabase Vector Database Integration | Vectorize Docs, accessed May 2, 2025, [https://docs.vectorize.io/integrations/destination-connectors/supabase](https://docs.vectorize.io/integrations/destination-connectors/supabase)
62. Building a Serverless Chat Application with Supabase \- SitePen, accessed May 2, 2025, [https://www.sitepen.com/blog/building-a-serverless-chat-application-with-supabase](https://www.sitepen.com/blog/building-a-serverless-chat-application-with-supabase)
63. Supabase Vector Database Integration | Vectorize Docs, accessed May 2, 2025, [https://docs.vectorize.io/integrations/destination-connectors/supabase/](https://docs.vectorize.io/integrations/destination-connectors/supabase/)
64. Supabase Auth Tutorial for Flutter \- YouTube, accessed May 2, 2025, [https://www.youtube.com/watch?v=sy1UnXEfSvU](https://www.youtube.com/watch?v=sy1UnXEfSvU)
65. Telegram node Chat operations documentation \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/chat-operations/](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/chat-operations/)
66. Automating Email Responses via Telegram in n8n – Stuck on Telegram API Limitation\!, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1isach8/automating\_email\_responses\_via\_telegram\_in\_n8n/](https://www.reddit.com/r/n8n/comments/1isach8/automating_email_responses_via_telegram_in_n8n/)
67. Telegram Send Chat Bot \- Questions \- n8n Community, accessed May 2, 2025, [https://community.n8n.io/t/telegram-send-chat-bot/93175](https://community.n8n.io/t/telegram-send-chat-bot/93175)
68. Execute Sub-workflow Trigger node documentation \- n8n Docs, accessed May 2, 2025, [https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.executeworkflowtrigger/](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.executeworkflowtrigger/)
69. Cannot Test WhatsApp Node To Receive Messages · Issue \#13361 · n8n-io/n8n \- GitHub, accessed May 2, 2025, [https://github.com/n8n-io/n8n/issues/13361](https://github.com/n8n-io/n8n/issues/13361)
70. Issue with WhatsApp Business API Webhook and n8n (Not Receiving Messages) \- Reddit, accessed May 2, 2025, [https://www.reddit.com/r/n8n/comments/1jd1qy6/issue\_with\_whatsapp\_business\_api\_webhook\_and\_n8n/](https://www.reddit.com/r/n8n/comments/1jd1qy6/issue_with_whatsapp_business_api_webhook_and_n8n/)
71. Send whatsapp message | Evolution API v2 \- Questions \- n8n Community, accessed May 2, 2025, [https://community.n8n.io/t/send-whatsapp-message-evolution-api-v2/92235](https://community.n8n.io/t/send-whatsapp-message-evolution-api-v2/92235)
72. Tutorial \- Evaluate RAG Responses using Ragas | Couchbase Developer Portal, accessed May 2, 2025, [https://developer.couchbase.com/tutorial-evaluate-rag-responses-using-ragas/](https://developer.couchbase.com/tutorial-evaluate-rag-responses-using-ragas/)
73. Introduction to RAG QA Agent Evaluation | DeepEval \- Confident AI, accessed May 2, 2025, [https://docs.confident-ai.com/tutorials/qa-agent-introduction](https://docs.confident-ai.com/tutorials/qa-agent-introduction)
74. Simplifying RAG evaluation with Ragas \- QED42, accessed May 2, 2025, [https://www.qed42.com/insights/simplifying-rag-evaluation-with-ragas](https://www.qed42.com/insights/simplifying-rag-evaluation-with-ragas)
75. Evaluation of RAG pipelines with Ragas \- Langfuse, accessed May 2, 2025, [https://langfuse.com/guides/cookbook/evaluation\_of\_rag\_with\_ragas](https://langfuse.com/guides/cookbook/evaluation_of_rag_with_ragas)
76. RAG Evaluation | DeepEval \- The Open-Source LLM Evaluation Framework, accessed May 2, 2025, [https://docs.confident-ai.com/guides/guides-rag-evaluation](https://docs.confident-ai.com/guides/guides-rag-evaluation)
77. Evaluate RAG pipeline using Ragas in Python with watsonx \- IBM, accessed May 2, 2025, [https://www.ibm.com/think/tutorials/ragas-rag-evaluation-python-watsonx](https://www.ibm.com/think/tutorials/ragas-rag-evaluation-python-watsonx)
78. Evaluate a simple RAG system \- Ragas, accessed May 2, 2025, [https://docs.ragas.io/en/stable/getstarted/rag\_eval/](https://docs.ragas.io/en/stable/getstarted/rag_eval/)
79. RAG Evaluation \- A Step-by-Step Guide with DeepEval \- Atamel.Dev, accessed May 2, 2025, [https://atamel.dev/posts/2025/01-14\_rag\_evaluation\_deepeval/](https://atamel.dev/posts/2025/01-14_rag_evaluation_deepeval/)
80. Tutorial Introduction | DeepEval \- The Open-Source LLM Evaluation Framework, accessed May 2, 2025, [https://docs.confident-ai.com/tutorials/tutorial-introduction](https://docs.confident-ai.com/tutorials/tutorial-introduction)
81. 16 Techniques to Supercharge and Build Real-world RAG Systems—Part 1, accessed May 2, 2025, [https://www.dailydoseofds.com/16-techniques-to-supercharge-and-build-real-world-rag-systems-part-1/](https://www.dailydoseofds.com/16-techniques-to-supercharge-and-build-real-world-rag-systems-part-1/)
