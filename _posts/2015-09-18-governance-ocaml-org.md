---
layout: post
title: "Governance of OCaml.org"
author: Amir Chaudhry
date: 2015-09-18 14:00:00
tags: [essay, ocaml, ocamllabs, platform, project]
description:
shorturl: http://bit.ly/1Kqc6WZ
---
{% include JB/setup %}

[![Governance Screenshot](http://amirchaudhry.com/images/web/governance-page.png)][gov]

For several months, I've been working with the maintainers of OCaml.org
projects to define and document the governance structure around the domain
name. I wrote about this [previously][init-post] and I'm pleased to say that
the work for this phase has concluded, with the document now [live][gov]. 

## Recurring themes ##

There were some recurring themes that cropped up during my email discussions
with people and I thought it would be useful to present a summary of them,
along with my thoughts. Broadly, the discussions revolved around the
philosophy of the document, the extent of its scope, and the depth of coverage.
This discourse was very important for refining and improving the document.

### Ideals and Reality ###

Some of the comments I received were essentially that the document did not
represent how we *should* be organising ourselves.  There was occasionally the
sense (to me at least) that the only appropriate form of governance is a fully
democratic and representational one. 

That would entail things like official committees, ensuring that various
communities/organisations were represented, and perhaps establishing some
form of electoral processes. Overall, something relatively formal and quite
carefully structured. Of course, instituting such an arrangement would
necessarily require somewhat involved procedures, documentation, and
systems — as well as the volunteer time to manage those processes.

These may be noble aims — and I expect one day we'll be closer to such ideals —
but one of the critical factors for the current approach was that we record
how things are *right now*.  In my experience, anything else is purely
aspirational and therefore would have little bearing with how things currently
function.

To put it another way, the current document must not describe the structure we
*desire* to have, but the organisation we *actually* have — warts and all. 
Yes, right now we have a [BDFL][]\*, who personally owns the domain and
therefore can do as he pleases with it.  Irrespective of this, the community
has been able to come together, coordinate themselves, and build very useful
things around the domain name.  This has happened independently of any formal
community processes and, in my view, has largely been driven by people
supporting each other's works and generally trying to 'do the right thing'.

Another aspect to point out is that is that such documents and procedures are
not *necessary* for success. This is obvious when you consider how far the
OCaml community has come in such a relatively short space of time. Given this,
one might argue why we need any kind of written governance at all.  

To answer that, I would say that once things grow beyond a certain scale, I
believe it helps to gather the implicit behaviours and document them clearly. 
This allows us to be more systematic in our approach and also enables
newcomers to understand how things work and become involved more quickly. In
addition, having a clear record of how things operate in the present is an
invaluable tool in helping to clarify what exactly we should work on changing
for the future.


### Extent of scope ###

It's a little confusing to consider that 'OCaml.org' is simultaneously a
collection of websites, infrastructural components, and projects.
Disambiguating these from the wider OCaml community was important, and
relatively straightforward, but there were a few questions about the
relationship between the domain name and the projects that use it.

Although the governance covers the OCaml.org *domain name*, it necessarily has
an impact on the projects which make use of it.  This matters because anything
under the OCaml.org domain will, understandably, be taken as authoritative by
users at large. In a way, OCaml.org becomes the sum of the projects under it,
hence it's necessary to have some lightweight stipulations about what is
expected of those projects.

Projects themselves are free to organise as they wish (BDFL/Democracy/etc) but
there are certain guiding principles for OCaml.org that those projects are
expected to be compatible with (e.g. openness, community-related, comms, etc).
These stipulations are already met by the current projects, so codifying them
is intended to clarify expectations for new projects.


### Depth of coverage ###

Another of the recurring points was how the current document didn't capture
every eventuality.  Although I could have attempted this, the end result would
have been a lengthy document, full of legalese, that I expect very few people
would ever read.  The document would also have needed to cover eventualities
that have not occurred (yet) and/or may be very unlikely to occur. 

Of course, this is *not* a legal document. No-one can be compelled to comply
with it and there are very few sanctions for anyone who chooses not to comply.
However, for those who've agreed to it, acceptance signals a clear intent to
take part in a [social contract][soc-cont] with the others involved in work
around the domain name.

Overall, I opted for a lightweight approach that would cover how we typically
deal with issues and result in a more readable document.  Areas that are
'unchartered' for us should be dealt with as they have been so far — through
discussion and action — and can subsequently be incorporated when we have a
better understanding of the issues and solutions.


## A solid starting position ##

The current version of the governance document is now live and it is very much
intended to be a living document, representing where we are now.  As the
community continues to grow and evolve, we should revisit this to ensure it is
accurate and is meeting our needs.

I look forward to seeing where the community takes it!

*In case you're interested, the set of links below covers the journey from
beginning to end of this process.*

* *Background — ["Towards a governance framework for OCaml.org"][init-post]*
* *Discussion phase — ["Adopting a Governance framework..."][1]*
* *Tracking issue — [ocaml/ocaml.org#700][2]*
* *Ratification — ["Governance document is now ratified..."][3]*
* *Governance doc — ["Governance of the OCaml.org domain"][gov]*

[BDFL]: https://en.wikipedia.org/wiki/Benevolent_dictator_for_life
[soc-cont]: https://en.wikipedia.org/wiki/Social_contract

[init-post]: http://amirchaudhry.com/towards-governance-framework-for-ocamlorg/
[1]: http://lists.ocaml.org/pipermail/infrastructure/2015-August/000518.html
[2]: https://github.com/ocaml/ocaml.org/issues/700
[3]: http://lists.ocaml.org/pipermail/infrastructure/2015-September/000540.html
[gov]: http://ocaml.org/governance.html

<p class="footnote">
    * Yeah, I made sure to add Xavier to the BDFL list before publishing
    this. :)
</p>
<p class="footnote">
    Thanks to Ashish, Philippe and Anil for comments on an earlier draft.
</p>
