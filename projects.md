---
layout: default
title: Projects
---

# Projects

Currently I get paid to work on closed source software, so I cannot list all
the things I am working on. But still, here is a small amount of projects I am
contributing to. For a full list of my open source projects, you should check
out my [github account][github]. If you are interested in what I am doing,
[contact][contact] me and I will tell you a bit more about what I am working
on.

## Notable projects

Some of the projects you might already have heard of or somewhat interesting
things.

{% assign projects = site.projects | where: 'notable': true | sort: 'position', 'last' %}
{% for project in projects %}

### {{ project.title }}

{{ project.content }}

{% if project.infolink %}
Get [more information]({{ project.infolink }}) or [grab the source code]({{ project.sourcelink }}).
{% else %}
[Grab the source code]({{ project.sourcelink }}).
{% endif %}

{% endfor %}

## Other projects

Possibly less interesting projects. You might want to check them out, though.

<ul>
{% assign projects = site.projects | where_not: 'notable': true | sort: 'position', 'last' %}
{% for project in projects %}
  <li>
    <a href="{{ project.sourcelink }}"><strong>{{ project.title }}</strong></a><br>
    {{ project.shorttext }}
  </li>
{% endfor %}
</ul>

[contact]: /contact.html
[github]: https://github.com/denschub
