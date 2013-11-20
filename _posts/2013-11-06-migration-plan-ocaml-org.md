---
layout: post
title: "Migration plan for the OCaml.org redesign"
author: Amir Chaudhry
date: 2013-11-06 11:00:00
tags: [ocaml, ocaml-labs, ocamllabs]
shorturl: http://bit.ly/19C1nKJ
---
{% include JB/setup %}

We're close to releasing the new design of ocaml.org but need help from the 
OCaml community to identify and fix bugs before we switch next week.

Ashish, Christophe, Philippe and I have been discussing how we should go 
about this and below is the plan for migration.  If anyone would like to 
discuss any of this, then the [infrastructure list][infra-list] is the best 
place to do so.

1. We've made a **[new branch][1]** on the main ocaml.org repository with 
the redesign.  This branch is a fork of the master and we've simply cleaned 
up and replayed our git commits there.

2. We've built a live version of the new site, which is visible at 
**[http://preview.ocaml.org][preview]** - this is rebuilt every few minutes 
from the branch mentioned above.  

3. Over the course of one week, we ask the community to review the new site 
and **[report any bugs or problems][2]** on the issue tracker. We *triage* 
those bugs to identify any blockers and work on those first.  This is the 
phase we'll be in from *today*.

4. After one week (7 days), and after blocking bugs have been fixed, we 
**merge the redesign branch** into the master branch.  This would 
effectively present the new site to the world.  

During the above, we would not be able to accept any new pull requests on 
the master branch but would be happy to accept them on the new, redesign 
branch.  Hence, restricting the time frame to one week.  

Please note that the above is only intended to merge the *design* and 
*toolchain* for the new site.  Specifically, we've created new landing 
pages, have new style sheets and have restructured the site's contents as 
well as made some new libraries ([OMD][] and [MPP][]). The new toolchain 
means people can write files in markdown, which makes contributing content a 
lot easier.  

Since the files are on GitHub, people don't even need to clone the site 
locally to make simple edits (or even add new pages). Just click the 'Edit 
this page' link in the footer to be taken to the right file in the 
repository and GitHub's editing and pull request features will allow you to 
make changes and submit updates, all from within your browser (see the 
[GitHub Article][5] for details).  

There is still work to be done on adding new features but the above changes 
are already a great improvement to the site and are ready to be reviewed by 
the OCaml community and merged.

[1]: https://github.com/ocaml/ocaml.org/tree/redesign
[2]: https://github.com/ocaml/ocaml.org/issues
[OMD]: http://pw374.github.io/posts/2013-09-05-22-31-26-about-omd.html
[MPP]: http://pw374.github.io/posts/2013-10-03-20-39-07-OPAMaging-MPP.html
[5]: https://help.github.com/articles/creating-and-editing-files-in-your-repository
[infra-list]: http://lists.ocaml.org/listinfo/infrastructure
[preview]: http://preview.ocaml.org
