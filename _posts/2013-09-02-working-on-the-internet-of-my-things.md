---
layout: post
title: "I'm working on The Internet of *my* Things"
author: Amir Chaudhry
tags: [apps, aggregation, centralisation, companies, devices, essay, internet of things, nymote, ownership, privacy, rights, software, tech]
shorturl: http://bit.ly/1a1HT0T
---
{% include JB/setup %}

For a long time I've been interested what the future holds in terms of how 
we will interact with each other and our environments.  Back in the day, 
these areas used to be called ubiquitous computing and home automation but 
have since been subsumed by the (only slightly) catchier moniker of Internet 
of Things (IoT).

<a href="http://www.flickr.com/photos/mjwiacek/3718366706/"><img style="float: right; margin-left: 10px" src="/images/web/pizza-oven.jpg"></a>
A couple of my ideas involved controlling devices at home via SMS messages 
(this was way before smart phones and 'apps' came along).  For example, 
being able to set my VCR to record a show while I'm out\* or pre-heat the 
oven when I'm heading home with a frozen pizza<sup>&dagger;</sup>.  Of 
course, if I were to implement these now I'd take a completely different 
approach.  With all the advances we've made, the Internet of Things has huge 
potential to change our lives the way the Internet itself did.

However, if we take the last decade of the Internet and Web as an example of 
how the IoT may play out it's actually not a pretty picture.  We're in the 
age of the Internet behemoths, with huge centralised data silos containing 
lots of our personal data.  We trust such services to secure our data but 
[repeated breaches][dropbox-breaches] undermine that trust. Sure, there is 
some choice among providers but it's fast becoming a case of "choose your 
dictator".  Our information is trapped, interoperating is 
[becoming difficult][eff-google-xmpp] and to top it off, these giants are 
busy fighting [legal battles][groklaw-apple] with each other instead of 
out-competing.  Users just get caught in the cross-fire.

If we extrapolate this to the Internet of Things then, ultimately, it'll 
become a winner-take-all-my-data arrangement, with lock-ins to restrict me 
from migrating.  Remember, we're talking about connecting more devices to 
the Internet and giving almost ubiquitous access to our daily lives and 
habits.  Trading more of our personal lives, from within our homes, with 
increasingly faceless companies and for not very much in return, isn't 
particularly appealing.

If the IoT plays out this way, then we will effectively *increase* the 
Privacy Tax that we've *already* had to pay for our social networking tools. 
In order to benefit from the world of connected devices, we have to adjust 
(again) the notion of ownership.  I want this to be the Internet of **my** 
Things, so how do we make that happen?

To really achieve that, we need to have software infrastructure that 
incorporates [Privacy by Design][], so that an individual can regain the 
ability to control their data and decide for themselves whom to share it 
with. These infrastructure tools must also work in a distributed fashion, so 
there's no requirement to ally yourself to any particular centralised 
service. Of course, the tools themselves also have to be open-source, so 
that developers can be reassured that the ground they're building their 
products on won't be taken away from them.

In the last year and a half, I've been exploring these ideas at the 
[Cambridge Computer Laboratory][].  A lot of cutting edge work is being done 
on the problems of [Identity and connectivity][signpost-post] as well as the 
operating systems for the future.  Infrastructure and tools are being shaped 
that together form a new toolstack to make the creation and management of 
decentralised networks easier<sup>&Dagger;</sup>.  There's a larger picture 
emerging from this work and it's time to start talking more about it and 
describing the pieces.  We're calling this open-source toolstack 
**[Nymote][]** and there's a new site where you can read more about it and 
keep up with news and releases.  The [introductory post][nymote-intro-blog] 
there describes more about the background and what we're working on.  

I'll be writing about this work both here and on the [Nymote Blog][] and I'd 
love to hear from others who are interested in this area -- please do 
[get in touch with me][about] or leave a comment.  If you'd like to sign up 
for updates by email, you can [join the Nymote list here][nymote-list].

[dropbox-breaches]: http://venturebeat.com/2012/08/01/dropbox-has-become-problem-child-of-cloud-security/
[eff-google-xmpp]: https://www.eff.org/deeplinks/2013/05/google-abandons-open-standards-instant-messaging
[groklaw-apple]: http://www.groklaw.net/article.php?story=20130523150909464
[Privacy by Design]: http://en.wikipedia.org/wiki/Privacy_by_Design
[Cambridge Computer Laboratory]: http://www.cl.cam.ac.uk
[signpost-post]: http://nymote.org/connected-devices-and-signpost
[Nymote]: http://nymote.org
[nymote-intro-blog]: http://nymote.org/blog/2013/introducing-nymote/
[Nymote Blog]: http://nymote.org/blog
[about]: /about
[nymote-list]: http://eepurl.com/mXYb1


<!-- footnotes -->
<p class="footnote">* Sky+ came out with this feature a few months after I started discussing it with people.</p>

<p class="footnote"><sup>&dagger;</sup> Yes, people told me this was insane and I'd burn my house down.  Luckily for my housemates, I never actually got around to implementing anything.</p>

<p class="footnote"><sup>&Dagger;</sup> This is somewhat ironic as decentralisation was one of the founding tenets of the Internet. We're just helping people get back to that.</p>
