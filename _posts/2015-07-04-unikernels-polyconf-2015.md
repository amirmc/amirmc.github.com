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
<!-- 
{% assign image_folder = 'folder-of-images' %}
{% assign number_of_images = 2 %}
{% include amc/make_gallery %}

[![Alt]({{BASE_PATH}}/images/web/#.jpg)](http://www.com)

<div class="flex-video">
  <iframe>Title</iframe>
</div>

<a href="#"><img style="float: right; margin-left: 10px" src="http://amirchaudhry.com/images/web/#"></a> -->

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

[MISO]: http://amirchaudhry.com/brewing-miso-to-serve-nymote/
[nymote]: http://nymote.org/blog/2013/introducing-nymote/
[mindy-overview]: http://www.somerandomidiot.com/blog/2014/08/18/i-am-unikernel/
[tom-unikernel]: http://roscidus.com/blog/blog/2014/07/28/my-first-unikernel/ 
[magnus]: http://www.skjegstad.com/blog/2015/03/25/mirageos-vm-per-url-experiment/
[pinata]: http://amirchaudhry.com/bitcoin-pinata/
[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[heroku-unikernel]: http://amirchaudhry.com/heroku-for-unikernels-pt1
[nymote-intro]: http://nymote.org/blog/2013/introducing-nymote/
[mir-skeleton]: https://github.com/mirage/mirage-skeleton
[mir-list]: http://lists.xenproject.org/cgi-bin/mailman/listinfo/mirageos-devel
