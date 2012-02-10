---
layout: page
title: Amir Chaudhry
---
{% include JB/setup %}

This blog contains sample posts which help stage pages and blog data.
When you don't need the samples anymore just delete the `_posts/core-samples` folder.

    $ rm -rf _posts/core-samples

Here's a sample "posts list".

<ul class="posts">
  {% for post in site.posts %}
    <li class="posts"><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

# And another title here

Test post. Not to be kept

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sodales est nec risus dapibus nec dictum ligula pulvinar. Curabitur pharetra, justo eu viverra vestibulum, risus est porta erat, et sollicitudin lorem massa sit amet mi. Proin eros tellus, egestas eu porttitor sed, condimentum vitae nulla. Maecenas mollis auctor nisi vitae condimentum. Phasellus enim lorem, cursus a sollicitudin sed, lobortis vitae sapien. Sed vestibulum mollis lorem nec accumsan. Curabitur quis elit sed augue aliquam dignissim. Praesent quis condimentum tellus. Phasellus ut nisi leo. Cras quam neque, faucibus quis consequat in, rutrum nec metus. Integer tellus elit, tempor vel imperdiet ut, convallis vitae ipsum. Donec nec sem vel felis tincidunt aliquet.

Aliquam vel dolor in purus imperdiet varius. Vivamus quam tellus, luctus in iaculis vitae, faucibus vel magna. Nunc bibendum tortor sed est tempor fermentum. Nunc eu metus tortor, nec fermentum tortor. Quisque quis nisi massa. Vestibulum ornare mauris vehicula tortor tincidunt eget auctor ante consequat. Proin tempor velit mauris, nec viverra turpis. Vestibulum tristique consectetur elit et dignissim. In suscipit odio nec augue sodales adipiscing. Curabitur ullamcorper tincidunt convallis. In in urna sem, et elementum odio. Donec pulvinar massa eu risus ultrices interdum. In malesuada malesuada congue. Etiam nisl metus, feugiat id blandit vel, molestie sit amet lacus. Nunc ultrices mattis ipsum, nec commodo turpis ornare ut. Etiam sit amet risus in nunc tincidunt vehicula.


