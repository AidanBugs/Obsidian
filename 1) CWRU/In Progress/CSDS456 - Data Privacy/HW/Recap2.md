---
format:
  pdf:
    output-file: "bugayong_aidan_module2.pdf"
---

# A Survey of Homomorphic Encryption for Nonspecialists
## Summary
The article covers what is homomorphic encryption (and the basics of encryption as well) and discusses the different performance and security constraints associated with homomorphic encryption. The article starts with laying the groundwork for what encryption is, basic encryption schemes and follows this with the pros and cons of homomorphic encryption and why its important. 

::: {layout-ncol="2"}
::: {}
## Strengths
- Enables Computation on Encrypted Data
- Flexible and Extendable Schemes
- Wide Variety of Useful Applications

:::
::: {}
## Weaknesses
- Performance Issues
- Security Issues
- Large Text Sizes

:::
:::

## Comments On Strengths & Weaknesses
The idea of homomorphic encryption is it allows an external party to perform computation on encrypted data without the need to decrypt the data or learn anything about the encrypted data. Homomorphic encryption has a wide variety of uses such as "secret sharing schemes, threshold schemes, zero-knowledge proofs, oblivious transfer, commitment schemes, anonymity, privacy, electronic voting, electronic auctions, lottery protocols, protection of mobile agents, multiparty computation,, mix-nets, watermarking or finger-printing protocols, and so forth"[^1]. As for the flexible and extendable schemes, there a variety of different implementations of homomorphic encryption such as the Damgard-Jurik which has a parameter $s$ which helps control the size of ciphertext at the expense of an increased computation requirement. This implementation demonstrates how for certain systems with a stricter bandwidth, they might have an increased $s$ in order to have smaller ciphertext (to preserve bandwidth). However for systems with weaker computational capacities, they might use smaller $s$ to save on computational costs (or go with a different homomorphic encryption implementation). Regardless, this flexibility explaination also demonstrates some of the issues with homomorphic encryption. For starters since homomorphic encryption is a type of asymmetric encryption, it is important to note that asymmetric encryption is substantially slower than symmetric encryption with the text giving the example of "A block cipher like AES is typically 100 times faster than RSA encryption and 2000 times than RSA decryption"[^2]. Additionally, since these ciphertexts must be strictly larger than the original plain text, this could run into ciphertext size issues as previously mentioned. Additionally, since the idea of homomorphic encryption is the ability to perform meaningful transformations on encrypted texts, this naturally leaves these texts susceptible to a malleability attack where an untrustworthy party could simply multiply the text by a constant and jeopardize the integrity of the text. As such, by the very nature of homomorphic encryption these encrypted texts cannot be fully secure where ideally a party would know the message was tampered with through decrypting the text and recieving nothing but nonsense.

[^1]: Caroline Fontaine and Fabien Galand, "A Survey of Homomorphic Encryption for Nonspecialists," EURASIP Journal on Information Security 2007, Article ID 13801 (2007): 1

[^2]: Fontaine and Galand, "Survey of Homomorphic Encryption.": 2

