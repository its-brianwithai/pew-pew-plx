**Prompt**    
**Engineering Author: Lee Boonstra**  
Prompt Engineering 

**Acknowledgements** 

**Content contributors** Michael Sherman   
Yuan Cao 

Erick Armbrust 

Anant Nawalgaria 

Antonio Gulli 

Simone Cammel 

**Curators and Editors** Antonio Gulli   
Anant Nawalgaria 

Grace Mollison  

**Technical Writer** 

Joey Haymaker 

**Designer** 

Michael Lanning 

February 2025 2   
**Table of contents**

Introduction 6 Prompt engineering 7 LLM output configuration 8 

Output length 8 Sampling controls 9 Temperature 9 Top-K and top-P 10 Putting it all together 11 Prompting techniques 13 General prompting / zero shot 13 One-shot & few-shot 15 System, contextual and role prompting 18 System prompting 19 Role prompting 21 Contextual prompting 23   
Step-back prompting 25 Chain of Thought (CoT) 29 Self-consistency 32 Tree of Thoughts (ToT) 36 ReAct (reason & act) 37 Automatic Prompt Engineering 40 Code prompting 42 

Prompts for writing code 42 Prompts for explaining code 44 Prompts for translating code 46 Prompts for debugging and reviewing code 48 What about multimodal prompting? 54 

Best Practices 54 Provide examples 54 Design with simplicity 55 Be specific about the output 56 Use Instructions over Constraints 56 Control the max token length 58 Use variables in prompts 58 Experiment with input formats and writing styles 59 For few-shot prompting with classification tasks, mix up the classes 59 Adapt to model updates 60 Experiment with output formats 60  
JSON Repair 61 Working with Schemas 62 Experiment together with other prompt engineers 63 CoT Best practices 64 Document the various prompt attempts 64 

Summary 66 Endnotes 68  
Prompt Engineering 

You don’t need to be a data  

scientist or a machine learning  engineer – everyone can write  a prompt.

**Introduction** 

When thinking about a large language model input and output, a text prompt (sometimes  accompanied by other modalities such as image prompts) is the input the model uses  to predict a specific output. You don’t need to be a data scientist or a machine learning  engineer – everyone can write a prompt. However, crafting the most effective prompt can be  complicated. Many aspects of your prompt affect its efficacy: the model you use, the model’s  training data, the model configurations, your word-choice, style and tone, structure, and  context all matter. Therefore, prompt engineering is an iterative process. Inadequate prompts  can lead to ambiguous, inaccurate responses, and can hinder the model’s ability to provide  meaningful output. 

February 2025 6   
Prompt Engineering 

When you chat with the Gemini chatbot,1 you basically write prompts, however this  whitepaper focuses on writing prompts for the Gemini model within Vertex AI or by using  the API, because by prompting the model directly you will have access to the configuration  such as temperature etc. 

This whitepaper discusses prompt engineering in detail. We will look into the various  prompting techniques to help you getting started and share tips and best practices to  become a prompting expert. We will also discuss some of the challenges you can face  while crafting prompts. 

**Prompt engineering** 

Remember how an LLM works; it’s a prediction engine. The model takes sequential text as  an input and then predicts what the following token should be, based on the data it was  trained on. The LLM is operationalized to do this over and over again, adding the previously  predicted token to the end of the sequential text for predicting the following token. The next  token prediction is based on the relationship between what’s in the previous tokens and what  the LLM has seen during its training.  

When you write a prompt, you are attempting to set up the LLM to predict the right sequence  of tokens. Prompt engineering is the process of designing high-quality prompts that guide  LLMs to produce accurate outputs. This process involves tinkering to find the best prompt,  optimizing prompt length, and evaluating a prompt’s writing style and structure in relation  to the task. In the context of natural language processing and LLMs, a prompt is an input  provided to the model to generate a response or prediction.

February 2025 7   
Prompt Engineering 

These prompts can be used to achieve various kinds of understanding and generation  tasks such as text summarization, information extraction, question and answering, text  classification, language or code translation, code generation, and code documentation  or reasoning. 

Please feel free to refer to Google’s prompting guides2,3 with simple and effective  prompting examples. 

When prompt engineering, you will start by choosing a model. Prompts might need to be  optimized for your specific model, regardless of whether you use Gemini language models in  Vertex AI, GPT, Claude, or an open source model like Gemma or LLaMA. 

Besides the prompt, you will also need to tinker with the various configurations of a LLM. 

**LLM output configuration** 

Once you choose your model you will need to figure out the model configuration. Most LLMs  come with various configuration options that control the LLM’s output. Effective prompt  engineering requires setting these configurations optimally for your task. 

**Output length** 

An important configuration setting is the number of tokens to generate in a response.  Generating more tokens requires more computation from the LLM, leading to higher energy  consumption, potentially slower response times, and higher costs.

February 2025 8   
Prompt Engineering 

Reducing the output length of the LLM doesn’t cause the LLM to become more stylistically  or textually succinct in the output it creates, it just causes the LLM to stop predicting more  tokens once the limit is reached. If your needs require a short output length, you’ll also  possibly need to engineer your prompt to accommodate. 

Output length restriction is especially important for some LLM prompting techniques, like  ReAct, where the LLM will keep emitting useless tokens after the response you want. 

Be aware, generating more tokens requires more computation from the LLM, leading  to higher energy consumption and potentially slower response times, which leads to  higher costs. 

**Sampling controls** 

LLMs do not formally predict a single token. Rather, LLMs predict probabilities for what the  next token could be, with each token in the LLM’s vocabulary getting a probability. Those  token probabilities are then sampled to determine what the next produced token will be.  Temperature, top-K, and top-P are the most common configuration settings that determine  how predicted token probabilities are processed to choose a single output token. 

**Temperature** 

Temperature controls the degree of randomness in token selection. Lower temperatures  are good for prompts that expect a more deterministic response, while higher temperatures  can lead to more diverse or unexpected results. A temperature of 0 (greedy decoding) is 

February 2025 9   
Prompt Engineering 

deterministic: the highest probability token is always selected (though note that if two tokens  have the same highest predicted probability, depending on how tiebreaking is implemented  you may not always get the same output with temperature 0). 

Temperatures close to the max tend to create more random output. And as temperature gets  higher and higher, all tokens become equally likely to be the next predicted token. 

The Gemini temperature control can be understood in a similar way to the softmax function  used in machine learning. A low temperature setting mirrors a low softmax temperature (T),  emphasizing a single, preferred temperature with high certainty. A higher Gemini temperature  setting is like a high softmax temperature, making a wider range of temperatures around  the selected setting more acceptable. This increased uncertainty accommodates scenarios  where a rigid, precise temperature may not be essential like for example when experimenting  with creative outputs. 

**Top-K and top-P** 

Top-K and top-P (also known as nucleus sampling)4 are two sampling settings used in LLMs  to restrict the predicted next token to come from tokens with the top predicted probabilities.  Like temperature, these sampling settings control the randomness and diversity of  generated text. 

• **Top-K** sampling selects the top K most likely tokens from the model’s predicted  distribution. The higher top-K, the more creative and varied the model’s output; the  lower top-K, the more restive and factual the model’s output. A top-K of 1 is equivalent to  greedy decoding.

February 2025 10   
Prompt Engineering 

• **Top-P** sampling selects the top tokens whose cumulative probability does not exceed  a certain value (P). Values for P range from 0 (greedy decoding) to 1 (all tokens in the  LLM’s vocabulary). 

The best way to choose between top-K and top-P is to experiment with both methods (or  both together) and see which one produces the results you are looking for.  

**Putting it all together** 

Choosing between top-K, top-P, temperature, and the number of tokens to generate,  depends on the specific application and desired outcome, and the settings all impact one  another. It’s also important to make sure you understand how your chosen model combines  the different sampling settings together. 

If temperature, top-K, and top-P are all available (as in Vertex Studio), tokens that meet  both the top-K and top-P criteria are candidates for the next predicted token, and then  temperature is applied to sample from the tokens that passed the top-K and top-P criteria. If  only top-K or top-P is available, the behavior is the same but only the one top-K or P setting  is used.  

If temperature is not available, whatever tokens meet the top-K and/or top-P criteria are then  randomly selected from to produce a single next predicted token. 

At extreme settings of one sampling configuration value, that one sampling setting either  cancels out other configuration settings or becomes irrelevant.

February 2025 11   
Prompt Engineering 

• If you set temperature to 0, top-K and top-P become irrelevant–the most probable  token becomes the next token predicted. If you set temperature extremely high (above  1–generally into the 10s), temperature becomes irrelevant and whatever tokens make  it through the top-K and/or top-P criteria are then randomly sampled to choose a next  predicted token. 

• If you set top-K to 1, temperature and top-P become irrelevant. Only one token passes the  top-K criteria, and that token is the next predicted token. If you set top-K extremely high,  like to the size of the LLM’s vocabulary, any token with a nonzero probability of being the  next token will meet the top-K criteria and none are selected out. 

• If you set top-P to 0 (or a very small value), most LLM sampling implementations will then  only consider the most probable token to meet the top-P criteria, making temperature and  top-K irrelevant. If you set top-P to 1, any token with a nonzero probability of being the  next token will meet the top-P criteria, and none are selected out. 

As a general starting point, a temperature of .2, top-P of .95, and top-K of 30 will give you  relatively coherent results that can be creative but not excessively so. If you want especially  creative results, try starting with a temperature of .9, top-P of .99, and top-K of 40\. And if you  want less creative results, try starting with a temperature of .1, top-P of .9, and top-K of 20\.  Finally, if your task always has a single correct answer (e.g., answering a math problem), start  with a temperature of 0\. 

**NOTE:** With more freedom (higher temperature, top-K, top-P, and output tokens), the LLM  might generate text that is less relevant. 

**WARNING:** Have you ever seen a response ending with a large amount of filler words? This  is also known as the "repetition loop bug", which is a common issue in Large Language  Models where the model gets stuck in a cycle, repeatedly generating the same (filler) word,  phrase, or sentence structure, often exacerbated by inappropriate temperature and top-k/

February 2025 12   
Prompt Engineering 

top-p settings. This can occur at both low and high temperature settings, though for different  reasons. At low temperatures, the model becomes overly deterministic, sticking rigidly to the  highest probability path, which can lead to a loop if that path revisits previously generated  text. Conversely, at high temperatures, the model's output becomes excessively random,  increasing the probability that a randomly chosen word or phrase will, by chance, lead back  to a prior state, creating a loop due to the vast number of available options. In both cases,  the model's sampling process gets "stuck," resulting in monotonous and unhelpful output  until the output window is filled. Solving this often requires careful tinkering with temperature  and top-k/top-p values to find the optimal balance between determinism and randomness. 

**Prompting techniques** 

LLMs are tuned to follow instructions and are trained on large amounts of data so they can  understand a prompt and generate an answer. But LLMs aren’t perfect; the clearer your  prompt text, the better it is for the LLM to predict the next likely text. Additionally, specific  techniques that take advantage of how LLMs are trained and how LLMs work will help you get  the relevant results from LLMs 

Now that we understand what prompt engineering is and what it takes, let’s dive into some  examples of the most important prompting techniques. 

**General prompting / zero shot** 

A *zero-shot*5 prompt is the simplest type of prompt. It only provides a description of a task  and some text for the LLM to get started with. This input could be anything: a question, a  start of a story, or instructions. The name zero-shot stands for ’no examples’.

February 2025 13   
Prompt Engineering 

Let’s use Vertex AI Studio (for Language) in Vertex AI,6 which provides a playground to test  prompts. In Table 1, you will see an example zero-shot prompt to classify movie reviews.  

The table format as used below is a great way of documenting prompts. Your prompts will  likely go through many iterations before they end up in a codebase, so it’s important to keep  track of your prompt engineering work in a disciplined, structured way. More on this table  format, the importance of tracking prompt engineering work, and the prompt development  process is in the Best Practices section later in this chapter (“Document the various prompt  attempts”).  

The model temperature should be set to a low number, since no creativity is needed, and we  use the gemini-pro default top-K and top-P values, which effectively disable both settings  (see ‘LLM Output Configuration’ above). Pay attention to the generated output. The words  *disturbing* and *masterpiece* should make the prediction a little more complicated, as both  words are used in the same sentence.

February 2025 14   
Prompt Engineering 

Name 1\_1\_movie\_classification 

| Goal  | Classify movie reviews as positive, neutral or negative. |  |  |
| :---- | :---- | :---- | :---- |
| Model  | gemini-pro |  |  |
| Temperature  | 0.1  | Token Limit  | 5 |
| Top-K  | N/A  | Top-P  | 1 |
| Prompt  | `Classify movie reviews as POSITIVE, NEUTRAL or NEGATIVE. Review: "Her" is a disturbing study revealing the direction  humanity is headed if AI is allowed to keep evolving,  unchecked. I wish there were more movies like this masterpiece. Sentiment:` |  |  |

Output POSITIVE 

Table 1\. An example of zero-shot prompting 

When zero-shot doesn’t work, you can provide demonstrations or examples in the prompt,  which leads to “one-shot” and “few-shot” prompting. General prompting / zero shot 

**One-shot & few-shot** 

When creating prompts for AI models, it is helpful to provide examples. These examples can  help the model understand what you are asking for. Examples are especially useful when you  want to steer the model to a certain output structure or pattern.  

A **one-shot prompt**, provides a *single* example, hence the name one-shot. The idea is the  model has an example it can imitate to best complete the task. 

A **few-shot prompt** 7 provides *multiple* examples to the model. This approach shows the  model a pattern that it needs to follow. The idea is similar to one-shot, but multiple examples  of the desired pattern increases the chance the model follows the pattern.

February 2025 15   
Prompt Engineering 

The number of examples you need for few-shot prompting depends on a few factors,  including the complexity of the task, the quality of the examples, and the capabilities of the  generative AI (gen AI) model you are using. As a general rule of thumb, you should use at  least three to five examples for few-shot prompting. However, you may need to use more  examples for more complex tasks, or you may need to use fewer due to the input length  limitation of your model. 

Table 2 shows a few-shot prompt example, let’s use the same gemini-pro model  configuration settings as before, other than increasing the token limit to accommodate the  need for a longer response. 

Goal Parse pizza orders to JSON 

| Model  | gemini-pro |  |  |
| :---- | :---- | :---- | :---- |
| Temperature  | 0.1  | Token Limit  | 250 |
| Top-K  | N/A  | Top-P  | 1 |

Prompt `Parse a customer's pizza order into valid JSON:` 

`EXAMPLE:` 

`I want a small pizza with cheese, tomato sauce, and pepperoni. JSON Response:` 

```` ``` ```` 

`{` 

`"size": "small",` 

`"type": "normal",` 

`"ingredients": [["cheese", "tomato sauce", "peperoni"]]` 

`}` 

```` ``` ```` 

**Continues next page...**

February 2025 16   
Prompt Engineering 

Prompt `EXAMPLE:` 

`Can I get a large pizza with tomato sauce, basil and mozzarella`  

`{` 

`"size": "large",` 

`"type": "normal",` 

`"ingredients": [["tomato sauce", "bazel", "mozzarella"]]` 

`}` 

`Now, I would like a large pizza, with the first half cheese and  mozzarella. And the other tomato sauce, ham and pineapple.` 

`JSON Response:` 

Output ```` ``` ```` 

`{` 

`"size": "large",` 

`"type": "half-half",` 

`"ingredients": [["cheese", "mozzarella"], ["tomato sauce",`  

`"ham", "pineapple"]]` 

`}` 

```` ``` ```` 

Table 2\. An example of few-shot prompting 

When you choose examples for your prompt, use examples that are relevant to the task you  want to perform. The examples should be diverse, of high quality, and well written. One small  mistake can confuse the model and will result in undesired output. 

If you are trying to generate output that is robust to a variety of inputs, then it is important to  include edge cases in your examples. Edge cases are inputs that are unusual or unexpected,  but that the model should still be able to handle.

February 2025 17   
Prompt Engineering 

**System, contextual and role prompting** 

System, contextual and role prompting are all techniques used to guide how LLMs generate  text, but they focus on different aspects: 

• **System prompting** sets the overall context and purpose for the language model. It  defines the ‘big picture’ of what the model should be doing, like translating a language,  classifying a review etc. 

• **Contextual prompting** provides specific details or background information relevant to  the current conversation or task. It helps the model to understand the nuances of what’s  being asked and tailor the response accordingly. 

• **Role prompting** assigns a specific character or identity for the language model to adopt.  This helps the model generate responses that are consistent with the assigned role and its  associated knowledge and behavior. 

There can be considerable overlap between system, contextual, and role prompting. E.g. a  prompt that assigns a role to the system, can also have a context. 

However, each type of prompt serves a slightly different primary purpose: • System prompt: Defines the model’s fundamental capabilities and overarching purpose. 

• Contextual prompt: Provides immediate, task-specific information to guide the response.  It’s highly specific to the current task or input, which is dynamic. 

• Role prompt: Frames the model’s output style and voice. It adds a layer of specificity  and personality.

February 2025 18   
Prompt Engineering 

Distinguishing between system, contextual, and role prompts provides a framework for  designing prompts with clear intent, allowing for flexible combinations and making it easier to  analyze how each prompt type influences the language model’s output. 

Let’s dive into these three different kinds of prompts. 

**System prompting** 

Table 3 contains a system prompt, where I specify additional information on how to return the  output. I increased the temperature to get a higher creativity level, and I specified a higher  token limit. However, because of my clear instruction on how to return the output the model  didn’t return extra text. 

Goal Classify movie reviews as positive, neutral or negative. 

| Model  | gemini-pro |  |  |
| :---- | :---- | :---- | :---- |
| Temperature  | 1  | Token Limit  | 5 |
| Top-K  | 40  | Top-P  | 0.8 |
| Prompt  | `Classify movie reviews as positive, neutral or negative. Only  return the label in uppercase.  Review: "Her" is a disturbing study revealing the direction  humanity is headed if AI is allowed to keep evolving,  unchecked. It's so disturbing I couldn't watch it. Sentiment:` |  |  |

Output NEGATIVE 

Table 3\. An example of system prompting 

System prompts can be useful for generating output that meets specific requirements. The  name ‘system prompt’ actually stands for ‘providing an additional task to the system’. For  example, you could use a system prompt to generate a code snippet that is compatible with  a specific programming language, or you could use a system prompt to return a certain  structure. Have a look into Table 4, where I return the output in JSON format.

February 2025 19   
Prompt Engineering 

Goal Classify movie reviews as positive, neutral or negative, return JSON. 

| Model  | gemini-pro |  |  |
| :---- | :---- | :---- | :---- |
| Temperature  | 1  | Token Limit  | 1024 |
| Top-K  | 40  | Top-P  | 0.8 |
| Prompt  | ````Classify movie reviews as positive, neutral or negative. Return  valid JSON:  Review: "Her" is a disturbing study revealing the direction  humanity is headed if AI is allowed to keep evolving,  unchecked. It's so disturbing I couldn't watch it.  Schema:  ```  MOVIE:  {  "sentiment": String "POSITIVE" | "NEGATIVE" | "NEUTRAL", "name": String  }  MOVIE REVIEWS:  {  "movie_reviews": [MOVIE]  }  ```  JSON Response:```` |  |  |

Output ```` ``` ```` 

`{` 

 `"movie_reviews": [` 

 `{` 

 `"sentiment": "NEGATIVE",` 

 `"name": "Her"` 

 `}` 

 `]` 

`}` 

```` ``` ```` 

Table 4\. An example of system prompting with JSON format

February 2025 20   
Prompt Engineering 

There are some benefits in returning JSON objects from a prompt that extracts data. In  a real-world application I don’t need to manually create this JSON format, I can already  return the data in a sorted order (very handy when working with datetime objects), but most  importantly, by prompting for a JSON format it forces the model to create a structure and  limit hallucinations. 

System prompts can also be really useful for safety and toxicity. To control the output, simply  add an additional line to your prompt like: ‘You should be respectful in your answer.’. 

**Role prompting** 

Role prompting is a technique in prompt engineering that involves assigning a specific role to  the gen AI model. This can help the model to generate more relevant and informative output,  as the model can craft its responses to the specific role that it has been assigned. 

For example, you could role prompt a gen AI model to be a book editor, a kindergarten  teacher, or a motivational speaker. Once the model has been assigned a role, you can then  give it prompts that are specific to that role. For example, you could prompt a teacher to  create a lesson plan that they can then review. Have a look into Table 5, where the model  takes the role of a travel guide.

February 2025 21   
Prompt Engineering 

Goal Act as travel guide and provide 3 travel suggestions 

| Model  | gemini-pro |  |  |
| :---- | :---- | :---- | :---- |
| Temperature  | 1  | Token Limit  | 1024 |
| Top-K  | 40  | Top-P  | 0.8 |
| Prompt  | `I want you to act as a travel guide. I will write to you  about my location and you will suggest 3 places to visit near  me. In some cases, I will also give you the type of places I  will visit.  My suggestion: "I am in Amsterdam and I want to visit  only museums."  Travel Suggestions:` |  |  |

Output 1\. Rijksmuseum: World-renowned museum, known for Dutch masterpieces  like Rembrandt’s “The Night Watch.” Don’t miss the incredible collection of  

paintings and artifacts showcasing Dutch art and history. 

2\. Van Gogh Museum: Immerse yourself in the captivating works of Vincent  

van Gogh. The museum houses the largest collection of his paintings and  

drawings, including “The Starry Night” and “Sunflowers.” 

3\. Stedelijk Museum Amsterdam: Discover modern and contemporary art  

from around the world. The museum’s collection includes works by Picasso,  

Kandinsky, and Rietveld, housed in a striking modern building. 

Table 5\. An example of role prompting 

The above example shows an example of taking the role of a travel agent. When you  would change the role to a teacher of geography, you would notice that you will receive a  different response. 

Defining a role perspective for an AI model gives it a blueprint of the tone, style, and focused  expertise you’re looking for to improve the quality, relevance, and effectiveness of your  output. 

February 2025 22   
Prompt Engineering 

Here are some styles you can choose from which I find effective: 

Confrontational, Descriptive, Direct, Formal, Humorous, Influential, Informal,  Inspirational, Persuasive 

Let’s change our prompt in Table 6 to include a humorous and inspirational style. 

Prompt `I want you to act as a travel guide. I will write to you about  my location and you will suggest 3 places to visit near me in  a humorous style.` 

`My suggestion: "I am in Manhattan."` 

`Travel Suggestions:` 

Output 1\. Behold the Empire State of Mind: Ascend to the dizzying heights of the Empire  State Building and bask in the glory of Manhattan's skyline. Prepare to feel like  King Kong atop the Big Apple, minus the giant ape-sized banana. 

2\. Get Artsy-Fartsy at MoMA: Unleash your inner art aficionado at the Museum  of Modern Art (MoMA). Gaze upon masterpieces that will boggle your  

mind and make you question whether your stick-figure drawings have any  

artistic merit. 

3\. Shop ‘Til You Drop on Fifth Avenue: Indulge in some retail therapy on the  

iconic Fifth Avenue. Brace yourself for sticker shock as you window-shop (or  

actually shop) at designer boutiques that will make your wallet cry. But hey,  

you’re in Manhattan, so you might as well embrace the fabulousness\! 

Table 6\. An example of role prompting with a humorous tone and style 

**Contextual prompting** 

By providing contextual prompts, you can help ensure that your AI interactions are as  seamless and efficient as possible. The model will be able to more quickly understand your  request and be able to generate more accurate and relevant responses, as you can see in the  example of Table 7\.

February 2025 23   
Prompt Engineering 

Goal Suggest articles for a blog about retro games 

| Model  | gemini-pro |  |  |
| :---- | :---- | :---- | :---- |
| Temperature  | 1  | Token Limit  | 1024 |
| Top-K  | 40  | Top-P  | 0.8 |
| Prompt  | `Context: You are writing for a blog about retro 80's arcade  video games.  Suggest 3 topics to write an article about with a few lines of  description of what this article should contain.` |  |  |

Output 1\. \*\*The Evolution of Arcade Cabinet Design:\*\* 

This article would explore the evolution of arcade cabinet designs, from the  

early wood and metal cabinets of the 1970s to the sleek, neon-lit designs of  

the 1980s and beyond. 

2\. \*\*Blast From The Past: Iconic Arcade Games of The 80’s:\*\* 

\- This article would feature a glimpse into the history, impact, and legacy  

of some of the most iconic and influential arcade games of the 1980s,  

highlighting their innovations, popular mechanics, and enduring charm. 

3\. \*\*The Rise and Retro Revival of Pixel Art:\*\* 

\- This article would delve into the evolution of pixel art as a defining visual  

style of early arcade games, tracing its roots, exploring its techniques, and  

discussing the resurgence of pixel art in modern games and digital art. 

Table 7\. An example of contextual prompting

February 2025 24   
Prompt Engineering 

**Step-back prompting** 

Step-back8 prompting is a technique for improving the performance by prompting the LLM  to first consider a general question related to the specific task at hand, and then feeding the  answer to that general question into a subsequent prompt for the specific task. This ‘step  back’ allows the LLM to activate relevant background knowledge and reasoning processes  before attempting to solve the specific problem. 

By considering the broader and underlying principles, LLMs can generate more accurate and  insightful responses. Step-back prompting encourages LLMs to think critically and apply their  knowledge in new and creative ways. It changes the final prompt doing the task by utilizing  more knowledge in the LLM’s parameters than would otherwise come into play when the LLM  is prompted directly. 

It can help to mitigate biases in LLM responses, by focusing on general principles instead of  specific details, step-back prompting. 

Let’s have a look into these examples to understand how step-back prompting can improve  the results. Let’s first review a traditional prompt (Table 8\) before we compare it to a step  back prompt (Table 9):

February 2025 25   
Prompt Engineering 

Goal Write a storyline for a level of a first-person shooter video game. 

| Model  | gemini-pro |  |  |
| :---- | :---- | :---- | :---- |
| Temperature  | 1  | Token Limit  | 1024 |
| Top-K  | 40  | Top-P  | 0.8 |
| Prompt  | `Write a one paragraph storyline for a new level of a first person shooter video game that is challenging and engaging.` |  |  |

Output The level begins with the player’s squad being ambushed in a dense urban area  by a relentless enemy faction. Players must fight their way through a maze of  back alleys and dilapidated buildings, utilizing stealth and precision to eliminate  enemy forces and avoid detection. The player must use their environment to their  advantage, setting traps, utilizing cover, and making calculated moves to survive.  Along the way, they uncover intel suggesting the enemy is planning a devastating  attack, and the player must race against time to gather evidence and relay it back  to their headquarters before the enemy can carry out their plans. 

Table 8\. A traditional prompt before we compare it with a step back prompt 

When you set the temperature to 1, you might end up with all kinds of creative writings for a  storyline, but it’s also quite random and generic. So let’s take a step back:

February 2025 26   
Prompt Engineering 

Prompt `Based on popular first-person shooter action games, what are  5 fictional key settings that contribute to a challenging and  engaging level storyline in a first-person shooter video game?` 

Output 1\. \*\*Abandoned Military Base\*\*: A sprawling, post-apocalyptic military complex  crawling with mutated soldiers and rogue robots, ideal for challenging  

firearm combat. 

2\. \*\*Cyberpunk City\*\*: A neon-lit, futuristic urban environment with towering  skyscrapers and dense alleyways, featuring cybernetically enhanced enemies  and hacking mechanics. 

3\. \*\*Alien Spaceship\*\*: A vast alien vessel stranded on Earth, with eerie  

corridors, zero-gravity sections, and extraterrestrial creatures to encounter. 

4\. \*\*Zombie-Infested Town\*\*: A desolate town overrun by hordes of aggressive  zombies, featuring intense close-quarters combat and puzzle-solving to find  

safe passage. 

5\. \*\*Underwater Research Facility\*\*: A deep-sea laboratory flooded with water,  filled with mutated aquatic creatures, and requiring stealth and underwater  

exploration skills to survive. 

Table 9\. An example of prompting for self consistency 

Yeah those topics seem like a good fit for a first-person video game. Let’s go back to the  original prompt, but this time we include the answer of the step back as context and see what  it will return.

February 2025 27   
Prompt Engineering 

Prompt `Context: 5 engaging themes for a first person shooter video game:` 

`1. **Abandoned Military Base**: A sprawling, post-apocalyptic`  

`military complex crawling with mutated soldiers and rogue`  

`robots, ideal for challenging firearm combat.` 

`2. **Cyberpunk City**: A neon-lit, futuristic urban environment  with towering skyscrapers and dense alleyways, featuring`  

`cybernetically enhanced enemies and hacking mechanics.` 

`3. **Alien Spaceship**: A vast alien vessel stranded on`  

`Earth, with eerie corridors, zero-gravity sections, and`  

`extraterrestrial creatures to encounter.` 

`4. **Zombie-Infested Town**: A desolate town overrun by hordes of  aggressive zombies, featuring intense close-quarters combat and  puzzle-solving to find safe passage.` 

`5. **Underwater Research Facility**: A deep-sea laboratory flooded  with water, filled with mutated aquatic creatures, and requiring  stealth and underwater exploration skills to survive.` 

`Take one of the themes and write a one paragraph storyline`  

`for a new level of a first-person shooter video game that is`  

`challenging and engaging.` 

Output In the heart of a murky abyss, lies a dilapidated underwater research facility,  standing as a testament to human ambition and its disastrous consequences.  

Shrouded in darkness, pulsating with the hum of malfunctioning machinery, and  

haunted by the echoes of drowned souls, the facility is now a breeding ground for  a nightmare borne from the deep sea. The player, an elite marine equipped with  

advanced diving gear and experimental weaponry, is tasked with venturing into  

this aquatic realm of terror. Armed with resilience and resourcefulness, they must  navigate treacherous corridors, solve cryptic puzzles, and confront gruesome sea  monstrosities that lurk in the depths. From grappling with the crushing pressure  

of the deep sea to outsmarting cunning aquatic predators, every moment in this  uncharted underworld tests the limits of human endurance and courage. 

Table 10\. An example of prompting for self consistency 

That looks like an interesting video game\! By using step back prompting techniques you can  increase the accuracy of your prompts.

February 2025 28   
Prompt Engineering 

**Chain of Thought (CoT)** 

Chain of Thought (CoT) 9 prompting is a technique for improving the reasoning capabilities  of LLMs by generating **intermediate reasoning steps**. This helps the LLM generate more  accurate answers. You can combine it with few-shot prompting to get better results on more  complex tasks that require reasoning before responding as it’s a challenge with a zero-shot  chain of thought. 

CoT has a lot of advantages. First of all, it’s low-effort while being very effective and works  well with off-the-shelf LLMs (so no need to finetune). You also get interpretability with CoT  prompting, as you can learn from the LLM’s responses and see the reasoning steps that were  followed. If there’s a malfunction, you will be able to identify it. Chain of thought appears  to improve robustness when moving between different LLM versions. Which means the  performance of your prompt should drift less between different LLMs than if your prompt  does not use reasoning chains. Of course there are also disadvantages, but they are  somewhat intuitive. 

The LLM response includes the chain of thought reasoning, which means more output  tokens, which means predictions cost more money and take longer. 

To explain the following example in Table 11, let’s first try to create a prompt that is not using  CoT prompting to showcase the flaws of a large language model. 

Prompt `When I was 3 years old, my partner was 3 times my age. Now, I  am 20 years old. How old is my partner?` 

Output 63 years old 

Table 11\. An example of a prompt which is trying to solve a mathematical problem

February 2025 29   
Prompt Engineering 

Yikes. That’s obviously the wrong answer. As a matter of fact, LLMs often struggle with  mathematical tasks and can provide incorrect answers – even for a task as simple as  multiplying two numbers. This is because they are trained on large volumes of text and math  may require a different approach. So let’s see if intermediate reasoning steps will improve  the output. 

Prompt `When I was 3 years old, my partner was 3 times my age. Now,  I am 20 years old. How old is my partner? Let's think step`  

`by step.` 

Output 1\. Let’s assume my current age is “x” years. 

2\. When I was 3 years old, my age was 3 years. 

3\. My partner’s age at that time was 3 times my age, which means my partner’s  age was 3 \* 3 \= 9 years. 

4\. Now, I am 20 years old, which means my age has increased by 20 \- 3 \= 17  years since I was 3 years old. 

5\. Since my partner’s age was 9 years when I was 3 years old, and my age has  increased by 17 years, my partner’s age must have also increased by 17 years. 

6\. Therefore, my partner’s current age is 9 \+ 17 \= 26 years. 

So, my partner is 26 years old. 

Table 12\. An example of Chain of Thought prompting 

Alright, now the final answer is correct. That’s because we clearly instructed the LLM to  explain each step instead of just returning an answer. It’s interesting to see that the model  adds up the 17 increased years. In my head I would take the difference of years between my  partner and me and add those up. (20+(9-3)). Let’s help the model to think a little bit more  like me.

February 2025 30   
Prompt Engineering 

Table 12 is an example of ‘zero-shot’ Chain of thought. Chain of thought prompting can be  very powerful when combined with a single-shot or few-shot, as what you can see in Table 13: 

Prompt `Q: When my brother was 2 years old, I was double his age. Now  I am 40 years old. How old is my brother? Let's think step`  

`by step.` 

`A: When my brother was 2 years, I was 2 * 2 = 4 years old.`  

`That's an age difference of 2 years and I am older. Now I am 40  years old, so my brother is 40 - 2 = 38 years old. The answer  is 38.` 

`Q: When I was 3 years old, my partner was 3 times my age. Now,  I am 20 years old. How old is my partner? Let's think step`  

`by step.` 

`A:` 

Output When I was 3 years old, my partner was 3 \* 3 \= 9 years old. That’s an age  difference of 6 years and my partner is older. Now I am 20 years old, so my  

partner is 20 \+ 6 \= 26 years old. The answer is 26\. 

Table 13\. An example of chain of thought prompting with a single-shot 

Chain of thought can be useful for various use-cases. Think of code generation, for breaking  down the request into a few steps, and mapping those to specific lines of code. Or for  creating synthetic data when you have some kind of seed like “*The product is called XYZ,  write a description guiding the model through the assumptions you would make based on  the product given title.*” Generally, any task that can be solved by ‘talking through is a good  candidate for a chain of thought. If you can explain the steps to solve the problem, try chain  of thought. 

Please refer to the notebook10 hosted in the GoogleCloudPlatform Github repository which  will go into further detail on CoT prompting:

February 2025 31   
Prompt Engineering 

In the best practices section of this chapter, we will learn some best practices specific to  Chain of thought prompting. 

**Self-consistency** 

While large language models have shown impressive success in various NLP tasks, their  ability to reason is often seen as a limitation that cannot be overcome solely by increasing  model size. As we learned in the previous Chain of Thought prompting section, the model can  be prompted to generate reasoning steps like a human solving a problem. However CoT uses  a simple ‘greedy decoding’ strategy, limiting its effectiveness. Self-consistency11 combines  sampling and majority voting to generate diverse reasoning paths and select the most  consistent answer. It improves the accuracy and coherence of responses generated by LLMs. 

Self-consistency gives a pseudo-probability likelihood of an answer being correct, but  obviously has high costs. 

It follows the following steps: 

1\. Generating diverse reasoning paths: The LLM is provided with the same prompt multiple  times. A high temperature setting encourages the model to generate different reasoning  paths and perspectives on the problem. 

2\. Extract the answer from each generated response. 

3\. Choose the most common answer. 

Let’s look into an example of an email classification system, which classifies an email as  IMPORTANT or NOT IMPORTANT. A zero-shot chain of thought prompt will be sent to the LLM  multiple times, to see if the responses differ after each submit. Notice the friendly tone, the  word choice and the sarcasm that’s been used in the email. All this could trick the LLM.

February 2025 32   
Prompt Engineering 

Prompt `EMAIL:` 

```` ``` ```` 

`Hi,` 

`I have seen you use Wordpress for your website. A great open  source content management system. I have used it in the past  too. It comes with lots of great user plugins. And it's pretty  easy to set up.` 

`I did notice a bug in the contact form, which happens when  you select the name field. See the attached screenshot of me  entering text in the name field. Notice the JavaScript alert  box that I inv0k3d.` 

`But for the rest it's a great website. I enjoy reading it. Feel  free to leave the bug in the website, because it gives me more  interesting things to read.` 

`Cheers,` 

`Harry the Hacker.` 

```` ``` ```` 

`Classify the above email as IMPORTANT or NOT IMPORTANT. Let's  think step by step and explain why.` 

**Continues next page...**

February 2025 33   
Prompt Engineering 

Output  Attempt 1 

Output  Attempt 2   
\*\*Step 1: Identify the purpose of the email.\*\* 

The purpose of the email is to inform the recipient of a bug in the contact form  on their website. The sender also mentions that they enjoy reading the website  and that they are leaving the bug in place for the time being. 

\*\*Step 2: Assess the potential impact of the bug.\*\* 

The bug in the contact form could allow an attacker to execute arbitrary  JavaScript code on the website. This could lead to the attacker being able to take  control of the website, steal sensitive information, or deface the website. 

\*\*Step 3: Consider the credibility of the sender.\*\* 

The sender of the email claims to be a hacker named Harry. However, there is no  way to verify the sender’s identity. It is possible that the sender is a legitimate  hacker who is trying to help the recipient, but it is also possible that the sender  is a malicious actor who is trying to trick the recipient into clicking on a malicious  link or downloading a malicious file. 

\*\*Conclusion: IMPORTANT\*\* 

Based on the potential impact of the bug and the credibility of the sender,  the email should be classified as \*\*IMPORTANT\*\*. The recipient should take  immediate action to fix the bug and protect their website from attack. 

\*\*Explanation:\*\* 

1\. \*\*Lack of urgency:\*\* The email does not convey any sense of urgency or  time-sensitivity. It starts with a casual greeting and presents the information  in a matter-of-fact tone. 

2\. \*\*Non-critical bug report:\*\* The bug reported in the contact form is  described as interesting but not critical. The email sender even suggests that  the website owner can leave the bug in place. 

3\. \*\*Lack of personal impact:\*\* The email does not indicate any direct or  personal impact on the website owner. It simply mentions that the sender  enjoys reading the website. 

**Continues next page...**

February 2025 34   
Prompt Engineering 

Output  Attempt 2 

Output  Attempt 3   
4\. \*\*Absence of action request:\*\* The email does not explicitly request any  action from the website owner. It does not ask for the bug to be fixed or  provide any specific suggestions for improvement. 

5\. \*\*Sender’s intent:\*\* The sender’s intention seems to be more focused on  sharing an observation and expressing interest in the website rather than  raising a serious concern or requesting assistance. 

\*\*Conclusion: NOT IMPORTANT\*\* 

\*\*Step 1: Identify the purpose of the email.\*\* 

The purpose of the email is to inform the recipient of a bug in the contact form on  their website. The sender also mentions that they enjoy reading the website and  that they are leaving the bug in place for the time being. 

\*\*Step 2: Assess the potential impact of the bug.\*\* 

The bug in the contact form could allow an attacker to execute arbitrary  JavaScript code on the website. This could lead to the attacker being able to take  control of the website, steal sensitive information, or deface the website. 

\*\*Step 3: Consider the credibility of the sender.\*\* 

The sender of the email claims to be a hacker named Harry. However, there is no  way to verify the sender’s identity. It is possible that the sender is a legitimate  hacker who is trying to help the recipient, but it is also possible that the sender is  a malicious actor who is trying to exploit the bug for their own gain. 

\*\*Conclusion:\*\* 

Based on the above factors, the email should be classified as \*\*IMPORTANT\*\*.  The bug in the contact form is a serious security risk, and the sender’s credibility  is unknown. The recipient should take immediate action to fix the bug and  investigate the sender’s claims. 

Table 14\. An example of prompting for self consistency 

You can use the above prompt and try to see if it returns a consistent classification.  Depending on the model that you are using and the temperature configuration, it might  return “IMPORTANT” or “NOT IMPORTANT”. 

February 2025 35   
Prompt Engineering 

By generating many Chains of Thoughts, and taking the most commonly occurring answer  (“IMPORTANT”), we can get a more consistently correct answer from the LLM. 

This example shows how self-consistency prompting can be used to improve the accuracy  of an LLM’s response by considering multiple perspectives and selecting the most  consistent answer. 

**Tree of Thoughts (ToT)** 

Now that we are familiar with chain of thought and self-consistency prompting, let’s review  Tree of Thoughts (ToT).12 It generalizes the concept of CoT prompting because it allows LLMs  to explore multiple different reasoning paths simultaneously, rather than just following a  single linear chain of thought. This is depicted in Figure 1\. 

![][image1]  
Figure 1\. A visualization of chain of thought prompting on the left versus. Tree of Thoughts prompting on  the right

February 2025 36   
Prompt Engineering 

This approach makes ToT particularly well-suited for complex tasks that require exploration. It  works by maintaining a tree of thoughts, where each thought represents a coherent language  sequence that serves as an intermediate step toward solving a problem. The model can then  explore different reasoning paths by branching out from different nodes in the tree.  

There’s a great notebook, which goes into a bit more detail showing The Tree of Thought  (ToT) which is based on the paper ‘Large Language Model Guided Tree-of-Thought’.9 

**ReAct (reason & act)** 

Reason and act (ReAct) \[10\]13 prompting is a paradigm for enabling LLMs to solve complex  tasks using natural language reasoning combined with external tools (search, code  interpreter etc.) allowing the LLM to perform certain actions, such as interacting with external  APIs to retrieve information which is a first step towards agent modeling. 

ReAct mimics how humans operate in the real world, as we reason verbally and can  take actions to gain information. ReAct performs well against other prompt engineering  approaches in a variety of domains. 

ReAct prompting works by combining reasoning and acting into a thought-action loop. The  LLM first reasons about the problem and generates a plan of action. It then performs the  actions in the plan and observes the results. The LLM then uses the observations to update  its reasoning and generate a new plan of action. This process continues until the LLM  reaches a solution to the problem. 

To see this in action, you need to write some code. In code Snippet 1 I am using the langchain  framework for Python, together with VertexAI (`google-cloud-aiplatform`) and the  `google-search-results pip packages`.

February 2025 37   
Prompt Engineering 

To run this sample you must create a (free) SerpAPI key from https://serpapi.com/manage api-key and set an environment variable `SERPAPI_API_KEY`. 

Next let’s write some Python code, with the task for the LLM to figure out: *How many children  have a famous dad that performs in the band Metallica.* 

**Python** 

`from langchain.agents import load_tools` 

`from langchain.agents import initialize_agent` 

`from langchain.agents import AgentType` 

`from langchain.llms import VertexAI` 

`prompt = "How many kids do the band members of Metallica have?"` 

`llm = VertexAI(temperature=0.1)` 

`tools = load_tools(["serpapi"], llm=llm)` 

`agent = initialize_agent(tools, llm,`  

`agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION, verbose=True)` 

`agent.run(prompt)` 

Snippet 1\. Creating a ReAct Agent with LangChain and VertexAI 

Code Snippet 2 shows the result. Notice that ReAct makes a chain of five searches. In fact,  the LLM is scraping Google search results to figure out the band names. Then, it lists the  results as observations and chains the thought for the next search.

February 2025 38   
Prompt Engineering 

`> Entering new AgentExecutor chain...` 

`Metallica has 4 members.`  

`Action: Search` 

`Action Input: How many kids does James Hetfield have?` 

`Observation: three children` 

`Thought: 1/4 Metallica band members have 3 children` 

`Action: Search` 

`Action Input: How many kids does Lars Ulrich have?` 

`Observation: 3` 

`Thought: 2/4 Metallica band members have 6 children` 

`Action: Search` 

`Action Input: How many kids does Kirk Hammett have?` 

`Observation: Hammett has been married to his second wife Lani since 1998.  They have two sons, Angel (b. September 29, 2006) and Vincenzo (b. June  28, 2008).` 

`Thought: 3/4 Metallica band members have 8 children` 

`Action: Search` 

`Action Input: How many kids does Robert Trujillo have?` 

`Observation: 2` 

`Thought: 4/4 Metallica band members have 10 children` 

`Final Answer: 10` 

Snippet 2\. Executing ReAct Agent in the terminal 

Code Snippet 2 figures out that the band Metallica has four band members. Then it searches  each band member to request the total of children and add up the total. Finally, it returns the  total number of children as the final answer. 

ReAct prompting in practice requires understanding that you continually have to resend the  previous prompts/responses (and do trimming of the extra generated content) as well as set  up the model with appropriate examples/instructions. Please refer to the notebook14 hosted  in the GoogleCloudPlatform Github repository, which goes into a bit more detail showing the  actual LLM inputs and outputs with a more elaborate example.

February 2025 39   
Prompt Engineering 

**Automatic Prompt Engineering** 

At this point you might realize that writing a prompt can be complex. Wouldn’t it be nice to  automate this (write a prompt to write prompts)? Well, there’s a method: Automatic Prompt  Engineering (APE). This method15 not only alleviates the need for human input but also  enhances the model’s performance in various tasks. 

You will prompt a model to generate more prompts. Evaluate them, possibly alter the good  ones. And repeat. 

For example, you can use automatic prompt engineering that will help with training a chatbot  for a merchandise t-shirt webshop. We want to figure out all the various ways customers  could phrase their order for buying a band merchandise t-shirt. 

1\. Write the prompt which will generate the output variants. In this example, I am using  gemini-pro to generate 10 instructions. See Table 15:

February 2025 40   
Prompt Engineering 

Prompt `We have a band merchandise t-shirt webshop, and to train a  chatbot we need various ways to order: "One Metallica t-shirt  size S". Generate 10 variants, with the same semantics but keep  the same meaning.` 

Output 1\. I’d like to purchase a Metallica t-shirt in size small. 

2\. Can I order a small-sized Metallica t-shirt? 

3\. I’d like to buy one Metallica t-shirt in small. 

4\. One Metallica shirt, size small, please. 

5\. I want one Metallica t-shirt in size small. 

6\. I’d like to place an order for one Metallica t-shirt in small. 

7\. Small Metallica t-shirt, one please. 

8\. I’m looking for one Metallica t-shirt in small. 

9\. Can you get me one Metallica t-shirt in small? 

10.One Metallica small t-shirt, please. 

Table 15\. Use an LLM to generate prompts 

2\. Evaluate all of the instruction candidates by scoring the candidates based on a chosen  metric, For example, you can use. BLEU (Bilingual Evaluation Understudy) or ROUGE  (Recall-Oriented Understudy for Gisting Evaluation). 

3\. Select the instruction candidate with the highest evaluation score. This candidate will be  the final prompt you can use in your software application or chatbot. You can also tweak  the select prompt and evaluate again.

February 2025 41   
Prompt Engineering 

**Code prompting** 

Gemini focuses primarily on text-based prompts, which also includes writing prompts for  returning code. Let’s go to the Vertex AI Studio and test these prompts to look at some  coding examples. 

**Prompts for writing code** 

Gemini can also be a developer and help you with writing code in any programming language  of choice. As a developer this can help you speed up the process of writing code. 

Imagine a folder on your machine with hundreds of files that needs to be renamed.  Renaming each file would take you a lot of time. You know a little Bash, and could write  a script to automate this, but that may also take awhile. So let’s write a prompt. You can  write the prompt in the public consumer chatbot Gemini, or if you are more concerned  about confidentiality, you can write these prompts within your Google Cloud account and  open Vertex AI Studio. The advantage of Vertex AI Studio is that you can configure the  temperature etc.

February 2025 42   
Prompt Engineering 

Name 1\_bash\_rename\_files\_in\_folder 

| Goal  | Write a prompt to write code in Bash to rename files in a folder. |  |  |
| :---- | :---- | :---- | :---- |
| Model  | gemini-pro |  |  |
| Temperature  | 0.1  | Token Limit  | 1024 |
| Top-K  | N/A  | Top-P  | 1 |
| Prompt  | `Write a code snippet in Bash, which asks for a folder name.  Then it takes the contents of the folder and renames all the  files inside by prepending the name draft to the file name.` |  |  |

Output ```` ```bash ```` 

`#!/bin/bash` 

`# Ask for the folder name` 

`echo "Enter the folder name: "` 

`read folder_name` 

`# Check if the folder exists` 

`if [ ! -d "$folder_name" ]; then` 

`echo "Folder does not exist."` 

`exit 1` 

`fi` 

`# Get the list of files in the folder` 

`files=( "$folder_name"/* )` 

`# Rename each file by prepending "draft" to the file name` 

`for file in "${files[@]}"; do` 

`new_file_name="draft_$(basename "$file")"` 

`mv "$file" "$new_file_name"` 

`done` 

`echo "Files renamed successfully."` 

```` ``` ```` 

Table 16\. Using Gemini to program code 

That seems like good code to me \- it’s even documented\! However, since LLMs can’t reason,  and repeat training data, it’s essential to read and test your code first.  

The moment we are all waiting for, does it really work? 

February 2025 43   
Prompt Engineering 

Let’s try it first with a test folder with only a few files in it, which will need to be renamed from  filename.txt to draft\_filename.txt.  

1\. Copy the output from Table 16 (without the \`\`\`**bash** \`\`\` text wrapper), and paste it in a new  file called: “**rename\_files.sh**”.  

2\. Open a terminal window and type: **. rename\_files.sh**. It will ask to enter a folder name, e.g.  **test**. and hit enter.  

3\. The script seems to run fine. You will see the message: **Files renamed successfully.** When you look into the test folder, notice that all the files were perfectly renamed to  **draft\_filename.txt.** 

It worked\! 

**Prompts for explaining code** 

As a developer when you work in teams you have to read someone else’s code. Gemini can  help you with this as well. Let’s take the code output from Table 16, remove the comments  and ask the large language model to explain what’s happening, See Table 17:

February 2025 44   
Prompt Engineering 

Name 1\_bash\_explain\_the\_code 

| Goal  | Write a prompt to explain Bash code |  |  |
| :---- | :---- | :---- | :---- |
| Model  | gemini-pro |  |  |
| Temperature  | 0.1  | Token Limit  | 1024 |
| Top-K  | N/A  | Top-P  | 1 |
| Prompt  | ```` Explain to me the below Bash code:  ```  #!/bin/bash  echo "Enter the folder name: "  read folder_name  if [ ! -d "$folder_name" ]; then  echo "Folder does not exist."  exit 1  fi  files=( "$folder_name"/* )  for file in "${files[@]}"; do  new_file_name="draft_$(basename "$file")"  mv "$file" "$new_file_name"  done  echo "Files renamed successfully."  ``` ```` |  |  |

Output This Bash script performs the following tasks: 

1\. \*\*User Input\*\*: 

\- It prompts the user to enter a folder name using the \`echo\` and \`read\`  

commands. The entered folder name is stored in the \`folder\_name\` variable. 

2\. \*\*Folder Existence Check\*\*: 

\- It checks if the folder with the specified name exists using the \`\[ \! \-d  

“$folder\_name” \]\` condition. If the folder does not exist, it displays an error  

message (“Folder does not exist.”) and exits the script with an exit code of 1\. 

**Continues next page...**

February 2025 45   
Prompt Engineering 

Output 3\. \*\*File Listing\*\*: 

\- It lists all the files inside the specified folder using the \`files=( “$folder\_ 

name”/\* )\` command. This creates an array called \`files\` containing the paths  to all the files in the folder. 

4\. \*\*File Renaming\*\*: 

\- It iterates through each file in the \`files\` array using a \`for\` loop. 

\- For each file, it generates a new file name using the \`new\_file\_ 

name=”draft\_$(basename “$file”)” \` command. This new file name is created  by prefixing the original file name with the string “draft\_”. 

\- It then renames the file using the \`mv “$file” “$new\_file\_name”\` command,  which moves the file to the new file name. 

5\. \*\*Success Message\*\*: 

\- After renaming all the files, it displays a success message (“Files renamed  

successfully.”) to indicate that the renaming operation was successful 

Table 17\. A prompt for explaining code 

**Prompts for translating code** 

The bash code from Table 16 seems to work fine. However this script could really be reusable  when it would prompt me for file names, ideally it should work as a separate application with  an UI. As a starting point, Python would be a better language for a (web) application than  Bash. LLMs can help with translating code from one language to another. See the example in  Table 18:

February 2025 46   
Prompt Engineering 

Name 1\_python\_rename\_files 

| Goal  | Write a prompt to translate Bash code to Python |  |  |
| :---- | :---- | :---- | :---- |
| Model  | gemini-pro |  |  |
| Temperature  | 0.1  | Token Limit  | 1024 |
| Top-K  | N/A  | Top-P  | 1 |
| Prompt  | ```` Translate the below Bash code to a Python snippet.  ```bash  #!/bin/bash  echo "Enter the folder name: "  read folder_name  if [ ! -d "$folder_name" ]; then  echo "Folder does not exist."  exit 1  fi  files=( "$folder_name"/* )  for file in "${files[@]}"; do  new_file_name="draft_$(basename "$file")"  mv "$file" "$new_file_name"  done  echo "Files renamed successfully."  ``` ```` |  |  |

Output ```` ```python ```` 

`import os` 

`import shutil` 

`# Get the folder name from the user` 

`folder_name = input("Enter the folder name: ")` 

`# Check if the folder exists` 

`if not os.path.isdir(folder_name):` 

`print("Folder does not exist.")` 

 `exit(1)` 

**Continues next page...**

February 2025 47   
Prompt Engineering 

Output `# Get a list of all files in the folder` 

`files = os.listdir(folder_name)` 

`# Iterate over the files` 

`for file in files:` 

 `# Create a new file name with the prefix "draft_"` 

 `new_file_name = f"draft_{file}"` 

`# Move the file to the new name` 

`shutil.move(os.path.join(folder_name, file),`  

`os.path.join(folder_name, new_file_name))` 

`# Print a success message` 

`print("Files renamed successfully.")` 

```` ``` ```` 

Table 18\. A prompt for translating code from Bash to Python 

Read and review the code. Copy the output from the prompt and paste it into a new file:  **file\_renamer.py**. Test the code by opening a Terminal window, and execute the following  command **python file\_renamer.py.** 

**NOTE:** When prompting for (Python) code in the Language Studio in Vertex AI, you will have  to click on the ‘Markdown’ button. Otherwise you will receive plain text which is missing the  proper indenting of lines, which is important for running Python code. 

**Prompts for debugging and reviewing code** 

Let’s manually write some edits to the code of Table 18\. It should prompt the user for the  filename prefix, and write this prefix in upper case characters. See the example code in  Snippet \*3, but what a bummer. It now returns Python errors\!

February 2025 48   
Prompt Engineering 

**Python** 

`import os` 

`import shutil` 

`folder_name = input("Enter the folder name: ")` 

`prefix = input("Enter the string to prepend to the filename: ") text = toUpperCase(prefix)` 

`if not os.path.isdir(folder_name):` 

 `print("Folder does not exist.")` 

 `exit(1)` 

`files = os.listdir(folder_name)` 

`for file in files:` 

 `new_filename = f"{text}_{file}"` 

`shutil.move(os.path.join(folder_name, file),`  

`os.path.joi(folder_name, new_file_name))` 

`print("Files renamed successfully.")` 

Snippet 3\. A broken Python script 

Doh\! That looks like a bug: 

`The below Python code gives an error:` 

`Traceback (most recent call last):` 

 `File “/Users/leeboonstra/Documents/test_folder/rename_files.py”, line 7,  in <module>` 

 `text = toUpperCase(prefix)` 

`NameError: name ‘toUpperCase’ is not defined` 

Snippet 4\. I broke the Python code 

Let’s see if we can ask the large language model to debug and review code. Have a look into  Table 19:

February 2025 49   
Prompt Engineering 

Name 1\_python\_debug\_code 

| Goal  | Write a prompt to debug and review Python code. |  |  |
| :---- | :---- | :---- | :---- |
| Model  | gemini-pro |  |  |
| Temperature  | 0.1  | Token Limit  | 1024 |
| Top-K  | N/A  | Top-P  | 1 |

Prompt `The below Python code gives an error:` 

`Traceback (most recent call last):` 

 `File "/` 

`Users/leeboonstra/Documents/test_folder/rename_files.py", line  7, in <module>` 

 `text = toUpperCase(prefix)` 

`NameError: name 'toUpperCase' is not defined` 

`Debug what's wrong and explain how I can improve the code.` 

```` ```python ```` 

`import os` 

`import shutil` 

`# Get the folder name from the user` 

`folder_name = input("Enter the folder name: ")` 

`prefix = input("Enter the string to prepend to the filename: ") text = toUpperCase(prefix)` 

`# Check if the folder exists` 

`if not os.path.isdir(folder_name):` 

 `print("Folder does not exist.")` 

 `exit(1)` 

`# Get a list of all files in the folder` 

`files = os.listdir(folder_name)` 

`# Iterate over the files` 

`for file in files:` 

**Continues next page...**

February 2025 50   
Prompt Engineering 

Prompt `# Create a new file name with the prefix "draft_"  new_filename = f"{text}_{file}"` 

`# Move the file to the new name` 

`shutil.move(os.path.join(folder_name, file),`  

`os.path.join(folder_name, new_file_name))` 

`# Print a success message` 

`print("Files renamed successfully.")` 

```` ``` ```` 

Output The code calls the \`toUpperCase\` function to convert \`prefix\` to uppercase, but  that function is not defined. To fix this issue, you can use the \`upper()\` method of  the string class which converts a given string into uppercase. The modified code  is shown below: 

```` ```python ```` 

`import os` 

`import shutil` 

`# Get the folder name from the user` 

`folder_name = input("Enter the folder name: ")` 

`prefix = input("Enter the string to prepend to the filename: ") text = prefix.upper()` 

`# Check if the folder exists` 

`if not os.path.isdir(folder_name):` 

 `print("Folder does not exist.")` 

 `exit(1)` 

`# Get a list of all files in the folder` 

`files = os.listdir(folder_name)` 

`# Iterate over the files` 

`for file in files:` 

 `# Create a new file name with the prefix "draft_"` 

 `new_filename = f"{text}_{file}"` 

`# Move the file to the new name` 

`shutil.move(os.path.join(folder_name, file),` 

**Continues next page...**

February 2025 51   
Prompt Engineering 

Output `os.path.join(folder_name, new_filename))` 

`# Print a success message` 

`print("Files renamed successfully.")` 

```` ``` ```` 

Additionally, there are a few other improvements that can be made to the code: 

1\. The file extension of the new filenames is not kept. It’s better to extract the  extension from the original filename and append it to the new filename. 

2\. The code assumes that there are no spaces in the folder name. However,  it is a good practice to handle spaces gracefully by replacing them with  

underscores or hyphens. 

3\. Using the \`f\` string syntax for string interpolation is more readable and  

concise than the traditional \`+\` operator. 

4\. The code doesn’t handle errors that might occur during the renaming process.  It would be better to wrap the \`shutil.move\` call in a \`try...except\` block to  

catch any potential errors. 

Here is the improved code with these suggestions: 

```` ```python ```` 

`import os` 

`import shutil` 

`# Get the folder name from the user` 

`folder_name = input("Enter the folder name: ")` 

`prefix = input("Enter the string to prepend to the filename: ") # Check if the folder exists` 

`if not os.path.isdir(folder_name):` 

 `print("Folder does not exist.")` 

 `exit(1)` 

`# Get a list of all files in the folder` 

`files = os.listdir(folder_name)` 

`# Iterate over the files` 

`for file in files:` 

**Continues next page...**

February 2025 52   
Prompt Engineering 

Output `# Get the file extension` 

 `ext = os.path.splitext(file)[1]` 

`# Create a new file name with the prefix and the file extension  new_filename = f"{prefix}_{os.path.splitext(file)[0]}{ext}"` 

`# Build the full paths for the original and new files` 

 `old_path = os.path.join(folder_name, file)` 

 `new_path = os.path.join(folder_name, new_filename)` 

`# Try to move the file` 

 `try:` 

 `shutil.move(old_path, new_path)` 

`except Exception as e:` 

 `print(f"An error occurred while moving the file`  

`{file}: {e}")` 

`# Print a success message` 

`print("Files renamed successfully.")` 

```` ``` ```` 

These improvements make the code more robust and flexible while also making  it easier to read and understand... (The response was truncated because  

it has reached the token limit. Try to increase the token limit if you need a  

longer response.) 

Table 19\. A prompt for debugging and reviewing Python code 

That’s great. Not only did it tell me how to solve the problem, it also figured out that my code  had more bugs and how to solve them, too. The last part of the prompt gave suggestions to  improve the code in general.

February 2025 53   
Prompt Engineering 

**What about multimodal prompting?** 

Prompting for code still uses the same regular large language model. Multimodal prompting  is a separate concern, it refers to a technique where you use multiple input formats to guide  a large language model, instead of just relying on text. This can include combinations of text,  images, audio, code, or even other formats, depending on the model’s capabilities and the  task at hand.  

**Best Practices** 

Finding the right prompt requires tinkering. Language Studio in Vertex AI is a perfect place to  play around with your prompts, with the ability to test against the various models. 

Use the following best practices to become a pro in prompt engineering. 

**Provide examples** 

The most important best practice is to provide (one shot / few shot) examples within a  prompt. This is highly effective because it acts as a powerful teaching tool. These examples  showcase desired outputs or similar responses, allowing the model to learn from them  and tailor its own generation accordingly. It’s like giving the model a reference point or  target to aim for, improving the accuracy, style, and tone of its response to better match  your expectations.

February 2025 54   
Prompt Engineering 

**Design with simplicity** 

Prompts should be concise, clear, and easy to understand for both you and the model. As a  rule of thumb, if it’s already confusing for you it will likely be also confusing for the model. Try  not to use complex language and don’t provide unnecessary information.  

Examples: 

BEFORE: 

`I am visiting New York right now, and I'd like to hear more about great  locations. I am with two 3 year old kids. Where should we go during  our vacation?` 

AFTER REWRITE: 

`Act as a travel guide for tourists. Describe great places to visit in  New York Manhattan with a 3 year old.` 

Try using verbs that describe the action. Here’s a set of examples: 

**Act, Analyze, Categorize, Classify, Contrast, Compare, Create, Describe, Define,  Evaluate, Extract, Find, Generate, Identify, List, Measure, Organize, Parse, Pick,  Predict, Provide, Rank, Recommend, Return, Retrieve, Rewrite, Select, Show, Sort,  Summarize, Translate, Write.**

February 2025 55   
Prompt Engineering 

**Be specific about the output** 

Be specific about the desired output. A concise instruction might not guide the LLM enough  or could be too generic. Providing specific details in the prompt (through system or context  prompting) can help the model to focus on what’s relevant, improving the overall accuracy. 

Examples: 

DO:  

`Generate a 3 paragraph blog post about the top 5 video game consoles.  The blog post should be informative and engaging, and it should be  written in a conversational style.` 

DO NOT:  

`Generate a blog post about video game consoles.` 

**Use Instructions over Constraints** 

Instructions and constraints are used in prompting to guide the output of a LLM.  

• An **instruction** provides explicit instructions on the desired format, style, or content of the  response. It guides the model on what the model should do or produce. 

• A **constraint** is a set of limitations or boundaries on the response. It limits what the model  should not do or avoid.

February 2025 56   
Prompt Engineering 

Growing research suggests that focusing on positive instructions in prompting can be more  effective than relying heavily on constraints. This approach aligns with how humans prefer  positive instructions over lists of what not to do.  

Instructions directly communicate the desired outcome, whereas constraints might leave the  model guessing about what is allowed. It gives flexibility and encourages creativity within the  defined boundaries, while constraints can limit the model’s potential. Also a list of constraints  can clash with each other. 

Constraints are still valuable but in certain situations. To prevent the model from generating  harmful or biased content or when a strict output format or style is needed. 

If possible, use positive instructions: instead of telling the model what not to do, tell it what to  do instead. This can avoid confusion and improve the accuracy of the output.  

DO:  

`Generate a 1 paragraph blog post about the top 5 video game consoles.  Only discuss the console, the company who made it, the year, and total  sales.`  

DO NOT:  

`Generate a 1 paragraph blog post about the top 5 video game consoles.  Do not list video game names.` 

As a best practice, start by prioritizing instructions, clearly stating what you want the model  to do and only use constraints when necessary for safety, clarity or specific requirements.  Experiment and iterate to test different combinations of instructions and constraints to find  what works best for your specific tasks, and document these.

February 2025 57   
Prompt Engineering 

**Control the max token length** 

To control the length of a generated LLM response, you can either set a max token limit in the  configuration or explicitly request a specific length in your prompt. For example: 

*`"Explain quantum physics in a tweet length message."`* 

**Use variables in prompts** 

To reuse prompts and make it more dynamic use variables in the prompt, which can be  changed for different inputs. E.g. as shown in Table 20, a prompt which gives facts about a  city. Instead of hardcoding the city name in the prompt, use a variable. Variables can save  you time and effort by allowing you to avoid repeating yourself. If you need to use the same  piece of information in multiple prompts, you can store it in a variable and then reference  that variable in each prompt. This makes a lot of sense when integrating prompts into your  own applications. 

Prompt `VARIABLES` 

`{city} = "Amsterdam"` 

`PROMPT` 

`You are a travel guide. Tell me a fact about the city: {city}` 

Output Amsterdam is a beautiful city full of canals, bridges, and narrow streets. It’s a  great place to visit for its rich history, culture, and nightlife. 

Table 20\. Using variables in prompts

February 2025 58   
Prompt Engineering 

**Experiment with input formats and writing styles** 

Different models, model configurations, prompt formats, word choices, and submits can yield  different results. Therefore, it’s important to experiment with prompt attributes like the style,  the word choice, and the type prompt (zero shot, few shot, system prompt). 

For example a prompt with the goal to generate text about the revolutionary video game  console Sega Dreamcast, can be formulated as a **question**, a **statement** or an **instruction**,  resulting in different outputs: 

• **Question:** What was the Sega Dreamcast and why was it such a revolutionary console? 

• **Statement:** The Sega Dreamcast was a sixth-generation video game console released by  Sega in 1999\. It... 

• **Instruction:** Write a single paragraph that describes the Sega Dreamcast console and  explains why it was so revolutionary. 

**For few-shot prompting with classification tasks, mix up  the classes** 

Generally speaking, the order of your few-shots examples should not matter much. However,  when doing classification tasks, make sure you mix up the possible response classes in the  few shot examples. This is because you might otherwise be overfitting to the specific order of  the examples. By mixing up the possible response classes, you can ensure that the model is  learning to identify the key features of each class, rather than simply memorizing the order of  the examples. This will lead to more robust and generalizable performance on unseen data.

February 2025 59   
Prompt Engineering 

A good rule of thumb is to start with 6 few shot examples and start testing the accuracy  from there. 

**Adapt to model updates** 

It’s important for you to stay on top of model architecture changes, added data, and  capabilities. Try out newer model versions and adjust your prompts to better leverage new  model features. Tools like Vertex AI Studio are great to store, test, and document the various  versions of your prompt. 

**Experiment with output formats** 

Besides the prompt input format, consider experimenting with the output format. For non creative tasks like extracting, selecting, parsing, ordering, ranking, or categorizing data try  having your output returned in a structured format like JSON or XML.  

There are some benefits in returning JSON objects from a prompt that extracts data. In  a real-world application I don’t need to manually create this JSON format, I can already  return the data in a sorted order (very handy when working with datetime objects), but most  importantly, by prompting for a JSON format it forces the model to create a structure and  limit hallucinations. 

In summary, benefits of using JSON for your output: 

• Returns always in the same style 

• Focus on the data you want to receive

February 2025 60   
Prompt Engineering 

• Less chance for hallucinations 

• Make it relationship aware 

• You get data types 

• You can sort it 

Table 4 in the few-shot prompting section shows an example on how to return  structured output. 

**JSON Repair** 

While returning data in JSON format offers numerous advantages, it's not without its  drawbacks. The structured nature of JSON, while beneficial for parsing and use in  applications, requires significantly more tokens than plain text, leading to increased  processing time and higher costs. Furthermore, JSON's verbosity can easily consume the  entire output window, becoming especially problematic when the generation is abruptly cut  off due to token limits. This truncation often results in invalid JSON, missing crucial closing  braces or brackets, rendering the output unusable. Fortunately, tools like the `json-repair` library (available on PyPI) can be invaluable in these situations. This library intelligently  attempts to automatically fix incomplete or malformed JSON objects, making it a crucial  ally when working with LLM-generated JSON, especially when dealing with potential  truncation issues.

February 2025 61   
Prompt Engineering 

**Working with Schemas** 

Using structured JSON as an output is a great solution, as we've seen multiple times in this  paper. But what about *input*? While JSON is excellent for structuring the *output* the LLM  generates, it can also be incredibly useful for structuring the *input* you provide. This is where  JSON Schemas come into play. A JSON Schema defines the expected structure and data  types of your JSON input. By providing a schema, you give the LLM a clear blueprint of the  data it should expect, helping it focus its *attention* on the relevant information and reducing  the risk of misinterpreting the input. Furthermore, schemas can help establish relationships  between different pieces of data and even make the LLM "time-aware" by including date or  timestamp fields with specific formats. 

Here's a simple example: 

Let's say you want to use an LLM to generate descriptions for products in an e-commerce  catalog. Instead of just providing a free-form text description of the product, you can use a  JSON schema to define the product's attributes: 

`{` 

 `"type": "object",` 

 `"properties": {` 

 `"name": { "type": "string", "description": "Product name" },  "category": { "type": "string", "description": "Product category" },  "price": { "type": "number", "format": "float", "description": "Product  price" },` 

 `"features": {` 

 `"type": "array",` 

 `"items": { "type": "string" },` 

 `"description": "Key features of the product"` 

 `},` 

 `"release_date": { "type": "string", "format": "date", "description":  "Date the product was released"}` 

 `},`

Snippet 5\. Definition of the structured output schema 

February 2025 62   
Prompt Engineering 

Then, you can provide the actual product data as a JSON object that conforms to  this schema: 

`{` 

 `"name": "Wireless Headphones",` 

 `"category": "Electronics",` 

 `"price": 99.99,` 

 `"features": ["Noise cancellation", "Bluetooth 5.0", "20-hour battery life"],  "release_date": "2023-10-27"` 

`}`

Snippet 6\. Structured output from the LLM 

By preprocessing your data and instead of providing full documents only providing both the  schema and the data, you give the LLM a clear understanding of the product's attributes,  including its release date, making it much more likely to generate an accurate and relevant  description. This structured input approach, guiding the LLM's attention to the relevant fields,  is especially valuable when working with large volumes of data or when integrating LLMs into  complex applications. 

**Experiment together with other prompt engineers** 

If you are in a situation where you have to try to come up with a good prompt, you might  want to find multiple people to make an attempt. When everyone follows the best practices  (as listed in this chapter) you are going to see a variance in performance between all the  different prompt attempts. 

February 2025 63   
Prompt Engineering 

**CoT Best practices** 

For CoT prompting, putting the answer after the reasoning is required because the  generation of the reasoning changes the tokens that the model gets when it predicts the  final answer. 

With CoT and self-consistency you need to be able to extract the final answer from your  prompt, separated from the reasoning.  

For CoT prompting, set the temperature to 0\. 

Chain of thought prompting is based on greedy decoding, predicting the next word in a  sequence based on the highest probability assigned by the language model. Generally  speaking, when using reasoning, to come up with the final answer, there’s likely one single  correct answer. Therefore the temperature should always set to 0\.  

**Document the various prompt attempts** 

The last tip was mentioned before in this chapter, but we can’t stress enough how important  it is: document your prompt attempts in full detail so you can learn over time what went well  and what did not.  

Prompt outputs can differ across models, across sampling settings, and even across different  versions of the same model. Moreover, even across identical prompts to the same model,  small differences in output sentence formatting and word choice can occur. (For example, as  mentioned previously, if two tokens have the same predicted probability, ties may be broken  randomly. This can then impact subsequent predicted tokens.).

February 2025 64   
Prompt Engineering 

We recommend creating a Google Sheet with Table 21 as a template. The advantages of  this approach are that you have a complete record when you inevitably have to revisit your  prompting work–either to pick it up in the future (you’d be surprised how much you can  forget after just a short break), to test prompt performance on different versions of a model,  and to help debug future errors. 

Beyond the fields in this table, it’s also helpful to track the version of the prompt (iteration),  a field to capture if the result was OK/NOT OK/SOMETIMES OK, and a field to capture  feedback. If you’re lucky enough to be using Vertex AI Studio, save your prompts (using the  same name and version as listed in your documentation) and track the hyperlink to the saved  prompt in the table. This way, you’re always one click away from re-running your prompts. 

When working on a *retrieval augmented generation* system, you should also capture the  specific aspects of the RAG system that impact what content was inserted into the prompt,  including the query, chunk settings, chunk output, and other information. 

Once you feel the prompt is close to perfect, take it to your project codebase. And in the  codebase, save prompts in a separate file from code, so it’s easier to maintain. Finally, ideally  your prompts are part of an operationalized system, and as a prompt engineer you should  rely on automated tests and evaluation procedures to understand how well your prompt  generalizes to a task. 

Prompt engineering is an iterative process. Craft and test different prompts, analyze,  and document the results. Refine your prompt based on the model’s performance. Keep  experimenting until you achieve the desired output. When you change a model or model  configuration, go back and keep experimenting with the previously used prompts.

February 2025 65   
Prompt Engineering 

Name \[name and version of your prompt\] 

| Goal  | \[One sentence explanation of the goal of this attempt\] |  |  |
| :---- | :---- | :---- | :---- |
| Model  | \[name and version of the used model\] |  |  |
| Temperature  | \[value between 0 \- 1\]  | Token Limit  | \[number\] |
| Top-K  | \[number\]  | Top-P  | \[number\] |
| Prompt  | `[Write all the full prompt]` |  |  |

Output \[Write out the output or multiple outputs\] 

Table 21\. A template for documenting prompts 

**Summary** 

This whitepaper discusses prompt engineering. We learned various prompting techniques,  such as: 

• Zero prompting 

• Few shot prompting 

• System prompting 

• Role prompting 

• Contextual prompting 

• Step-back prompting 

• Chain of thought 

• Self consistency 

• Tree of thoughts

February 2025 66   
Prompt Engineering 

• ReAct 

We even looked into ways how you can automate your prompts.  

The whitepaper then discusses the challenges of gen AI like the problems that can happen  when your prompts are insufficient. We closed with best practices on how to become a better  prompt engineer.

February 2025 67   
Prompt Engineering 

**Endnotes** 

1\. Google, 2023, Gemini by Google. Available at: https://gemini.google.com. 

2\. Google, 2024, Gemini for Google Workspace Prompt Guide. Available at:  

https://inthecloud.withgoogle.com/gemini-for-google-workspace-prompt-guide/dl-cd.html. 

3\. Google Cloud, 2023, Introduction to Prompting. Available at:  

https://cloud.google.com/vertex-ai/generative-ai/docs/learn/prompts/introduction-prompt-design. 

4\. Google Cloud, 2023, Text Model Request Body: Top-P & top-K sampling methods. Available at:  https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text\#request\_body. 

5\. Wei, J., et al., 2023, Zero Shot \- Fine Tuned language models are zero shot learners. Available at:  https://arxiv.org/pdf/2109.01652.pdf. 

6\. Google Cloud, 2023, Google Cloud Model Garden. Available at: https://cloud.google.com/model-garden. 

7\. Brown, T., et al., 2023, Few Shot \- Language Models are Few Shot learners. Available at:  https://arxiv.org/pdf/2005.14165.pdf. 

8\. Zheng, L., et al., 2023, Take a Step Back: Evoking Reasoning via Abstraction in Large Language Models.  Available at: https://openreview.net/pdf?id=3bq3jsvcQ1 

9\. Wei, J., et al., 2023, Chain of Thought Prompting. Available at: https://arxiv.org/pdf/2201.11903.pdf. 

10\. Google Cloud Platform, 2023, Chain of Thought and React. Available at: https://github.com/  GoogleCloudPlatform/generative-ai/blob/main/language/prompts/examples/chain\_of\_thought\_react.ipynb.  

11\. Wang, X., et al., 2023, Self Consistency Improves Chain of Thought reasoning in language models.  Available at: https://arxiv.org/pdf/2203.11171.pdf. 

12\. Yao, S., et al., 2023, Tree of Thoughts: Deliberate Problem Solving with Large Language Models.  Available at: https://arxiv.org/pdf/2305.10601.pdf. 

13\. Yao, S., et al., 2023, ReAct: Synergizing Reasoning and Acting in Language Models. Available at:  https://arxiv.org/pdf/2210.03629.pdf. 

14\. Google Cloud Platform, 2023, Advance Prompting: Chain of Thought and React. Available at: https://github.com/GoogleCloudPlatform/applied-ai-engineering-samples/blob/main/genai on-vertex-ai/advanced\_prompting\_training/cot\_react.ipynb. 

15\. Zhou, C., et al., 2023, Automatic Prompt Engineering \- Large Language Models are Human-Level Prompt  Engineers. Available at: https://arxiv.org/pdf/2211.01910.pdf.

February 2025 68 

[image1]: <data:image/png;base64,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>