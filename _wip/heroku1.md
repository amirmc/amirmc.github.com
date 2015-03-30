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


In my [Jekyll to Unikernel post][jekyll-unikernel], I described an automated workflow that would take your static website and turn it into a MirageOS unikernel — built via Travis CI — and then store that unikernel in a git repo for later deployment.  This post covers how things have progressed since then and the kind of automated, end-to-end workflows that we can achieve with unikernels.  

If you're already familiar with the above-linked post then it should be clear that this is simply a matter of writing a few more scripts and ensuring they're in the right place.  The rest of this post will go through a real-world example of such an automated system and then (just for fun) we'll consider what the possibilities could be if we extended that system using some of our [other tools][miso-post] — thus arriving at something very much like a Heroku for Unikernels\*.


## Standardised build scripts

Almost all of our OCaml projects now use Travis CI for build and testing (and deployment). There are so many libraries now that we recently put together an [OCaml Travis Skeleton][travis-skeleton], which means we don't have to manually keep the scripts in sync across all our repos — and fewer copy/paste/edits means fewer mistakes. 

If you're familiar with the build scripts from [last time][amc-travis], then you can browse the new scripts and you'll see they're broadly similar.  In many cases you may well be able to depend on one or other of the scripts directly and for a handful of scenarios, you can simply fork and patch them to suit you (i.e. for MirageOS unikernels).  We can do this because we've made it quick to set up an OCaml environment using an [Ubuntu PPA][anil-ppa]. The rest of the work is done by the `mirage` tool itself so once that's installed, the build process becomes fairly straightforward. The complexity around secure keys was [covered last time][deploy-key], which allowed us to commit the final unikernel to a deployment repo, so the remaining step is automating the deployment.


## Automated deployment of unikernels

Committing the unikernel to a deployment repo is where the previous post ended and a [number of people][uni-for-all] forged ahead and wrote about their experiences deploying onto AWS and Linode.  
Many of these deployments (understandably) involve a number of quite manual steps. It would be particularly useful to construct a set of scripts that can be fully automated, such that a `git push` to a repo will automatically run through the cycle of building, testing, storing and *activating* a new unikernel.  We've done exactly this with some of our repos and this post will talk through those scripts.

For this post, I'll assume you already have access to a working Xen machine. I won't be going into the details of how to set this up but there are [installation instructions][xen-installation] you can follow.  In our case, we've set up a dedicated host, which is how we deploy our unikernels.


### The scripts for decks.openmirage.org

[Decks][decks-repo] is the repo that holds many of our slides, which we've presented at conferences and events over the years (I admit that I have yet to [add mine][decks-slides]).  The repo compiles to a unikernel that can then serve those slides, as you see at [decks.openmirage.org][decks-site].  For maximum fun-factor, we usually run that unikernel from a cubieboard2 when giving talks.

The toolchain for this unikernel covers, build, store and deploy.  We'll recap the first two steps before discussing the final one.

**Build** — In the root of the decks repo, you'll notice the `.travis.yml` file, which sources the build script mentioned earlier. Building the unikernel proceeds according to the options in the build matrix.

**Store** — One of the combinations in the build matrix (configured for Xen), is intended for deployment.  When that unikernel is completed, an additional part of the script is triggered that pushes it into the deployment repo. 

#### Deployment scripts

For this stage, we have a new set of scripts that live in the [deployment repo][decks-deploy], alongside the unikernels.  If you look at the repo, you'll notice a folder called `scripts` within which you'll see four files.  

```bash
.
├── Makefile
├── README.md
├── scripts
│   ├── crontab
│   ├── deploy.sh
│   ├── install-hooks.sh
│   └── post-merge.hook
...
```

So on our Xen deployment machine, we clone the repo and set up the hooks.  Then a simple cronjob will perform `git pull` at regular intervals.  If a merge event occurs, then it means the repo has been updated and another script is triggered. That script removes the currently running unikernel and boots the latest version from the repo.  We'll explain what each of the files does below.

`Makefile` - On the first clone of the repo, `make install` will run `install-hooks.sh` to set things up appropriately. It's worth remembering that from this point on, the git repo on the deployment machine will not be identical to the repo on GitHub.

`install-hooks.sh` —  The first two lines simply ensure that the commands will be run from the root of the git repo.  The third line symlinks the `post-merge.hook` file into the appropriate place within the `.git` directory.  This is the folder where customized [git hooks][hooks] need to be placed in order to work.  The final line adds the file `scripts/crontab` to the deployment machine's list of cron jobs.


```bash
ROOT=$(git rev-parse --show-toplevel)   # obtain path to root of repo
cd $ROOT

# symlink the post-merge.sh file into the .git/hooks folder
ln -sf $ROOT/scripts/post-merge.hook $ROOT/.git/hooks/post-merge
crontab scripts/crontab                 # add to list of cron jobs
```

`crontab` — This file is a cronjob that sets up the Xen machine to perform a `git pull` on the deployment repo at regular intervals. Changing the file in the repo will cause it to be changed on the deployment machine (via the deploy script).

`post-merge.hook` — Since we've already run the Makefile, this file is symlinked from the appropriate place on the deployment machine.  When a `git pull` results in new commits being downloaded and merged, then this script is triggered immediately afterwards.  In this case, it just executes the `deploy.sh` script.

```bash
ROOT=$(git rev-parse --show-toplevel)  # obtain path to root of repo
exec $ROOT/scripts/deploy.sh           # execute the deploy script
```

`deploy.sh` — This is where the work actually happens and you'll notice that there actually isn't much to do!  I've commented in the code below to explain what's going on.

```bash
VM=mir-decks
XM=xm

ROOT=$(git rev-parse --show-toplevel)
cd $ROOT

crontab scripts/crontab     # Update cron scripts

# Identify the latest build in the repo and then use
# the generic Xen config script to construct
# a specific file for this unikernel. Essentially,
# 'sed' just does a find/replace on two elements and
# the output is written to a file.
#
KERNEL=$ROOT/xen/`cat xen/latest`
sed -e "s,@VM@,$VM,g; s,@KERNEL@,$KERNEL/$VM.xen,g" \
    < $XM.conf.in \
    >| $KERNEL/$XM.conf

# Move into the folder with the latest unikernel.
# Remove any uncompressed Xen images found there
# (since we may be starting a rebuilt unikernel).
# Unzip the compressed unikernel.
#
cd $KERNEL
rm -f $VM.xen
bunzip2 -k $VM.xen.bz2

# Instruct Xen to remove the currently running
# unikernel and then start up the new one we
# just unzipped.
#
sudo $XM destroy $VM || true
sudo $XM create $XM.conf
```

That's all there is to it!  Of course, this arrangement isn't perfect and there are number of things we could improve.  For example, it depends on a cron job, which means it may take a while before a new unikernel is live. Replacing this with a webhook could be an improvement.  The scripts will also redeploy the *current* unikernel, even if the only change is to the crontab schedule.  Some extra work in the deploy script, using some git tools, might work around this. 

Despite these minor issues, we do have a completely end-to-end workflow that takes us all the way from pushing some new changes to deploying a new unikernel.  An additional feature is that *everything* is checked into version control. Right from the scripts to completed artefacts (including a method of transmitting secure keys/data, over public systems). 

There is minimal work done outside the code you've already seen, though there is obviously some effort involved in setting the Xen machine, but that's a topic for another time (as a quick hint, you could simply use [Virtualbox VM with Xen][magnus-xen] if you wanted to text out this entire toolchain). 

Overall, we've only added around 20 lines of code to the initial 50 or so that we use for the Travis CI build.  So for less than 100 lines of code, we have a complete end-to-end system that can take a MirageOS project from a `git push`, all the way through to a live deployment.  This close enough for me to declare it as a 'Heroku for unikernels' but obviously, there's much more we can do with such a system.


=====


<!-- 

This part of the post is somewhat more fanciful.  If we can consider that the end-to-end story exists a above, what kind of system could you build at scale? What if you could use the other tools that are available?
 -->

TODO - flesh out and flow all the following paras - they're just notes for now.

#### Testing frameworks

In our current system, if the unikernel builds appropriately then we simply assume it can be deployed to production. Just fire and forget!  Of course, it would be much better to introduce a more thorough testing regimen. This would include running unit tests as part of the build and more functional/systems/stress testing on the unikernel before permitting deployment. Indeed, various libraries in the MirageOS project are already moving towards this model (e.g see the [notes][mir-notes-qa]) for links).  Once the 'backbone' of the toolchain is in place, it's easier to see where it can be extended and how.  

With the above model, you can go from writing code, to testing it via CI, to deploying it to a staging server for functional tests, and finally pushing it out into live deployment.  All of this can be done with a few additional scripts and minimal interaction from the developer.  We can achieve this because we don't have to concern ourselves with large blobs of code, multiple different systems and keeping environments in sync. Once we've built the unikernel, the rest almost becomes trivial. 

<!-- TODO - In the case of Mirage Decks, we could add testing of the network stack, etc etc -->

<!-- TODO - Example of GoTestIt? Prob wanna scrap this. I once worked on a product called Go Test it, so it would be simple to test a new unikernel based site to ensure that the user flow was as expected.  -->

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
