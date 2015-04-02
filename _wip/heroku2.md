---
layout: post
title: "Towards Heroku for Unikernels: Part 2 - Self Scaling Systems"
author: Amir Chaudhry
date: 2015-04-03 14:00:00
tags: [essay, mirage, miso, nymote, ocaml, ocamllabs, unikernel]
description:
shorturl: http://bit.ly/19xH2K3
---
{% include JB/setup %}

<!-- <p class="footnote">This is the second post in this series. You might like to start with <a href="http://amirchaudhry.com/heroku-for-unikernels-pt1/">Part 1</a>.</p>
 -->

In the [previous post][heroku1] I described the continuous end-to-end system that we've set up for some of the MirageOS projects — automatically going from a `git push` all the way to live deployment, with everything under version-control.

Everything I described previously already *exists* and you can set up the workflow for yourself, the same way many others have done with the Travis CI scripts for testing/build.  However, there are a range of exciting possibilities to consider if we're willing to extrapolate *just a little* from the tools we have right now.  The rest of this post explores these ideas and considers how we might extend our system.  

Previously, we had finished the backbone of the workflow and I discussed a few obvious ideas about how we should flesh it out — namely more testing and some form of logging/reporting.  There's substantially more we can do when we consider how lean and nimble unikernels are, especially if we speculate about the systems we could create as our [toolstack][miso-post] matures.  A couple of things immediately come to mind.  

The first is the ability to boot a unikernel only when it is required, which opens up the possibility of highly-elastic infrastructure.  The second is the ease with which we can push, pull or otherwise distribute unikernels throughout a system, allowing new forms of deployment to both cloud and embedded systems. We can consider these in turn and see where they take us, comparing with current `mirage-decks` deployment I described in [Part 1][heroku1].

<!-- In this post I'll extrapolate from that backbone and speculate about the systems we could create as our [toolstack][miso-post] matures.  What benefits and features could we add to this system?  How would it operate at scale?
 -->

<!-- 
as already seen in the .  Each of this

This also leads to another question of how we understand what's going on such as the system, in terms of logging and monitoring. 

leads to interesting possibilities for the kinds of platforms we can build in order to deploy and manage systems.
 -->


<!-- We can consider the implications of these and then think about the additional things we would bee for 
 -->
<!-- are and how easy it is to experiment with them (especially compared with running the equivalent experiments on traditional stacks).   -->


<!-- Items that cover
- Demand driven clouds
- Hybrid deployments (ARM/x86 as well as Unix)
- ubiquitous logging

-- So what?
- small-scale services -- running near you, the user
- What does Immutable Infrastructure really mean?
 -->

<!-- 
onto a Xen machine.  All the scripts and outputs are under version-control so it's easy for collaborators to understand what's going on without needing access to any machines. 
 -->

<!-- Everything I've discussed above exists *today* and you can set up the workflow for yourself, the same way many others have done with the Travis CI scripts for testing/build.  However, there are a range of exciting possibilities to consider if we're willing to extrapolate *just a little* from the tools we have above.  The rest of this post explores these ideas and considers how we might extend our end-to-end system.  --> 
<!-- As an example service, we can consider how we deploy static websites on our infrastructure. -->
<!-- What benefits and features can our other tools provide to this system?  How could it operate at scale?  What can we generalise and what has to remain bespoke? -->


<!-- 

This part of the post is somewhat more fanciful.  If we can consider that the end-to-end story exists a above, what kind of system could you build at scale? What if you could use the other tools that are available?
 -->

<!-- TODO - flesh out and flow all the following paras - they're just notes for now. -->


[heroku1]: http://amirchaudhry.com/heroku-for-unikernels-pt1/
[miso-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/


## Demand-driven clouds

The way cloud services are currently provisioned, means that you may have services operating and consuming resources (CPU, memory, etc), even when there is no demand for them. It would be significantly more efficient if we could simply *activate* a service when required and then shut it down again when the demand has passed.  In our case, this would mean that when a unikernel is 'deployed to production', it doesn't actually have to be *live* — it merely needs to be ready to boot when demand arises.  With tools like [Jitsu][jitsu-repo] (just-in-time summoning of unikernels), we can work towards this kind of architecture. 

### Summon on request

Jitsu allows us to have unikernels sitting in storage then 'summon' them into existence, in response to an incoming request and with *no discernible latency* for the requester.  For the times when unikernels are inactive, they consume only the actual physical storage required (and thus 0% CPU, 0% RAM, etc). This is highly efficient as it means that more can be achieved with fewer resources and it would significantly improve things like utilization rates of hardware and power efficiency.

In the case of the [decks.openmirage.org][decks-site] unikernel that I discussed last time, it would mean that the site would only come online if someone had requested it.  In fact, we've already been working on this kind of system and Jitsu will be presented at [NSDI in Oakland this May][jitsu-nsdi] ([PDF][jitsu-paper]). So in the spirit of looking ahead, there's more we could do.




<!-- such that the same workloads can be... 
because a single machine that uses Jitsu...
only the applications that need to be running at a given time are actually active.  This is ideal for systems ...
the same physical hardware can be ...
This is *highly* efficient since fewer machines can manage a great workload 
the system ensure that only ...
and is very different to the 
-->

### Hyper-elastic scaling

At the moment, Jitsu lets you set up a system where unikernels will boot in response to incoming requests.  This is already pretty cool but we could take this a step further.  If we can boot unikernels on demand, then we could use that to build a system which can automate the *scale-out* of those services to match demand.  We could even have that system work across multiple machines, not just one host.  So how would all this look in practice for `mirage-decks`?

Our previous toolchain automatically boots the new unikernel when one is pulled from the git repo.  Using Jitsu, our deployment machine would simply unzip the unkernel and leave it there and it would only be activated when someone requests access to it.  Most of the time, it may receive no traffic and therefore would remain 'turned off' (let's ignore webcrawlers for now). When someone requests to see a slide deck, the unikernel is booted and responds to the request.  In time it can be turned off again, thus freeing resources.  So far, so good.

### Effect on our example

Now let's say that a certain slide deck becomes *really* popular (e.g. posted to HackerNews or Reddit).  Suddenly, there are *many* incoming requests and we want to be able to serve them all.  We can use the one unikernel until it's at full capacity, at which point the system can create new copies of that unikernel and automatically balance across them. These unikernels don't need to be on the same host and with a sufficiently distributed system we should be able to spin them up on different machines.

If we're *really* clever, we can coordinate the creation of those new unikernels nearer the *source* of that demand, for example starting off on a European cloud, then spinning up on the East coast US and finally over to the West coast of the US.  All this could happen seamlessly and the process can continue until the demand passes or we reach a predefined limit — After all, given that we pay for the machines, we don't really want to turn a Denial of *Service* into a Denial of *Credit*. 

After the peak, the system can automatically scale back down to being largely dormant — ready to react when the next wave of interest occurs.

### Can we actually do this

If you think this is somewhat fanciful, that's perfectly understandable — and as I mentioned previously, this post is very much about *extrapolating* from where the tools are right now.  However, unikernels actually make it very easy to run quick experiments which indicate that we could iterate towards what I've described.  For example, a recent and somewhat extreme experiment ran a [unikernel VM for *each URL*][magnus-url-vm].  Every URL on a small static site was served from its own, self-contained unikernel, complete with it's own web-server (even the rss.png icon was served separately).  You can read the post to see how this was done and it also led to an interesting [discussion][list-vm-disc] on the mailing list (e.g. if you're only serving a single item, why use a web-server?).  Of course, this was just an *experiment* but it demonstrates what is possible now and how we can iterate, uncover new problems, and move forward.

Overall, the model I've described is quite different to the way we currently use the Cloud, where the overhead of a classic OS is constantly consuming resources.  Although it's tempting to stick with the same frame of reference we have today we should recognise that the current model is inextricably intertwined with the traditional software stacks themselves.  Unikernels allow completely new ways of creating, distributing and managing software and it takes some thought in order to fully exploit their benefits. 

For example, having a demand-driven system means we can deliver more services from just the one set of physical hardware — because not all those services would be consuming resources at the same time.  There would also be a dramatic impact on the economics, as billing cycles are currently measured in hours, whereas unikernels may only be active for seconds at a time.  In addition to these benefits, there are interesting possibilities in *how* such scale-outs can be co-ordinated across different devices.


<!-- took a simple static website and 

If the load increases (e.g. a HackerNews/Reddit effect) then more unikernels/resources can automatically be allocated to serving those requests — up to a specified limit (including scaling out onto different machines).  It's even possible to take this to an extreme, where *each individual page* could be served via it's *own* unikernel.  We've already [experimented with this][jitsu-x] and in this scenario, a scale-out would only be needed for the individual pages that are receiving the traffic. 

Somewhere i, you could define the maximum resource usage you would allow for a given service/application and the infrastructure would simply scale to that limit in real-time, and then back down again as demand passes. 

If we recall our previous toolchain, the 

For example, you could define the maximum resource usage you would allow for a given service/application and the infrastructure would simply scale to that limit in real-time, and then back down again as demand passes. 


We can consider the benefits of such a system for the mirage-decks unikernel.  Most of the time, it may receive no traffic and therefore would remain 'turned off'. 

When a request comes in for a page, the unikernel can be started in order to serve that request — using minimal resources. If the load increases (e.g. a HackerNews/Reddit effect) then more unikernels/resources can automatically be allocated to serving those requests — up to a specified limit (including scaling out onto different machines).  It's even possible to take this to an extreme, where *each individual page* could be served via it's *own* unikernel.  We've already [experimented with this][jitsu-x] and in this scenario, a scale-out would only be needed for the individual pages that are receiving the traffic. 
 -->

<!-- If it seems that a particular post is generating lots of incoming traffic (a HackerNews/Reddit effect), then more resources can automatically be allocated to serving those requests — up to a specified limit (including scaling out onto different machines).  We can even imagine taking this to an extreme where each individual page is its own unikernel. -->


<!-- Just like Heroku, you can specify the maximum number of instances you want to run and your unikernels can scale up to that limit and then back down again. 
-->

[jitsu-repo]: https://github.com/MagnusS/jitsu
[decks-site]: http://decks.openmirage.org
[jitsu-nsdi]: https://www.usenix.org/conference/nsdi15/technical-sessions/presentation/madhavapeddy
[jitsu-paper]: http://anil.recoil.org/papers/2015-nsdi-jitsu.pdf
[magnus-url-vm]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment/
[list-vm-disc]: http://lists.xenproject.org/archives/html/mirageos-devel/2015-03/msg00110.html

## Hybrid deployments

As we move to a world with more connected devices, the software and services we create will have to operate across both the cloud and embedded systems. There have been many names for this kind of distributed system, ranging from ubiquitous computing to dust clouds and the 'Internet of Things' but they all share the same idea of running software at the edges of the network (rather than just cloud deployments).

When we consider the toolchain we already have, it's not that much of a stretch to imagine that we could also build and store a unikernel for ARM-based deployments.  Those unikernels can be deployed onto embedded devices and currently we target the [Cubieboard2][cubie].  

<!-- For the example of our static websites, it would be straightforward to serve them from cubieboards that reside from our homes, thus further minimising the costs to run such infrastructure.  However, they could be configured such that if demands begins to peak, then an automated scale-out can occur from the Cubieboard onto the public cloud instead.   -->

<!-- You could even set up such a system to push the well-tested unikernels out onto embedded devices elsewhere (think IoT). In this way you only need a Minimal cloud infrastructure for your IoT service, in order to push new code out to end points, where the work is actually done (within a user's home). Think of the Goodnight Lamp, This can drastically reduce cost and any loss of the central service means end devices can keep working. (requires Signpost?).  Have a central location where devices can pick up updates from. Doesn't need to do any more than coordinating stuff and devices can work P2P. V cheap to run and make money from selling devices. -->

We could make such a system smarter. Instead of having the edge devices constantly polling for updates, our deployment process could directly *push* the new unikernels out to them. Since these devices are likely to be behind NATs and firewalls, tools like [Signpost][sp-post] would deal with the issue of secure connectivity. In this way, the centralized deployment process remains as a co-ordination point, whereas most of the workload is dealt with by the devices the unikernels are running on.  If the central machine happens to be unavailable for any reason, the edge-devices would continue to function as normal.  This kind of arrangement would be ideal for Internet-of-Things style deployments, where it could reduce the burden on centralised infrastructure while still enabling continuous deployment.

In this scenario, we could easily serve the traffic for `mirage-decks` from a unikernel on a Cubieboard2, which could further minimise the cost of running such infrastructure.  It could be configured such that if demand begins to peak, then an automated scale-out can occur from the Cubieboard2 directly out onto the public cloud and/or *other Cubieboards*. Thus, we can still make use of third-party resources but only when needed and of the kind we desire.  Of course, running a highly distributed system leads to other needs.

[cubie]: http://openmirage.org/wiki/xen-on-cubieboard2
[sp-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/#signpost


<!-- This is also great for third party servieces as tehy can consume minimal cloud recources and allow their edge devices to do most of the work
 -->

## Remember everything

When running systems at scale it becomes important to track the activity and understand what is taking place in the system. In practice, this means logging the activity of the unikernels, when and where they were created and how they perform.  This becomes even more complex for a distributed system.

This is an area where the ability to manage distributed data structures becomes important, which is exactly what [Irmin][irmin-post] addresses.  Using Irmin would enable us to building an end-to-end logging system, allowing data to be managed and merged across different nodes and keeping track of activity.  The ability able to capture such information also means the opportunity to provide analytics to the creators of those unikernels around performance and usage characteristics. 

Use of Irmin wouldn't be limited to logging as the unikernels themselves could use it for managing data in lieu of other file systems.  I'll refrain from extrapolating too far about this particular tool as it's still under rapid development.

<!-- With something like [Irmin][irmin-post], you may even be able to receive notifications about the type of incoming traffic and raise the limit if you so wish.  May be able to configure your embedded devices to scale up to the hosted provider if there's sufficient demand. -->

[irmin-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/#irmin


## The march to immutable infrastructure

You may have noticed that one of the benefits of the unikernel approach arises because the artefacts themselves are not altered once they're created.  This embraces the ideas of immutable infrastructure as all the software and services are managed right from the code. Everything is in version control, including the built artefact, which makes managing a unikernel deployment much easier than with legacy systems. 


<!-- you don't need to be too concerned about recreating it as something of this size is trivial to move around, the same way source code is. 

TODO- xref with Nymote somehow.  The above infra is needed for those apps to provide a resilient service. etc 

All the above building blocks are open source and all you need is a Xen machine to deploy this code to!
 -->






<!-- ## The march to immutable infrastructure.
## A true immutable infrastructure.

So here we have a rudimentary system for deplpying unikernels!  Apart from configuring the machines themselves, all is in git.  This only involves about XX lines of code because the VMs are trivially easy to manage. 

TODO - Describe why this is relevant to immutable infra (and why immutable infa is something to aspire to -- cf al the existing config mgmnt tools etc)
 -->

Let's think about what immutable infrastructure means for code.  Essentially, it means the artefact produced *doesn't matter*. It's disposable because we have the means to easily recreate it.  In our current example, we still ship the unikernel around.  In order to make this 'fully immutable', we'd have to capture the snapshot of all the packages and code used when *building* the unikernel. That would give us a complete manifest of which package versions were pulled in and from which sources.  Complete information like this would allow us to recreate any given unikernel in a highly systematic way.  If you can achieve this, then it's the *manifest itself* which represents the minimal requirement.

In this world-view, the unikernel itself becomes something akin to caching. You use it because you don't want to rebuild it from source — but unikernels are typically quicker to build than a whole OS/App stack.  For more security critical applications, you may want to be assured of the code that is pulled in, so you check the manifest file before rebuilding for yourself. This also allows you to pin to specific versions of libraries so that you can explicitly adjust the dependencies as you wish.  So how do we encode the manifest?  This is another area where Irmin can help as it can store a snapshot of the state of packages that were used for any given build run.  That build run can then be recreated elsewhere without having to manually specify package versions.


## What happens next?

As I mentioned at the beginning of this post, most of what I've described is speculative. I've deliberately extrapolated from where the tools are now so as provoke more thoughts and discussion about how this new model can be used in the wild.  Some of the things we're already working towards but there are many other uses that may surprise us — we won't know until we get there and experimenting is half the fun.

We'll keep marching on with more libraries, better tooling and improving quality.  What happens with unikernels in the rest of 2015 is largely up to the wider ecosystem.  

That means you.


<!-- 
If you're interested in getting involved, then look over the various 



**Responsible footnote: Of course, I should remind you that this is speculative and is something that the tools will allow us to work towards. 

We will be presenting the current state of Jitsu at NSDI in May in Oakland, California. The paper will be available shortly afterwards. ***
 -->

<!-- 
\* If you're not familiar with Heroku, it's an application platform that deals with all the messy bits of deployment. The command is as simple as git push heroku master
 -->




<!-- [jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[travis-skeleton]: https://github.com/ocaml/ocaml-travisci-skeleton
[amc-travis]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#setting-up-travis-ci
[anil-ppa]: https://launchpad.net/~avsm
[uni-for-all]: http://amirchaudhry.com/unikernels-for-everyone/
[deploy-key]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#deploying-your-unikernel
[decks-repo]: https://github.com/mirage/mirage-decks
[deck-slide]: https://github.com/mirage/mirage-decks/issues/49
[xen-installation]: http://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide

[decks-deploy]: https://github.com/mirage/mirage-decks-deployment
[hooks]: http://www.git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
[magnus-xen]: http://www.skjegstad.com/blog/2015/01/19/mirageos-xen-virtualbox/
[mir-notes-qa]: http://openmirage.org/wiki/weekly-2015-03-11#Qualityandtest
[jitsu-x]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment -->

