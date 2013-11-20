---
layout: post
title: "Review of the OCaml FPDays tutorial"
author: Amir Chaudhry
date: 2013-10-28 12:30:00
tags: [ocaml, ocaml-labs, ocamllabs]
shorturl: http://bit.ly/HoxEec
---
{% include JB/setup %}

<a href="http://fpdays.net/2013/sessions/index.php?session=24"><img style="float: right; margin-top: 10px; margin-left: 10px" src="{{BASE_PATH}}/images/web/fpdays-logo.png"></a>
Last Thursday a bunch of us from the OCaml Labs team gave an OCaml tutorial 
at the [FPDays][] conference (an event for people interested in Functional 
Programming).  [Jeremy][] and I led the session with [Leo][], [David][] and 
[Philippe][] helping everyone progress and dealing with questions.

<img style="float: left; margin-right: 10px" src="{{BASE_PATH}}/images/fpdays2013/fpdays2013-01.jpg">
It turned out to be by far the *most popular session* at the conference with 
over 20 people all wanting to get to grips with OCaml!  An excellent turnout 
and a great indicator of the interest that's out there, especially when you 
offer a hands-on session to people.  This shouldn't be a surprise as we've 
had good attendance for the general [OCaml meetups][ocaml-meetups] I've run 
and also the [compiler hacking sessions][compiler-hacking], which Jeremy and 
Leo have been building up (do sign up if you're interested in either of 
those!).  We had a nice surprise for attendees, which were 
[uncorrected proof][] copies of Real World OCaml and luckily, we had just 
enough to go around.

For the tutorial itself, Jeremy put together a nice sequence of exercises 
and a [skeleton repo][] (with helpful comments in the code) so that people 
could dive in quickly.  The event was set up to be really informal and the 
rough plan was as following:


0. *Installation/Intro* - We checked that people had been able to follow the 
[installation instructions][install-info], which we'd sent them in advance. 
We also handed out copies of the book and made sure folks were comfortable 
with [OPAM][].

1. *Hello world* - A light intro to get people familiar with the OCaml 
syntax and installing packages with OPAM. This would also help people to get 
familiar with the toolchain, workflow and compilation.  

2. *Monty Hall browser game* - Using [`js_of_ocaml`][js-ocaml], we wanted 
people to create and run the [Monty Hall problem][monty-hall] in their 
browser.  This would give people a taste of some real world interaction by 
having to deal with the DOM and interfaces.  If folks did well, they could 
add code to keep logs of the game results.

3. *Client-server game* - The previous game was all in the browser (so could 
be examined by players) so here the task was to split it into a client and 
server, ensuring the two stay in sync.  This would demonstrate the 
re-usability of the OCaml code already written and give people a feel for 
client server interactions. If people wanted to do more, they could use 
[ctypes][] and get better random numbers.  

We did manage to stick to the overall scheme as above and we think this is a 
great base from which to improve future tutorials.  It has the really nice 
benefit of having visual, interactive elements and the ability to run things 
both in the browser as well as on the server is a great way to show the 
versatility of OCaml.  `js_of_ocaml` is quite a mature tool and so it's 
no surprise that it's also used by companies such as Facebook (see the recent 
[CUFP talk by Julien Verlaguet][fb-ocaml-cufp] - skip to [19:00][]).  

We learned a lot from running this session so we've captured the good, the 
bad and the ugly below.  This is useful for anyone who'd like to run an 
OCaml tutorial in the future and also for us to be aware of the next 
time we do this.  I've incorporated the feedback from the attendees as well 
as our own thoughts.

![Heads down and hands on]({{BASE_PATH}}/images/fpdays2013/fpdays2013-03.jpg)

### Things we learnt

#### The Good

* Most people really did follow the install instructions beforehand. This 
made things so much easier on the day as we didn't have to worry about 
compile times and people getting bored.  A few people had even got in touch 
with me the night before to sort out installation problems.  

* Many folks from OCaml Labs also came over to help people, which meant 
no-one was waiting longer than around 10 seconds before getting help.  

* We had a good plan of the things we wanted to cover but we were happy to 
be flexible and made it clear the aim was to get right into it.  Several 
folks told us that they really appreciated this loose (as opposed to rigid) 
structure.  

* We didn't spend any time lecturing the room but instead got people right 
into the code.  Having enough of a skeleton to get something interesting 
working was a big plus in this regard. People did progress from the early 
examples to the later ones fairly well.

* We had a VM with the correct set up that we could log people into if they 
were having trouble locally.  Two people made use of this.

* Of course, It was great to have early proofs of the book and these were 
well-received.

![RWO books galore!]({{BASE_PATH}}/images/fpdays2013/fpdays2013-02.jpg)

#### The Bad

* In our excitement to get right into the exercises, we didn't really give 
an overview of OCaml and its benefits.  A few minutes at the beginning would 
be enough and it's important so that people can leave with a few sound-bites.

* Not everyone received my email about installation, and certainly not the 
late arrivals.  This meant some pain getting things downloaded and running 
especially due to the wifi (see 'Ugly' below).  

* A few of the people who *had* installed, didn't complete the instructions 
fully but didn't realise this until the morning of the session.  There was a good 
suggestion about having some kind of test to run that would check 
everything, so you'd know if there was something missing.

* We really should have had a cut-off where we told people to use VMs 
instead of fixing installation issues and 10-15 minutes would have been 
enough.  This would have been especially useful for the late-comers.

* We didn't really keep a record of the problems folks were having so we 
can't now go back and fix underlying issues.  To be fair, this would have 
been a little awkward to do ad-hoc but in hindsight, it's a good thing to 
plan for.

#### The Ugly

* The only ugly part was the wifi.  It turned out that the room itself was a 
bit of a dead-spot and that wasn't helped by 30ish devices trying to connect 
to one access point!  Having everyone grab packages at the same time in the 
morning probably didn't help.  It was especially tricky as all our 
mitigation plans seemed to revolve around at least having local connectivity.
In any case, this problem only lasted for the morning session and was a 
little better by the afternoon.  I'd definitely recommend a backup plan in 
the case of complete wifi failure next time!  One such plan that Leo got 
started on was to put the repository and other information onto a flash 
drive that could be shared with people.  We didn't need this in the end but 
it'll be useful to have something like this prepared for next time.  If 
anyone fancies donating a bunch of flash drives, I'll happily receive them!

Overall, it was a great session and everyone left happy, having completed 
most of the tutorial (and with a book!).  A few even continued at home 
afterwards and [got in touch][clegg-tweet] to let us know that they got 
everything working.
It was a great session and thanks to [Mark][], [Jacqui][] and the rest of 
the FPDays crew for a great conference!

![RWO Book giveaway]({{BASE_PATH}}/images/fpdays2013/fpdays2013-04.jpg)


(Thanks to Jeremy, Leo, David and Philippe for contributions to this post)


[FPDays]: http://fpdays.net/2013/sessions/index.php?session=24
[Jeremy]: https://github.com/yallop
[Leo]: http://www.lpw25.net
[David]: https://github.com/dsheets
[Philippe]: http://philippewang.info/CL/
[skeleton repo]: https://github.com/ocamllabs/fpdays-skeleton
[install-info]: http://amirchaudhry.com/fpdays-ocaml-session/
[ocaml-meetups]: http://www.meetup.com/Cambridge-NonDysFunctional-Programmers/
[compiler-hacking]: http://ocamllabs.github.io/compiler-hacking/2013/09/17/compiler-hacking-july-2013.html
[uncorrected proof]: http://en.wikipedia.org/wiki/Galley_proof
[js-ocaml]: http://ocsigen.org/js_of_ocaml/
[monty-hall]: http://en.wikipedia.org/wiki/Monty_Hall_problem
[ctypes]: http://opam.ocaml.org/pkg/ctypes/0.1.1/
[fb-ocaml-cufp]: http://www.youtube.com/watch?v=gKWNjFagR9k
[19:00]: http://www.youtube.com/watch?feature=player_detailpage&v=gKWNjFagR9k#t=1149
[Mark]: https://twitter.com/MarkDalgarno
[Jacqui]: https://twitter.com/JacquiDDavidson
[OPAM]: http://opam.ocaml.org
[clegg-tweet]: https://twitter.com/richardclegg/status/393458073052139520
