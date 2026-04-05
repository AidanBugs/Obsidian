---
format:
  pdf:
    output-file: "bugayong_aidan_module10.pdf"
---
# Internet Voting, Security, and Privacy
## Summary

The article examines the push for Internet voting in public elections, arguing that convenience and technology appeal often override security and privacy. The author categorizes Internet voting along three axes: blank ballot distribution versus ballot return, dedicated versus non dedicated systems, and supervised versus unsupervised voting. Using real world examples like D.C.'s Digital Vote by Mail and Operation BRAVO, the paper shows that most methods, especially unsupervised ballot return, are vulnerable to client, network, and server attacks. The author concludes that only low risk combinations like blank ballot distribution with dedicated supervised systems may be feasible for public elections.

::: {layout-ncol="2"}
::: {}
## Strengths
- Clear practical categorization of voting methods
- Uses real world pilots to illustrate risks
- Distinguishes public from private elections

:::
::: {}
## Weaknesses
- Lacks quantitative risk assessment
- Ignores cryptographic solutions like homomorphic encryption
- Relies on anecdotal cost data

:::
:::

## Comments On Strengths & Weaknesses

First, the paper's categorization fpr Internet voting methods is quite well defined. By separating blank ballot distribution from ballot return, dedicated from non dedicated systems, and supervised from unsupervised voting, Epstein creates a clear risk ladder. For example, method eight which is ballot return with non dedicated and unsupervised systems is rightly identified as the most dangerous, while method one which is blank ballot distribution with dedicated and supervised systems is the least risky. This framework helps election officials ask the right questions before deploying any system. The author grounds this taxonomy in real pilots. The D.C. DVM system suffered from client side PDF bugs and network misconfigurations, while Operation BRAVO avoided many client risks by using dedicated supervised kiosks. Additionally, the paper distinguishes public from private elections in terms of threat models. In corporate or association elections, the value of manipulation is lower, results can be audited against expectations, and voters already have stable identifiers. This nuance is often missing in blanket arguments for or against Internet voting. However, the paper lacks any quantitative risk assessment. For instance, it does not estimate the probability of a successful attack or the impact on election outcomes. Instead it lists vulnerabilities like malware, phishing, and BGP hijacking without comparing their likelihood or cost of exploitation. Another weakness is the absence of cryptographic solutions. Even in 2011, techniques like homomorphic encryption, mixnets, or end to end verifiable systems were known. The paper dismisses thick client software as unworkable but never discusses systems where the client only needs a browser and the server cannot alter votes. By limiting the analysis to conventional web and PDF architectures, the paper implicitly assumes that Internet voting must look like online banking, which is not true for modern cryptographic voting. Finally, the cost analysis is anecdotal and non comparable. Table one shows seventy three thousand eight hundred dollars per voter for one pilot versus three dollars and fifty eight cents for another, but the author does not normalize for scale or for what costs are included. The claim that there is no justification for reduced costs is plausible but not rigorously proven. In summary, Epstein's article provides a valuable risk based framework and warns against reckless deployment, but it lacks quantitative rigor and ignores cryptographic advances that could address many of its concerns.
