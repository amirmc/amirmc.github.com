---
layout: post
title: "Update on OCaml.org redesign"
author: Amir Chaudhry
date: 2013-09-13 16:00:00
tags: [ocaml-labs]
shorturl: http://amirchaudhry.com
---
{% include JB/setup %}

Last time I wrote about the [ocaml.org redesign work][wireframe-post], I presented a [set of wireframes][balsamiq-demo] and some [videos][wireframe-video] to describe the big picture for the site and some of the features we'll be building in over time.  Since then, we've been working on the design elements, OCaml branding and the new tooling we'll need to make the site a reality.  There have been multiple threads to keep track of so this post collates all the progress so far.


## OCaml Branding

As the rest of the design will flow from the branding elements, the very first thing we worked on was redesigning the OCaml logo.  We considered the current logo and thought about aspects that seem important and should be kept and which aspects can be improved.  It was 



We worked with a professional design agency and 

We want to have a image that works well in a square, since we can use it as an icon or profile image on appropriate places.  

[![](/images/web/ocaml-old.gif)][old-ocaml-logos] 

This is intended to be an iterative process and we'll soon be entering another (and likely final) phase of the process.  We 





we first thing we did was think about the logo and discuss the 

* Old Logo - [![](/images/web/ocaml-old.gif)][old-ocaml-logos]

* New Logo - [![](/images/web/ocaml-colour-draft01.png)][new-ocaml-logo]


[old-ocaml-logos]: http://ocaml.org/logos.html
[new-ocaml-logo]: https://github.com/ocaml/ocaml.org/wiki/Draft-OCaml-Logos


### Mood board



[![](/images/web/OCaml_Branding_MoodBoard_540.png)][mood-board]


[mood-board]: /images/web/OCaml_Branding_MoodBoard.jpg


## From wireframes to designs to html templates

Wireframes are a great tool for thinking about overall layout and where content should go but it's a very different thing to go from layouts to actual html.  This process took some time but we ultimately arrived at a set of images for what some of the main pages would look like.  You can see these on the [wiki][], where I've been putting these assets as we get them.  The images are useful because it's a lot quicker to iterate the elements than manually altering html all the time.  

[photoshop-mockups]: https://github.com/ocaml/ocaml.org/wiki/Site-Redesign
[wiki]: https://github.com/ocaml/ocaml.org/wiki




## Switching to a markdown-based site

We kicked off a discussion about [switching to a markdown-based site][markdown-discussion] and there were positive noises about having a pure OCaml Markdown parser.  [Philippe got straight to work on it][omd-repo], called 'omd' and it's about ready to make it's way into OPAM soon.  You can read more about it on Philippe's blog post and see updates in the [repo directly][omd-status]. Overall, switching to markdown should make submitting new content a lot simpler and make maintenance easier.  Philippe's put together a [great demo site][demo-site] that shows progress so far and has [generated a lot of feedback][feedback]. Amir will be collating this and taking back into the next iteration of the design.  Please do join the discussion on the infrastructure list!

[markdown-discussion]: http://lists.ocaml.org/pipermail/infrastructure/2013-July/000211.html
[omd-repo]: https://github.com/pw374/omd
[omd-status]: https://github.com/pw374/omd/blob/master/src/implementation_notes.md
[demo-site]: http://philippewang.info/CL/new-ocaml.org-demo/
[feedback]: http://lists.ocaml.org/pipermail/infrastructure/2013-August/000239.html




[wireframe-post]: /wireframe-demos-for-ocamlorg/
[balsamiq-demo]: https://ocaml.mybalsamiq.com/projects/public-demo/naked/0_home?key=b897ea86d8a8199c6e46b3295ddf630dfa33e5e1
[wireframe-video]: http://vimeo.com/album/2301640




## New tools and workflow

As mentioned above, we have a new 

Broadly, the workflow we've adopted is the following and it's intended to give us (1) a live site to work on and show people and (2) a migration path for when we're ready to move to the new design.

1. We converted the html in the current ocaml.org repo into markdown files using [pandoc][4] and some bash scripts.  These are the files which will form the basis of the new site.

2. As we have new landing pages and sections for the site, the existing content is rearranged accordingly (keeping track of what went where in another file).  This is still ongoing.

3. Next, we run the new tools over the files markdown files and generate the HTML (i.e build the site).  At this point we also use the new style files and templates.  These end up in a different folder in the same repo.
 
4. Via a cron job and some git-pulls, these html files then find their way to http://ocaml-redesign.github.io (approx every 10 minutes) so we can see how they look when live.

The above represents an end-to-end tool chain that we can refine as we go along.  There's still work to do but this will make the progress much more visible.  Some of the additional things we're working on include generating tables of contents and separating the OCaml code into \*.ml files.  


### Interim workflow



## Next steps




Philippe and Amir have been pushing ahead with the new tooling and design for ocaml.org.  


Hi folks,

I'd like to draw your attention to a new and live working site for the ocaml.org redesign work.  You can find it at http://ocaml-redesign.github.io

The site uses the tools related to [templating][1] and [markdown][2] that Philippe has been working on and is generated from content in a [sandbox repo][3].

## Workflow



If you have any comments or feedback, please do reply to the list.

Best wishes,
Amir

[1]: https://github.com/pw374/MPP-language-blender
[2]: https://github.com/pw374/omd
[3]: https://github.com/ocamllabs/sandbox-ocaml.org
[4]: http://johnmacfarlane.net/pandoc/
