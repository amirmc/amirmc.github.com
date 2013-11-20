---
layout: post
title: "Announcing the new OCaml.org"
author: Amir Chaudhry
date: 2013-11-20 23:00:00
tags: [ocaml, ocamllabs, ocaml-labs]
shorturl: http://bit.ly/1aHg3b2
---
{% include JB/setup %}

As some of you may have noticed, the new OCaml.org site is now live!  

The DNS may still be propagating so if [http://ocaml.org](http://ocaml.org) hasn't updated for you then try http://166.78.252.20.  This post is in two parts: the first is the announcement and the second is a call for content.


### New OCaml.org website design!

The new site represents a major milestone in the continuing growth of the OCaml ecosystem. It's the culmination of a lot of volunteer work over the last several months and I'd specifically like to thank [Christophe][], [Ashish][] and [Philippe][] for their dedication (the [commit logs][] speak volumes).  

[![OCaml.org Wireframes]({{BASE_PATH}}/images/ann-new-ocamlorg/ocaml-home-wire.png)](http://amirchaudhry.com/wireframe-demos-for-ocamlorg/)

We began this journey just over 8 months ago with paper, pencils and a lot of ideas. This led to a comprehensive set of [wireframes and walk-throughs][1] of the site, which then developed into a collection of [Photoshop mockups][2]. In turn, these formed the basis for the html templates and style sheets, which we've adapted to fit our needs across the site.  

Alongside the design process, we also considered the kind of structure and [workflow we aspired to][3], both as maintainers and contributors.  This led us to develop completely new tools for [Markdown][4] and [templating][5] in OCaml, which are now available in OPAM for the benefit all.  

Working on all these things in parallel definitely had it challenges (which I'll write about separately) but the result has been worth the effort.  

[![OCaml.org]({{BASE_PATH}}/images/ann-new-ocamlorg/ocaml-home-mockup.png)](http://ocaml.org)

The journey is ongoing and we still have many more improvements we hope to make. The site you see today primarily improves upon the design, structure and workflows but in time, we also intend to incorporate more information on packages and documentation. With the new tooling, moving the website forward will become much easier and I hope that more members of the community become involved in the generation and curation of content.  This brings me to the second part of this post.


### Call for content

We have lots of great content on the website but there are parts that could do with a refresh and gaps that could be filled.  As a community driven site, we need ongoing contributions to ensure that the site best reflects its members.  

For example, if you do commercial work on OCaml then maybe you'd like to add yourself to the [support page][6]? Perhaps there are tutorials you can help to complete, like [99 problems][7]?  If you're not sure where to begin, there are already a number of [content issues][8] you could contribute to.  

Although we've gone through a bug-hunt already, feedback on the site is still very welcome.  You can either [create an issue][issue] on the tracker (preferred), or email the infrastructure list. 

It's fantastic how far we've come and I look forward to the next phase!


[1]: http://amirchaudhry.com/wireframe-demos-for-ocamlorg/
[2]: https://github.com/ocaml/ocaml.org/wiki/Site-Redesign
[3]: http://lists.ocaml.org/pipermail/infrastructure/2013-July/000211.html
[4]: http://pw374.github.io/posts/2013-09-05-22-31-26-about-omd.html
[5]: http://pw374.github.io/posts/2013-10-03-20-35-12-using-mpp-two-different-ways.html
[6]: http://ocaml.org/community/support.html
[7]: http://ocaml.org/learn/tutorials/99problems.html
[8]: https://github.com/ocaml/ocaml.org/issues?labels=content
[commit logs]: https://github.com/ocaml/ocaml.org/commits/master
[issue]: https://github.com/ocaml/ocaml.org/issues
[Christophe]: https://github.com/Chris00
[Ashish]: http://ashishagarwal.org
[Philippe]: http://philippewang.info/CL/

