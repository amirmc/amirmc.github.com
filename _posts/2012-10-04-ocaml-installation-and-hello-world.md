---
layout: post
title: "OCaml - Installation and hello world"
author: Amir Chaudhry
tags: [30days, code, learning, ocaml]
description: "I'm learning the basics of OCaml over 30 days. This is the summary of the first few days."
shorturl: http://bit.ly/Swhtij
---
{% include JB/setup %}

<p class="footnote">This post is part of a series where I'm trying to teach myself OCaml.<br />
You might want to <a href="http://amirchaudhry.com/thirty-days-of-ocaml/">start at the beginning</a>.</p>

It's been a few days into my OCaml experience so this is a write-up of what I've come across so far.  I've spent more time reading background rather than getting stuck in so I've copied in some of the links that I've found interesting/useful at the end.


## Installation ##

There are number of ways you can get OCaml on your machine.  The most obvious  would be to get the source via the [release page][ocaml source], but you could also use something called [GODI][], which apparently bundles a bunch of other stuff alongside the language.  

I don't really want to install from source 'by hand' and I definitely don't need all the stuff that comes with GODI.  I happen to use [Homebrew][] on my machine, so I checked to see if I can install that way.  Turns out I can, so that's what I ended up doing.

{% highlight bash %}
$ brew install objective-caml
{% endhighlight %}

The current version of OCaml is 4.00.0 and you can check the version you have installed by typing `ocaml -version` in your terminal.


#### *notes* ####

Be aware that Homebrew has it's own installation process and depends on Ruby.  To get Ruby, someone recommended that I install via [Ruby Version Manager][RVM].  To be able to do the above, you'll need to have the OSX developer tools installed, which means having [Xcode][].  

[ocaml source]: http://caml.inria.fr/ocaml/release.en.html
[GODI]: http://godi.camlcity.org/godi/index.html
[Homebrew]: http://mxcl.github.com/homebrew/
[ruby]: http://www.ruby-lang.org
[RVM]: https://rvm.io/
[Xcode]: https://developer.apple.com/xcode/

## Hello World! ##

The first thing to do is get a [hello world][] programme working.  Since OCaml is a compiled language, that means writing the necessary source code into a file, compiling it and then executing it.  In this case I only need one line that prints 'hello world' to the screen and I'm taking it from INRIA's site ([link][]).

{% highlight ocaml %}
print_string "Hello, world!\n";;
{% endhighlight %}

Take the one line above and save it in a file called `hello.ml`.  Now we need to compile that file using the OCaml compiler.  At the command prompt, type the following:

{% highlight bash %}
$ ocamlc -o hello hello.ml
$ ./hello
{% endhighlight %}

Since I don't really understand the first line I should break it down. `ocamlc` is the command to invoke the compiler, the option `-o hello` means you want to name the output executable to be (in this case) 'hello' and the final argument is the source code file.  It's useful to look at the man page for `ocamlc` to see what other options are available.  The second line executes the programme, which prints hello world to the screen with a line-break.

I also notice that I now have two other files in addition to the source, `hello.cmi` and `hello.cmo`.  According to the man page, these are the 'compiled interface' and 'compiled object code file' respectively.  I have no idea what that means but removing the files doesn't affect the executable.

[link]: http://caml.inria.fr/pub/docs/u3-ocaml/ocaml-steps.html

### OCaml 'toplevel' ###

Even though OCaml is a compiled language, there's something called 'toplevel' that allows interactive use (more on [toplevel][]).  To enter this mode, you simply have to type `ocaml` at the prompt so let's try running the above hello world program using toplevel.

{% highlight text %}
$ ocaml
        OCaml version 4.00.0

# print_string "Hello, world!\n";;
Hello, world!
- : unit = ()
# #quit;;
$ 
{% endhighlight %}

The `$` prompt is the command line and the `#` prompt is where toplevel is awaiting a new line of input.  The input can span multiple lines and is terminated by `;;` (as in the source code).

To exit toplevel, type `#quit;;`.  It took me three attempts to get that right.  I haven't really played around with toplevel much and I think I'm likely to stick with source code and compiling until I'm a little more comfortable with the syntax.  

That's pretty much where I am for the moment and everything so far has been straightforward.  Obviously, I should push myself a bit harder :)

[hello world]: http://en.wikipedia.org/wiki/Hello_world_program
[toplevel]: http://caml.inria.fr/pub/docs/manual-ocaml-4.00/manual023.html


## Resources ##

This is the material I found and have been looking over for the last couple of days.  Useful as background but I'd say I'm in danger of (semi-productive) procrastination if I'm not careful.

- [OCaml Manual](http://caml.inria.fr/pub/docs/manual-ocaml-4.00) (from INRIA)
- [OCaml examples](http://caml.inria.fr/about/taste.en.html) (also INRIA)
- [OCaml Intro](http://en.wikibooks.org/wiki/Objective_Caml/Introduction) (wikibooks)
- [Minsky on ML](https://ocaml.janestreet.com/?q=node/82) (Jane Street)
- [OCaml pros](https://sites.google.com/site/steveyegge2/ocaml) (Steve Yegge)
- [OCaml cons](http://www.podval.org/~sds/ocaml-sucks.html) (Sam Steingold)
- [Think OCaml](http://www.thinkocaml.com) (PDF book)

<!--
    http://news.ycombinator.com/item?id=112129
    http://dave.fayr.am/posts/2011-08-19-lets-go-shopping.html
-->
