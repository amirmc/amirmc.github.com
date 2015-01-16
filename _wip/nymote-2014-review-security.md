---
layout: post
title: "Progress towards Nymote"
author: Amir Chaudhry
date: 2015-01-12 12:00:00
tags: [nymote]
description:
shorturl: http://amirchaudhry.com/
---
{% include JB/setup %}
<!-- 
[![Alt]({{BASE_PATH}}/images/web/#.jpg)](http://www.com)

<a href="#"><img style="float: right; margin-left: 10px" src="http://amirchaudhry.com/images/web/#"></a>
 -->

### The Emperor's new ~~clothes~~ security

Pic: http://www.informationisbeautiful.net/visualizations/worlds-biggest-data-breaches-hacks/

The state of security was put squarely in the public eye last year with a wide range of reported breaches and critical software bugs. It's no secret that large, central stores of data are enticing targets for criminals but we reasonably expect such large firms to maintain the security of their systems.  In total, almost *300 million* pieces of personal data were compromised, with a third of this being credit card numbers. The affected companies are household names and include [Target][target], [Home Depot][home-depot] and [JP Morgan][jp-morgan], [amongst others][2014-breaches]. In some cases, the affected companies had no idea they had been breached at all!

There was also the Sony Pictures breach, sensitive commercial information was breached and leaked to the world where around 100 Terabytes of sensitive data was stolen and so far, only a portion of this has been leaked to the world.  The contents range from simply [embarrassing email exchanges][sony-hack-2] to commercially damaging effects such as [movie plots][bond-script] being revealed, [secret financial information][sony-hack-1] being aired and full movies being leaked before release.  This follows on from earlier [hacks on Sony's Playstation][playstn-hack] networks.

Issues like these have a severe impact on a company's reputation and are difficult to recover from.  Target and Sony Pictures are both facing multiple legal actions from all sides and the Sony revelations in particular seem set to continue. The scale of these breaches gives an indication of how dependent we are on such organisations and how little we know about the data they hold and how they secure it.  


### An environment that breeds bugs

In addition to news around these breaches, some catastrophic software bugs also began to enter the mainstream media and public consciousness. The most well known of these was [Heartbleed][], which exposed data from cloud services including usernames, passwords and pretty much anything else that happened to be running on the affected machines — without leaving a single trace. Major services like Facebook, Google and Wikipedia were all affected.  The bug itself was in a crytpographic software library called OpenSSL, which is maintained by a [vanishingly small handful of people][open-ssl-maint], used by almost everyone, yet funded by hardly anyone. Even once the bug was fixed it required all internet users to reset their passwords and even then, only 40% of users who had heard of Heartbleed had [changed their passwords][hb-percept].

Other software bugs included [Apple's Goto Fail][goto-fail], which affected both iOS and OSX devices. The effect was to completely bypass the checks for creating secure connections, yet still inform users they were secure, even though in reality an attacker could have intercepted, viewed and modified nearly all sensitive traffic.  Another bug, as equally devastating as Heatbleed, was nicknamed [Shellshock][shellshock].  This allowed attackers to gain control of affected machines and in fact, within days of disclosure, companies reported [millions of attacks][shellshock-botnet-1] and [probes][shellshock-botnet-2]. 

So far I've only described issues that are technical in nature, which primarily affect developers and corporations.  It's their systems that are attacked so it's the knock-on effects that cause us problems.  In a world of proliferating smart devices, this is no longer the case as one, quite stark, example from last year demonstrated.

### All your pics are belong to us

If what I've described so far seems abstract, then there was also the very prominent [nude celebrity photo breach][fappening].  In late August 2014, a large trove of private photos and videos appeared on social media sites of celebrities.  Over 100 individuals were compromised, mostly women, and many of the images were nude. It was clear from the pictures that they had been taken on phones in private, so speculation focused on the many cloud storage services that promise to backup and *secure* such content — including Dropbox, Google and Apple's iCloud. It even generated a debate about who or what was at fault, ranging from claims that women shouldn't have taken such pictures in the first place to lambasting the companies for lax security.  In the end, it seemed that [iCloud accounts were breached][icloud-breach] via password and [phishing][] attacks, without the users realising anything was amiss.  Apple has since made [changes to iCloud][icloud-changes], especially with how it reports activity to users, but the emotional damage to the victims cannot be undone — demonstrating the human cost of weak security.

Of course, security is one thing but being [experimented on][fb-expt] is quite another. Facebook revealed that they had manipulated the news feeds of 700,000 people as part of an emotional contagion study. It shouldn't surprise us that they alter the feed but the manner in which this experiment was performed and the sensitive nature of the manipulations — attempting to affect emotions — caused a backlash against the company.  It highlighted some fundamental differences of opinion, where tech companies routinely adjust things to maximise 'engagement' and users remain oblivious of the terms they've signed up to.

What all these stories have in common is that breaches (and manipulations) occur and go *undetected* for some time — many months in some cases — until someone finally detects an anomalous pattern (in the case of credit cards) or the data itself is publicly released (as in the case of celebrity nudes).  It's evident that large companies are not as good at securing their systems as they would have us believe — despite the scale and resources at their disposal — and using our data to manipulate behaviour is considered acceptable.

As a result, more people are becoming concerned about the volume of information we divulge to third-parties and the level of trust we can place in their systems, irrespective of any privacy concerns.  The sheer *scale* of these activities is unprecedented, which underlines both how quickly our professional and personal lives have moved online and also how precarious those systems are that we entrust our data to.  Even the US President has called for [stronger privacy laws][obama-privacy], though it remains to be seen what comes of such rhetoric.

Overall, what's needed is a way to drastically improve the state of technology and also move it into the control of the user. There's been much activity on both these aspects and the desire for the latter is being proven by many successful crowdfunding campaigns.

<!-- ========================================================= -->

[target]: http://money.cnn.com/2014/05/05/news/companies/target-breach/index.html
[home-depot]: http://www.forbes.com/sites/quickerbettertech/2014/09/22/why-the-home-depot-breach-is-worse-than-you-think/
[jp-morgan]: http://en.wikipedia.org/wiki/2014_JPMorgan_Chase_data_breach
[2014-breaches]: http://www.networkworld.com/article/2861023/security0/worst-security-breaches-of-the-year-2014-sony-tops-the-list.html
[sony-hack-1]: http://www.hollywoodreporter.com/news/sony-hack-reveals-top-secret-754491
[sony-hack-2]: http://www.nytimes.com/2014/12/11/business/media/emails-from-hacking-reveal-sonys-dirty-laundry.html?_r=1
[sony-hack-3]: http://time.com/3625392/the-7-most-outrageous-things-we-learned-from-the-sony-hack/
[playstn-hack]: http://en.wikipedia.org/wiki/PlayStation_Network_outage

[heartbleed]: http://heartbleed.com
[open-ssl-maint]: http://www.buzzfeed.com/chrisstokelwalker/the-internet-is-being-protected-by-two-guys-named-s
[hb-percept]: http://www.pewinternet.org/2014/04/30/heartbleeds-impact/2/
[shellshock]: http://en.wikipedia.org/wiki/Shellshock_(software_bug)
[goto-fail]: http://www.wired.com/2014/02/gotofail/
[shellshock-botnet-1]: http://www.businessweek.com/news/2014-09-30/shellshock-draws-hacker-attacks-sparks-race-to-patch-bug
[shellshock-botnet-2]: http://bits.blogs.nytimes.com/2014/09/26/companies-rush-to-fix-shellshock-software-bug-as-hackers-launch-thousands-of-attacks/

[fapenning]: http://en.wikipedia.org/wiki/2014_celebrity_photo_hack
[phishing]: http://en.wikipedia.org/wiki/Phishing
[icloud-breach]: http://gizmodo.com/apple-no-celeb-nudes-came-from-icloud-breach-1629650623
[icloud-changes]: http://www.bbc.com/news/technology-29237469
[fb-expt]: http://www.nytimes.com/2014/06/30/technology/facebook-tinkers-with-users-emotions-in-news-feed-experiment-stirring-outcry.html?_r=0
[obama-privacy]: http://www.bbc.com/news/technology-30779848

<!-- ======== -->

[unsecure-cam]: http://www.networkworld.com/article/2844283/microsoft-subnet/peeping-into-73-000-unsecured-security-cameras-thanks-to-default-passwords.html

