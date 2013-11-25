---
layout: page
title: Tags
header: Posts By Tag
group: navigation
---
{% include JB/setup %}

<ul class="tag_cloud inline-list">
  {% assign tags_list = site.tags %}  
  {% include amc/ordered_tags_list %}
</ul>
<hr>

{% for tag in site.tags %} 
<h3 id="{{ tag[0] }}">{{ tag[0] }}</h3>
<ul>
  {% assign pages_list = tag[1] %}  
  {% include JB/pages_list %}
</ul>
{% endfor %}
