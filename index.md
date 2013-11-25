---
layout: default
title: Amir Chaudhry
group: nav
navtitle: home
navlink: 
navweight: 1
description: Amir Chaudhry's website
---
{% include JB/setup %}

<div class="row">
  <div class="medium-9 columns">

    {% for post in site.posts limit:5 %}
    <div class="row">
      <div class="medium-3 columns">
        <h5 class="post-date" align="right">{{ post.date | date: "%e %B %Y" }}</h5>
      </div>
      <div class="medium-9 columns">
        <h2><a class="post-title" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
        {{ post.content }}
        <a href="{{ BASE_PATH }}{{ post.url }}/#share-comment">Share / Comment</a>
        <hr>
        <br />
        <br />
      </div>
    </div>
    {% endfor %}

  </div>
  <div class="medium-3 columns">
    {% include amc/sidebar %}
  </div>
</div>


<!-- Crazy nesting just to match post alignment -->
<div class="row">
  <div class="medium-9 columns">
    <div class="row">
      <div class="medium-9 medium-offset-3 columns">
        <h3><a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">More posts</a></h3>
      </div>
    </div>
  </div>
</div>
