---
format: pdf
---

For the actual proposal I need to do proper formatting (and signposting!), TOC, 1-pager as a separate document. Overall more rigor

# Title and keywords
Here are a few updated ones, not sure which to pick just yet.

> **From Scores to Social Practice: How Benchmark Performance and User Behavior Reify Cultural Profiles in AI**

> **Mapping the Cultural Fingerprints of Large Language Models: An Embedding Space Analysis of Benchmark Performance**

> **The Cultural Geometry of AI: How Benchmark Scores Reveal Epistemological Traditions**

# Aims and background
AI, specifically Large Language Models, have had a massive impact on pop culture, society and the global economy. There are a wide variety of communities and industries that are obsessed with finding the "best" performing models and havev developed these benchmarks, which act as standardized tests, to assess models on a given task to truly to determine what these "best" models are. 

While this may result in determining what models perform best on a given task, I find this approach to be incredible reductionistic and lacking in terms of understanding what underlying factors make models different. The goal of my project is to shed some insights on not only what these underlying factors are but what are potential implications of these factors and the significance of their role in shaping "intelligence".

# Context (literature review)
Sort of covered from the previous section, we have plenty of data on how models perform against each other but there is hardly any work done on cultural implications besides claims that China's open source models slightly lag behind the US industry leading models. 

The "On the Convergent Properties of Word Embedding Methods" paper is new to me so good that more work is being done in this field. The "Distinct AI Models Seem to Converge on How They Encode Reality" paper was the one we read in HTEC301 that sort of inspired this paper so it is relevant. Unfortunately for me, these papers are both situated on embedding models and not LLM's like what most people think when discussing on "AI". 

# Research question(s) / the problem
My pure research project studies AI benchmark performance in aggregate, rather than focusing only on top-performing models. I intervene by asking: what underlying factors shape what we call “performance”? 

While many people assume LLM benchmarks are assumed to be neutral leaderboards, I question this assumption by studying patterns that emerge from mapping LLM models onto a coordinate space, based on their benchmark performance, where models that perform similarly across benchmarks cluster together. 

I hope to find whether regional origin predicts performance patterns and whether domain strengths form distinct cognitive styles.

If so, this changes the landscape: benchmarks become cultural artifacts rather than neutral yardsticks; AI evaluation becomes a site of cultural negotiation; and “intelligence” must be understood as plural, situated, and political.

# Method & intervention
The two things I will be making for this are: 

1. An embedding space for AI models constructed through benchmark performance and viewable through the lens of company, origin, and year/time uploaded. 
2. A paper summarizing findings and key insights.

I think these two are necessities for this project because the former will actually allow me to derive insights and create discoveries since this is the new form of analysis in my project. The latter completes the former by viewing, analyzing, and interpreting the data in the humanities lens in order to derive some profound insights.


# The two deliverables & production plan

| Week | Goal |
| -- | ------ |
| 09/22 | Proposal Draft |
| 09/29 | Resources, Final Proposal? |
| 10/06 | Recollect Data, Generate Embedding Space |
| 10/13 | Mess With Dimensionality Reduction Techniques |
| 10/20 | User Experience Revamp pt1 |
| 10/27 | User Experience Revamp pt2 / Project Framing (Creating Good Movie Glasses!) |
| 11/03 | Presentation! User feedback and interpretability |
| 11/10 | Address Feedback |
| 11/17 | Website Polish and Additional Features |
| 11/24 | Analyze Key Findings pt1 / Finished$^1$ |
| 12/01 | Analyze Key Findings pt2 (Setup for next sem) |

The above timeline is for this semester and primarily focus on deliverable 1, generating a strong embedding space for LLM models and having a website in which users can interact with the space. Finished$^1$ refers to bla

Deliverable 2 described briefly in previous section.

# Resources & feasibility
In terms of data I have the same API keys to access huggingface model data. In short of the data side, I am viewing each benchmark score as a dimension or an axis (like x axis and y axis for width and height for example), and part of the issue in doing this is now I am having around 6 different axis/dimensions making it hard to visualize. Over the summer I worked on various dimensionality reduction techniques that preserve the overall/neighbourhood structure of the data while projecting it into smaller dimensions so its easier to visualize (ie 2 or 3 dimensions instead of 1024 dimensions) which I plan to apply into this project. To fill any gaps in technical side, I have taken software engineering courses as well as data analysis courses and the union of these skills will allow me to complete the technical side of this project.

In terms of framing and thoroughly evaluating the results, thats where my time spent in PHIL210: Politics of AI with Prof Cauvin allows me to better posit the work in the philosophy of technology realm.
    
# Ethics & responsible practice
All data is open source and available for free through huggingface so no issues on the data side. Need to address ethical stakes and critical practice

    
# Limitations & scope
Last semester I had put analysis of the embedding space as out of scope, for the paper the analysis is necessary for the paper. 

While it would be nice to include non-opensource model data, many private models may not have been assessed on all benchmarks in my data, these models are thus unfortunately ignored. While the way I am collecting can be auto updated through scrapping BUT models not on huggingface (ie not opensource) may not have their data be updated so non-opensource model benchmark data will be limited.
 

# Outcomes & significance of the intervention
Yes

# References
Ben Brubaker, "Distinct AI Models Seem to Converge on How They Encode Reality," Quanta Magazine, January 7, 2026, <https://www.quantamagazine.org/distinct-ai-models-seem-to-converge-on-how-they-encode-reality-20260107/>

Yingtao Tian et al., "On the Convergent Properties of Word Embedding Methods," Preprint, arXiv, May 12, 2016, <https://arxiv.org/abs/1605.03956>

