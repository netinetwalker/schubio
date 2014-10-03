---
layout: post
title: "XMPP - A little introduction"
date: 2011-09-24 00:00:00
tags:
  - technologies
  - xmpp
---

Recently I worked on a little project and I wanted to control a special device
remotely. I am using XMPP for my daily chats and I had in my mind XMPP is
extendable and so I decided to use XMPP for that.

Unfortunately my knowledge of XMPP wasn't that huge, so I read a lot about that
protocol. I ended up reading the RFCs [6120][rfc6120], [6121][rfc6121] and
[6122][rfc6122].

I got a lot of input and I had some long telnet-sessions with my XMPP-server.
;) As I'm sure I cannot remember everything in a year, I'll write some
blogposts describing XMPP a bit.

## XMPP? What is it?

XMPP is short for Extensible Messaging and Presence Protocol and that's what it
is. XMPP is a decentralized system for sending messages around the world.
That's pretty cool as you can set up your own chatting server - privacy wins.
(You know, I'm one of the coders and supporters of [Diaspora\*][diaspora] -
it's decentralized, too.) All data are XML - easy to use and easy to expand.

## How XMPP works

XMPP is a decentralized network. Because of that, there are
Server-to-Server-connections and Server-to-Client-connection. I'll only write
about stuff regarding the Server-to-Client-connections as I don't want to write
a XMPP-server.

XMPP's user names look like email-addresses: `user1@example.com` - in that
example there is a user1 on example.com. user1 is able to connect with guys
from other servers, so `user1@example.com` can chat with `user2@foobar.com`.

XMPP is able to handle multiple logins with the same user at the same time. So
you could leave your PC logged in, take your smartphone to the balcony and
continue chatting outside. The differentiation is getting done by "resources".
A resource could be "balcony", "android", "pc" or whatever. You cannot use a
resource multiple per user, of course.

Imagine you are outside and chatting with your android. It would be nice if you
can receive all the incoming stuff at your phone, your PC should continue
idling around, huh? That's why there are priorities in XMPP. It's an interger
between -128 to +127. The server _should_ deliever the messages to the client
with the highest priority.

## A basic XML-snippet

Let's take a look at a very basic thing - let's send a message to a friend over
XMPP:

```xml
<message type='chat' id='123abc123' to='user1@example.com'>
  <body>Hello my friend!</body>
</message>
```

That is awesome, huh? Let's analyse it a bit. I think there's no need to
explain what the opening `<message>` does. But let's have a look at its
attributes:

* *type*: In our example it's set to `chat`, because we want to send a direct
  message to another user. Other possible values are
  * *error*: You'll see this when something goes wrong. Every client _should_
    provide an error-dialog for that.
  * *groupchat*: A message which belongs to a groupchat. Groupchats are not
    supported by default, they are an extension, I'll write about it in another
    post.
  * *headline*: Similar to `chat`, but that will be delivered to all available
    resources, ignoring the priority.
  * *normal*: It's like `chat`, but out of the context of any conversation. The
    client _should_ provide an interface which allows the user to reply a
    message, but it _should not_ log anything.
* *id*: The id is used for tracking any response and/or errors in relation to
  the message you just send. For `<message/>` and `<presence/>` stanzas an id
  is recommended, for `<iq/>` stanzas it's required. An id has to be unique -
  usually the id gets incremented.
* *body*: Contains the message. :)

That's enough for a little introduction. ~~More to come soon.~~ Right now, I am
way too busy to write further posts about XMPP. Sorry for that.

[diaspora]: http://github.com/diaspora/diaspora
[rfc6120]: http://xmpp.org/rfcs/rfc6120.html
[rfc6121]: http://xmpp.org/rfcs/rfc6121.html
[rfc6122]: http://xmpp.org/rfcs/rfc6122.html
