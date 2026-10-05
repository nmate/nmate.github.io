---
title: ""
layout: "single"
---

### Cloud-native challenges

Traditional telco systems were not exactly born for today's cloud-native ecosystem (recommended reading: [pet vs. cattle](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)).

- **Elastic Scaling of Real Time Communication Services** [[ link ](https://ieeexplore.ieee.org/document/11435462)]  
  *IEEE Transactions on Network and Service Management, 2026.*  
  Máté Nagy; Tamás Lévai; Felicián Németh; Aurojit Panda; Gianni Antichi; Gábor Rétvári  

    **TL;DR:** Kubernetes networking is built on {{< abbr "NAT" >}}, which replaces the source address of packets in transit. This is particularly problematic for real-time media where users are identified by their source address (IP and port). In this paper we explore how a custom service mesh could work around this limitation. This line of work also gave rise to the popular WebRTC gateway, [STUNner](https://github.com/l7mp/stunner), largely thanks to the brilliance of [Gábor Rétvari](http://lendulet.tmit.bme.hu/~retvari/).

- **Industrial-scale Stateless Network Functions** [[ pdf ](/papers/industrial-scale-ieee-cloud-2019.pdf)]  
   *IEEE Cloud, Milan, Italy, 2019.*  
   Márk Szalay, Máté Nagy, Dániel Géhberger, Zoltán Kiss, Péter Mátray, Felician Németh, Gergely Pongrácz, Gábor Rétvári, László Toka  

    **TL;DR:** High performance (low latency and jitter) is the primary focus when designing telco media servers. Before the cloud era, keeping session state in-process was not a limitation but a feature, with resiliency delegated to hardware. Once these services moved to the cloud, that was no longer an option — the software itself had to handle failures gracefully. Imagine a server handling all live sessions of a small country going down; the inability to call 911 is simply unacceptable. The challenge I received from my former manager was to come up with a practical solution. Thanks to a superfast in-house database and a few enthusiastic colleagues, the solution made it into the product, and this paper and several [patents](https://scholar.google.com/citations?user=prFKKcUAAAAJ&hl=hu) followed.


### Information theory

- **R3D3: A Doubly Opportunistic Data Structure for Compressing and Indexing Massive Data** [[ pdf ](/papers/r3d3_2019.pdf)]  
    *Infocommunications Journal, 11:58--66, 2019.*  
    Máté Nagy, János Tapolcai, Gábor Rétvári  

    **TL;DR:** Succinct data structures let you store data in a compact form while keeping it directly accessible — no need to decompress before querying. [R3D3](https://github.com/nmate/sdsl-lite) is a tweak to the popular RRR representation scheme, by leveraging longer block sizes to reduce the size of the index. It didn't exactly set the world on fire, though :smile:


### Network optimization for resiliency

Providing resiliency to pure IP networks by altering the topology was a hot topic in the 2010s. If you're curious about the
details, check out the intro of my dissertation. In these papers, we offered different solutions to the problem.

- **Node Virtualization for IP Level Resilience** [[ pdf ](/papers/nagy2018ton.pdf)]  
    *IEEE/ACM Transactions on Networking, 2018.*  
    Máté Nagy, János Tapolcai, Gábor Rétvári  

- **On the design of resilient IP overlays** [[ pdf ](/papers/drcn2014.pdf)]  
    *Design of Reliable Communication Networks (DRCN), 2014.*  
    Máté Nagy, János Tapolcai, Gábor Rétvári  

- **Optimization methods for improving IP-level fast protection for local Shared Risk Groups with Loop-Free Alternates.** [[ pdf ](/papers/tel_sys_2012.pdf)]  
    *Telecommunication Systems, 2014.*  
    Máté Nagy, János Tapolcai, Gábor Rétvári  

### Dissertation

For sleepless nights, when nothing else works...

- **Thesis booklet** [[ pdf ](/papers/thesis_booklet_mate_nagy.pdf)]

- **Dissertation** [[ pdf ](/papers/thesis_mate_nagy.pdf)]

