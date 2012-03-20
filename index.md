---
layout: default
title: Amir Chaudhry
---
{% include JB/setup %}

{% for post in site.posts %}
<div class="row">
  <div class="span2">
    <h5 class="post-date" align="right">{{ post.date | date_to_long_string }}</h5>
  </div>
  <div class="span7">
    <h2><a class="post-title" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
    <br />
    {{ post.content }}
    <a href="{{ BASE_PATH }}{{ post.url }}#comments">Comments</a>
    <hr>
    <br />
    <br />
  </div>
</div>
{% endfor %}

<!-- <div class="row">
  <div class="span2 offset9">
    <h3><a href="#">Sidebar goes here</a></h3>
  </div>
</div> 
apparently not :)
-->

<div class="row">
  <div class="span7 offset2">
    <h3><a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">More posts</a></h3>
  </div>
</div>

