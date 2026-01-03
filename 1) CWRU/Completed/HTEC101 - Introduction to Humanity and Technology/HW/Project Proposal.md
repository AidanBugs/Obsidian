---
format: pdf
---


# 1 
Description

> The short hand description of the project is applying Natural Language Processing methods such as embeddings to compare and contrast semantic meaning of words across disciplines. The current approach to the project would be gathering a collection of research papers by disipline / field of study and creating custom embeddings for each disciplines. Then find a list of commonly used words across disciplines that have different meanings. This could be things such as "system", "community", and "significance" which have different meanings and importance depending on the field of study. Then from this set of words to analyze, using the customized embeddings I could perform cosine similarity to find a Top 5 most similar words for each of the words in each of the disciplines. If I further wanted to extend the scope of the project, I could perform word frequency analysis as well as add a temporal aspect to the project by mapping change in word frequencies or meanings over time. This could possibly answer questions like when certain terminology originates and if/when terminology diverges in the past.

The exigency of your project: what necessity or set of problems (or opportunities) motivates your project? How would you explain the exigency of your project to someone with little or no familiarity with your field, method, or discipline?

> The primary motivation of the project rests on the idea that disciplines can feel at times create their own cliques of language where at times if one is not frequently exposed to the language of the discipline it can be hard to interpret or understand the content of a study. For example, in certain martial arts frame could mean one's body composition or skeletal structure, while in other martial arts (such as jiujitsu) it means to use one's limbs in a way to push or support the opponent without much muscular use. 

The objects of your project: what object, objects, materials, or process is at the center of your project? What materials will you need to engage with? Are you dealing with technical artifacts, ideas, people, equations? How would you characterize the objective field of your project, that is, what domain of objects will you be working with?

> The object of studies would be the words used in academic reports or study findings across disciplines. 

The concepts of your project: what is the intellectual core of your project? What concepts are indispensable to the project? What are the threshold concepts someone would need to understand in order to understand what you hope to accomplish?

> The two main threshold concepts would be understanding what is meant by semantic meaning and also understanding (at a fairly abstracted level) what embeddings are. A fun (but hard) game to learn briefly about both of these concepts is semantle which has a user guess a word where upon each guess the game will return a score of how similar the guessed word was to the hidden word. This can get quite difficult as certain words will at times be very hard to guess due to having a smaller circle of similar words (synonyms and antonyms) which gets at the purpose of this project in interdisciplinary research.

The methods of your project: what will you do to bring about your project? How will you realize your proposal? Do you need to build something, or interview someone, or paint something, or program something? What is the mode of praxis you will call upon to enact your proposal? Will you need to use multiple methods? If so, how do they stand in relation with each other, and how might they transform each other?

> The overall process of this project would be as follows: 

> 1. Scrape and sort research papers by discipline
> 2. Create custom trained embeddings for each discpline's set of research papers
> 3. Find key words to perform analysis on. This could be done by finding key words by discipline and searching for overlap
> 4. Perform analysis of these key words across disciplines by looking at frequencies and differences or minute discrepencies of word similarities. 

The disciplines of your project: what disciplinary resources might you engage to realize your project? Will you need to think like an engineer, or a cognitive scientist, or a dancer, or a philosopher?

> This project is a unique intersection of Computer Science, Cognitive Science and Etymology / Lexicology. This project takes a step beyond natural language processing which is a computer scientist's takeover of Lexicology and trying to emulate semantic understanding to computers. I believe this project moreso alligns with Franchi's cooperative agnostic model as this project requires both the computer skills and the linguistic skills to make further improvements towards the other field. 


# 2 Annotated Bibliography

Franchi, Stefano. "The Past, Present, and Future Encounters between Computation and the Humanities." In Philosophy and Theory of Artificial Intelligence, edited by V.C. Müller, 349–64. Berlin: Springer, 2013.

> This article was used as a primary source for my reading response essay 5 and primarily focuses on two different modalities of interdisciplinary work. The one hand being the takeover where the disciplines essentially minimize their interactions and instead use the other discipline only as necessary or as a means to an end. The other modality being the cooperative agnostic model where the disciplines synthesize and build off another to make something new. This relates to this project as it allows for us to disect research moreso alligning with the takeover model where the key words and concepts are reused as opposed to creating something new.

Galison, Peter. "Ten Problems in History and Philosophy of Science." Isis, vol. 99, no. 1, 2008

> This article is important as it pertains to thge differences within disciplines and the overall essay aims to create a more integrative approach to the History and Philosophy of Science. The key parts that Galison points out (in the context of this problem) are the problems of context and problems of fundamentality. The problems of context pertains to how the different disciplines (history and philosophy) interpret what context is for an arguement. Galison argues that for historians, context refers to physical site of the arguement while the philosophers focus on the texts and ideas of the time. The problem of purity demonstrates how disciplines change and evolve overtime in the sense that it becomes hard to distinuish the pure vs applied sciences.

Geng, Wenshu, and Maocheng Liang. "From words to senses: A sense-based approach to quantitative polysemy detection across disciplines." Journal of English for Academic Purposes 72, November 2024

> This acts as a sort of foundation for my project. This research was done to find and identify key word differences across the hard and soft sciences. Specifically they used embeddings to automate finding words that have different meanings across the different disciplines by measuring the difference of similarities between the two disciplines. They vied their project as an automated polysemy finder which is quite similar to this projects goals and may be used as a baseline to find key words and apply further analysis.

Nwadike, Chibuzo Valentine. "Differences Between Vectorization and Embeddings in NLP." Medium. April 17, 2025.

> This article summarizes the conceptual ideas behind embeddings, tokenization and vectorization of text. This article would help bridge any gaps of understanding for those who are not familiar with the technical aspect of this project.
