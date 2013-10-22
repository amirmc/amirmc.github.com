---
layout: post
title: "FP Days OCaml Session"
author: Amir Chaudhry
date: 2013-10-22 21:00:00
tags: [ocaml, ocamllabs]
shorturl: http://bit.ly/1bbVYIH
---
{% include JB/setup %}

On Thursday, along with [Jeremy](https://github.com/yallop) and 
[Leo](http://www.lpw25.net), I'll be running an OCaml Hands-on Session at 
the [FPDays conference](http://fpdays.net/2013/). Below are some prep 
instructions for attendees.

### Preparation for the session 

If you're starting from scratch, installation can take some time so it's 
best to get as much done in advance as possible.  You'll need OPAM (the 
package manager), OCaml 4.01 (available through OPAM) and a few libraries 
before Thursday.  If you have any issues, please contact Amir.

* **OPAM**: Follow the instructions for your platform at [http://opam.ocaml.org/doc/Quick_Install.html](http://opam.ocaml.org/doc/Quick_Install.html). 
OPAM requires OCaml so hopefully the relevant dependencies will kick in and 
you'll get OCaml too (most likely version 3.12).  You can get a cup of 
coffee while you wait. After installation, run `opam init` to initialise OPAM.

* **OCaml 4.01**: We actually need the latest version of OCaml but OPAM 
makes this easy.  Just run the following (and get more coffee):

{% highlight bash %}
$ opam update
$ opam switch 4.01.0
$ eval `opam config env`
{% endhighlight %}

* **Libraries**: For the workshop you will need to check that you have the 
following installed: `libffi`, `pcre` and `pkg-config`.  This will depend on 
your platform so on a Mac with homebrew I would do 
`brew install libffi pcre pkg-config` or on Debian or Ubuntu 
`apt-get install libffi-dev`.  After this, two OCaml packages it's worth 
installing in advance are `core` and `js_of_ocaml` so simply run:

{% highlight bash %}
$ opam install core js_of_ocaml
{% endhighlight %}

OPAM will take care of the dependencies and the rest we can get on the day!
