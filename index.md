---
layout: default
---

As I am not blogging that much, you should also check out my social profiles to get some newer stuff. If you want to know more about who I am and what I am doing, check out my [profile][profile]. I am very happy when communcating with people I don't know, so [contact me][contact] if you like.

[contact]: /contact.html
[profile]: /profile.html
[projects]: /projects/index.html

<section id="blogposts">
{% for post in site.posts %}
  <article>
    <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
    <p class="metaline">
      <span class="dateline"><i class="icon-date"></i> {{ post.date | date: "%Y-%m-%d" }}</span>
      <span class="tagline"><i class="icon-tag"></i> {{ post.tags | join: ", " }}</span>
    </p>
  </article>
{% endfor %}
</section>
