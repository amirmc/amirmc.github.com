---
layout: post
title: "Unikernels at PolyConf!"
author: Amir Chaudhry
date: 2015-07-04 13:00:00
tags: [ocaml, mirage, irmin, ocamllabs]
description:
shorturl: http://bit.ly/1fatBTF
---
{% include JB/setup %}

***Updated: 14 July (see below)***

<script async class="speakerdeck-embed" data-id="1076a457408d42d7bb9da27dd88b68c8" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

Above are my slides from a talk at PolyConf this year.  I was originally going
to talk about the [MISO][] tool stack and personal clouds (i.e. how we'll
build [towards Nymote][nymote]) but after some informal conversations with
other speakers and attendees, I thought it would be *way* more useful to focus
the talk on unikernels themselves — specifically, the 'M' in MISO.  As a
result, I ended up completely rewriting all my slides!  Since I pushed this
post just before my talk, I hope that I'm able to stick to the 30min time slot
(I'll find out very soon).

In the slides I mention a number of things we've done with MirageOS so I
thought it would be useful to list them here.  If you're reading this at the
conference now, please do give me feedback at the end of my talk!

- *Thomas' Hello world and REST service*, ["My First Unikernel"][tom-unikernel]
- *Magnus on* ["A unikernel experiment: A VM for every URL"][magnus]
- *Mindy on ["I Am Unikernel (and So Can You!)"][mindy-overview]*
- *The [mirage-skeleton repo][mir-skeleton], which has a number of examples*

- *My previous posts (referred to in the talk)*
  - ["From Jekyll site to Unikernel in fifty lines of code."][jekyll-unikernel]
  - ["Towards Heroku for Unikernels"][heroku-unikernel]
  - ["The Bicoin Piñata!"][pinata]
  - ["Introducing Nymote"][nymote-intro]

To get involved in the development work, please do join the
[MirageOS devel list][mir-list] and try out some of the examples for
yourselves!

### Update — 14 July

The video of the talk is now available and it's embedded below. Overall, the
talk seemed to go well and there was enough time for questions.

At the end of the talk, I asked people to give me feedback and shared a URL,
where I had a very short form. I had 21 responses with a rating of
**4.52/5.00**.  I'm quite pleased with this and the feedback was also useful.
In a nutshell, the audience seemed to really appreciate the walkthrough (which
encourages me to make some screencasts).  There was one comment that I didn't
do enough justice to the security benefits.  Specifically, I could have drawn
more reference to the OCaml TLS work, which prevents bugs like heartbleed.
Security is definitely one of the key benefits of MirageOS unikernels (see
[here][why ocaml-tls]), so I'll do more to emphasise that next time.

Here's the video and I should mention that the slides seem to be a few
seconds ahead. You'll notice that I've left the feedback link live, too. If
you'd like to tell me what you think of the talk, please do so! There are some
additional comments at the end of this post.

<div class="flex-video">
    <iframe width="540" height="304" src="https://www.youtube.com/embed/zi2TdMXs7Cc" frameborder="0" allowfullscreen></iframe>
</div>

<!-- I find it a little awkward watching myself give a talk, especially when I
recognise things I should have said (or obvious mistakes). 
 -->
Finally, here are few things I should clarify:

- Security is one of the critical benefits, which is why we need new systems
for personal clouds (rather than legacy stacks).
- We still get to use all the existing tools for storage (e.g. EBS), it
doesn't have to be Irmin.
- The [Introducing Irmin][irmin-intro] post is the one I was trying to point
an audience member at.
- When I mention the DNS server, I said it was 200MB when I actually meant
200KB. More info in the [MirageOS ASPLOS paper][mirage-paper].
- I referred to the ["HAT Project"][hat] and you should also check out the
["Databox paper"][databox].
- A summary of other unikernel approaches is also [available][7-unikernels].

[MISO]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/
[nymote]: http://nymote.org/blog/2013/introducing-nymote/
[mindy-overview]: http://www.somerandomidiot.com/blog/2014/08/19/i-am-unikernel/
[tom-unikernel]: http://roscidus.com/blog/blog/2014/07/28/my-first-unikernel/ 
[magnus]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment/
[pinata]: http://amirchaudhry.com/bitcoin-pinata/
[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[heroku-unikernel]: http://amirchaudhry.com/heroku-for-unikernels-pt1
[nymote-intro]: http://nymote.org/blog/2013/introducing-nymote/
[mir-skeleton]: https://github.com/mirage/mirage-skeleton
[mir-list]: http://lists.xenproject.org/cgi-bin/mailman/listinfo/mirageos-devel
[hat]: http://hubofallthings.com
[databox]: http://mor1.github.io/publications/pdf/aarhus15-databox.pdf

[why ocaml-tls]: https://mirage.io/blog/why-ocaml-tls
[irmin-intro]: https://mirage.io/blog/introducing-irmin
[mirage-paper]: http://nymote.org/docs/2013-asplos-mirage.pdf
[7-unikernels]: http://www.linux.com/news/enterprise/cloud-computing/819993-7-unikernel-projects-to-take-on-docker-in-2015/
