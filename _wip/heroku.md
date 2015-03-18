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


In my [Jekyll to Unikernel post][jekyll-unikernel], I described an automated workflow that would take your static website and turn it into a MirageOS unikernel — built via Travis CI — and then store that unikernel in a git repo, ready for deployment.  This post covers how things have progressed since then and the kind of automated, end-to-end workflows that we can achieve with unikernels.  

If you're already familiar with the above-linked post then it should be clear that this is simply a matter of writing a few more scripts and ensuring they're in the right place.  The rest of this post will go through a real-world example of such an automated system and then (just for fun) we'll consider what the possibilities could be if we extended that system using some of our [other tools][miso-post] — thus arriving at something very much like a Heroku for Unikernels\*.


### Standardised build scripts

Things have come a long way since the earlier post and most of our OCaml projects now use Travis for build and testing (and deployment).  So many that we recently put together an [OCaml Travis Skeleton][travis-skeleton], which means we don't have to manually keep the scripts in sync across all our repos. If you're familiar with the build scripts from [before][], then you can browse the new scripts and you'll see they're broadly similar.  In many cases you may well be able to depend on one or other of the scripts directly and for a handful of scenarios, you can simply fork and patch them to suit you (i.e. for Mirage unikernels).  We can do this because most of the effort involved is in the `mirage` tool itself and once that is installed, the rest of the build process becomes fairly straightforward. The complexity around secure keys was [covered last time][deploy-key], which allowed us to commit the final unikernel to a deployment repo.




### Automated deployment of unikernels

The deployment repo is where the previous story ended and a [number of people][uni-for-all] forged ahead and wrote about live deployments to AWS and also Linode.  
Many of these (understandably) involve a number of quite manual steps. It would be particularly useful to construct a set of scripts that can be fully automated, such that a `git push` to a repo will automatically run through building, testing, storing and *activating* a new unikernel.  We've done exactly this with some of our repos and 

TODO - We assume that we have a Xe machine that we've configured just as we wish ... 

#### The scripts for decks.openmirage.org

Decks is the repo that holds many of our slides, which we've presented at conferences and events over the years (I admit that I have yet to [add mine][decks-slides]).  It compiles to a unikernel, which can then serve those slides (and for maximum effect, we serve them from a cubieboard2).

TODO:
 - The build script in main repo tell Travis what to do (describe)
 - Need same for deployment machine 
 - now lets take a look at the deployment repo
 - see that there are bunch of scripts in the scripts folder
 - Each of these servers a different purpose (describe)


Currently the above setup deps on cron job but in principle we can set it up to work on a post-merge hook.

Note that *everything* is checked into version control. Right from scripts to completed artefacts. We even have a method of transmitting secure keys/data, over public systems. There is minimal config outside the code you've already seen, though we have bypassed the set up of a Xen machine (but that can be a topic for another time.)

### The march to immutable infrastructure

So here we have a rudimentary system for deplpying unikernels!  Apart from configuring the machines themselves, all is in git.  This only involves about XX lines of code because the VMs are trivially easy to manage. 

TODO - Describe why this is relevant to immutable infra (and why immutable infa is something to aspire to -- cf al the existing config mgmnt tools etc)

This is sufficient for me to declare it as the Heroku for unikernels but there's actually a lot more you could do. with such a system.  

TODO -- comments about unit tests and more functional tests? Easily managed in above infra.

### A complete end to end process -- a system at scale

This part of the post is somewhat more fanciful.  If we can consider that the end-to-end story exists a above, what kind of system could you build at scale? What if you could use the other tools that are available?


TODO - flesh out and flow all the following paras - they're just notes for now.

You go from writing code, to testing it via CI, to deploying it to a staging server for functional tests, and then pushing out into live deployment.  All of this with minimal interaction from you.  How can we we achieve this?  Because we don't have to shift around humongous blobs of stuff. Once the unikernel is built, the rest is almost trivial. You could simply deploy to production but lets add some tests.

TODO - Example of GoTestIt? Prob wanna scrap this. I once worked on a product called Go Test it, so it would be simple to test a new unikernel based site to ensure that the user flow was as expected. 


(Use of Jitsu) When it's deployed to production, it doesn't actually have to be *live*.  Thanks to tools like Jitsu, we can have the unikernels sitting in storage, consuming only the *actual* physical storage required (0% CPU and 0% Ram), and then summon them into existence *on demand*.  This allows *highly* efficient use of resources and is very different to the current economic model of the Cloud, where billing cycles are measured in hours and the overhead of a classic OS is constantly consuming resources.  This also uses less electricity and is a much more green solution than the repetition today.

(Widescale deployment?) You could even set up such a system to push the well-tested unikernels out onto embedded devices elsewhere (think IoT). In this way you only need a Minimal cloud infrastructure for your IoT service, in order to push new code out to end points, where the work is actually done (within a user's home). Think of the Goodnight Lamp, This can drastically reduce cost and any loss of the central service means end devices can keep working. (requires Signpost?).  Have a central location where devices can pick up updates from. Doesn't need to do any more than coordinating stuff and devices can work P2P. V cheap to run and make money from selling devices.


(Logging) Such a system can also have complete end-to-end logging (mention dog?). using Irmin. This means each event where a unikernel is created and how much it serves can be automatically logged and be *very* fine grained. Being able to split out such information also means the ability to provide analytics to the creators of those unikernels around performance and usage characteristics. 


(autoscaling - merge w Jitsu above) Just like Heroku, you can specify the maximum number of instances you want to run and your unikernels can scale up to that limit and then back down again. With something like Irmin, you may even be able to receive notifications about the type of incoming traffic and raise the limit if you so wish.  May be able to configure your embedded devices to scale up to the hosted provider if there's sufficient demand.

The beauty of this kind of system is that it embraces the ideas of immutable infrastructure and DevOps as all your services are simply manged right from the code. Everything is in version control *including* the built artefact. you don't need to be too concerned about recreating it as something of this size is trivial to move around, the same way source code is. 

TODO- xref with Nymote somehow.  The above infra is needed for those apps to provide a resilient service. etc 

All the above building blocks are open source and all you need is a Xen machine to deploy this code to!













\* If you're not familiar with Heroku, it's an application platform that deals with all the messy bits of deployment. The command is as simple as git push heroku master




[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[miso-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/
[travis-skeleton]: https://github.com/ocaml/ocaml-travisci-skeleton
[before]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#setting-up-travis-ci
[uni-for-all]: http://amirchaudhry.com/unikernels-for-everyone/
[deploy-key]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#deploying-your-unikernel
[deck-slide]: https://github.com/mirage/mirage-decks/issues/49

