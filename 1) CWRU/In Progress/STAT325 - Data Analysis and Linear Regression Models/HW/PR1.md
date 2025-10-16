---
format: pdf
from: markdown+emoji
---

# Project Update 1

It must contain at least 50 observations (rows).

> The dataset has over 4700 sample resumes. While some more cleaning needs to be done (I just removed any empty / unknown personal information paramters), the remaining data has over 4500 sample resumes.

There must be at least one response variable (Y) and at least four predictor variables (X’s).

> The response variable(s) will be the scores these resumes get in one (or more) open source NLP model fine tuned for resume scoring. The predictor variables are a wide variety of professional measurements (levels of education, years of experience, relevant work, etc) as well as personal metrics (location, percieved race, age, etc)
>
> Specifically:
>
>> Y1: Resume Score (0-100) \*\*\*
>>
>> Y2: Advance Canidate / Reject (0,1) \*\*
>
>> X1: Inferred Gender
>
>> X2: Inferred Ethnicity
>
>> X3: Educational Prestige 
>
>> X4: GPA (0-4)
>>
>> X5: Years of Experience
>>
>> X6: % Skill Match \*
>
> \* might drop this predictor if not enough resumes have a skills section
>
> \*\* This will be something along the lines of the top x% canidates based on score (for logistic regressions)
>
> \*\*\* Might create multiple Y1's based on different AI Screening Systems

You cannot use a data set from our notes.

> This dataset is not from notes / hw

Ideally, I would like you to analyze a dataset interesting to you.

> Algorithmic bias is interesting to me and I feel like this topic is particularly relevant as more companies use various forms of resume screeners. Additionally, as I apply for more jobs I wonder what biases these technologies have.

If you are doing research for a professor or another course, you may use that data set for this project as long as it meets the requirements stated above and you are given permission from the other professor.

> N/A

Produce your research question of interest and any sub questions that you think might help to answer that question. Research questions should be exploratory in nature and should not be able to be answered with a yes or no response. Submit your data set and these questions on Canvas (Project Update 2)

> The overarching question is simply are automated resume screening systems biased?
>
> To what extent do demographic proxies (inferred from names and educational institutions) in resumes predict callback rates/scores from automated resume screening systems, after controlling for objective qualifications and skills?
>
> Sub topics include a variety of things such as does gender play a role in male dominated fields/roles? Do surnames associated with particular ethnic groups affect a canidates resume score? Does educational prestiege affect AI systems like human systems? 

# Dataset
The Data Set is a merged collection of both real and synthetic resume data in JSON format. Specifically analyzing the technical domain so many resumes have coding / technical backgrounds.

The [Data Set](https://huggingface.co/datasets/datasetmaster/resumes) can be found here: [https://huggingface.co/datasets/datasetmaster/resumes](https://huggingface.co/datasets/datasetmaster/resumes)

