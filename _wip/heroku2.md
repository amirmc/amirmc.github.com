---
layout: post
title: "Towards Heroku for Unikernels: Part 2 - Self Scaling Systems"
author: Amir Chaudhry
date: 2015-04-03 15:30:00
tags: [essay, mirage, miso, nymote, ocaml, ocamllabs, unikernel]
description:
shorturl: http://bit.ly/19xH2K3
---
{% include JB/setup %}


In the [previous post][heroku1] I described the continuous end-to-end system that we've set up for some of the MirageOS projects — automatically going from a `git push` all the way to live deployment, with everything under version-control.

Everything I described previously already exists and you can set up the workflow for yourself, the same way many others have done with the Travis CI scripts for testing/build.  However, there are a range of exciting possibilities to consider if we're willing to extrapolate *just a little* from the tools we have right now.  The rest of this post explores these ideas and considers how we might extend our system.  

Previously, we had finished the backbone of the workflow and I discussed a few ideas about how we should flesh it out — namely more testing and some form of logging/reporting.  There's substantially more we could do when we consider how lean and nimble unikernels are, especially if we speculate about the systems we could create as our [toolstack][miso-post] matures.  A couple of things immediately come to mind.  

The first is the ability to boot a unikernel only when it is required, which opens up the possibility of highly-elastic infrastructure.  The second is the ease with which we can push, pull or otherwise distribute unikernels throughout a system, allowing new forms of deployment to both cloud and embedded systems. We'll consider these in turn and see where they take us, comparing with the current 'mirage-decks' deployment I described in [Part 1][heroku1].

[heroku1]: http://amirchaudhry.com/heroku-for-unikernels-pt1/
[miso-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/


## Demand-driven clouds

The way cloud services are currently provisioned means that you may have services operating and consuming resources (CPU, memory, etc), even when there is no demand for them. It would be significantly more efficient if we could just *activate* a service when required and then shut it down again when the demand has passed.  In our case, this would mean that when a unikernel is 'deployed to production', it doesn't actually have to be *live* — it merely needs to be ready to boot when demand arises.  With tools like [Jitsu][jitsu-repo] (Just-In-Time Summoning of Unikernels), we can work towards this kind of architecture. 

### Summon when required

Jitsu allows us to have unikernels sitting in storage then 'summon' them into existence.  This can occur in response to an incoming request and with *no discernible latency* for the requester. While unikernels are inactive, they consume only the actual physical storage required and thus do not take up any CPU cycles, nor RAM, etc. This means that more can be achieved with fewer resources and it would significantly improve things like utilization rates of hardware and power efficiency.

In the case of the [decks.openmirage.org][decks-site] unikernel that I discussed last time, it would mean that the site would only come online if someone had requested it and would shut down again afterwards.  

In fact, we've already been working on this kind of system and [Jitsu will be presented at NSDI][jitsu-nsdi] in Oakland, California this May. <!-- ([PDF][jitsu-paper]) -->In the spirit of looking ahead, there's more we could do.


### Hyper-elastic scaling ###

At the moment, Jitsu lets you set up a system where unikernels will boot in response to incoming requests.  This is already pretty cool but we could take this a step further.  If we can boot unikernels on demand, then we could use that to build a system which can automate the *scale-out* of those services to match demand.  We could even have that system work across multiple machines, not just one host.  So how would all this look in practice for 'mirage-decks'?

#### Auto-scaling and dispersing our slide decks ###

Our previous toolchain automatically boots the new unikernel as soon as it is pulled from the git repo.  Using Jitsu, our deployment machine would pull the unikernel but leave it in the repo — it would only be activated when someone requests access to it.  Most of the time, it may receive no traffic and therefore would remain 'turned off' (let's ignore webcrawlers for now). When someone requests to see a slide deck, the unikernel would be booted and respond to the request.  In time it can be turned off again, thus freeing resources.  So far, so good.

Now let's say that a certain slide deck becomes *really* popular (e.g. posted to HackerNews or Reddit).  Suddenly, there are *many* incoming requests and we want to be able to serve them all.  We can use the one unikernel, on one machine, until it is unable to handle the load efficiently.  At this point, the system can create new copies of that unikernel and automatically balance across them. These unikernels don't need to be on the same host and we should be able to spin them up on different machines.

To stretch this further, we can imagine coordinating the creation of those new unikernels nearer the *source* of that demand, for example starting off on a European cloud, then spinning up on the East coast US and finally over to the West coast of the US.  All this could happen seamlessly and the process can continue until the demand passes or we reach a predefined limit — after all, given that we pay for the machines, we don't really want to turn a Denial of *Service* into a Denial of *Credit*. 

After the peak, the system can automatically scale back down to being largely dormant — ready to react when the next wave of interest occurs.

#### Can we actually do this? ####

If you think this is somewhat fanciful, that's perfectly understandable — as I mentioned previously, this post is very much about *extrapolating* from where the tools are right now.  However, unikernels actually make it very easy to run quick experiments which indicate that we could iterate towards what I've described.  

A recent and somewhat extreme experiment ran a [unikernel VM for *each URL*][magnus-url-vm].  Every URL on a small static site was served from its own, self-contained unikernel, complete with it's own web server (even the 'rss.png' icon was served separately).  You can read the post to see how this was done and it also led to an interesting [discussion][list-vm-disc] on the mailing list (e.g. if you're only serving a single item, why use a web server at all?).  Of course, this was just an *experiment* but it demonstrates what is possible now and how we can iterate, uncover new problems, and move forward.  One such question is how to automatically handle networking during a scale-out, and this is an area were tools like [Signpost][sp-post] can be of use.

Overall, the model I've described is quite different to the way we currently use the cloud, where the overhead of a classic OS is constantly consuming resources.  Although it's tempting to stick with the same frame of reference we have today we should recognise that the current model is inextricably intertwined with the traditional software stacks themselves.  Unikernels allow completely new ways of creating, distributing and managing software and it takes some thought in order to fully exploit their benefits. 

For example, having a demand-driven system means we can deliver more services from just the one set of physical hardware — because not all those services would be consuming resources at the same time.  There would also be a dramatic impact on the economics, as billing cycles are currently measured in hours, whereas unikernels may only be active for seconds at a time.  In addition to these benefits, there are interesting possibilities in how such scale-outs can be coordinated across *different* devices.

[jitsu-repo]: https://github.com/MagnusS/jitsu
[decks-site]: http://decks.openmirage.org
[jitsu-nsdi]: https://www.usenix.org/conference/nsdi15/technical-sessions/presentation/madhavapeddy
[jitsu-paper]: http://anil.recoil.org/papers/2015-nsdi-jitsu.pdf
[magnus-url-vm]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment/
[list-vm-disc]: http://lists.xenproject.org/archives/html/mirageos-devel/2015-03/msg00110.html
[sp-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/#signpost


## Hybrid deployments

As we move to a world with more connected devices, the software and services we create will have to operate across both the cloud and embedded systems. There have been many names for this kind of distributed system, ranging from ubiquitous computing to dust clouds and the 'Internet of Things' but they all share the same idea of running software at the edges of the network (rather than just cloud deployments).

When we consider the toolchain we already have, it's not much of a stretch to imagine that we could also build and store a unikernel for ARM-based deployments.  Those unikernels can be deployed onto embedded devices and currently we target the [Cubieboard2][cubie].  

<!-- For the example of our static websites, it would be straightforward to serve them from cubieboards that reside from our homes, thus further minimising the costs to run such infrastructure.  However, they could be configured such that if demands begins to peak, then an automated scale-out can occur from the Cubieboard onto the public cloud instead.   -->

<!-- You could even set up such a system to push the well-tested unikernels out onto embedded devices elsewhere (think IoT). In this way you only need a Minimal cloud infrastructure for your IoT service, in order to push new code out to end points, where the work is actually done (within a user's home). Think of the Goodnight Lamp, This can drastically reduce cost and any loss of the central service means end devices can keep working. (requires Signpost?).  Have a central location where devices can pick up updates from. Doesn't need to do any more than coordinating stuff and devices can work P2P. V cheap to run and make money from selling devices. -->

We could make such a system smarter. Instead of having the edge devices constantly polling for updates, our deployment process could directly *push* the new unikernels out to them. Since these devices are likely to be behind NATs and firewalls, tools like [Signpost][sp-post] could deal with the issue of secure connectivity. In this way, the centralized deployment process remains as a coordination point, whereas most of the workload is dealt with by the devices the unikernels are running on.  If a central machine happens to be unavailable for any reason, the edge-devices would continue to function as normal.  This kind of arrangement would be ideal for Internet-of-Things style deployments, where it could reduce the burden on centralised infrastructure while still enabling continuous deployment.

In this scenario, we could serve the traffic for 'mirage-decks' from a unikernel on a Cubieboard2, which could further minimise the cost of running such infrastructure.  It could be configured such that if demand begins to peak, then an automated scale-out can occur from the Cubieboard2 directly out onto the public cloud and/or *other Cubieboards*. Thus, we can still make use of third-party resources but only when needed and of the kind we desire.  Of course, running a highly distributed system leads to other needs.

[cubie]: http://openmirage.org/wiki/xen-on-cubieboard2


## Remember all the things

When running services at scale it becomes important to track the activity and understand what is taking place in the system. In practice, this means logging the activity of the unikernels, such as when and where they were created and how they perform.  This becomes even more complex for a distributed system.

If we also consider the logging needs of a highly-elastic system, then another problem emerges.  Although scaling up a system is straightforward to conceptualise, scaling it back *down* again presents new challenges.  Consider all the additional logs and data that have been created during a scale-out — all of that history needs to be merged back together as the system contracts. To do that properly, we need tools designed to manage distributed data structures, with a consistent notion of merges.

[Irmin][irmin-post] addresses these kinds of needs and it enables a style of programming very similar to the Git workflow, where distributed nodes fork, fetch, merge and push data between each other.  Building an end-to-end logging system with Irmin would enable data to be managed and merged across different nodes and keep track of activity, especially in the case of a scale down. The ability to capture such information also means the opportunity to provide analytics to the creators of those unikernels around performance and usage characteristics. 

The use of Irmin wouldn't be limited to logging as the unikernels themselves could use it for managing data in lieu of other file systems.  I'll refrain from extrapolating too far about this particular tool as it's still under rapid development and we'll write more as it matures.

<!-- With something like [Irmin][irmin-post], you may even be able to receive notifications about the type of incoming traffic and raise the limit if you so wish.  May be able to configure your embedded devices to scale up to the hosted provider if there's sufficient demand. -->

[irmin-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/#irmin


## On immutable infrastructure

You may have noticed that one of the benefits of the unikernel approach arises because the artefacts themselves are not altered once they're created. 
This is in line with the recent resurgence of ideas around 'immutable infrastructure'.  Although there isn't a precise definition of this, the approach is that machines are treated as replaceable and can be regularly re-provisioned with a known state.  Various tools help the existing systems to achieve this but in the case of unikernels, everything is already under version control, which makes managing a deployment much easier.

As our approach is already compatible with such ideas, we can take it a step further.  Immutable infrastructure essentially means the artefact produced *doesn't matter*. It's disposable because we have the means to easily recreate it.  In our current example, we still ship the unikernel around.  In order to make this 'fully immutable', we'd have to know the state of all the packages and code used when *building* the unikernel. That would give us a complete manifest of which package versions were pulled in and from which sources.  Complete information like this would allow us to recreate any given unikernel in a highly systematic way.  If we can achieve this, then it's the manifest which generates everything else that follows.

In this world-view, the unikernel itself becomes something akin to caching. You use it because you don't want to rebuild it from source — even though unikernels are quicker to build than a whole OS/App stack.  For more security critical applications, you may want to be assured of the code that is pulled in, so you examine the manifest file before rebuilding for yourself. This also allows you to pin to specific versions of libraries so that you can explicitly adjust the dependencies as you wish.  So how do we encode the manifest?  This is another area where Irmin can help as it can keep track of the state of package history and can recreate the environment that existed for any given build run.  That build run can then be recreated elsewhere without having to manually specify package versions.  

There's a lot more to consider here as this kind of approach opens up new avenues to explore. For the time being, we can recognise that the unikernel approach lends itself to the achieving immutable infrastructure.


## What happens next?

As I mentioned at the beginning of this post, most of what I've described is speculative. I've deliberately extrapolated from where the tools are now so as to provoke more thoughts and discussion about how this new model can be used in the wild.  Some of the things we're already working towards but there are many other uses that may surprise us — we won't know until we get there and experimenting is half the fun.

We'll keep marching on with more libraries, better tooling and improving quality.  What happens with unikernels in the rest of 2015 is largely up to the wider ecosystem.  

That means you.


****

<p class="footnote">
Thanks to Thomas Gazagnaire and Richard Mortier for comments on an earlier draft.
</p>

<!-- TODO- xref with Nymote somehow.  The above infra is needed for those apps to provide a resilient service. etc -->

