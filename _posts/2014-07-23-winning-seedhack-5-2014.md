---
layout: post
title: "Winning Seedhack 5.0"
author: Amir Chaudhry
date: 2014-07-23 12:00:00
tags: [apps, calendar, centralisation, cloud, essay, fun,
hackathon, internet of things, mirage, nymote, ownership, pics,
project, seedcamp, software, startups, tech, website]
description:
shorturl: http://bit.ly/1wSm6C7
---
{% include JB/setup %}

A couple of weeks ago, I took part in [Seedhack 5.0][seedhack], on the theme
of life-logging. My team were overall winners with Clarity, our calendar
assistant app. This post captures my experiences of what happened over the
weekend, the process of how we built the app and the main things I learned.
You'll find out what Clarity is at the end -- just like we did.

[seedhack]: http://seedhack.com


### Meeting people and pitches on Friday

The weekend began with some information on the APIs available to us, which
was followed by pizza and mingling with everyone. I spoke to a few people
about what they were working on and the technologies they were used to. It
was good to find a mixture of experience and I was specifically looking for
folks with an interest in functional programming -- that's how I first met
Vlad over Twitter. 

[![Tweets with Vlad](http://amirchaudhry.com/images/seedhack2014/seedhack2014-1.jpg)](https://twitter.com/vla_ve/statuses/485083697172185088)

After pizza, those people with ideas, even if not fully formed, were invited
to share them with the room. I came in to Seedhack with specific thoughts on
the kind of things I wanted to work on so I spoke about one of those.  


### Pitching Personal Clouds

I described the problem of silos, poor interoperability and how all the
life-logging data should really be owned by the user. That would allow third
parties to request access and provide way more value to users, while
maintaining privacy and security. Building a centralised service makes a lot
of sense in the first instance but what's more disruptive than eschewing the
current model of yet-another-silo and putting the user in control? If that
sounds familiar, it's because I'm trying to solve these problems already.  

I'm working on a open source toolstack for building distributed systems that
I call the MISO stack, which is analogous to the LAMP stack of old but
is based on [Mirage OS][mirage-www].  With this stack, I'm putting together a
system to help people create and run their own little piece of the cloud
-- [Nymote][nymote]. The [introductory post][nymote-intro] and my post on
'[The Internet of *my* Things][amc-iot]' has more detail on why I'm working
on this. 

For systems like this to be viable, we must be willing to trust them with
the core applications of Email, Contacts and Calendar. Without advanced and
robust options for running these, it's unlikely that anyone (including me)
would want to switch away from the current providers. Of these three
applications, I decided to talk about the contact management solution, since
I happen to have wireframes and thought it might be simpler to implement
something over the weekend. 

<!--
Some readers may not be convinced but I like to recall a 1977 quote by Ken
Olsen, Cofounder and CEO of Digital Equipment Corp., who said *"[There is no
reason for any individual to have a computer in his home][olsen]."* We now
carry computers in our pockets (see footnote), so it's perfectly reasonable
to me that we'll all have our own clouds one day.
-->

There was quite a bit of interest in the overall concept but what really
piqued my curiosity was that someone else presented some thoughts around
Calendars and analytics. After a brief chat, we decided to join forces and
tackle the problems of Calendar management. The team had a great mix of
experience from product to design and several of them had worked together
before.

[mirage-www]: http://openmirage.org
[nymote]: http://nymote.org
[nymote-intro]: http://nymote.org/blog/2013/introducing-nymote/
[amc-iot]: http://amirchaudhry.com/working-on-the-internet-of-my-things/

[olsen]: http://www.snopes.com/quotes/kenolsen.asp
[digital-natives]: http://www.brondbjerg.co.uk/blog/2014/06/building-the-next-generation-of-the-web/
[smart-homes]: http://www.cambridgenetwork.co.uk/news/smart-homes-2013-nymote-org-comes-top-of-speaker-survey/


### The Clarity Team

[Amir] - *Product* - Worked in several startups, product & programme management experience, currently a Post Doc at Cambridge University Computer Science dept.

[River] - *Product* - Programme Manager at Dotforge Accelerator and lead organiser of StartupBus UK 2014.

[Mani] - *Developer* - Freelance web dev (CMS and APIs), winner of multiple hackathons, currently studying at Sheffield University.

[Vlad] - *Developer* - Started programming long ago and attended many competitions and hackathons. Currently studying Computer Science at the University of Southampton.

[João] - *Developer* - PhD in Theoretical Physics, Python enthusiast and moving into data science, currently doing data analysis at Potential.

[Jeremy] - *Designer* - Freelance UI/UX Designer, hackathon enthusiast, currently studying medicine at Sheffield University.

[Amir]: http://amirchaudhry.com
[River]: http://twitter.com/rivertam57
[Mani]: http://msingh.co
[Vlad]: http://vladvelici.github.io
[João]: http://linkedin.com/in/joaoaparicio
[Jeremy]: http://jchui.me


### Thick fog and ambiguity on Friday evening

We had all decided to work together and we knew it would be on the problem
of calendar management and analytics. We were fired up but it quickly became
obvious that was *all* we knew.

The next four to five *hours* were spent discussing the rough shape of what
we were going to build, what specific problem we thought we were solving and
whether there were enough people with such a problem to care. 

We had a look at each other's calendars and talked about how we each use
them and the things we like and dislike about them. For example, I have
around nine calendars and I curate them carefully, adding contextual
information and sometimes even correcting old events to reflect what
happened. We even bounced around the idea of the contact management app
several times as well as a few other ideas that came up during the
discussions. 

These conversations took a while and it seemed like we were going around in
circles. Despite this, it didn't feel particularly frustrating. I realised
that the same sticking point was coming up repeatedly because we were
forcing ourselves to imagine a prototypical customer and the problems *they*
might have. This was never going to work since we wouldn't have time to go
and find such people and do basic customer development. Far better to
constrain the problem to something *we* experience so that we can look to
ourselves for initial customer feedback.  Once we did this, things seemed to
go a little faster and taking breaks for food helped us keep our energy up.

[![Mani grabbing falafel for dinner](http://amirchaudhry.com/images/seedhack2014/seedhack2014-2.jpg)](https://twitter.com/inthecompanyof/status/485463322020839424)

There were a few occasions where I looked around the room and saw other
teams with their heads down, headphones in, and bashing away at keyboards
-- we hadn't even figured out what we were doing yet.
Despite this, it was a great exercise because it allowed all of us to get a
feel for what aspects each of us cared about most and it helped us form some
kind of shared language for the product. 

The only outcome from this first evening was an outline but it was an
important one. It distilled what we what we were going to work on and the
components of it. We did this so we'd have a clear starting point the next
morning and could get going quickly.  Here's a paraphrased version of what
we sent ourselves. 

```text
Smart Calendar App.

We are collecting data from mobile and from desktop. 
- Mobile includes:
  - Call logs
  - Location (if we can)
  - Messages
  - What application is being used and when
- Desktop includes:
  - What application is active and timestamps of it
  - Location?
  - Git Logs ... ?
  - Taking logs of their existing calendars.

Working out what people are doing.
- Extrapolating info from active application (e.g browser page)

Present info back via calendar UI
- Need to turn all this information into webcal events

Useful info we want
- Time spent travelling (how much?)
- Time in meetings 
- Time on phone
- Who the meetings/calls were with
- Relevant docs/emails these are linked with
- Use labels
```

Then it was time for some late night snacks.

[![Midnight snacks](http://amirchaudhry.com/images/seedhack2014/seedhack2014-3.jpg)](https://twitter.com/nicolagreco/status/485201493633826818)

With one challenge out of the way, the next one was finding somewhere to
sleep for a few hours (Campus was closing from 01:30). I had nothing planned
but luckily for me, a couple of team members had booked a hotel room for the
night. The minor complication was that we had to first find the hotel and
then somehow get six people into a room meant for two -- without the night
manager kicking us out. That's a whole other story, but it suffices to say
that James Bond has nothing to worry about.


### Rays of light and clearing haze on Saturday

After some card games and a few hours of sleep, we headed back to Campus and
during this walk, we came up with 'Clarity' as the name of the application. 

Once we arrived, development began. River volunteered his digital
assets to the cause (i.e. his whole Google life). Mani worked on the Android
app, Vlad on a Chrome extension with Joao pulling in the Google Apps data as
well as combining it with data from the various platform apps. Jeremy worked
on the front-end of the site, while River and I began wireframing the UI and
user flow through the site. 

Once the development was well underway, I realised how superfluous 'the
business guys' can be. It would have been easy to simply sit there and let
everyone get on with it but there were other things River and I did while
developers were writing code.

*Wireframing* - We spent time thinking about what a user would actually see
and engage with once they visited the Clarity site. We made a lot of
sketches on paper and this was helpful because communication with the team
was smoother with something to guide the discussion. It also helped to
inform the design work and gave River and I something to show to potential
users. 

*Talk to people* - aka early customer development. We already knew that we
were our own customers but it was useful to talk to other people for two
reasons. Firstly, to get an idea of how they use their calendars and whether
they have similar problems to us and secondly, to see what thoughts we
prompt when we describe our solution (or show our wireframes). This led to
useful information on how we should refine the product and and position
ourselves against perceived competition.

*Refine the product* - Going through the wireframing and talking to people
helped us come up with several new ideas for how to display the data back to
users. Some of these seemed great at the time, but after showing some paper
sketches to other people, we realised customers didn't care about certain
things, so we discarded them. Even though Jeremy had already done the work of
putting together the UI for them (sorry, Jeremy!).

*Examine the competition* - After we described what we were working on. A
few people mentioned potential competitors and asked how we were different.
Initially, we didn't know much about these companies but it was something we
could explore while development was underway and consider our positioning.

*Remind people to regroup* - Every few hours, we would make sure everyone
caught up with each other.  We would check that things were going well, share
what we'd learned from talking to people and discuss any technical problems
and possible workarounds -- including changing the scope of the product. The
discussions we'd had on Friday meant that we spent less time debating when
these questions came up during the weekend.

*Work on the pitch* - River and I began working on the pitch from just after
Saturday lunchtime and kept building on it until Sunday afternoon. This,
combined with showing our sketches to people, made it much easier to think
about the story we wanted to tell the audience. In turn, that made it easier
to think about the product development that *had* to be completed by Sunday.
Especially in terms of a kick-ass demo.

[![Popcorn and candyfloss](http://amirchaudhry.com/images/seedhack2014/seedhack2014-4.jpg)](https://twitter.com/mindeedly/status/485502064437780480)


### Bright sunshine and achieving Clarity on Sunday afternoon

Development carried on through the night and we took a break to watch some
sports via River's laptop -- at this point Clarity was actually logging this
and other events.
The next morning, we reiterated what we needed to
get done for the demo and I was pretty ruthless about practising the pitch.
River and I practised endlessly while everyone else made sure the the
technical pieces were working smoothly. We had a lot of moving parts and
making sure they were glued together seamlessly was important.
At this point, we knew what Clarity was and how to tell its story.


### Introducing Clarity

We all have calendars and we put a lot of time and effort into managing them
but get very little back. A simple glance at your calendar for the past
month will show you a sea of information with no idea where your time was
actually spent. We believe your calendar should be working harder for you.
Your calendar should give you clarity. 

![Calendar](http://amirchaudhry.com/images/seedhack2014/seedhack2014-5.jpg)

Over the course of the weekend, we built tools that can go through your
calendar and understand the events you're involved in and tie them back to
the relevant emails, documents and people.  With a suite of software that
spans across your GDrive, Chrome and Android, we're able to combine your
calendars with rich, contextual information so you can really understand
what your time is being spent on.

[![Clarity summary view](http://amirchaudhry.com/images/seedhack2014/seedhack2014-6.jpg)](http://clarityapp.me)

We built this system and plugged it into River's digital life.
If we take a look at River's summary for the last month, we see that he's
spent around 32 hours in meetings in London last month, despite living in
Sheffield. We can also see that he's spent an hour on the phone with someone
called Lee, but that all of them were short calls. The next person also
totalled an hour on the phone but only across 3 calls.  Already, River has
learned something about the the people he interacts with most and how. We
can also drill down further and see all this activity presented in a
calendar view, except this now represents where his time *did* go, rather
than where he thought it went. For example, he's most active via text
message between 4pm and 5pm during the week, and we can see that he spent
a few hours watching sports last night.

Clarity can do much more than provide an accurate retrospective view of your
time. Since it interacts with all the important components of your life,
like your phone and laptop, it can even perform helpful actions for you.
For example, say I have a meeting set up with River but I want to reschedule
it. I simply send a text to him as I normally would, suggesting that we move
it to another day. Clarity can pick up that message and is smart enough to
understand its intent, find the relevant calendar event and *reschedule
it automatically*. River doesn't have to lift a finger and his diary is
always up to date. It's easy to imagine a future where we might never have
to add or edit events ourselves. 

Clarity is a smart calendar assistant that understands the context around
you, provides you with insight into your life and helps you seamlessly
organise your future. You can find out more at
[http://clarityapp.me](http://clarityapp.me)

<script async class="speakerdeck-embed" data-id="c88770b0ef1801315b3b2e79871312e8" data-ratio="1.41436464088398" src="//speakerdeck.com/assets/embed.js"></script>


### Judging and announcements

After the pitches, we met a lot of people who had the same problems as we
did with calendar management. Several offered to be beta testers. After
waiting for the judges, prizes were announced and Clarity was declared the
overall winner of Seedhack 5.0!

{% assign image_folder = 'seedhack2014-win' %}
{% assign number_of_images = 11 %}
{% include amc/make_gallery %}


### Things I learned

Looking back, there were a lot of things we did which I think
helped us get to the winning slot, so I thought I'd summarise them here.

**Think first** - We spent time up front to *define* what we were
going to work on. I thought this step was crucial as it meant we all
understood the shape of the problem but also the areas that each of us were
interested in.  That helped later in the weekend as we could refer back to
things we discussed on Friday.

**Move fast** - Once we did figure out what we were doing, then it was a
matter of building the software to gather and crunch the data. A lot of this
was done in parallel as Jeremy worked on the front-end UI while Mani, Joao
and Vlad took care of the data aggregation, analytics and platform products.
Don't be afraid to throw away ideas if you find that they don't work for
people and remember it's a *hackathon* (i.e gruesome hacks are the norm).

**Remember the demo** - At some point you're going to be forced to stand up
and talk about what you've done. We started thinking about this from
Saturday lunchtime and sketched out the slides and the elements of the app
we wanted to show. This helped inform the UI and technology that we were
building and the pitch never felt like it was rushed.

**Practice, practice, practice** - we were told we'd have 3 minutes to
pitch/demo and maybe a few additional questions. I made sure River and I
practised *repeatedly* to get our time down to 3mins and ensure we getting
across everything we wanted to.  The important thing with such a
short amount of time, is that we were forced to *cut* things out as well as
ensure we emphasised the main points. It was a ruthless exercise in saying
'no'. During the actual pitches, we realised everyone was taking longer
(without repercussions), so I added an extra 30 seconds to cover the
potential market sizes and business models.

**Leave artefacts** - After the pitches, we knew that we had to take the
site down. It was built at high speed and in a way that ended up exposing
someone's data to the internet at large (thanks, River!). It might have have
been somewhat easier to build something using faked data that we could
happily share the URL to and leave online.  On the other hand, our demo
would not have been half as compelling if we weren't running it real-time
on live data.


### Looking to the future

This is a product we all want to use and the team is interested in taking
this forward. There are a lot of things to think about and many
things we would build differently so we're discussing the next steps. For
example, there are likely ways to empower the end-users to control their
data and give them more flexibility, even though the work at the hackathon
was already quite impressive. Given how well Seedhack went, you might even
see us at [Seedcamp Week][seedcamp] later in the year. If you think this is
something you'd like to work on with us,
[do get in touch](mailto:amirmc+clarity@gmail.com)!

To wrap things up, here's a victory selfie!

[![Victory Selfie](http://amirchaudhry.com/images/seedhack2014/seedhack2014-7.jpg)](https://twitter.com/RiverTam57/status/485821694037458944)

[seedcamp]: http://seedcamp.com/events/seedcamp-week-london/

<!-- 
****

<p class="footnote">**Footnote: It's worth reading the
<a href="http://www.snopes.com/quotes/kenolsen.asp">linked article</a> as
the quote is usually taken out of context -- did you notice that I'm guilty
of that too? :). Ken actually <strong>did</strong> understand the value of
PCs and having them at home. What he was disputing was that we would have
computers everywhere that would be running our lives. There's delicious
irony here because that is <strong>exactly</strong> the promise of the
Internet of Things and 'Big Data'. Systems that know us better than we know
ourselves.</p>
-->
