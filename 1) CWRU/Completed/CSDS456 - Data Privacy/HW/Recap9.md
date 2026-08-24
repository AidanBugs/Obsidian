---
format:
  pdf:
    output-file: "bugayong_aidan_module9.pdf"
---

# Zerocoin: A Distributed E-Cash Scheme for Anonymous Bitcoin Transactions
## Summary

The paper proposes Zerocoin, a cryptographic extension to Bitcoin that enables fully anonymous transactions without adding trusted parties. Bitcoin’s public ledger allows anyone to trace coin flows, and existing laundry services require trusting operators not to steal or track funds. Zerocoin lets users mint “zerocoins” by escrowing bitcoins and publishing a commitment to a random serial number. Later, they spend a zerocoin by proving (via a zero‑knowledge proof) that they know some coin in the set of all minted coins, without revealing which one. The system uses a Strong‑RSA accumulator to compress the set of coins into a constant‑sized value, making proofs efficient. The authors integrate Zerocoin into Bitcoin by adding new transaction types, maintaining accumulator checkpoints in the block chain, and proving security under standard assumptions.

::: {layout-ncol="2"}
::: {}
## Strengths
- No trusted coin issuer or bank required
- Information‑theoretically hiding commitments
- Leverages Bitcoin’s existing block chain as bulletin board

:::
::: {}
## Weaknesses
- Trusted setup phase for accumulator parameters
- Large proof sizes and high computational overhead
- Requires hard fork / global changes to Bitcoin

:::
:::

## Comments On Strengths & Weaknesses

First, unlike nearly all previous e‑cash systems, Zerocoin eliminates the need for a central bank or trusted mint. Traditional blind‑signature schemes require a party that issues coins; Zerocoin allows any user to mint a coin simply by escrowing bitcoins and publishing a commitment. This fits Bitcoin’s decentralized trust model and removes a single point of failure or censorship. The authors achieve this using Pedersen commitments, which are information‑theoretically hiding, so even an adversary with infinite computing power cannot link a mint to a spend. Second, the design cleverly reuses Bitcoin’s block chain as a tamper‑evident public bulletin board. The accumulator is incrementally updated with each new mint, and checkpoints are stored in coinbase transactions. This means no new infrastructure is required – the existing network of miners already provides append‑only storage and distributed agreement. The paper avoids the need for a separate “laundry” service, which could steal funds or log transactions. However, Zerocoin introduces several practical weaknesses. The most concerning is the trusted setup for the accumulator’s RSA modulus. While the authors mention “RSA UFOs” as an alternative, the default construction requires generating primes $(p,q)$ that must be destroyed afterwards. If an attacker kept these primes, they could forge membership proofs and create counterfeit zerocoins. This contradicts Bitcoin’s trust‑minimized philosophy and creates a single point of vulnerability during initialization. Another major drawback is proof size and verification time. Even with optimizations, a Zerocoin spend proof is several dozen kilobytes (versus a few hundred bytes for a normal Bitcoin transaction), and verification involves multiple exponentiations. The paper’s benchmarks show that verifying a block with 800 Zerocoin transactions takes nearly five minutes – half the target block interval. This threatens Bitcoin’s ten‑minute block target and could lead to network congestion. Additionally, the protocol reveals the total number of minted and spent coins, and anonymity is limited to coins minted between a user’s mint and spend – an attacker who mints many coins can shrink the anonymity set. Finally, Zerocoin is not a drop‑in upgrade; it requires hard‑fork changes to Bitcoin’s scripting language and consensus rules. Older nodes would reject blocks containing Zerocoin transactions, risking a permanent network split. The authors suggest embedding proofs as comments or using separate validation services, but these workarounds either reduce security or reintroduce trust. This deployment barrier has historically prevented Zerocoin from being adopted in Bitcoin, though its ideas later influenced Zcash.
