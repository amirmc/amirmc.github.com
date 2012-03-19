---
layout: default
title: Amir Chaudhry
---
{% include JB/setup %}

<!--<div class="row">
  <div class="span7 offset2">
    <div class="page-header">
      <h1 class="head-title">{{ page.title }} <br /></h1>
        <h2 class="head-title"><small>thoughts, comments &amp; general ramblings</small></h2>
    </div>
  </div>

  <div class="span7 offset2">
    <div class="head-nav">
      <a href="{{ site.JB.production_url }}">home</a>
      <a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">journal</a>
      <a href="{{ BASE_PATH }}freebusy">free/busy</a>
      <a href="{{ BASE_PATH }}about">about</a>
    </div>
  </div>

</div>
-->
<div class="row">
  <div class="span7 offset2">
  <!--
  This blog contains sample posts which help stage pages and blog data.
  When you don't need the samples anymore just delete the `_posts/core-samples` folder.

      $ rm -rf _posts/core-samples

  Here's a sample "posts list".

  <ul class="posts">
    {% for post in site.posts %}
      <li class="posts"><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>

  -->

  {% for post in site.posts %}
  <br />

  <br />

  <h1><a class="post-title" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h1>
  <h6>{{ post.date | date_to_string }}</h6>
  <br />
  {{ post.content }}
  <a href="{{ BASE_PATH }}{{ post.url }}#comments">Comments</a>
  <hr>
  {% endfor %}

  <br />

  <br />

  <h3><a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">More posts</a></h3>
  </div>
</div>