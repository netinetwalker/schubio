---
layout: default
title: Profile
---

# Personal

{% img bordered float-right /cfiles/profile_picture.jpg %}

My name is Dennis Schubert and I was born on September 17th, 1993. At the moment I am living somewhere between Stuttgart and Balingen, both cities in southern Germany. When I am not coding (or sleeping), I sometimes enjoy getting some fresh air outside and I usually have my digital camera with me. All my photos are on [flickr][flickr], most of them are licensed under some Creative Commons license. :)

# Work

Most of the time I am developing web applications. Thus I am able to create software using Ruby, Python, JavaScript and even a bit of C. ;)

I cannot decide between one of them, so I work with [Ruby on Rails][rails] and [Django][django] - depends on the project. I know rails and I'm concerned about my privacy. That's why I really like the [Diaspora\* project][diaspora] and so I am also working there a bit.

Somehow I am in love with [XMPP][xmpp], so my server monitoring, my contact form and my room heating's control are talking XMPP with me. Yes, my heating's control talks XMPP.

## Projects

Currently I get paid for developing closed source software, so I cannot list all the stuff I am working on. But still, here is a small amount of projects I am contributing to. For a full list of my open source projects, you should check out my [github account][github]. If you are interested in what I am doing, [contact][contact] me and I will tell you a bit more about what I am working on.

<ul>
{% assign projects = site.data.projects | sort: 'title' %}
{% for project in projects %}
  <li>
    <a href="{{ project.url }}"><strong>{{ project.title }}</strong></a> ({{ project.tags | join: ", " }}): <br>
    {{ project.description }}
  </li>
{% endfor %}
</ul>

# Curriculum vitae

Incomplete. Inaccurate. [Ask me][contact] if you want to know more.

* **06/2013 - present**: Software engineer at [Weber eBusiness Services GmbH][wes].
* **08/2010 - 06/2013**: Job training (specialised computer scientist for software development) at [Weber eBusiness Services GmbH][wes].
* **09/2006 - 07/2010**: Ludwig Uhland-Realschule Tuttlingen (junior high school)
* **09/2004 - 07/2006**: Immanuel Kant-Gymnasium Tuttlingen (high school)
* **09/2000 - 07/2004**: Schrotenschule Tuttlingen (elementary school)

[contact]: /contact.html
[diaspora]: https://github.com/diaspora/diaspora
[django]: https://www.djangoproject.com/
[flickr]: http://www.flickr.com/photos/denschub/sets/
[github]: https://github.com/denschub
[projects]: /projects/
[rails]: http://rubyonrails.org/
[wes]: https://www.weber-ebusiness.de/
[xmpp]: http://xmpp.org/
