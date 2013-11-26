---
layout: post
title: "Switching from Bootstrap to Zurb Foundation"
author: Amir Chaudhry
date: 2013-11-26 21:05:00
tags: [design, essay, ocaml, ocamllabs, ocaml-labs]
description:
shorturl: http://bit.ly/1blLWsm
---
{% include JB/setup %}

I've just updated my site's HTML/CSS and moved from Twitter Bootstrap to [Zurb Foundation][zurb].  This post captures my subjective notes on the migration.


#### My use of Bootstrap

When I originally set this site up, I didn't know what frameworks existed or anything more than the basics of dealing with HTML (and barely any CSS).  I came across Twitter Bootstrap and immediately decided it would Solve All My Problems.  It really did.  Since then, I've gone through one 'upgrade' with Bootstrap (from 1.x to 2.x), after which I dutifully ignored all the fixes and improvements (note that Bootstrap was up to v2.3.2 while I was still using v2.0.2).  

![Responsive Design](http://amirchaudhry.com/images/switch-to-foundation/responsive-design.png)

For the most part, this was fine with me but for a while now, I've been meaning to make this site 'responsive' (read: not look like crap from a mobile).  Bootstrap v3 purports to be mobile-first so upgrading would likely give me what I'm after but v3 is [not backwards compatible][breaking], meaning I'd have to rewrite parts of the HTML.  Since this step was unavoidable, it led me to have another look at front-end frameworks, just to see if I was missing anything.  This was especially relevant since we'd [just released][ocaml-org ann] the new [OCaml.org](http://ocaml.org) website, itself built with Bootstrap v2.3.1 (we'd done the design/templating work long before v3 was released).  It would be useful to know what else is out there for any future work.

Around this time I discovered Zurb Foundation and also the numerous comparisons between them (note: Foundation seems to come out ahead in most of those).  A few days ago, the folks at Zurb released [version 5][foundation-5], so I decided that now is the time to kick the tires.  For the last few days, I've been playing with the framework and in the end I decided to migrate my site over completely.  

[![Foundation's Yeti](http://amirchaudhry.com/images/switch-to-foundation/zurb-yeti.png)](http://foundation.zurb.com/learn/features.html)

#### Swapping out one framework for another

Over time, I've become moderately experienced with HTML/CSS and I can usually wrangle things to look the way I want, but my solutions aren't necessarily elegant. I was initially concerned that I'd already munged things so much that changing anything would be a pain.  When I first put the styles for this site together, I had to spend quite a bit of time overwriting Bootstrap's defaults so I was prepared for the same when using Foundation.  Turns out that I was fine.  I currently use [Jekyll][] (and [Jekyll Bootstrap][]) so I only had three template files and a couple of HTML pages to edit and because I'd kept most of my custom CSS in a separate file, it was literally a case of swapping out one framework for another and bug-fixing from there onwards.  There's definitely a lesson here in using automation as much as possible.

Customising the styles was another area of concern but I was pleasantly surprised to find I needed *less* customisation than with Bootstrap.  This is likely because I didn't have to override as many defaults (and probably because I've learned more about CSS since then).  The one thing I seemed to be missing was a way to deal with code sections, so I just took what Bootstrap had and copied it in.  At some point I should revisit this.

It did take me a while to get my head around Foundation's grid but it was worth it in the end.  The idea is that you should design for small screens first and then adjust things for larger screens as necessary. There are several different default sizes which inherit their properties from the size below, unless you explicitly override them.  I initially screwed this up by explicitly defining the grid using the `small-#` classes, which obviously looks ridiculous on small screens.  I fixed it by swapping out `small-#` for `medium-#` everywhere in the HTML, after which everything looked reasonable.  Items flowed sensibly into a default column for the small screens and looked acceptable for larger screens and perfectly fine on desktops.  I could do more styling of the mobile view but I'd already achieved most of what I was after.  


#### Fixing image galleries and embedded content

The only additional thing I used from Bootstrap was the [Carousel][]. I'd written some custom helper scripts that would take some images and thumbnails from a specified folder and produce clickable thumbnails with a slider underneath.  Foundation provides [Orbit][], so I had to spend time rewriting my script to produce the necessary HTML.  This actually resulted in cleaner HTML and one of the features I wanted (the ability to link to a specific image) was available by default in Orbit.  At this point I also tried to make the output look better for the case where JavaScript is disabled (in essence, each image is just displayed as a list).  Below is an example of an image gallery, taken from a previous post, when I [joined the computer lab][join-comp-lab].

{% assign image_folder = 'join-comp-lab' %}
{% assign number_of_images = 3 %}
{% include amc/make_gallery %}

Foundation also provides a component called [Flex Video][], which allows the browser to scale videos to the appropriate size.  This fix was as simple as going back through old posts and wrapping anything that was `<iframe>` in a  `<div class="flex-video">`.  It really was that simple and all the Vimeo and YouTube items scaled perfectly.  Here's an example of a video from an earlier post, where I gave a [walkthrough of the ocaml.org site][wireframe-demo]. Try changing the width of your browser window to see it scale.

<div class="flex-video widescreen vimeo">
  <iframe src="http://player.vimeo.com/video/61768157?byline=0&amp;portrait=0&amp;color=de9e6a" width="540" height="303" frameborder="0" webkitAllowFullScreen="true" mozallowfullscreen="true" allowFullScreen="true">Video demo</iframe>
</div>


#### Framework differences

Another of the main difference between the two frameworks is that Bootstrap uses [LESS][] to manage its CSS whereas Foundation uses [SASS][].  Frankly, I've no experience with either of them so it makes little difference to me.  It's worth bearing in mind for anyone who's workflow does involve pre-processing.  Also, Bootstrap is available under the [Apache 2 License][bootstrap-license], while Foundation is released under the [MIT license][zurb-license].


#### Summary

Overall, the transition was pretty painless and most of the time was spent getting familiar with the grid, hunting for docs/examples and trying to make the image gallery work the way I wanted.  I do think Bootstrap's docs are better but Foundation's aren't bad.  

Although this isn't meant to be a comparison, I much prefer Foundation to Bootstrap.  If you're not sure which to use then I think the secret is in the names of the frameworks.  

- Bootstrap (for me) was a *great* way to '*bootstrap*' a site quickly with lots of acceptable defaults -- it was quick to get started but took some work to alter.  
- Foundation seems to provide a great '*foundation*' on which to create more customised sites -- it's more flexible but needs more upfront thought.  

That's pretty much how I'd recommend them to people now.


[zurb]: http://foundation.zurb.com/learn/features.html
[bootstrap]: http://getbootstrap.com
[breaking]: http://getbootstrap.com/getting-started/
[mirage-www]: http://openmirage.org
[foundation-5]: http://zurb.com/article/1280/foundation-5-blasts-off--2
[foundation-templates]: http://foundation.zurb.com/templates.html
[ocaml-org ann]: http://amirchaudhry.com/announcing-new-ocamlorg/
[Jekyll]: http://jekyllrb.com
[Jekyll Bootstrap]: http://jekyllbootstrap.com
[Carousel]: http://getbootstrap.com/javascript/#carousel
[Orbit]: http://foundation.zurb.com/docs/components/orbit.html
[join-comp-lab]: http://amirchaudhry.com/joined-the-computer-lab/
[Flex Video]: http://foundation.zurb.com/docs/components/flex_video.html
[wireframe-demo]: http://amirchaudhry.com/wireframe-demos-for-ocamlorg/
[LESS]: http://lesscss.org
[SASS]: http://sass-lang.com
[bootstrap-license]: http://getbootstrap.com/getting-started/#license-faqs
[zurb-license]: http://foundation.zurb.com/learn/faq.html#question-3
