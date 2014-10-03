---
layout: post
title: "A good spam protection?"
date: 2011-08-20 00:00:00
tags:
  - webdev
---

As you maybe noticed I released my new blog today. One of the problems you need
to solve when coding a blog is how to protect your commenting system against
spam. There are a lot of different methods and I was comparing them in the last
few days so I'm going to write a bit about what I learned. Let's start...

## Captcha

One of the most used ways to protect systems against spam is a captcha. You
know those funny pictures with numbers and chars in it. In my opinion they are
pretty much annoying. I visited sites with captchas I was unable to solve - and
that's not the way a bot-protection should work. Additionally I read about
methods for spammers to avoid problems with captchas:

A lot of the captchas out there are pretty easy for bots to solve. That's why
people are trying to make captchas hard enough for bots - but then a lot of
people will be unable to solve them... A second way is to find users solving
the captchas for spambots. I'm not kidding, I've read about sites paying users
for solving captchas. Ha - a pretty easy way to make money, huh?

## Blocking user-agents

Some systems are trying to block special user agents to lock out bots. Well...
it's easy to change the user-agent, we all know this.

## Services like akismet

I've read about services like [akismet][akismet]. You can use that service over
an API - you're going to push a comment to their server and you'll get a "spam?
yes/no!" answer. I have no clue how that systems are working (I have not
inspected them enough) but I kinda liked the idea.

I thought about using a system like that but after I read the documentation I
decided to not do this... All system I have found wanna have stuff like the
users IP, referral links and so on. Heh - I'm not even collecting that
information...

## Ask silly questions

Nope, I'm still not kidding. I was using that method in my old plattform and
I'm using them here, too. I realized I can lock out bots by simply asking
questions like "What's the name of the big, grey animal living in Africa?". At
least they worked for me when I asked them in German - let's see if that works
here, too.

## [Update:] Ask content-related questions

MrZYX just suggested to ask a content-related question (like "What’s the first
mentioned method for spam protection?" instead of random questions. This could
be easily done by adding another field into the blogpost to define the
questions. That kind of questions should be very hard to answer for bots as
they have to read and understand the blog-post itself.

I'm always thankful for other ideas. :)

[akismet]: http://akismet.com/
