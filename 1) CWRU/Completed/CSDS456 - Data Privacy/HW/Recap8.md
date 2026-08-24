---
format:
  pdf:
    output-file: "bugayong_aidan_module8.pdf"
---

# Tor: The Second-Generation Onion Router
## Summary
The article focuses on Tor as an improvement on the Onion Routing systems designed for anonymous browsing. In short, the paper explains how the Tor system works, and how the system balances anonymity, utility and efficiency, as well as other open problems for anonymous communication systems. Additionally, the paper addresses various attacks and defenses (mitigations) to the Tor system and the future direction that the research could take. 


::: {layout-ncol="2"}
::: {}
## Strengths
- No kernel / high permission run privelidges
- Relatively lightweight program
- Perfect Forward Secrecy


:::
::: {}
## Weaknesses
- Relies on Users to opt into being relays / Tor nodes
- Does not protect from end to end attacks

:::
:::

## Comments On Strengths & Weaknesses
First, unlike other privacy programs like Freedom, the Tor system does not require kernel modifications / access to run and doesn't require elevated permissions either. This allows the program to be deployable quite easily on a variety of systems. The authors note that this prevents the program from anonymizing non TCP protocols but deams this as a worthy tradeoff. Additionally, due to their implementation of the Tor system using AES, which is relatively light program for encryption, allows for people with regular specs for computers and bandwidth to participate as a volunteer node or use the system in general. However this is a key drawback of the system which is that there isn't any good incentive for people to volunteer as a Tor node. The issues for being a Tor node is that it will increase your web traffic, constantly runs on the CPU and also potentially exposes volunteer nodes to illegal traffic endpoints. Ironically, the increase of webtraffic from volunteer nodes adds a sort of anonymity layer with that any web traffic would appear as if it could be of a variety of origins, allowing a user to send out their own web traffic without any attacker to know which requests are original to the user or just them relaying a request. Regardless, this goes into another weakness which is that since Tor is a low latency systems, a ISP's could monitor web traffic patterns and potentially correlate an endpoint to the original user within a probability. Additionally, packet sizes are another tell for ISP's to monitor if a user is using a Tor system and potentially find matches for traffic that enters and exits the network. A benefit however of Tor over the traditional Onion Routing is that it has perfect forward security. What this means is that if a node gets compromised then an attacker wouldn't be able to trace back previous traffic history to link users with their respective queries. This happens through a variety of improved methods such as incrementally building the Tor circuits, separate keys for each hop, and session keys being discarded after circuit close.
