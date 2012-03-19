---
layout: page
title: Amir Chaudhry
---
{% include JB/setup %}

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

<h2 align='center'><a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">See all posts...</a></h2>
