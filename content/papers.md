---
title: ""
layout: "single"
---

## Cloud-native challenges

Traditional telco systems were not exactly born for today's cloud-native ecosystem (recommended reading: [pet vs. cattle](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)).

- [**Elastic Scaling of Real Time Communication Services**](https://ieeexplore.ieee.org/document/11435462)  
  **Máté Nagy**; Tamás Lévai; Felicián Németh; Aurojit Panda; Gianni Antichi; Gábor Rétvári
  *Published in IEEE Transactions on Network and Service Management, 2026.*

    **TL;DR**  
    Kubernetes networking is built on {{< abbr "NAT" >}}, which replaces the source address of packets in transit. This is particularly problematic for real-time media where users are identified by their source address (IP and port). In this paper we explore how a custom service mesh could work around this limitation. This line of work also gave rise to the popular WebRTC gateway, [STUNner](https://github.com/l7mp/stunner), largely thanks to the brilliance of [Gábor Rétvari](http://lendulet.tmit.bme.hu/~retvari/).
    
- [**Industrial-scale Stateless Network Functions**](/papers/industrial-scale-ieee-cloud-2019.pdf)  
   Márk Szalay, **Máté Nagy**, Dániel Géhberger, Zoltán Kiss, Péter Mátray, Felician Németh, Gergely Pongrácz, Gábor Rétvári, László Toka  
   *Published in: IEEE Cloud, Milan, Italy, 2019.*

    **TL;DR**  
    High performance (low latency and jitter) is the primary focus when designing telco media servers. Before the cloud era, keeping session state in-process was not a limitation but a feature, with resiliency delegated to hardware. Once these services moved to the cloud, that was no longer an option — the software itself had to handle failures gracefully. Imagine a server handling all live sessions of a small country going down; the inability to call 911 is simply unacceptable. The challenge I received from my former manager was to come up with a practical solution. Thanks to a superfast in-house database and a few enthusiastic colleagues, the solution made it into the product, and this paper and several patents followed (see [Google Scholar](https://scholar.google.com/citations?user=prFKKcUAAAAJ&hl=hu)).
    

## Information theory

- [**R3D3: A Doubly Opportunistic Data Structure for Compressing and Indexing Massive Data**](/papers/r3d3_2019.pdf)  
    **Máté Nagy**, János Tapolcai, Gábor Rétvári  
    *Published in: Infocommunications Journal, 11:58--66, 2019.*

    **TL;DR**  
    Succinct data structures let you store data in a compact form while keeping it directly accessible — no need to decompress before querying. [R3D3](https://github.com/nmate/sdsl-lite) is a tweak to the popular RRR representation scheme, by leveraging longer block sizes to reduce the size of the index. It didn't exactly set the world on fire, though :-).


## Network optimization for resiliency
- <a href="/papers/nagy2018ton.pdf" class="no-underline">**Node Virtualization for IP Level Resilience**</a>

    Short overview later

    *Published in: IEEE/ACM Transactions on Networking, 2018.*

## Dissertation

- [**Thesis booklet**](/papers/thesis_booklet_mate_nagy.pdf)

- [**Dissertation**](/papers/thesis_mate_nagy.pdf)

