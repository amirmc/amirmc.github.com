---
layout: post
title: "Towards a governance framework for OCaml.org"
author: Amir Chaudhry
date: 2015-01-08 18:15:00
tags: [docs, legal, ocaml, ocaml-labs, ocamllabs, opam, platform, project]
description:
shorturl: http://bit.ly/1DnCoKW
---
{% include JB/setup %}

The projects around the OCaml.org domain name are becoming more established
and it's time to think about how they're organised. 2014 saw a *lot* of
activity, which built on the [successes from 2013][2013-review].
Some of the main things that stand out to me are:

- More [volunteers][contributors] contributing to the public website with
translations, bug fixes and content updates, as well as many new visitors —
for example, the new page on [teaching OCaml][teach-ocaml] received over 5k
visits alone. The increasing contributions are a result of the earlier work on
[re-engineering the site][new-ocamlorg] and there are many ways to get involved
so please do [contribute][]!

[2013-review]: http://www.cl.cam.ac.uk/projects/ocamllabs/news/index.html#OnlineatOCamlorg
[contributors]: http://ocaml.org/contributors.html
[teach-ocaml]: http://ocaml.org/learn/teaching-ocaml.html
[new-ocamlorg]: http://amirchaudhry.com/announcing-new-ocamlorg/
[contribute]: https://github.com/ocaml/ocaml.org/labels/contribute%21

<a href="http://opam.ocaml.org/"><img style="float: right; margin-left: 10px" src="http://amirchaudhry.com/images/web/opampkg-2015-01-08.png"></a>

- The relentless improvements and growth of OPAM, both in terms of the
repository — with over 1000 additional packages and several
[new repo maintainers][repo-maint] — and also improved workflows (e.g the new
[pin functionality][opam-pin]). 
The OPAM site and package list also moved to the ocaml.org domain, becoming
the substrate for the OCaml Platform efforts. This began with the work towards
[OPAM 1.2][opam-beta] and there is much more to come (including closer
integration in terms of styling). Join the [Platform list][platform-list] to
keep up to date.

[repo-maint]: http://lists.ocaml.org/pipermail/opam-devel/2014-October/000781.html
[opam-pin]: http://opam.ocaml.org/blog/opam-1-2-pin/
[opam-beta]: http://opam.ocaml.org/blog/opam-1-2-0-beta4/
[platform-list]: http://lists.ocaml.org/listinfo/platform

- Much more activity on the [mailing lists][lists] in general and user groups
requesting to have lists made (e.g the [teaching list][teach-list]). If anyone
has a need for a new list, just ask on the
[infrastructure list][infra-mail]!

[lists]: http://lists.ocaml.org
[teach-list]: http://lists.ocaml.org/listinfo/teaching
[infra-mail]: http://lists.ocaml.org/listinfo/infrastructure

There is other work besides those I've mentioned and I think by any measure,
all the projects have been quite successful. As the community continues to
develop, it's important to clarify how things currently work to improve the
level of transparency and make it easier for newcomers to get involved.

### Factors for a governance framework

For the last couple of months, I've been looking over how larger projects
manage themselves and the governance documents that are available. My aim has
been to put such a document together for the OCaml.org domain without
introducing burdensome processes.  There are number of things that stood out
to me during this process, which have guided the approach I'm taking.

My considerations for an OCaml.org governance document:

- A governance document is not *necessary* for success but it's valuable to
demonstrate a commitment to a **stable decision-making process**.  There are
many projects that progress perfectly well without any documented processes
and indeed the work around OCaml.org so far is a good example of this (as well
as OCaml itself).  However, for projects to achieve a scale greater than the
initial teams, it's a significant benefit to encode in writing how things work
(NB: please note that I didn't define the *type* of decision-making process -
merely that it's a stable one).

- It must **clarify its scope** so that there is no confusion about what the
document covers. In the case of OCaml.org, it needs to be clear that the
governance covers the domain itself, rather than referring to the website. 

- It should **document the reality**, rather than represent an aspirational
goal or what people *believe* a governance structure should look like.  It's
very tempting to think of an idealised structure without recognising that
behaviours and norms have *already* been established. Sometimes this will be
vague and poorly defined but that might simply indicate areas that the
community hasn't encountered yet (e.g it's uncommon for any new project to
seriously think about dispute resolution processes until they have to).  In
this sense, the initial version of a governance document should simply be a
written description of how things currently stand, rather than a means to
adjust that behaviour.  

- It should be **simple and self-contained**, so that anyone can understand
the intent quickly without recourse to other documents.  It may be tempting to
consider every edge-case or try to resolve every likely ambiguity but this
just leads to large, legal documents.  This approach may well be necessary
once projects have reached a certain scale but to implement it sooner would be
a case of premature optimisation — not to mention that very few people would 
read and remember such a document.

- It's a **living document**. If the community decides that it would prefer a
new arrangement, then the document conveniently provides a stable starting
point from which to iterate. Indeed, it *should* adapt along with the project
that it governs. 

With the above points in mind, I've been putting together a draft governance
framework to cover how the OCaml.org domain name is managed.  It's been a
quiet work-in-progress for some time and I'll be getting in touch with
maintainers of specific projects soon.  Once I've had a round of reviews, I'll
be sharing it more widely and posting it here!

<!-- [![FIGURE 06.1 Governance versus anarchy on Flickr](http://amirchaudhry.com/images/web/governance-alpha.png)](https://www.flickr.com/photos/jurgenappelo/5201270923/) -->
