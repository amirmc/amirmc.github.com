---
layout: post
title: "IoT - Brave New World or Simply evolved M2M?"
author: Amir Chaudhry
date: 2014-03-13 21:00:00
tags: [conference, devices, internet of things, notes, pics]
shorturl: http://bit.ly/1fWcbIj
---
{% include JB/setup %}

I was at an [event][] run by Cambridge Wireless today on the Internet of
Things.  These are my notes. Although I've named people, I'm paraphrasing a
lot so best not to treat anything you read here as a direct quote.

There were a few audience polls conducted using little keypads they handed
out. There were only 30-ish keypads so it's not necessarily indicative of
how the whole room felt.  I took some hasty pics of a few of the slides
(mainly the poll results) so apologies for the poor quality.

[event]: http://www.cambridgewireless.co.uk/events/article/default.aspx?objid=43697

### "The Enterprise and the Internet of Things - Evolution or Revolution?"
*John Hicklin, Principal Consultant | Commercial Enterprise Markets, CGI UK*

Nowadays, you can walk into the C-suite and start a discussion about the IoT.
They may not know what they're talking about but someone's told them they
need to be thinking about it.  But what is IoT?

One of the problems in industry you go to your Director and you explain this
new tech and all the awesome things you can do with it and he asks the
dreaded question, "So what?"  Example of the Connected Toothbrush. With a
connected toothbrush you can automatically have a remote relationship with
your dentist.  But he already drives a BMW and it's not clear how he
benefits from that.  He wants you in the office where, every time you open
your mouth, he sees new business development opportunities.  For the moment,
he neither needs nor wants a remote relationship with you. Leads to the
question about who's going to sign up for the business case.

Number of key areas that need to be addressed (paraphrased):

- **Crack open the Data**: We are awash with data but don't know how to use
it. Problem with clients is that they really buy into the vision but they
have a lot of legacy systems (green screens!) which already run things.

- **Identifying value**(?): Volume is not a sign of success.  Need to know
where the value is, which means understanding it. e.g is Enron. Thousands of
documents, accountants all over the place with tons of data. It took a small
team of a few researchers doing a case study that discovered no tax had ever
been paid.  They got to the right data and asked the right questions.

- **Connectivity**(?): M2M has grown in a silo'd manner where a device takes
data and sends it to one place.  This needs to open up more and give access
to other areas of business.

- **Business operations**: People matter too. Process changes, systems that
allow real-time decisions, empowering individuals.

Overall, IoT is an enabler for a number of wider trends. IoT can improve
operational efficiency **and** enhance customer experience.  Normally these
are in conflict with each-other. However, if we just get into a tech-fest,
then we might just end up with a large number of failures as we've seen with
'Big Data'

**Poll - Which (categories of) business-related infrastructure categories
are most urgently needed for building the Internet of Things.**

![Poll results](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-1.jpg)


### "Overcoming the Internet of Things Connectivity Challenge" ###
*David Dunn, Software Engineer, Electric Imp*

Electric Imp aims to help people in Product Development in the IoT space,
namely with the connectivity problem.  The name 'IMP' came from 'Internet
Messaging Processor'. Name is also from Terry Pratchett who's stories had
devices that contained an imp which did the work :)

Building connected devices is difficult. Have to be secure, easy to set up.
There are many choices for connectivity, problems with managing the code on
the devices.  Electric Imp picked wifi and decided to do it well.  This
satisfies a lot of markets but not all.

Side story of the [hacked fridge sending spam emails][fridge-spam].  

Things run through Electric Imp system and they manage the security. It's
security as a service.  Electric Imp manages deployment of your code too so
developers can just push code and it will end up on all their devices.

[fridge-spam]: http://www.proofpoint.com/threatinsight/posts/your-fridge-is-full-of-spam-part-ll-details.php

<!-- http://www.bbc.co.uk/news/technology-25780908
http://www.economist.com/news/science-and-technology/21594955-when-internet-things-misbehaves-spam-fridge
http://www.proofpoint.com/about-us/press-releases/01162014.php
http://www.proofpoint.com/threatinsight/posts/your-fridge-is-full-of-spam-proof-of-a-Iot-driven-attack.php
http://www.proofpoint.com/threatinsight/posts/your-fridge-is-full-of-spam-part-ll-details.php -->

Simplicity comes from one-step setup.  It's optical and uses a smartphone
and flashes the screen, which sends the wifi SSID and credentials to the
device (via a sensor). Customer code runs within a VM on top of with custom
OS (impOS) taking care of I/O (TLS-encrypted wifi connection to service). 

Difficult to debug devices in the field so cloud based- service helps with
that. They do embedded stuff on the device and cloud stuff in the cloud.
There's another VM in the cloud that's paired with the VM on the device.
Heavy lifting can happens elsewhere so no need to parse JSON on the device
itself.

Q - How do you deal with identity of units?  
A - Imps have unique serials and the devices they're plugged into are also unique (missed how).


### "Real-life experiences from rolling out M2M networks and how we can learn from these in the shift to IoT" ###
*Jon Lewis, Chief Innovation Officer, Plextek Consulting*

Plextek was working in this field when it was called 'telemetry'.  One of
the earliest things they worked on was 'Lojack' (car tracking). Things then
shifted to 'smart cities' and now people talk about 'IoT' and want consumer
devices with consumer volumes.

2014 has got to be year of IoT. However, still some way from business cases
as it's too expensive to simply track your cat (approx £100 set up fee and
then around £30 pcm).

Deployment often costs more than then the sensor devices. c.f street
lighting systems.  Choice of radio system is critical.  Projects in
UK/Europe are about incremental cost savings with pay-back in less than 5yrs.
In industrialising countries, there is new build which is easier then
retrofit.  Urbanisation creates strain and demand. Local issues relate to
the Spectrum issues and local regulations (e.g mandate to use govt
encryption streams).  Data privacy is also concern as we don't know who
holds the monkey. That's made even more difficult when you go abroad.  Local
politics also matters.

**Summary**:

- Big opportunity in B2C: but need consolidation in B2B markets to get
necessary economies of scale
- Big B2B opportunity in developing countries: but is tough and needs local
partners
- Application developers need common platforms: to lower R&D costs and
enable access to global markets
- Whole value chain needs to work: building an ecosystem that connects
application developers to markets is key to achieving scale


### "The role of LTE in M2M" ###
*Georg Steimel, Head of M2M Solutions, Huawei*

About Huawei
- Three businesses: Carrier network, Consumer business, Enterprise business
- Revenues of $39Bn, No2. Telecom solution provider, 150k+ employees
worldwide

Georg is in Consumer branch for Europe.  Huawei wants to be top M2M module
vendor in the coming years.  They're operator and system integrator agnostic.

Tech evolution brings new opportunities. Mobile data traffic needs, Network
upgrading etc. Ave user expected to generated 1G data traffic per month
(currently 63MB today) and there are predicted to be 50Bn+ devices.
Examples of users are highly varied including monitoring of pregnant cows.

Challenges for mass rollout are a scattered market requiring complex
solutions.  Alignment of all parties in one adequate business model is quite
tricky, esp when it comes to customer ownership. Should consider the value
chain.

Complex business model:

- From sales to service
- Many stakeholders
  - Who pays, how much, to whom, for what service, for what benefits?
- Individual benefit must exceed cost
  - Realistic pricing
  - Appropriate effort
  - Total benefit, direct vs indirect TCO
  - Sustainability

Amount of data generated is also going to be huge.  Smart meters in German
households could send over 4TB per day, which is a huge strain for mobile
networks.

LTE advantage for M2M is obviously bandwidth but that's only relevant to a
few verticals (signage, routers, and in-car entertainment). Low latency is
more important for industrial alarms and medical devices. 


**Poll - What business models?**
![Poll results](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-2.jpg)

Break down of poll results.  
![Poll results](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-3.jpg)


### "Using networked visualisation for better decision making" ###
*Fredrik Sjostedt, Vice President | Corporate Marketing, Barco Ltd*

Barco does a lot of visualising information. Displays for radiographers,
stuff in cinema screens, screens in flight simulators and a lot more.

Need to take in data from sensors, display relevant information and allow
operators to make SMART decisions.  e.g number of CCTV cameras in London -
who's looking at them? Real 'Big Data' step is at the operator level. 

Important to use standards, rather than proprietary systems.

Q - In transport visualisation do you have low enough latency to get
real-time info?  
A- Yes, e.g on a route in Brazil near Sao Palo it's closed dues to fog.
Real-time info important for understanding the whole route.



### "Regulatory backdrop on IP and standards issues for the M2M eco-system" ###
*Justin Hill, Co-Head of the Patent Prosecution Group and Purvi Parekh, Co-Head of International Telecoms, Olswang*

**Purvi** on the Regulatory environment  
No tailor made regulation v high regulatory focus. Regulatory focus from
leading bodies and many of them said that existing regulation can be amended
to facilitate M2M/IoT.  Made more complicated by lack of globally agreed
definition of IoT (which make it difficult for lawyers).  There's generally
promotion of Open Standards.  EU does believe that this is v important.
People should read the RAND report (Nov 2013), commissioned by the EU to
examine if there should be standards.

**Justin** on IP issues  
With any standardisation process, you're hoping to increase adoption with
the trade-off of Right of IPR owners.  [FRAND][] (fair, reasonable, and
non-discriminatory terms) are also important but that's also debatable.
When considering how to protect IPR, it's worth comparing whole-system
claims with protecting at different layers of the tech/value stack and build
a portfolio.

[FRAND]: http://en.wikipedia.org/wiki/Reasonable_and_non-discriminatory_licensing

### "The impact of autonomous systems on surface transport" ###
*Paul Copping, Corporate Development Director, TRL*

TRL is the Transport Research Laboratory.  Did some work to consider the
impact of autonomous transport on the overall value chain.  Some of things
we're trying now with autonomous driving have been successfully done in the
past by other means (e.g car tracking a lane with magnets).

![Transport Value Chain](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-4.jpg)

### "Connected Products - Designing for Scale" ###
*Pilgrim Beart, Founder Director, 1248-io*

What is IoT?  Humans don't scale.  Population is predicted to tail off at
around 9Bn.  Connected devices are growing and the rate of change is
exponential (and increasing).  In the 90s we used to be our own sysadmin
with maybe one device.  Now we have several and some cloud services.  In the
future there will be many more and they'll have to manage themselves. There
are different problem you face as you go from 1 to 10 to 100 to 10000 to
1MM+ deployed devices.  Issues ranging from device updates al the way to
regulation and externalities that affect your business.

In 10 years time, when all is said and done, we won't be calling it the
Internet of Things. It'll just be called the Internet.

Q from an application developers perspective wht would you different earlier
in your development if you were to go back and start again  
A - AlertMe started a bit too early so there were a lot things were not
off-the-shelf. Had to build. Right now can see a lot people reinventing the
wheel but shouldn't need to do this.


### "A new standard to connect the Internet of Everything" ###
*Antony Rix, Senior Consultant, TTP*

One of the things TTP works on are wireless standards. 

The size of the grey blobs are in an indication of market size.  
![IoT Market Segments](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-5.jpg)

Users will expect things to cost pretty much the same as they did before.
Cost will be critical and as we buy things we generally still expect them to
last for years.

TTP Matrix is a proprietary standard specifically for use by low-cost
wireless connected devices.  It's optimised for efficient use of radio
spectrum, long range, low cost and power efficient.  Use-case example
(DisplayData) are the pricing labels on supermarket.  50k products running
through only 3 gateways (other standards would find this difficult). Low
power consumption means a battery can last 10 years.  

**Poll - Which (categories of) technical / architecture building blocks are
most urgently needed for building the Internet of Things.**
![Poll results](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-6.jpg)

### Debate ###

Interesting discussion of Humans role in IoT.  For home consumer devices
people may not want to have to make any decisions (completely automated) but
corporates my want all information in order to integrate and decide.  

How quickly will this happen? It's difficult to say when you're in the
middle of it. We'll know it's happened after the event. It takes about a
decade for things to get things in to mature in the market. On the other
hand, it's happening. 

**Poll - Big and small data - Which statement do you agree with most/least**    
I only got a pic of the latter but it's the inverse of the former
(unsurprisingly).  
![Poll results](http://amirchaudhry.com/images/cw-iot-new-world/cw-iot-new-world-7.jpg)
