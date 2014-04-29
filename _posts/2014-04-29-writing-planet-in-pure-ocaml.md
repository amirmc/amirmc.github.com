---
layout: post
title: "Writing Planet in pure OCaml"
author: Amir Chaudhry
date: 2014-04-29 09:30:00
tags: [ocaml, ocamlatom, ocamllabs, ocaml-labs, planet, project]
shorturl: http://bit.ly/QRIHAX
---
{% include JB/setup %}

I've been learning OCaml for some time now but not really had a problem that
I wanted to solve. As such, my progress has been rather slow and sporadic
and I only make time for exercises when I'm travelling. In order to focus my
learning, I have to identify and tackle something specific. That's usually
the best way to advance and I recently found something I can work on.

As I've been trying to write more blog posts, I want to be able to keep as
much content on my own site as possible and syndicate my posts out to other
sites I run. Put simply, I want to be able to take multiple feeds from
different sources and merge them into one feed, which will be served from
some other site. In addition, I also want to render that feed as HTML on a
webpage. All of this has to remain within the OCaml toolchain so it can be
used as part of [Mirage][mir-www] (i.e. I can use it when
[building unikernels][jekyll-unikernel]). 

What I'm describing might sound familiar and there's a well-known tool that
does this called [Planet][]. It's a 'river of news' feed reader, which
aggregates feeds and can display posts on webpages and you can find the
[original Planet][] and it's successor [Venus][], both written in Python.
However, Venus seems to be unmaintained as there are a number of
[unresolved issues and pull requests][venus-issues], which have been
languishing for quite some time with no discussion. There does appear to be
a more active Ruby implementation called [Pluto][], with recent commits and
no reported issues.

<!-- 
    \[Rant: Frankly, the naming of these versions leaves a lot to be desired.
    When you know exactly what you're supposed to Google for you're fine, but
    until then you're just on a random-walk through space websites. I'm
    lucky I managed to get to the Wikipedia page.\] 
-->

### Benefits of a Planet in pure OCaml ###

Although I could use the one of the above options, it would be much more
useful to keep everything within the OCaml ecosystem.  This way I can make
the best use of the [unikernel approach][unikernel] with Mirage (i.e lean,
single-purpose appliances). Obviously, the existing options don't lend
themselves to this approach and there are [known bugs][] as a lot has
changed on the web since Planet Venus (e.g the adoption of HTML5).
Having said that, I can learn a lot from the existing implementations and
I'm glad I'm not embarking into completely uncharted territory.

In addition, the OCaml version doesn't need to (and *shouldn't*) be written
as one monolithic library.  Instead, pulling together a collection of
smaller, reusable libraries that present clear interfaces to each other
would make things much more maintainable. This would bring substantially
greater benefits to everyone and [OPAM][] can manage the dependencies. 

<!--
    OPAM makes managing dependencies easy so having a number of single-
    purpose libraries is A Good Thing and costs almost nothing.  This 
    approach has already worked well with examples like an [IP address 
    library][ipaddr] and the [OCaml markdown library][OMD], which can be 
    used by multiple projects.
-->


### Breaking down the problem ###

The first cut is somewhat straightforward as we have a piece that deals with
the consumption and manipulation of feeds and another that takes the result
and emits HTML. This is also how the original Planet is put together, with a
library called [feedparser][] and another for templating pages.  

For the feed-parsing aspect, I can break it down further by considering Atom
and RSS feeds separately and then even further by thinking about how to (1)
consume such feeds and (2) output them. Then there is the HTML component,
where it may be necessary to consider existing representations of HTML. These
are not new ideas and since I'm claiming that individual pieces might be
useful then it's worth finding out which ones are already available.

#### Existing components ####

The easiest way to find existing libraries is via the
[OPAM package list][opam-list]. Some quick searches for `RSS`, `XML`, `HTML`
and `net` bring up a lot of packages. The most relevant of these seem to be
[xmlm][], [ocamlrss][], [cow][] and maybe [xmldiff][]. I noticed that
nothing appears, when searching for `Atom`, but I do know that `cow` has an
Atom module for creating feeds. In terms of turning feeds into pages and
HTML, I'm aware of [rss2html][] used on the [OCaml][] website and parts of
[ocamlnet][] that may be relevant (e.g `nethtml` and `netstring`) as well as
`cow`.  There is likely to be other code I'm missing but this is useful as a
first pass. 

Overall, a number of components are already out there but it's not obvious
if they're compatible (e.g html) and there are still gaps (e.g atom). Since
I also want to minimise dependencies, I'll try and use whatever works but
may ultimately have to roll my own. Either way, I can learn from what
already exists. Perhaps I'm being overconfident but if I can break things
down sensibly and keep the scope constrained then this should be an
achievable project. 


### The first (baby) steps - an Atom parser ###

As this is an exercise for me to learn OCaml by solving a problem, I need to
break it down into bite-size pieces and take each one at a time. Practically
speaking, this means limiting the scope to be as narrow as possible while
still producing a useful result *for me*.  That last part is important as I
have specific needs and it's likely that the first thing I make won't be
particularly interesting for many others. 

For my specific use-case, I'm only interested in dealing with Atom feeds as
that's what I use on my site and others I'm involved with. Initial feedback
is that creating an Atom parser will be the bulk of the work and I should
start by defining the types. To keep this manageable, I'm only going to deal
with my own feeds instead of attempting a fully compliant parser (in other
words, I'll only consider the subset of [RFC4287][] that's relevant to me).
Once I can parse, merge and write such feeds I should be able to iterate
from there. 

To make my requirements more concrete:

- Only consider *my own* Atom feeds for now
- Initially, be able to parse and emit just one Atom feed
- Then be able to merge 2+ feeds, specifically:
  - Use tag-based feeds from my personal site as starting points
  - Be able to de-dupe content
- No database or storage (construct it afresh every time)
- Minimise library dependencies

<!-- 
    Perhaps these requirements are already too much and I may decide to dial
    it down even further (e.g just figure out how to consume *one* feed),
    but I won't really know until I get started. For example, I can imagine
    that I'll need one bunch of code to deal with Atom feeds and then
    perhaps I can make another (feedparser), that depends on it and others
    to deal with general feeds.
-->


#### Timeframes and workflow ####

I've honestly no idea how long this might take and I'm treating it as a
side-project. I know there are many people out there who could produce a
working version of everything in a week or two but I'm not one of them (yet).
There are also *a lot* of ancillary things I need to learn on the way, like
packaging, improving my knowledge of Git and dealing with build systems. If
I had to put a vague time frame on this, I'd be thinking in months rather
than weeks.  It might even be the case that others start work on parts of
this and ship things sooner but that's great as I'll probably be able to use
whatever they create and move further along the chain.

In terms of workflow, everything will be done in the open, warts and all, and
I expect to make embarrassing mistakes as I go. You can follow along on my
freshly created [OCaml Atom][] repo, and I'll be using the issue tracker as
the main way of dealing with bugs and features. Let the fun begin.

<!-- acknowledgements -->

****

*Acknowledgements:* Thanks to [Daniel][], [Ashish][], [Christophe][],
[Philippe][] and [Thomas][] for discussions on an earlier draft of this post
and providing feedback on my approach.

<!-- links -->

[mir-www]: http://openmirage.org/
[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines

[Planet]: http://en.wikipedia.org/wiki/Planet_(software)
[original Planet]: http://www.planetplanet.org
[Venus]: http://intertwingly.net/code/venus/docs/index.html
[venus-issues]: https://github.com/rubys/venus/issues
[Pluto]: http://feedreader.github.io/

[unikernel]: https://queue.acm.org/detail.cfm?id=2566628
[known bugs]: https://forge.ocamlcore.org/tracker/index.php?func=detail&aid=1349&group_id=1&atid=101

[OPAM]: https://opam.ocaml.org/
[OMD]: https://opam.ocaml.org/packages/omd/omd.0.9.7/
[ipaddr]: https://opam.ocaml.org/packages/ipaddr/ipaddr.2.4.0/

[feedparser]: https://pypi.python.org/pypi/feedparser/

[opam-list]: http://opam.ocaml.org/packages
[xmlm]: https://opam.ocaml.org/packages/xmlm/xmlm.1.2.0/
[ocamlrss]: https://opam.ocaml.org/packages/ocamlrss/ocamlrss.2.2.2/
[cow]: https://opam.ocaml.org/packages/cow/cow.0.9.1/
[xmldiff]: http://opam.ocaml.org/packages/xmldiff/xmldiff.0.1/
[ocamlnet]: http://opam.ocaml.org/packages/ocamlnet/ocamlnet.3.7.3/
[rss2html]: https://github.com/ocaml/ocaml.org/blob/master/script/rss2html.ml
[OCaml]: http://ocaml.org

[RFC4287]: https://tools.ietf.org/html/rfc4287

[OCaml Atom]: https://github.com/amirmc/ocamlatom
[compiler-hacking]: http://ocamllabs.github.io/compiler-hacking/2014/04/24/fifth-compiler-hacking-session.html

[Daniel]: http://erratique.ch
[Ashish]: http://ashishagarwal.org
[Christophe]: https://github.com/Chris00
[Philippe]: http://philippewang.info/
[Thomas]: http://gazagnaire.org
