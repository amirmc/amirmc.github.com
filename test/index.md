---
layout: page
title: Test
---
{% include JB/setup %}

A page to test stuff

Trying to embed a Speakerdeck presentation below.  Example from Slideshare and Speakerdeck.


-----

### Slideshare

The following is a slideshare version of the deck. The code is modified a bit from the original i.e adding ="true" and some other stuff. (Aside: I discovered I had to do this with iframes when I tried to embed vimeo videos in the past. Something about XHTML/XML.)

&#x20; <iframe src="http://www.slideshare.net/slideshow/embed_code/25359900" width="100%" height="400" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="max-width:476px;border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true">signpost-at-foci</iframe>

Code used to embed above is:

{% highlight html %}
&#x20; <iframe src="http://www.slideshare.net/slideshow/embed_code/25359900" width="100%" height="400" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="max-width:476px;border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true">signpost-at-foci</iframe>
{% endhighlight %}

----

### Speakerdeck


This is the embed code from Speakerdeck for the same presentation as above.  this fails when run in `jekyll serve` with the error "REXML could not parse this XML/HTML".  Since this didn't work locally I never tried pushing a page live so this is my attempt at that.

<script class="speakerdeck-embed" data-id="c05c39b0ea5a013072963e3eecf5e7e1" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js">signpost-at-foci</script>

Code to *try* to embed above is:

{% highlight html %}
<script class="speakerdeck-embed" data-id="c05c39b0ea5a013072963e3eecf5e7e1" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js">signpost-at-foci</script>
{% endhighlight %}
