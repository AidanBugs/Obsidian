# Data Privacy: Comprehensive Course Notes

## Module 1: Introduction to Data Privacy

### 1. Defining Privacy
- **Definition:** Privacy is the ability of an individual to determine **when, how, and to what extent** information about themselves is revealed to others.
- **Goal of Privacy-Enhancing Technologies (PETs):** To ensure personal data is used *only* in the context for which it was released.
- **Personal Data:** Any information that can identify an individual (e.g., name, ID number, hospital records, IP address).

### 2. The Value and Misconceptions of Privacy
- **Common Misconception:** *"If you aren't doing anything wrong, what do you have to hide?"*
- **Reality:** Privacy is not about hiding wrongdoing; it is about control and autonomy.
- **Security vs. Privacy:** These are **not a zero-sum game**. You do not necessarily have to trade privacy for security. As Benjamin Franklin noted, sacrificing essential liberty for temporary safety yields neither.

### 3. Historical Milestones
- **Hippocratic Oath (ca. 400 B.C.):** Early professional duty of confidentiality.
- **Warren & Brandeis (1890):** *"The Right to Privacy"* (Harvard Law Review). Defined privacy as the "right to be let alone" in response to intrusive photography.

### 4. The Data Ecosystem & Surveillance
- **How Companies Collect Data:** Voluntarily shared info, server logs, location tracking, and purchasing history from data brokers.
- **Case Study - Target:** Analyzed shopping habits to predict pregnancy (e.g., changes in lotion/buying habits) to send targeted coupons before the baby's birth—sometimes alerting families before the individual had disclosed the pregnancy.
- **Data Breaches:** The average adult in the developed world has records in approximately 700 major databases.

### 5. The Failure of Simple Anonymization
- **Netflix Prize Case:** Researchers de-anonymized users by correlating "anonymous" movie ratings with public IMDb reviews.
- **AOL Search Logs:** "Anonymous" User #4417749 was identified as Thelma Arnold based solely on search queries (e.g., "landscapers in Lilburn, GA").
- **Massachusetts Governor Case:** Dr. Latanya Sweeney proved that **87% of the U.S. population** can be uniquely identified using only **Zip Code, Birth Date, and Gender**.

### 6. Privacy Terminology
- **Anonymity:** The state of being not identifiable within a set of subjects (the anonymity set).
- **Unlinkability:** The inability to link two actions or pieces of data to the same user.
- **Unobservability:** The state where an item of interest (IOI) is indistinguishable from random noise. *Unobservability implies anonymity, but anonymity does NOT imply unobservability.*
- **Pseudonymity:** Using an alias. Strong anonymity requires that the pseudonym is used rarely and cannot be linked to other personal data (e.g., one's genome cannot be a pseudonym).

### 7. Legal Framework: EU vs. US
| Feature | European Union | United States |
| :--- | :--- | :--- |
| **Approach** | Comprehensive, proactive regulation (GDPR/DPD). | Sectoral, reactive laws (HIPAA, GLBA, COPPA). |
| **Philosophy** | Privacy is a fundamental human right. | Privacy is balanced against economic efficiency. |
| **Key Legislation** | GDPR (Data Protection Directive). Strict rules on data transfer outside EU (Safe Harbor/Privacy Shield). | HIPAA (Health), COPPA (Children). **No overarching federal privacy law.** |
| **HIPAA Identifiers** | N/A | Defines 18 identifiers (Name, Dates, IP, Biometrics) that must be removed for data to be considered "De-Identified." |

### 8. The Future of Privacy Threats
- **Wholesale Surveillance:** Shift from targeted surveillance ("follow that car") to mass collection ("follow every car").
- **Genomic Privacy:** DNA is the ultimate identifier—it is non-revocable, identifies family members, and reveals disease predispositions.
- **Drones & Sensors:** Thermal imaging and aerial surveillance create new vectors for warrantless observation.

---

## Module 2: Cryptographic Solutions for Privacy

### 1. Secure Multiparty Computation (SMC)
- **Goal:** Allow multiple parties to jointly compute a function over their private inputs **without revealing those inputs to each other**.
- **Example:** Two hospitals compute the average survival rate of a treatment across both their patient pools without sharing individual patient records.

### 2. Adversary Models & Security Definitions
- **Semi-Honest (Honest-but-Curious):** Parties follow the protocol correctly but try to learn extra information from the messages they receive.
- **Malicious:** Parties can arbitrarily deviate from the protocol (e.g., sending false data) to break security or correctness.
- **Ideal/Real Simulation Paradigm:** A protocol is secure if whatever an adversary can do in the *real* protocol, they could also do in an *ideal* world where a perfectly trusted third party computes the function.

### 3. Core Cryptographic Building Blocks
- **Homomorphic Encryption:** Allows computation directly on encrypted data.
    - *Example (Paillier):* `Enc(X) * Enc(Y) = Enc(X + Y)`
    - *Limitation:* High computational overhead.
- **Oblivious Transfer (OT):** Receiver chooses to receive *one* of two messages from the Sender. The Sender does not learn which message was chosen, and the Receiver learns nothing about the unchosen message.
- **Garbled Circuits (Yao's Protocol):**
    1.  Function is converted to a Boolean circuit (AND/OR gates).
    2.  The "Garbler" encrypts the truth tables of every gate.
    3.  The "Evaluator" uses OT to get keys for their input and evaluates the circuit gate-by-gate.
    4.  **Result:** The Evaluator learns the output of the function but *nothing* about the intermediate values or the Garbler's input.

#### Yao's Garbled Circuit Example
Alice has input $x$ and Bob has input $y$ for an or gate $z$

Thus:

| x | y | z |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

Essentially do a form of onion routing with the keys and that allows Bob to figure out the last decryption and what not

### 4. Other Crypto Tools
- **Zero-Knowledge Proofs:** Proving you know a secret (e.g., a password) without revealing the secret itself.
- **Private Information Retrieval (PIR):** Querying a public database without revealing *which* record you retrieved.
- **Oblivious RAM (ORAM):** Hiding access patterns to cloud storage (i.e., the server cannot tell if you are reading the same file twice or a new file).

---

## Module 3: Hiding Data from the Database User (Non-Interactive Mechanisms)

### 1. The Problem with Re-Identification
- **Quasi-Identifiers (QID):** Attributes that are not unique on their own but become identifiers when combined (e.g., Zip Code + Birth Date + Gender).
- **Sensitive Attributes:** The data researchers want to analyze (e.g., Disease, Salary).

### 2. k-Anonymity
- **Definition:** Every record in the released dataset must be indistinguishable from at least **k-1** other records regarding the Quasi-Identifier.
- **Methods:** Generalization (replacing specific zip code with region) and Suppression (removing outliers).
- **Critical Failure (Homogeneity Attack):** If all `k` people in an anonymized group have the **same sensitive value** (e.g., all have HIV), the attacker learns the sensitive value without needing to identify the exact row.
- **Critical Failure (Background Knowledge Attack):** If the attacker knows the target is Japanese and the only Japanese person in the `k`-anonymous group has a specific disease, privacy is broken.

### 3. l-Diversity
- **Definition:** An improvement on k-anonymity. Requires that within each `k`-anonymous group, there are at least **`l`** *well-represented* distinct values for the sensitive attribute.
- **Limitation:** Fails against **Skewness Attacks**.
    - *Scenario:* Overall population has 99% negative HIV rate. A group with 50% positive and 50% negative is "diverse," but it still leaks a massive amount of information because it deviates wildly from the expected baseline.

#### Distinct l-diversity
Each equivalence class has at least $l$ different sensitive attribute values

#### Entropy l-diversity
The entropy of the distribution of sensitive attributes is at least $\log (l)$

#### Recursive l-diversity
The frequencies of the sensitive values are pretty similar in each equivalence class

### 4. t-Closeness
- **Definition:** The distribution of sensitive attributes within any anonymized group must be within a threshold **`t`** of the distribution in the **entire overall dataset**.
- **Metric:** Often uses **Earth Mover's Distance** to measure the difference between distributions.
- **Purpose:** Prevents skewness attacks by ensuring the sample reflects the global population distribution.

### 5. Privacy in Social Networks
- **Structural De-Anonymization:**
    1. **Seed Identification:** Attacker finds / de-anonymizes a few nodes (users) present in both the *anonymous target graph* and an *auxiliary graph* (e.g., public Twitter follows).
    2. **Propagation:** The algorithm identifies the target's unique network topology (who they follow/who follows them) and matches it across networks.
- **Countermeasure Limitation:** Even removing names is insufficient; the **graph structure itself is a fingerprint**.

## Module 4: De-anonymization Attacks in Online Social Networks (OSNs)

### 1. Why Profile Matching?
- **Goal:** Link user accounts across different social networks (e.g., Facebook to Twitter) to build a more complete user profile.
- **Uses:** Improved personalized advertising, background checks, and people search engines.
- **Privacy Risk:** Even if a user uses a pseudonym, their behavioral patterns and attributes can link their "anonymous" account to their real identity.

### 2. Two-Stage De-Anonymization Paradigm (Graph-Based)
This method relies on the **network structure** (friends/followers) rather than just profile text.
1.  **Seed Identification:** Attacker identifies a small number of users present in both the *anonymous target graph* (T) and the *auxiliary graph* (A).
2.  **Propagation:** Using the seeds, the algorithm maps the unique topology (who knows whom) to re-identify the rest of the network.
    - *Case Study (Narayanan et al.):* Using 150 seeds on Twitter/Flickr data resulted in **30.8% correct re-identification**.
    - *Limitation:* If the overlap between networks is small (e.g., 50%), error rates can be as high as 90%.

### 3. Attribute-Based Profile Matching Framework
When network structure is private or sparse, attackers use public profile attributes:
- **Features:** Username similarity, Location, Profile photo, Free text (bio/posts), Activity timestamps, and Sentiment analysis.
- **Method:** Supervised Machine Learning classifiers (Random Forest, SVM, Logistic Regression) trained on known matched/unmatched pairs.
- **Key Finding:** Even **weak identifiers** (like writing style or activity times) that are hard for users to fake or hide can be used for re-identification with non-negligible accuracy.
- **Scalability Challenge:** Traditional matching uses the Hungarian Algorithm (O(N³)), which is computationally heavy for large networks.

### 4. Belief Propagation (BP) for Efficient Matching
- **Improvement:** Uses a **Factor Graph** and message-passing algorithm to model the probability of two profiles being a match.
- **Advantage:** Significantly more efficient computationally than the Hungarian Algorithm while maintaining comparable accuracy.
- **Scalability Insight:** The success rate of de-anonymization remains high even as the size of the target network increases, proving the robustness of the attack.

### 5. Take-Aways
- Graph anonymization techniques (e.g., edge editing, k-anonymity) are **vulnerable** to modern De-Anonymization (DA) attacks.
- There is **no universal optimal defense**; the choice of anonymization depends on the specific data utility required.
- Users leave consistent "footprints" across platforms that are difficult to eliminate.

---

## Module 5: Hiding Data from the Database User (Interactive Mechanisms)

### 1. Interactive vs. Non-Interactive Mechanisms
- **Non-Interactive:** Database publishes a sanitized dump (k-anonymity, l-diversity). Researcher queries the dump.
- **Interactive:** Researcher queries the **live database**. The system answers with noise or denies queries based on history.

### 2. Challenges of Interactive Query Auditing
- **Query Auditing:** Keeping a log of all past queries to prevent inference.
- **Fundamental Flaw:** Refusing to answer a query can be just as revealing as answering it.
    - *Example:* `Max(salary) of Males = 2`; `Max(salary) of PhD Students = 3`. If Alice is the *only* female PhD student, the system's refusal to answer the second query leaks her exact salary.
- **Naive Noise Addition:** Adding fixed random noise fails if the same query is asked repeatedly (averaging cancels out the noise).

### 3. Differential Privacy: The Gold Standard
- **Core Philosophy:** The outcome of an analysis should be **statistically indistinguishable** whether any single individual is included in the dataset or not.
- **Formal Definition (ε-Differential Privacy):**
    - Consider two databases D1 and D2 that differ by **one record** (neighboring databases).
    - A mechanism `M` is ε-differentially private if for all outputs `S`: `Pr[M(D1) ∈ S] ≤ e^ε * Pr[M(D2) ∈ S]`.
    - **Epsilon (ε):** The privacy budget. Smaller ε = Stronger privacy (more noise).

### 4. Mechanisms to Achieve Differential Privacy
- **Laplace Mechanism (Numeric Queries):**
    - Calculate **Sensitivity (Δf)** : The maximum change in the query result if one record is changed.
        - *Count query:* Δf = 1.
        - *Sum query:* Δf = max value.
    - **Formula:** `Answer = True Result + Lap(Δf / ε)`.
- **Exponential Mechanism (Non-Numeric / "Best" Queries):**
    - Used when the output is categorical (e.g., "What is the most common eye color?").
    - Assigns a **score function** to each possible output. Outputs a value with probability proportional to `exp(ε * score / (2 * Δu))`.

### 5. Properties of Differential Privacy
- **Composability:** If you run a mechanism with budget ε1 and another with ε2, the total privacy cost is `ε1 + ε2`. This prevents unlimited querying without eventually leaking the database.
- **Post-Processing Immunity:** You cannot "reverse engineer" privacy out of a differentially private output by running calculations on it.

---

## Module 7: Hiding Access Patterns from the Database Owner (PIR & ORAM)

### 1. The Problem: Beyond Encryption
- **Threat:** Even if data is encrypted, the **pattern of access** (e.g., *which* memory addresses are read/written) leaks sensitive information.
- *Example:* A stock trader encrypts their orders. The cloud server sees a read pattern always followed by a "Buy IBM" action and infers the trade without decrypting the data.

### 2. Private Information Retrieval (PIR)
**Goal:** Allow a user to retrieve a record from a database **without the server learning which record** was retrieved.

| Feature | Information Theoretic PIR (IT-PIR) | Computational PIR (cPIR) |
| :--- | :--- | :--- |
| **Servers** | Multiple (≥2) **non-colluding** servers with copies of the DB. | Single server. |
| **Method** | User sends secret shares (e.g., Shamir's scheme [polynomial vector]) to each server; servers compute response on shares. | User sends encrypted query; server uses homomorphic properties to compute response. |
| **Drawback** | Requires trust that servers don't collude. | Computationally heavy (requires crypto operations on entire DB). |

- **Symmetric PIR (SPIR):** Adds protection for the server; the user learns **only** the requested record and nothing else.

### 3. Oblivious RAM (ORAM)
**Goal:** Hide access patterns for **read/write** operations to remote storage. The server cannot tell if an access is a read, a write, or a repeat access.

- **Goldreich's Original Approach:** Continuous shuffling and re-encryption of data hierarchy. **Expensive** bandwidth cost.
- **Path ORAM (Modern Practical Approach):**
    1.  **Tree Structure:** Server storage is a binary tree. Each node is a bucket holding blocks.
    2.  **Position Map:** Client stores a small map locally: `Block ID -> Leaf ID`.
    3.  **Invariant:** A block is always stored somewhere along the path from the root to its assigned leaf.
    4.  **Access:** To read block `X`, client looks up leaf `L` in position map, reads the **entire path** to `L` into local stash, then remaps `X` to a **new random leaf** and writes the path back.
    5.  **Result:** From the server's view, every access is a random-looking read/write of a full tree path.

### 4. PIR vs. ORAM Comparison
| Feature | PIR | ORAM |
| :--- | :--- | :--- |
| **Operations** | Read-Only | Read & Write |
| **Multiple Users** | Easy (single query/answer round) | Hard (requires state coordination) |
| **Client State** | Stateless | Stateful (requires Position Map) |
| **Data State** | Plaintext possible | Must be encrypted |

---

## Module 8: Anonymous Communications (Tor)

### 1. Traffic Analysis Threat (Website Finger Printing)
- **Problem:** Even with encrypted content (HTTPS), metadata (Source IP, Destination IP, Packet Timing, Size) reveals who is talking to whom.
- **Goal of Anonymity Systems:** Hide the link between the sender and receiver (Unlinkability).

### 2. High-Latency Systems (Mixes)
- **Mechanism:** Messages are batched, delayed, and reordered (Threshold/Timed Pool Mixes).
- **Attack:** `(n-1) Attack` - Attacker floods the mix with dummy messages until only one real message remains, then traces it.
- **Status:** Mostly abandoned due to high latency unsuitable for web browsing.

### 3. Low-Latency Systems: Tor (The Onion Router)
- **Principle:** **Onion Routing**. A circuit of 3 relays (Guard, Middle, Exit).
- **Encryption Layers:** Client encrypts data multiple times. Each relay "peels" one layer of encryption to learn only the **next hop**, not the full path.
- **Hidden Services (Onion Sites):** Allow hosting a website without revealing the server's IP address. Communication is established via **Rendezvous Points**.
- **Bridges & Obfuscation:** Used to bypass censorship by hiding the fact that a user is even using Tor (e.g., making Tor traffic look like Skype video).

### 4. Tor Weaknesses
- **End-to-End Timing Correlation:** If an adversary monitors traffic entering the Tor network (Guard) and traffic leaving the network (Exit), they can statistically correlate packet timing to de-anonymize the user. Tor **does not** protect against a global adversary.
- **Exit Node Eavesdropping:** Traffic between the Exit Node and the destination server is **unencrypted** unless the user employs end-to-end encryption (HTTPS).

### 5. Unobservability (Beyond Anonymity)
- **Definition:** Hiding the very *existence* of communication. The adversary cannot tell if a message is real data or random noise.
- **Dining Cryptographers (DC-Nets):** A theoretical protocol where users broadcast synchronized messages. The XOR sum reveals the total message, but individual transmissions are provably indistinguishable from random noise.
- **Dissent:** A practical group communication system building on DC-Nets to provide *accountable* anonymity (proving *someone* sent a message without revealing *who*).

## Module 9: Privacy in E-Cash (Bitcoin & Anonymous Payments)

### 1. Bitcoin Fundamentals
- **Nature:** A decentralized digital currency operating on a **peer-to-peer network** without a central authority.
- **Core Components:**
    - **Wallet:** Stores public/private key pairs. The Bitcoin address is a hash of the public key.
    - **Transaction:** Transfer of value signed by the sender's private key, referencing previous unspent outputs.
    - **Blockchain:** A public, append-only ledger of all transactions grouped into blocks.
    - **Mining:** The process of verifying transactions and adding blocks to the chain. Miners are rewarded with newly minted coins and transaction fees.

### 2. Security Mechanisms
- **Preventing Double-Spending:** Relies on the computational work (Proof-of-Work) and the public nature of the blockchain. A transaction is considered confirmed only after being buried under several blocks (typically ~6 blocks / 1 hour).
- **Integrity:** Transactions are hashed and linked. Modifying a past transaction requires re-mining all subsequent blocks, which is computationally infeasible.

### 3. The Myth of Bitcoin Anonymity
Bitcoin is **pseudonymous**, not anonymous.
- **Linkability:** All transactions are public forever. If a user's address is linked to their real identity (e.g., via an exchange or merchant), their entire financial history is exposed.
- **Heuristics for De-anonymization:**
    - **Multi-Input Heuristic:** If a transaction has multiple inputs, those input addresses are likely owned by the same user (spending change from multiple wallets).
    - **Shadow/Change Addresses:** Outputs that are new addresses usually belong back to the sender.
- **Result:** Behavior-based clustering techniques can unveil the profiles of up to **40% of Bitcoin users** with 80% accuracy.

### 4. Enhancing Anonymity: Zerocoin & Zerocash
These are protocol-level extensions to solve Bitcoin's linkability issue.

| Feature | Bitcoin | **Zerocoin** | **Zerocash** |
| :--- | :--- | :--- | :--- |
| **Mechanism** | Direct chain of ownership. | Mint & Spend (Burn & Redeem). | Mint & Pour transactions. |
| **Anonymity** | Pseudonymous (Graph traceable). | **Hides Origin** (Unlinkable Mint/Spend). | **Hides Origin, Destination, & Amount**. |
| **Tech** | Public Key Crypto. | Zero-Knowledge Proofs (ZKPs). | **zk-SNARKs** (Succinct ZKPs). |
| **Drawback** | Privacy leaks via graph analysis. | Large proof sizes (45kB); shows payment amount. | Requires trusted setup for parameters. |

- **Zerocash Note:** Transactions are under 1KB and verify in milliseconds. It effectively functions as a fully private "shielded" pool of value on top of a public ledger.

---

## Module 10: Privacy in E-Voting (Internet Voting)

### 1. The Triad of E-Voting Privacy Requirements
A perfect system must satisfy three escalating levels of protection:
1.  **Vote-Privacy:** The system cannot link a voter to their cast ballot.
2.  **Receipt-Freeness:** The voter cannot *prove* to a coercer how they voted, even if they want to (no cryptographic receipt).
3.  **Coercion-Resistance:** The voter cannot *cooperate* with a coercer during the voting process to prove compliance (prevents forced real-time vote casting).

*Note: Coercion-resistance implies receipt-freeness, which implies privacy.*

### 2. Cryptographic Approaches in Research
- **Blind Signatures (1st Gen - Fujioka et al.):** Voter blinds the ballot, gets it signed by an authority (proving eligibility), then unblinds it and submits anonymously.
    - *Flaw:* Voter retains the random blinding factor. This acts as a **receipt**, allowing the voter to prove to a buyer how they voted.
- **Trapdoor Commitments / Designated Verifier Proofs (2nd/3rd Gen):** Allows the voter to open a commitment in multiple ways or simulate fake proofs.
    - *Mechanism:* Voter can show the coercer a "fake" transcript that says they voted for Candidate A, while the real tally system correctly counts the vote for Candidate B.
    - *Result:* Achieves receipt-freeness and, in specific constructions (e.g., Lee et al.), coercion-resistance.

### 3. Real-World Implementation: Estonia
Estonia is the most prominent national example of Internet voting (i-voting).
- **Enrollment:** Uses the national **ID card** (smart card with digital certificates) for strong authentication.
- **The "Double Envelope" Analogy:**
    1.  **Inner Envelope:** Vote choice encrypted with the Electoral Committee's **public key**.
    2.  **Outer Envelope:** Encrypted vote digitally signed with the voter's **private key**.
- **Counting Process:** Signatures (outer envelope) are verified and stripped *before* the encrypted votes (inner envelope) are transferred to an **air-gapped** (offline) computer for decryption and tallying.
- **Anti-Coercion Measure:** Voters can **re-vote** electronically multiple times; only the last vote counts. Voters can also override their e-vote by showing up in person at a polling station on Election Day.

### 4. Cryptographers' Consensus
Most security experts advise against Internet voting for high-stakes elections due to:
- **Client-Side Insecurity:** Malware on the voter's device can change the vote *before* encryption without detection.
- **Single Point of Failure:** The tallying server's private key is a high-value target.
- **Lack of Universal Verifiability:** Hard for average voters to mathematically verify the election outcome end-to-end.

---

## Module 11: Genomic & Medical Data Privacy

### 1. The Uniqueness of Genomic Data
- **Definition:** The genome is a 3-billion-letter sequence. SNPs (Single Nucleotide Polymorphisms) are the 0.1% variation that makes us unique.
- **Why Standard Anonymization Fails:**
    1.  **Identifiability:** The genome is the ultimate identifier. It cannot be changed (non-revocable).
    2.  **Kinship:** Revealing one genome leaks information about **all blood relatives**.
    3.  **Phenotype Linkage:** DNA predicts physical traits (eye color, face shape) that are publicly visible.

### 2. Key Attacks on Genomic Databases
- **Homer's Attack (Re-identification):** Determines if a specific individual is part of an "anonymous" aggregated genomic study (e.g., "Is Bob's DNA in the 1000 Genomes cancer cohort?").
    - *Method:* Correlates known SNP frequencies of the target with the aggregate allele frequencies of the study group.
- **Surname Inference Attack (Gymrek et al.):**
    1.  Extract Y-chromosome STR markers from "anonymous" male genome.
    2.  Query recreational genealogy databases (e.g., Ysearch) to find matching surnames.
    3.  Triangulate with demographic metadata (State, Age) from public records to find the exact person.

### 3. Defenses: GenoGuard and Honey Encryption
- **Problem:** Traditional password protection is vulnerable to brute-force. If an attacker guesses the password, they get the *real* genome.
- **GenoGuard (Honey Encryption):** Uses **Decoys**.
    - The decryption algorithm yields a **valid-looking (but fake) genome sequence** for *every* incorrect password guess.
    - **Result:** An attacker has no way of distinguishing the real genome from the thousands of plausible fake genomes generated during a brute-force attack, rendering dictionary attacks useless.

### 4. Privacy-Preserving Computation on Genomes
- **Threat Model:** A patient wants a Medical Center (MC) to compute disease risk without revealing the raw genome, and the MC wants to protect its proprietary risk model.
- **Solution: Secure Multiparty Computation (SMC) with Homomorphic Encryption.**
    - Patient encrypts genome with a key split between MC and a Storage Unit.
    - MC performs the disease risk calculation *directly on the encrypted SNPs* using **Paillier homomorphic encryption**.
    - **Outcome:** The MC learns only the final encrypted risk score, which is then decrypted collaboratively. The MC never sees the patient's raw genetic code.

### 5. Kinship Optimization (The Lacks Family Problem)
- **Scenario:** If one family member (the *donor*) shares their genome publicly, it exposes the private mutations of all relatives.
- **Optimization Model:** Modeled as a **Multidimensional Knapsack Problem**.
    - **Goal:** Maximize the number of SNPs the donor can release for research **subject to** the privacy constraints of *every* family member remaining above a safe threshold.
    - **Constraint:** Even if Relative A hasn't shared their DNA, the donor's release cannot allow an adversary to infer Relative A's disease status.
