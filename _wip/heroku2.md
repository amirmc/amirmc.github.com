---
layout: post
title: "Towards Heroku for Unikernels"
author: Amir Chaudhry
date: 2015-03-19 13:00:00
tags: [ocaml, unikernel, mirage]
description:
shorturl: http://amirchaudhry.com/
---
{% include JB/setup %}

<!-- <a href="#"><img style="float: right; margin-left: 10px" src="http://amirchaudhry.com/images/web/#"></a> -->



=====

TODO -- what is immutable infra? Means you don't need the artefact

### A complete end to end process -- a system at scale

Everything I've discussed above exists *today* and you can set up the workflow for yourself, the same way many others have done with the Travis CI scripts for testing/build.  However, there are a range of exciting possibilities to consider if we're willing to extrapolate *just a little* from the tools we have above.  The rest of this post explores these ideas and considers how we might extend our end-to-end system.  
<!-- As an example service, we can consider how we deploy static websites on our infrastructure. -->
What benefits and features can our other tools provide to this system?  How could it operate at scale?  What can we generalise and what has to remain bespoke?


<!-- 

This part of the post is somewhat more fanciful.  If we can consider that the end-to-end story exists a above, what kind of system could you build at scale? What if you could use the other tools that are available?
 -->

TODO - flesh out and flow all the following paras - they're just notes for now.

#### Demand-driven, hyper-elastic clouds

The way cloud services are currently provisioned, means that you may have services operating and consuming resources (CPU, memory, etc), even when there is no demand for them. It would be significantly more efficient if we could simply *activate* a service when required and shut it down again when the demand has passed. In our case, this would mean that when a unikernel is 'deployed to production', it doesn't actually have to be *live*.  With tools like [Jitsu][jitsu-repo]\* (just-in-time summoning of unikernels), we can work towards this kind of architecture. 

Jitsu allows us to have the unikernels sitting in storage then 'summon' them into existence, in response to an incoming request and with *no discernible latency* for the requester.  For the times when unikernels are inactive, they consume only the *actual* physical storage required (and thus 0% CPU, 0% RAM, etc). This is *highly* efficient as it means that more can be achieved with fewer resources and it would significantly improve utilization rates of hardware and things like power efficiency. 


<!-- such that the same workloads can be... 
because a single machine that uses Jitsu...
only the applications that need to be running at a given time are actually active.  This is ideal for systems ...
the same physical hardware can be ...
This is *highly* efficient since fewer machines can manage a great workload 
the system ensure that only ...
and is very different to the 
 -->

With a tool that can spawn unikernels on demand, it is possible to build systems that can automate scale-out of services, including onto other machines.  For example, you could define the maximum resource usage you would allow for a given service/application and the infrastructure would simply scale to that limit in real-time, and then back down again as demand passes. 

We can consider the benefits of such a system for the mirage-decks unikernel.  Most of the time, it may receive no traffic and therefore would remain 'turned off'. When a request comes in for a page, the unikernel can be started in order to serve that request — using minimal resources. If the load increases (e.g. a HackerNews/Reddit effect) then more unikernels/resources can automatically be allocated to serving those requests — up to a specified limit (including scaling out onto different machines).  It's even possible to take this to an extreme, where *each individual page* could be served via it's *own* unikernel.  We've already [experimented with this][jitsu-x] and in this scenario, a scale-out would only be needed for the individual pages that are receiving the traffic. 

<!-- If it seems that a particular post is generating lots of incoming traffic (a HackerNews/Reddit effect), then more resources can automatically be allocated to serving those requests — up to a specified limit (including scaling out onto different machines).  We can even imagine taking this to an extreme where each individual page is its own unikernel. -->

From the perspective of our deployment machine, having a demand-driven system means we can deliver more services from just the one set of physical hardware — because not all those services would be consuming resources at the same time.

Overall, this is model quite different to the current usage of the Cloud where the overhead of a classic OS is constantly consuming resources.  It would also impact the economics, as billing cycles are currently measured in hours, whereas unikernels may only be active for seconds at a time.  In addition to these benefits, there are interesting possibilities in *how* such scale-outs can be co-ordinated. 

<!-- Just like Heroku, you can specify the maximum number of instances you want to run and your unikernels can scale up to that limit and then back down again. 
-->


#### Hybrid deployments for embedded devices (ie the IoT)

As we move to a world with more connected devices, the software and services we create will have to operate across both the cloud and embedded systems.
For example, we could easily serve the traffic for mirage-decks from a unikernel on a Cubieboard2, which could further minimise the cost of running such infrastructure.  However, it could be configured such that if demand begins to peak, then an automated scale-out can occur from the Cubieboard2 out onto the public cloud instead. Thus, we can still make use of third-party resources but *only when needed*.  

<!-- For the example of our static websites, it would be straightforward to serve them from cubieboards that reside from our homes, thus further minimising the costs to run such infrastructure.  However, they could be configured such that if demands begins to peak, then an automated scale-out can occur from the Cubieboard onto the public cloud instead.   -->

<!-- You could even set up such a system to push the well-tested unikernels out onto embedded devices elsewhere (think IoT). In this way you only need a Minimal cloud infrastructure for your IoT service, in order to push new code out to end points, where the work is actually done (within a user's home). Think of the Goodnight Lamp, This can drastically reduce cost and any loss of the central service means end devices can keep working. (requires Signpost?).  Have a central location where devices can pick up updates from. Doesn't need to do any more than coordinating stuff and devices can work P2P. V cheap to run and make money from selling devices. -->

This could be incorporated into our existing end-to-end system by setting up our deployment machine to additionally push unikernels onto our embedded devices (with the help of [Signpost][sp-post]).  That way, the central deployment machine is merely a co-ordination point, whereas most of the workload is dealt with by the devices the unikernels are pushed to.  If the central machine is unavailable for any reason, the edge-devices would continue to function as normal.  This kind of arrangement would be ideal for Internet-of-Things style deployments, where it could reduce the burden on centralised infrastructure.

<!-- This is also great for third party servieces as tehy can consume minimal cloud recources and allow their edge devices to do most of the work
 -->

### Remember all the things - Ubiquitous logging/provenance

When running systems at scale it becomes important to track the activity and understand what is taking place in the system. In practice, this would mean logging the activity of the unikernels, when and where they were created and how they performed.  

With something like Irmin, you may even be able to receive notifications about the type of incoming traffic and raise the limit if you so wish.  May be able to configure your embedded devices to scale up to the hosted provider if there's sufficient demand.


(Logging) Such a system can also have complete end-to-end logging (mention dog?). using Irmin. This means each event where a unikernel is created and how much it serves can be automatically logged and be *very* fine grained. Being able to split out such information also means the ability to provide analytics to the creators of those unikernels around performance and usage characteristics. 


The beauty of this kind of system is that it embraces the ideas of immutable infrastructure and DevOps as all your services are simply manged right from the code. Everything is in version control *including* the built artefact. you don't need to be too concerned about recreating it as something of this size is trivial to move around, the same way source code is. 

TODO- xref with Nymote somehow.  The above infra is needed for those apps to provide a resilient service. etc 

All the above building blocks are open source and all you need is a Xen machine to deploy this code to!







### The march to immutable infrastructure.
### A true immutable infrastructure.

So here we have a rudimentary system for deplpying unikernels!  Apart from configuring the machines themselves, all is in git.  This only involves about XX lines of code because the VMs are trivially easy to manage. 

TODO - Describe why this is relevant to immutable infra (and why immutable infa is something to aspire to -- cf al the existing config mgmnt tools etc)






**Responsible footnote: Of course, I should remind you that this is speculative and is something that the tools will allow us to work towards. 

We will be presenting the current state of Jitsu at NSDI in May in Oakland, California. The paper will be available shortly afterwards. ***




\* If you're not familiar with Heroku, it's an application platform that deals with all the messy bits of deployment. The command is as simple as git push heroku master




[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[miso-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/
[travis-skeleton]: https://github.com/ocaml/ocaml-travisci-skeleton
[amc-travis]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#setting-up-travis-ci
[anil-ppa]: https://launchpad.net/~avsm
[uni-for-all]: http://amirchaudhry.com/unikernels-for-everyone/
[deploy-key]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#deploying-your-unikernel
[decks-repo]: https://github.com/mirage/mirage-decks
[deck-slide]: https://github.com/mirage/mirage-decks/issues/49
[decks-site]: http://decks.openmirage.org
[xen-installation]: http://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide

[decks-deploy]: https://github.com/mirage/mirage-decks-deployment
[hooks]: http://www.git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
[magnus-xen]: http://www.skjegstad.com/blog/2015/01/19/mirageos-xen-virtualbox/
[jitsu-repo]: https://github.com/MagnusS/jitsu
[mir-notes-qa]: http://openmirage.org/wiki/weekly-2015-03-11#Qualityandtest
[jitsu-x]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment
[sp-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/#signpost
