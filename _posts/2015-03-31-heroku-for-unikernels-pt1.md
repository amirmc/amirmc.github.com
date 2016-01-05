---
layout: post
title: "Towards Heroku for Unikernels: Part 1 - Automated deployment"
author: Amir Chaudhry
date: 2015-03-31 14:30:00
tags: [code, docs, essay, ocaml, ocamllabs, unikernel, mirage, miso]
description:
shorturl: http://bit.ly/1C1DG8y
---
{% include JB/setup %}

In my [Jekyll to Unikernel post][jekyll-unikernel], I described an automated
workflow that would take your static website, turn it into a MirageOS
unikernel, and then store that unikernel in a git repo for later deployment. 
Although it was written from the perspective of a static website, the process
was applicable to any MirageOS project.
This post covers how things have progressed since then and the kind of
automated, end-to-end deployments that we can achieve with unikernels.  

If you're already familiar with the above-linked post then it should be clear
that this will involve writing a few more scripts and ensuring
they're in the right place.  The rest of this post will go through a real
world example of such an automated system, which we've set up for building and
deploying the unikernel that serves our slide decks — [mirage-decks][].  Once
you've gone though this post, you should be able to recreate such a workflow
for your own needs. In Part 2 of this series I'll build on this post and
consider what the possibilities could be if we extended the system using
some of our [other tools][miso-post] — thus arriving at something very much
like our own Heroku for Unikernels.

[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[mirage-decks]: https://github.com/mirage/mirage-decks
[miso-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/


### Standardised build scripts

Almost all of our OCaml projects now use Travis CI for build and testing (and
deployment). In fact, there are so many libraries now that we recently put
together an [OCaml Travis Skeleton][travis-skeleton], which means we don't
have to manually keep the scripts in sync across all our repos — and fewer
copy/paste/edits means fewer mistakes. 

If you're familiar with the build scripts from [last time][amc-travis], then
you can browse the new scripts and you'll see that they're broadly similar. 
In many cases you may well be able to depend on one or other of the scripts
directly and for a handful of scenarios, you can fork and patch them to
suit you (i.e. for MirageOS unikernels).  We can do this because we've made it
quick to set up an OCaml environment using an [Ubuntu PPA][anil-ppa]. The rest
of the work is done by the `mirage` tool itself so once that's installed, the
build process becomes fairly straightforward. The complexity around secure
keys was also [covered last time][deploy-key], which allowed us to commit the
final unikernel to a deployment repo.  That means the remaining step is
to automate the deployment itself.

[travis-skeleton]: https://github.com/ocaml/ocaml-travisci-skeleton
[amc-travis]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#setting-up-travis-ci
[anil-ppa]: https://launchpad.net/~avsm
[deploy-key]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines#deploying-your-unikernel


### Automated deployment of unikernels

Committing the unikernel to a deployment repo is where the previous post ended
and a [number of people][uni-for-all] forged ahead and wrote about their
experiences deploying onto AWS and Linode.  Many of these deployments
(understandably) involve a number of quite manual steps. It would be
particularly useful to construct a set of scripts that can be fully automated,
such that a `git push` to a repo will automatically run through the cycle of
building, testing, storing and *activating* a new unikernel.  We've done
exactly this with some of our repos and this post will talk through those
scripts.  

[uni-for-all]: http://amirchaudhry.com/unikernels-for-everyone/


#### The deployment options — Xen or \*nix

MirageOS unikernels can currently be built for Xen and Unix backends.  This is
a straightforward step and typically the build matrix is already set up to
test that both of them build as expected. For this post, I've only considered
the Xen backend as that's our chosen deployment method but it would be equally
feasible to deploy the unix-based unikernels onto a \*nix machine in much the
same way. 
In this sense, you get to choose whether you want to deploy the unikernels
onto a [Hypervisor][hyp-class] (for isolation and security) or whether running
them as unix-processes better suits your needs. 
<!-- If you step back and think about what this means, it's *almost*
like considering the
[difference between a Type-1 and Type-2 hypervisor][hyp-class] and selecting
between them. -->
The unikernel approach means that *both* options are open to
you, with little more than a command-line flag between them.

In terms of the deployment machines there are several options to consider. The
most obvious is to set up a dedicated host, where you have full access to the
machine and can [install Xen][xen-installation].  Another is to have a machine
running on EC2 and [create scripts][mindy-ec2] to deal with unikernels. You
could also build and deploy onto [Xen on the Cubieboard2][cubie]. If you'd
rather test out the complete system first, you could set up an appropriate
[machine in Virtualbox][magnus-xen] to work with.

For our workflow, we use Xen unikernels which we deploy to a dedicated host. 
For the sake of brevity, I won't go into the details of how to set up
the machine but you can follow the instructions linked above.

[hyp-class]: http://en.wikipedia.org/wiki/Hypervisor#Classification
[xen-installation]: http://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide
[mindy-ec2]: http://somerandomidiot.com/blog/2014/08/19/i-am-unikernel/
[cubie]: http://openmirage.org/wiki/xen-on-cubieboard2
[magnus-xen]: http://www.skjegstad.com/blog/2015/01/19/mirageos-xen-virtualbox/

#### The scripts for decks.openmirage.org

[Decks][decks-repo] is the source repo that holds many of our slides, which
we've presented at conferences and events over the years (I admit that I have
yet to [add mine][decks-slide]).  The repo compiles to a unikernel that can
then serve those slides, as you see at [decks.openmirage.org][decks-site]. For
maximum fun-factor, we usually run that unikernel from a Cubieboard2 when
giving talks.

![mirage-decks-on-cubieboard](http://amirchaudhry.com/images/singles/mirage-cubieboard.jpg)

The toolchain for this unikernel includes build, store and deploy.  We'll
recap the first two steps before going through the final one.

**Build** — In the root of the decks source repo, you'll notice the
`.travis.yml` file, which fetches the standard build script mentioned earlier.
Building the unikernel proceeds according to the options in the build matrix. 

{% highlight yaml %}
language: c
install: wget https://raw.githubusercontent.com/ocaml/ocaml-travisci-skeleton/master/.travis-mirage.sh
script: bash -ex .travis-mirage.sh
env:
  matrix:
  - OCAML_VERSION=4.02 MIRAGE_BACKEND=unix MIRAGE_NET=socket
  - OCAML_VERSION=4.02 MIRAGE_BACKEND=unix MIRAGE_NET=direct
  - OCAML_VERSION=4.02 MIRAGE_BACKEND=xen
    MIRAGE_ADDR="46.43.42.134" MIRAGE_MASK="255.255.255.128" MIRAGE_GWS="46.43.42.129"
    DEPLOY=1
  global:
  - secure: ".... encrypted data ...."
  - secure: ".... encrypted data ...."
  - secure: ".... encrypted data ...."
  ...
{% endhighlight %}

In this case, two builds occur for Unix and one for Xen with different
parameters being used for each.  If you look at the
[actual travis file][travis-yml], you'll notice there are 26 lines of
encrypted data.  This is how we pass the deployment key to Travis CI, so that
it has push access to the *separate* [mirage-decks-deployment][decks-deploy]
repo.  You can read the section in the previous post to see how we
[send Travis a private key][decks-deploy].

**Store** — One of the combinations in the build matrix (configured for Xen),
is intended for deployment.  When that unikernel is completed, an additional
part of the script is triggered that pushes it into the deployment repo. 

[decks-repo]: https://github.com/mirage/mirage-decks
[decks-slide]: https://github.com/mirage/mirage-decks/issues/49
[decks-site]: http://decks.openmirage.org
[travis-yml]: https://github.com/mirage/mirage-decks/blob/master/.travis.yml
[decks-deploy]: https://github.com/mirage/mirage-decks-deployment
[deploy-key]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/#sending-travis-a-private-ssh-key

#### Deployment scripts

After the 'build' and 'store' steps above, we have a
[deployment repository][decks-deploy] with a collection of Xen unikernels. For
this stage, we have a new set of scripts that live in this repo alongside those
unikernels. Specifically, you'll notice a folder called `scripts` that
contains four files.  

{% highlight bash %}
.
├── Makefile
├── README.md
├── scripts
│   ├── crontab
│   ├── deploy.sh
│   ├── install-hooks.sh
│   └── post-merge.hook
...
{% endhighlight %}

A quick summary of the setup is that we clone the repo onto our deployment
machine and install some hooks there.  Then a simple cronjob will perform
`git pull` at regular intervals.  If a merge event occurs, then it means the
repo has been updated and another script is triggered. That script removes the
currently running unikernel and boots the latest version from the repo.  It's
fairly straightforward and I'll explain what each of the files does below.

**Makefile** - After cloning the repo, run `make install`.  This will trigger
`install-hooks.sh` to set things up appropriately. It's worth remembering that
from this point on, the git repo on the deployment machine will not be
identical to the deployment repo on GitHub.

**install-hooks.sh** —  The first two lines ensure that the commands
will be run from the root of the git repo.  The third line symlinks the
`post-merge.hook` file into the appropriate place within the `.git` directory.
This is the folder where customized [git hooks][hooks] need to be placed in
order to work.  The final line adds the file `scripts/crontab` to the
deployment machine's list of cron jobs.

{% highlight bash %}
ROOT=$(git rev-parse --show-toplevel)  # obtain path to root of repo
cd $ROOT

# symlink the post-merge.sh file into the .git/hooks folder
ln -sf $ROOT/scripts/post-merge.hook $ROOT/.git/hooks/post-merge
crontab scripts/crontab                # add to list of cron jobs
{% endhighlight %}

**crontab** — This file is a cronjob that sets up the deployment machine to
perform a `git pull` on the deployment repo at regular intervals. Changing the
file in the repo will ultimately cause it to be updated on the deployment
machine (cf. `deploy.sh`). At the moment, it's set to run every 11 minutes.

{% highlight bash %}
*/11 * * * * cd $HOME/mirage-decks-deployment && git pull
{% endhighlight %}

**post-merge.hook** — Since we've already run the Makefile, this file is
symlinked from the appropriate place on the deployment machine's copy of the
repo.  When a `git pull` results in new commits being downloaded and merged,
then this script is triggered immediately afterwards.  In this case, it just
executes the `deploy.sh` script.

{% highlight bash %}
ROOT=$(git rev-parse --show-toplevel)  # obtain path to root of repo
exec $ROOT/scripts/deploy.sh           # execute the deploy script
{% endhighlight %}

**deploy.sh** — This is where the work actually happens and you'll notice that
there really isn't much to do!  I've commented in the code below to explain
what's going on.

{% highlight bash %}
VM=mir-decks
XM=xm

ROOT=$(git rev-parse --show-toplevel)
cd $ROOT

crontab scripts/crontab     # Update cron scripts

# Identify the latest build in the repo and then use
# the generic Xen config script to construct a
# specific file for this unikernel. Essentially,
# 'sed' just does a find/replace on two elements and
# the result is written to a new file.
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
{% endhighlight %}

At this point, we now have a complete system!
Of course, this arrangement isn't perfect and
there are number of things we could improve.  For example, it depends on a
cron job, which means it may take a while before a new unikernel is live.
Replacing this with something triggered on a webhook could be an improvement,
but it does mean exposing an end-point to the internet.  The scripts will also
redeploy the *current* unikernel, even if the only change is to the crontab
schedule.  Some extra work in the deploy script, using some git tools, might
work around this. 

Despite these minor issues, we do have a completely end-to-end workflow that
takes us all the way from pushing some new changes to deploying a new
unikernel!  An additional feature is that *everything* is checked into version
control. Right from the scripts to completed artefacts (including a method of
transmitting secure keys/data, over public systems). 

There is minimal work done outside the code you've already seen, though there
is obviously some effort involved in setting up the deployment machine. 
However, as mentioned earlier, you could either use the unix-based unikernels
or experiment with [Virtualbox VM with Xen][magnus-xen] just to test out this
entire toolchain. 

Overall, we've only added around 20 lines of code to the initial 50 or so that
we use for the Travis CI build.  So for *less than 100 lines of code*, we have
a *complete* end-to-end system that can take a MirageOS project from a
`git push`, all the way through to a live deployment.  

[hooks]: http://www.git-scm.com/book/en/v2/Customizing-Git-Git-Hooks


### Fleshing out the backbone

In our current system, if the unikernel *builds* appropriately then we just
assume it's ok to deploy to production. Fire and forget! What could
possibly go wrong!  Of course, this is a somewhat naive approach and for any
critical system it would be better to hook in some additional things.


#### Testing frameworks

One obvious improvement would be to introduce a more thorough testing regimen,
which would include running unit tests as part of the build. Indeed, various
libraries in the MirageOS project are already moving towards this model
(e.g see the [notes][mir-notes-qa] for links).  

It's even possible to go beyond unit tests and introduce more
functional/systems/stress testing on the complete unikernel before permitting
deployment.  This would help to surface any wider issues as services interact
and we could even simulate network conditions — achieving something like
'staging on steroids'.  

[mir-notes-qa]: http://openmirage.org/wiki/weekly-2015-03-11#Qualityandtest


#### Logging and notifications

The scenario we have above also assumes that things work smoothly and nobody
needs to know anything.  It would be useful to hook in some form of logging
and reporting, such that when a new unikernel is deployed a notification can
be sent/stored somewhere. In the short term, there are likely existing tools
and ways of doing this so it would be a matter of putting them together.


#### Looking ahead

Overall, with the above model, we can easily set up a system where we go from
writing code, to testing it via CI, to deploying it to a staging server for
functional tests, and finally pushing it out into live deployment.  All of
this can be done with a few additional scripts and minimal interaction from
the developer.  We can achieve this because we don't have to concern ourselves
with large blobs of code, multiple different systems and keeping environments
in sync. Once we've built the unikernel, the rest almost becomes trivial. 

This is close enough for me to declare it as a 'Heroku for unikernels' but
obviously, there's much more we can (and should) do with such a system. If we
extrapolate *just a little* from where we are now, there are a range of
exciting possibilities to consider in terms of automation, scalability and
distributed systems.  Especially if we incorporate other aspects of the
[toolstack we're working towards][miso-post].  

[Part 2][pt2] of this series is where I'll consider these possibilities, which will
be more speculative and less constrained.  It will cover the kinds of systems
we can create once the tools are more mature and will touch on ideas around
hyper-elastic clouds, embedded systems and what this means for the concept of
immutable infrastructure.

Since we already have the 'backbone' of the toolchain in place, it's easier to
see where it can be extended and how.


*Edit: The second part of this series is now up -
"[Self Scaling Systems][pt2]"*

[pt2]: http://amirchaudhry.com/heroku-for-unikernels-pt2/

*Edit2: discuss this post on [devel.unikernel.org][discuss]*

[discuss]: http://devel.unikernel.org/t/towards-heroku-for-unikernels/27/1


****

<p class="footnote">
Thanks to Anil Madhavapeddy and Thomas Leonard for comments on an earlier
draft and Richard Mortier for his work on the deployment toolchain.
</p>
<!--
[jitsu-repo]: https://github.com/MagnusS/jitsu
[jitsu-x]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment
[sp-post]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/#signpost
[cron-conf]: http://en.wikipedia.org/wiki/Cron#Configuration_file
-->
