---
format: pdf
---

# Cluster and Culture: Interactive Clustering and Relations of AI via Benchmark Performance
## Central Theme
How do the performance patterns of large language models (LLMs) across different benchmarks reflect not only technical progress but also the cultural values, geographic origins, and temporal priorities of their creators? Can an interactive, user‑driven visualization help make these hidden sociotechnical relationships tangible?

## Format
Creative multimedia project entailing an interactive web-based data visualization of AI benchmark performance, including a large variety of AI models and AI benchmarks. The project will allow the user to interact with a data visualization tool, letting users compare different axis and filters in order to better visualize trends and patterns of AI model performance. In the case of me not finding a way / failing to successfully deploy this tool to a server, a video will be provided of me using the web tool along with the code files will be submitted, including instructions to run.

## Project Details
I will build a browser‑based interactive display powered by a FastAPI backend that allows users to explore a dataset of LLM benchmark scores (e.g., coding, math, commonsense reasoning, multilingual understanding, cultural knowledge). The interface will include:

- A 2D/3D scatter plot generated via Principal Component Analysis (PCA) using Python (scikit‑learn). The FastAPI backend will compute PCA projections either on‑the‑fly or from pre‑computed results. Each point represents an AI model. Users can hover/click to see model metadata (origin, release date, parameter count).
- Filtering and timeline sliders. The backend filters the dataset and returns updated PCA coordinates or pre‑clustered subsets as JSON.
- Various color filters that would allow users to see clusters of model performance by company, region, release date etc. These different color filters would ideally be easily changed by the user allowing them to use the tool in order to visualize patterns which appeal most to them.

In the write up, initial findings will be provided with their respective visualizations to demonstrate what the clusters of models look like. 

## Theoretical Grounding
The main focus of this project is social constructivism which is the idea that technology is a mirror of culture. This expands on Brubaker's work on AI embedding "convergence" focusing more on AI capability as opposed to how AI interprets our syntactic universe. Additionally, this work would expand on Ramezani and Xu's work on AI's "ethics hyperplane" noting that many LLM's are primarily focused on Western ethics and norms. This work expands on the ethics hyperplane as it acts as a more quantitative approach to AI output via benchmark scores and may also be used to see how AI model's geographic and cultural origin affects the model's benchmark score distributions.

## Feasibility
Model performance is all publicly available, additionally there are a select few benchmarks in which I would be able to test an AI model's performance on it. Note that this model would need to be able to run on my machine thus limiting the models to a select few open source ones. As another potential issue, not all models are run on all benchmarks, thus there will be a variety of different null values that will need to be dealt with during the data cleaning process. On the bright side, data visualizations, data scraping, data cleaning, and overall use of python is something I have done for many years and will complete the visualizations accordingly. Admittedly, there might be slight scope creep with interactive visualization plots and slight issues with null handling but the final result should still be very informative.

## First Draft
The first draft will include collected and semi-cleaned dataset of model performance and origins. In addition, basic visualizations and their respective frameworks allowing to be built off of when creating the finalized interactive interface. 

## References 
Brubaker, Ben. "Distinct AI Models Seem To Converge On How They Encode Reality." Quanta Magazine, January 7, 2026. https://www.quantamagazine.org/distinct-ai-models-seem-to-converge-on-how-they-encode-reality-20260107/.

Ramezani, Aida, and Yang Xu. 2025. "The Discordance Between Embedded Ethics and Cultural Inference in Large Language Models." Preprint, submitted January 15, 2025. https://aclanthology.org/2025.emnlp-main.743/

### Footnote
I will look into the commented "Machine Learners", "Language Machines", and the various "Humanist In The Loop" critical AI debates.
