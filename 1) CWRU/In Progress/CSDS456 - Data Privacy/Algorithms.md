## Module 1: Introduction to Data Privacy
*This module is conceptual; no formal algorithms are defined. It sets the stage with definitions and historical attacks (e.g., Sweeney's linkage). The later modules cover the actual algorithms.*

---

## Module 2: Crypto-based Solutions

### 1. Secure Multiparty Computation (SMC) – Generic Model
**Purpose:** Allow multiple parties to jointly compute a function over their private inputs without revealing anything beyond the output.

**Key Concepts:**
- **Ideal/Real paradigm:** A protocol is secure if its real‑world execution can be simulated in an ideal world where a trusted third party computes the function.
- **Adversary models:** Semi‑honest (follows protocol but tries to learn extra) vs. malicious (arbitrary deviation); static vs. adaptive corruption.

**Algorithms covered in this module:**

### 2. Yao's Garbled Circuits
**Purpose:** Two‑party secure computation of any Boolean circuit in the semi‑honest model.

**How it works (step‑by‑step):**
1. **Circuit representation:** The function is converted into a Boolean circuit of gates (AND, OR, NOT).
2. **Garbling (Alice):**
   - For each wire, Alice generates two random keys (`k₀`, `k₁`).
   - For each gate, she encrypts the output key under the two input keys, creating an encrypted truth table (garbled table) which is randomly permuted.
3. **Sending to Bob:** Alice sends the garbled circuit and the keys corresponding to her own input bits (believably random to Bob).
4. **Bob's inputs via Oblivious Transfer (OT):** For each of Bob's input bits, Alice and Bob run a 1‑out‑of‑2 OT so Bob learns the key for his actual bit without Alice learning which one.
5. **Evaluation:** Bob decrypts the garbled gates level by level using the keys he holds. For each gate, only one row decrypts correctly (due to the encryption scheme's authentication), outputting the key for the next wire.
6. **Output decoding:** Alice provides the mapping from final output keys to plaintext bits, or only Bob learns the output.

**Security:** Computational, semi‑honest. Optimizations: point‑and‑permute (reduces decryption attempts), free‑XOR (free XOR gates), half‑gates (2 ciphertexts per AND).

### 3. Homomorphic Encryption (Paillier)
**Purpose:** Allows computations on encrypted data. The Paillier cryptosystem is additively homomorphic: `Enc(m₁) · Enc(m₂) = Enc(m₁ + m₂ mod n)`.

**Algorithm (Paillier):**
- **Key generation:** Choose two large safe primes `p,q`, set `n = p·q`. Select `g` with order divisible by `n`, choose `x` as secret key, compute `h = gˣ mod n²`. Public key: `(n, g, h)`; secret key: `x`.
- **Encryption:** For message `m ∈ ℤₙ`, choose random `r`, ciphertext `(C₁, C₂) = (gʳ mod n², hʳ(1 + mn) mod n²)`.
- **Decryption:** `m = (C₂ · C₁⁻ˣ – 1 mod n²) / n`.
- **Homomorphism:** Multiplication of ciphertexts yields encrypted sum; exponentiation by a constant scales the plaintext.

**Uses:** SMC building block, privacy‑preserving genetic tests.

### 4. Oblivious Transfer (OT)
**Purpose:** A sender holds two messages `m₀, m₁`; a receiver chooses a bit `b` and learns `m_b` without the sender learning `b`, and the receiver learns nothing about `m_{1-b}`.

**Construction:** Can be built from various assumptions (e.g., Diffie‑Hellman). Efficient OT extensions exist for many instances.

**Role in garbled circuits:** Bob obtains his input wire keys via OT.

### 5. Oblivious Polynomial Evaluation (OPE)
**Purpose:** Sender has a polynomial `P(x)`; receiver has an input `α` and learns `P(α)` without revealing `α` to the sender, and the sender learns nothing.

**Implementation:** Based on homomorphic encryption. Not fully simulatable against malicious adversaries.

---

## Module 3: Non‑interactive Mechanisms (Hiding Data from the Database User I)

### 1. k‑Anonymity
**Purpose:** Protect identity disclosure. A dataset satisfies k‑anonymity if each record is indistinguishable from at least `k‑1` other records with respect to quasi‑identifiers (QIDs).

**Algorithmic realization (generalization and suppression):**
- **Generalization hierarchies (DGH):** Numerical/categorical attributes are replaced by broader categories (e.g., birth date → year, zip → first 3 digits).
- **Methods:** Many heuristic algorithms (e.g., DataFly, Incognito, Mondrian) search for a minimal generalization that satisfies k‑anonymity while maximizing a precision metric.
  - **Incognito:** Uses a bottom‑up breadth‑first search over generalization lattices, pruning non‑k‑anonymous states.
  - **Mondrian:** Multidimensional partitioning using a k‑d tree‑like approach; splits data until each partition has at least `k` records.
- **Output:** A sanitized table where every equivalence class (same QID values) has size ≥ `k`.

**Limitations:** Homogeneity attack, background knowledge attack.

### 2. l‑Diversity
**Purpose:** Mitigate attribute disclosure within k‑anonymous groups. Each equivalence class must contain at least `l` “well‑represented” sensitive values.

**Variations:**
- **Distinct l‑diversity:** Each class has at least `l` distinct sensitive values. Weak against skewed distributions.
- **Entropy l‑diversity:** The entropy of the sensitive distribution in each class must be ≥ `log(l)`. Prevents extreme skew.
- **Recursive (c,l)‑diversity:** Ensures the most frequent value does not dominate: `freq₁ < c·(freqₗ + … + freqₘ)`. Balances practicality and privacy.

**Implementation:** Post‑processing on k‑anonymous groups to merge or suppress until diversity holds.

### 3. t‑Closeness
**Purpose:** Prevent skewness attacks. The distribution of the sensitive attribute in any equivalence class must have an Earth Mover Distance (EMD) ≤ `t` from the global distribution.

**Algorithm:** After k‑anonymity/ l‑diversity, compute EMD between each class and the whole table; if > `t`, further generalize/suppress until the threshold is met.

### 4. Graph‑Based De‑anonymization (for Social Networks)
**Seed Identification & Propagation Attack (Narayanan et al.):**
- **Input:** Anonymized target graph `T` and auxiliary graph `A` with overlapping nodes.
- **Seed phase:** Identify a small set of nodes present in both graphs using topological fingerprinting (e.g., degree, neighborhood structure).
- **Propagation phase:** Use a self‑reinforcing process: for a matched node pair `(u,v)`, match their neighbors based on similarity of newly revealed structural features, iteratively expanding the mapping.

**Automated feature‑based attack (Sharad et al.):**
- **Features:** For each node, compute a feature vector (binned degree distribution of neighbors).
- **Training:** Use known coupled/uncoupled pairs to train a random forest classifier.
- **Matching:** Apply classifier scores to all possible pairs; select top matches using greedy or Hungarian algorithm.

**Belief Propagation (BP)‑based matching (Halimi et al.):**
- **Model:** Factor graph where variable nodes represent possible profile pairs (one from `A`, one from `T`), factor nodes capture attribute similarities (username, location, etc.) and prior constraints.
- **Messages:** Iteratively pass beliefs about a pair’s likelihood until convergence, then compute marginal probabilities.
- **Matching:** Greedy selection of high‑probability pairs, enforcing one‑to‑one assignment.

---

## Module 5: Interactive Mechanisms (Differential Privacy)
### Differential Privacy (Interactive Database Privacy)

Differential privacy is a mathematically rigorous definition of privacy in statistical databases. It was introduced by Cynthia Dwork et al. in 2006 and has become the gold standard for interactive privacy mechanisms. The central idea is that the outcome of a query should be **statistically indistinguishable** whether or not any single individual’s data is included in the database. This protects every individual’s privacy without making assumptions about the attacker’s background knowledge.

#### 1. Motivation and Intuition

Earlier approaches to database privacy (e.g., k‑anonymity, query auditing, naive noise addition) fail against adversaries with auxiliary information or repeated queries. Differential privacy shifts the focus from the data release to the **algorithm**: a randomized algorithm `M` is private if its output distribution changes only by a small multiplicative factor when one person’s data is added or removed.

This gives a strong guarantee: an attacker who observes the output of `M` cannot reliably infer whether a specific target was in the dataset, regardless of what other information the attacker possesses.

#### 2. Formal Definition

Let `D₁` and `D₂` be two databases that differ in exactly one record (called **neighboring databases**). A randomized mechanism `M` satisfies **`ε`-differential privacy** if for all possible outputs `S`:

```
Pr[M(D₁) ∈ S] ≤ e^ε · Pr[M(D₂) ∈ S]
```

- **ε (epsilon)** is the **privacy budget**. A smaller `ε` means stronger privacy (more noise). Typical values range from `0.01` to `1`.
- The guarantee is **worst‑case** – it holds for every pair of neighboring databases and every possible attacker.

#### 3. Sensitivity of a Query

To calibrate the amount of noise, we need the **global sensitivity** `Δf` of a query `f`. It measures the maximum possible change in the true answer when one record is modified:

```
Δf = max_{D₁,D₂ neighbors} ||f(D₁) – f(D₂)||₁
```

- **Counts:** `Δf = 1` (changing one person changes the count by at most 1).
- **Sums:** `Δf = maximum possible value` (e.g., max salary in a salary sum).
- **Averages:** depend on the range and number of records.

#### 4. Laplace Mechanism (for numeric queries)

To release a real‑valued query `f` while satisfying `ε`‑differential privacy, we add noise drawn from a **Laplace distribution** centered at zero. The scale parameter `b` is set as:

```
b = Δf / ε
```

**Mechanism:** Output `f(D) + Lap(Δf/ε)`.

The Laplace distribution has density `p(y) = (1/2b) exp(−|y|/b)`. Its exponential tail exactly matches the multiplicative `e^ε` requirement of the definition. A larger sensitivity increases the noise; a smaller `ε` (stronger privacy) also increases the noise.

**Example:** If we want to release the number of smokers in a survey with `ε = 0.1`, and `Δf = 1`, we add Laplace noise with scale `b = 10`. The true count of, say, 500 will be perturbed by a number typically on the order of `±10`, but occasionally more.

#### 5. Exponential Mechanism (for non‑numeric outputs)

When the query output is categorical (e.g., “which drug is most effective?”) or when simple additive noise ruins utility, we use the **Exponential Mechanism**. It requires a **scoring function** `q(D, r)` that measures how good output `r` is for database `D`. The sensitivity `Δq` is the maximum change in score between neighboring databases for any output `r`.

The mechanism outputs a random `r` with probability proportional to:

```
exp( (ε · q(D, r)) / (2 · Δq) )
```

This gives high‑scoring outputs a much higher chance of being selected, while still providing `ε`‑differential privacy. The factor 2 in the exponent arises from the proof.

#### 6. Composition Properties

Differential privacy degrades gracefully when multiple queries are posed:

- **Sequential Composition:** Releasing `k` queries, each with privacy budgets `ε₁, ε₂, …, ε_k`, results in total privacy loss `ε_total = ε₁ + ε₂ + … + ε_k`. This is the reason for the “privacy budget” analogy – you can run many queries, but each consumes part of the overall budget.
- **Parallel Composition:** If the queries operate on **disjoint subsets** of the data, the total privacy cost is `max(ε_i)`, not the sum.
- **Advanced Composition:** Tighter bounds exist for a large number of queries; the total privacy cost grows roughly as `√(k ln(1/δ))` for a small failure probability `δ`.

#### 7. Practical Considerations

- **Choice of `ε`:** There is no universal rule. For high‑sensitivity data (health, location), `ε` should be very small (e.g., 0.01‑0.1). For less sensitive statistics, values up to 1 or even 10 may be used. The total lifetime budget of a system must be managed carefully.
- **Post‑processing immunity:** Once a differentially private answer is released, no further computation can weaken the privacy guarantee.
- **Group privacy:** Protecting a group of `g` individuals requires scaling `ε` accordingly (e.g., `g·ε`‑differential privacy).
- **Local vs. global differential privacy:** In the **global** (or centralized) model, a trusted curator applies the noise. In the **local** model, each user perturbs their own data before submission (e.g., Randomized Response). The local model provides stronger individual control but usually requires much more noise.

### 8. Summary Table

| Concept | Definition |
| :--- | :--- |
| **Privacy definition** | `Pr[M(D₁)∈S] ≤ e^ε·Pr[M(D₂)∈S]` |
| **Sensitivity `Δf`** | Max change in query answer when one record changes |
| **Laplace scale** | `b = Δf / ε` |
| **Exponential score** | `p(r) ∝ exp(ε·q(D,r) / (2Δq))` |
| **Sequential budget** | `ε_total = Σ ε_i` |
| **Parallel budget** | `ε_total = max ε_i` |

Differential privacy has become a mature field, with implementations in government census releases (U.S. Census Bureau), industry tools (Google’s RAPPOR, Apple’s iOS data collection), and a rich theoretical foundation that bridges statistics, cryptography, and law.
### 1. Laplace Mechanism
**Purpose:** Achieve ε‑differential privacy for real‑valued query `f` by adding Laplace noise.

**Algorithm:**
1. Compute sensitivity `Δf = max_{D₁,D₂ neighboring} ||f(D₁) – f(D₂)||₁`.
2. Output `f(D) + Lap(Δf/ε)` (Laplace distribution with scale `b = Δf/ε`).

**Proof:** The Laplace density `p(y) ∝ exp(−|y|·ε/Δf)` guarantees the ratio of probabilities on neighboring databases is bounded by `e^ε`.

### 2. Exponential Mechanism
**Purpose:** For non‑numeric queries or when output is from a discrete set `R` with a quality score `q(D, r)`, select `r` with probability proportional to `exp(ε·q(D, r) / (2·Δq))`.

**Sensitivity:** `Δq = max_{D₁,D₂, r} |q(D₁, r) – q(D₂, r)|`.

**Privacy:** Satisfies ε‑differential privacy.

### 3. Composition Theorems
- **Sequential composition:** Applying multiple εᵢ‑DP mechanisms uses total privacy budget `Σεᵢ`.
- **Parallel composition:** If mechanisms operate on disjoint data subsets, the budget is `max(εᵢ)`.
- **Advanced composition:** Tighter bound for many queries.

---

## Module 7: Hiding Access Patterns (PIR & ORAM)

### 1. Information Theoretic PIR (Goldberg’s Scheme)
**Goal:** User retrieves block `D_β` from replicated database `D` on `L` non‑colluding servers without revealing `β`.

**Algorithm:**
1. Represent database as an `r × s` matrix.
2. User creates vector `e_β` (all 0 except 1 at position `β`).
3. User uses Shamir `(t+1, L)` secret‑sharing to split `e_β` into shares `v₁,…,v_L` (each of length `r`); send `v_i` to server `i`.
4. Server `i` computes `r_i = v_i · D` (dot product).
5. User collects `k > t` responses; these responses are Shamir shares of `e_β·D = D_β`. Reconstruct via Lagrange interpolation.

**Robustness:** Can tolerate up to `v` malicious servers and `L−k` non‑responsive servers if `v < k−t−1`.

### 2. Computational PIR (cPIR) – Basic Scheme (KO97)
**Goal:** Single‑server PIR using quadratic residuosity assumption.

**Algorithm:**
1. Database is a `√n × √n` bit matrix `M`.
2. For desired row `i`, user generates a vector `y` of length `√n` where `yᵢ = QNR` and all others are `QR` (encrypted query).
3. Server computes for each column `j` the product `zⱼ = Π_{ℓ} y_ℓ^{(M_{ℓ,j})}` (mod `N`).
4. The desired bit `M_{i,j}` is 1 if and only if `zⱼ` is a QNR.
5. User decrypts by checking quadratic residuosity (knowing factorization of `N`).

**Efficiency:** Communication sublinear in database size, but computation linear.

### 3. Path ORAM
**Purpose:** Oblivious RAM hiding access patterns (reads/writes) from storage server.

**Algorithm:**
- **Storage:** Binary tree of nodes, each holding `Z` blocks (e.g., Z=4). Client holds a stash and a position map: `block ID → leaf label`.
- **Invariant:** A block is always on the path from root to its assigned leaf.
- **Access (read/write):**
  1. Look up block’s leaf position `L` from position map.
  2. Read the entire path to leaf `L` into stash; find the requested block.
  3. Re‑assign the block to a new random leaf `L'`.
  4. Write back the path, pushing blocks as deep as possible (greedy), evicting to the root if full.
- **Security:** All accesses are to uniformly random leaves, independent of actual block; indistinguishable from random.
- **Recursion:** To reduce client storage, the position map itself is stored in a smaller ORAM recursively.

---

## Module 8: Anonymous Communications

### 1. Mix Networks (High‑Latency)
**Concept:** A mix collects encrypted messages, decrypts, delays, and outputs in a different order to unlink sender and receiver.

**Flushing algorithms:**
- **Threshold mix:** Forward when `n` messages are collected.
  - **(n‑1) attack:** Attacker sends `n‑1` dummy messages to flush, then inserts target and correlates.
- **Timed mix:** Forward every `t` seconds; vulnerable to trickle attack.
- **Pool mix:** Maintain a pool; when new mix arrives, randomly select a fixed number to forward. Makes (n‑1) attack probabilistic.
- **Stop‑and‑go mix:** Each message delayed independently by exponentially distributed time.
- **Binomial mix:** In each round, each message is forwarded with probability `p_f`, destroying batch boundaries.

### 2. Onion Routing / Tor
**Circuit construction (telescoping):**
1. Client incrementally builds a circuit: negotiates symmetric key with Entry guard, then extends to Middle (via Entry), then to Exit (via Middle).
2. Each relay knows only its predecessor and successor; perfect forward secrecy via ephemeral keys.

**Data transfer:**
- Client encrypts data in layers: innermost layer for Exit, middle layer for Middle, outer for Entry.
- Each relay peels its layer to reveal next hop.

**Hidden services:**
1. Service sets up Introduction Points and gives descriptors to a Distributed Hash Table.
2. Client picks a Rendezvous Point, sends it to the service via introduction circuit.
3. Service connects to Rendezvous Point; client and service communicate through this rendezvous, never revealing IP.

**Bridges/Obfsproxy:** Unlisted entry relays with obfuscated protocols to evade censorship.

### 3. Dining Cryptographers (DC‑net)
**Purpose:** Information‑theoretic sender anonymity.

**Algorithm:** `n` participants agree on pairwise random keys. To anonymously send one bit `m`, broadcast the XOR of `m` with all shared keys. Global XOR of all broadcasts reveals `m` if exactly one person sent. Superposition of senders causes collision.

**Extensions:** Dissent uses DC‑nets for accountable group anonymity; Herbivore scales DC‑net by hierarchical cliques.

---

## Module 9: Privacy in E‑cash

### 1. Bitcoin’s Core Protocol
- **Transaction:** A chain of digital signatures transferring ownership of unspent transaction outputs (UTXOs).
- **Blockchain:** Distributed append‑only ledger; blocks linked by cryptographic hashes.
- **Mining:** Proof‑of‑Work (finding a nonce such that block hash < target). Difficulty adjusted every 2016 blocks.
- **Double‑spend prevention:** Only the longest valid chain is accepted; transactions must be buried under several blocks.

### 2. De‑Anonymization Clustering (Androulaki et al.)
- **Heuristics:** Multi‑input transactions (inputs likely from same wallet) and shadow addresses (change addresses).
- **Behavioral clustering:** K‑Means and Hierarchical Agglomerative Clustering (HAC) using features like transaction times and values to group addresses belonging to the same user.
- **Result:** Can identify 40% of users with 80% accuracy.

### 3. Zerocoin Protocol
**Goal:** Unlinkable mint and spend of fixed‑denomination coins.

**Minting:** User generates serial number `S`, creates a zero‑knowledge proof that they know `S` within a commitment `C` without revealing `S`, and publishes `C` on the blockchain; the corresponding bitcoins are locked.

**Spending:** User provides a ZK proof that they know an `S` inside one of the published commitments `C` (without revealing which), thus burn the zerocoin and redeem new bitcoins. The link between mint and spend is broken.

### 4. Zerocash Protocol
**Improvement:** Uses zk‑SNARKs to hide amounts, sender, receiver, and transaction graph.

**Mint:** Creates a note committed in the Merkle tree; output a “coins” commitment.

**Pour:** Consumes old notes and creates new ones, with a zk‑SNARK proof that validates consistency without revealing any input/output details. All transactions are shielded by default.

---

## Module 10: Privacy in E‑voting

### 1. Fujioka‑Okamoto‑Ohta (FOO) Protocol
**Goal:** Simple internet voting with privacy but not receipt‑free.

**Steps:**
1. Voter commits to vote `v` using random key `r`, then blinds the commitment.
2. Administrator verifies eligibility, signs the blinded commitment (blind signature), returns it.
3. Voter unblinds, gets signed commitment, sends it to the collector anonymously.
4. Later, voter reveals the commitment key `r` to the collector, who opens the vote and tallies.

**Vulnerability:** Voter can sell the key `r` as a receipt, proving how they voted.

### 2. Okamoto’s Receipt‑Free Scheme
**Enhancement:** Uses trap‑door bit commitments that allow the voter to open the commitment in two different ways (one real, one fake). The voter sends the fake opening to a coercer and the real one to a timeliness member via an untappable channel.

**Result:** Receipt‑free but not coercion‑resistant.

### 3. Lee et al. Coercion‑Resistant Protocol
**Mechanism:** Mix‑net with re‑encryption and Designated Verifier Proofs (DVP).
- Voter encrypts vote with collector’s public key, signs and sends to administrator.
- Administrator re‑encrypts the ciphertext, signs, and provides a DVP that the re‑encrypted ciphertext contains the same plaintext. The DVP is verifiable only by the voter (using her private key) and cannot be transferred to a coercer.
- Voter can later claim that the re‑encrypted vote corresponds to a different choice by generating a fake DVP.

**Properties:** Achieves coercion‑resistance.

### 4. Estonian Internet Voting
**Design:** Uses national ID‑card with digital signatures. The vote is encrypted (inner envelope) and signed (outer envelope). Separation of duties: the outer envelope (voter identity) is stripped before the inner envelope is decrypted offline.

**Anti‑coercion:** Re‑voting allowed; only the last vote counts; physical voting overrides e‑vote.

---

## Module 11: Genomic Privacy

### 1. Homer’s Attack
**Goal:** Determine if a known individual’s DNA is part of an aggregate genomic statistic (e.g., allele frequencies in a case group).

**Method:**
- Attacker obtains the target’s SNP genotypes and the published aggregate allele frequencies of the study.
- For each SNP, compute a distance metric (e.g., correlation) between the target’s genotype and the frequency in the case vs. reference group.
- Accumulate statistics across thousands of SNPs; if overall evidence exceeds a threshold, the individual is likely in the case group.

**Countermeasure:** Add noise to statistics (differential privacy) or limit data release.

### 2. Surname Inference Attack (Gymrek et al.)
**Goal:** Recover the surname of a male genome donor.

**Procedure:**
1. Extract Y‑chromosome short tandem repeats (STRs) from the genome.
2. Query recreational genealogy databases (e.g., Ysearch) that link STR haplotypes to surnames.
3. Obtain a candidate surname list; combine with demographic metadata (age, state) from public records to triangulate identity.

### 3. GenoGuard (Honey Encryption)
**Purpose:** Protect genomic data stored under a password against brute‑force attacks.

**Algorithm:**
- When encrypting the genome with a password, the system creates a distribution‑transforming encoder: the decryption of an incorrect password yields a plausible but fake genomic sequence (a “honeyword”).
- An attacker without the password cannot distinguish the real genome from the many plausible decoys generated during brute‑force guessing, because all sequences are statistically valid.

**Implementation:** Uses a technique to map ciphertexts to a valid sequence space with uniform distribution, so every decryption attempt gives a believable output.

### 4. Privacy‑Preserving Disease Susceptibility Test
**Setting:** Patient (P), Medical Center (MC), Storage Unit (SPU), Certified Institution (CI).

**Techniques:** Modified Paillier homomorphic encryption with proxy re‑encryption.
- CI sequences the sample, encrypts SNPs under P’s public key.
- P’s secret key is split into two shares; one goes to MC, one to SPU (to prevent single insider from decrypting).
- MC requests specific SNP positions for a disease test; P or SPU provides encrypted positions.
- SPU partially decrypts or re‑encrypts the requested SNPs so MC can compute homomorphically the disease risk.
- Final encrypted result is partially decrypted by SPU and MC cooperatively.

**Security:** MC never sees raw SNPs; homomorphic additions/comparisons compute polygenic risk scores; proxy re‑encryption ensures authorized access per test.

### 5. Kin Genomic Privacy Optimization
**Problem:** A donor wants to publicly share a subset of his SNPs while preserving the privacy of relatives.

**Model:** Multidimensional 0‑1 Knapsack Problem: each SNP shareable (1) or not (0), subject to per‑relative privacy constraints (genomic and health privacy levels remain acceptable).

**Algorithm:** Branch‑and‑bound search over SNP selection, using a fast inference algorithm (Markov chain/HMM based on Mendel’s laws) to evaluate privacy loss from the released SNPs, leveraging pairwise linkage disequilibrium and familial relationships. Iterative fine‑tuning adjusts the SNP set until all constraints satisfied.
