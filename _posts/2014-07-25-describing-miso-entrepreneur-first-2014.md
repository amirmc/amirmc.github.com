---
layout: post
title: "Describing the MISO stack at Entrepreneur First"
author: Amir Chaudhry
date: 2014-07-25 11:30:00
tags: [centralisation, cloud, fun, internet of things, mirage, miso,
nymote, ownership, pics, project, slides, software,
talks, tech, website]
description:
shorturl: http://bit.ly/1nZvxKx
---
{% include JB/setup %}

<!-- 
{% assign image_folder = 'ef-2014' %}
{% assign number_of_images = 6 %}
{% include amc/make_gallery %}
 -->

I'm speaking to the [Entrepreneur First][ef] cohort this morning about the future of resilient, distributed systems and what I'm working on to get us there.  Firstly, I'm describing the kinds of solutions we have today, the great things they offer developers as well as the issues they create. This leads into the new toolstack we're creating, called the MISO stack, and the benefits and trade-offs.

I'm spending more time talking about [Mirage OS][mirage-www] -- the 'M' in the MISO stack -- because the workflow we've developed here underpins how we build, deploy and maintain such applications at scale. As an example of how things can work, I point at my earlier post on how to go from [jekyll to unikernel][jekyll-unikernel].  This uses TravisCI to do all the hard work and all the relevant artefacts, including the final VM, can be version-controlled through Git. I actually deployed this post while the audience was watching, so that I could point at [the build logs][amc-travis].

One of the use cases for our toolstack is to make it possible for individuals to create and maintain their own piece of the cloud, a project called [Nymote][nymote], which will also make it possible to run the [Internet of *my* Things][amc-iot] -- which itself is related to another things I'm working on, such the [Hub of All Things - HAT][hat] and the [User Centric Networking][ucn] projects.


This is an exciting summer for all the tools we're putting together, since we've recently [announced Mirage OS v2.0][mirage-20], which now works on ARM, are going full steam ahead with [Irmin][irmin] and working hard on improvements to the [OCaml ecosystem][platform]. It's a great time to explore these projects, learn a new language and build awesome stuff.

[![Mirage on ARM](http://amirchaudhry.com/images/singles/mirage-cubieboard.jpg)](https://twitter.com/amirmc/status/492202830774927361)

****
<p class="footnote">Some of the research leading to these results has received 
    funding from the European Union's Seventh Framework Programme
    FP7/2007-2013 under the UCN project, grant agreement no 611001.
</p>


[ef]: http://joinef.com
[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines
[mirage-www]: http://openmirage.org
[nymote]: http://nymote.org
[nymote-intro]: http://nymote.org/blog/2013/introducing-nymote/
[amc-iot]: http://amirchaudhry.com/working-on-the-internet-of-my-things/
[amc-travis]: http://travisci.org/amirmc/amirmc.github.com
[hat]: http://hubofallthings.com
[ucn]: http://usercentricnetworking.eu
[mirage-20]: http://openmirage.org/blog/announcing-mirage-20-release
[irmin]: http://openmirage.org/blog/introducing-irmin
[platform]: http://www.cl.cam.ac.uk/projects/ocamllabs/tasks/platform.html
