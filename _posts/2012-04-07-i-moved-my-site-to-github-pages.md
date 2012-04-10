---
layout: post
title: "I moved my site to GitHub Pages"
author: Amir Chaudhry
tags: [code, essay, learning, web]
description:
shorturl: http://bit.ly/Hpu1Bn
---
{% include JB/setup %}

Yet again, it's been several months since my last post (it's almost a habit now).  This isn't intended to be another catchup post, though.

The reason for this post is that I've moved my site ([amirchaudhry.com][]) to [GitHub Pages][].

Since I'm using my own domain, this is unlikely to affect anyone but I've copied this post into both the new GitHub site and old Posterous site just in case.  If you're reading this via [my Posterous site][] (presumably through the share/follow features there), then it'll be the last post to go up there.

There are still a bunch of things that are bit broken in the new place.

- No tweet/sharing buttons\*
- Tags don't sort properly
- Search doesn't work well
- RSS/Atom feed is probably a mess
- Syntax highlighting isn't working\*\*

[amirchaudhry.com]: http://amirchaudhry.com
[GitHub Pages]: http://pages.github.com
[my Posterous site]: http://amirmc.posterous.com


### Moving from Posterous to GitHub Pages

The process of moving to GitHub was a useful experience.  Here are the steps I ended up taking before I pointed the domain to the new site. Overall, I'm really glad that my posts aren't tied up in someone else's platform anymore.


#### Getting set up with GitHub Pages

I used [Jekyll Bootstrap][] and the default [bootstrap theme][]. It was *ridiculously* quick and easy to get a basic site up and start playing around.  The first thing I did was try to re-create structure of my old site and then worry about how it looked.  I'd never dealt with CSS before so this was always going to take a while. For example, it took me *ages* to figure out why items kept shifting between pages. Turns out I needed the following line in my style file:

{% highlight css %}
html { overflow-y: scroll; }
{% endhighlight %}

Although dealing with the CSS took a while, Bootstrap made it really easy to copy/paste/edit the bits I wanted to change.  The nav section was a pain to sort out.  It took a few weeks to get to this point but you're looking at a bootstrap site, which looks nothing like bootstrap (win!). It's likely that I'll keep tweaking things but I'm not expecting to do anything major.

[Jekyll Bootstrap]: http://jekyllbootstrap.com
[bootstrap theme]: http://twitter.github.com/bootstrap/

#### Migrating the posts

There wasn't an easy way to migrate directly from Posterous to GitHub. There are scripts available but either through bad-luck or ineptitude, I couldn't get them to work.  A guy called [Chad][] recently created [Export My Posts][], which pulled out all my content in html format (phew!).  I really didn't want to deal with learning an API or parsing an xml file, so I'm glad he put this together.  It works extremely well.

Next step was to run all the html posts through [pandoc][] to convert them to markdown. I wrote a fairly trivial shell script to do this.

{% highlight bash %}
#!/bin/bash
echo -e "Files to convert to md? "
read -a allfiles
#args=("$@")
for file in ${allfiles[*]}; do
    printf "   %s\n" $file
    pandoc -o ./convert/$file.md $file
done
{% endhighlight %}

Then came the slow process of checking each file, removing the left-over html, adding the appropriate headers, dealing with image galleries etc.  Part of this could have been automated but I don't have that many posts so I went through them manually.

[Chad]: http://jazzychad.net/
[Export My Posts]: http://exportmyposts.com
[pandoc]: http://johnmacfarlane.net/pandoc

Once all that was done, I simply had to switch the domain over and everything was fine.

#### Lessons learned

I need to keep a local copy of content. Of course, this is now solved but even before-hand I would write and save things locally before sending them up. The problem was that I'd always have to tweak something or edit a typo and *those* changes happened on the site (never on my local copy). 

Having existing things I can dig into and copy from (i.e. bootstrap) really speeds up my learning. I don't think I could have gotten this far this quickly without such resources.  If you look at the code itself it's probably a mess, but it's *my* mess.

Scripting things will help. Quickly creating image galleries is the next thing I need to figure out. The process is obvious to me now (since I did parts of it by hand) but I have to automate it using [ImageMagick][].

Overall, I'm quite pleased with myself.  I've gone from knowing nothing about CSS, static sites, and bootstrap to being vaguely (in)competent. Rock on!

[ImageMagick]: http://www.imagemagick.org

<p class="footnote">*Though I'll probably use something like <a href="http://www.addthis.com">AddThis</a>. ... Edit: Ok, so at the time of writing, I didn't have the buttons but by the time of publishing I'd figured it out :)</p>

<p class="footnote">**Yup, managed to fix that too :)</p>
