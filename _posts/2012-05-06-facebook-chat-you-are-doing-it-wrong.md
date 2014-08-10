---
layout: post
title: "Facebook Chat: you are doing it wrong."
date: 2012-05-06 00:00:00
tags:
  - facebook
  - technologies
  - xmpp
---

A lot of people uses Facebook's Chat without thinking about it. As I am a XMPP guru, I know [it is based on some kind of XMPP][fb-chat-doc]. Together with some friends I am doing a little project right now: a game which will send game statuses and other information via XMPP. We thought it would be fun if we allow using the Facebook Chat account for that, too.

As [I wrote some time ago][xmpp-introduction-blog], XMPP is just XML and you can easily extend it adding own XML data. So instead of sending an instant message with code like

```xml
<message type="chat" to="john@example.com" id="aaaa0">
  <body>Ohai! How's the weather?</body>
</message>
```

you could also transfer some data:

```xml
<message type="chat" to="john@example.com" id="aaaa1">
  <mygame xmlns="http://example.com/my/namespace">
    <action>fire</action>
    <target x="13" y="20" />
  </mygame>
</message>
```

That makes it really easy to use XMPP for such things. 

## Our idea

After we discussed that, we decided to use XMPP. To prevent users from seeing the stuff we send in their own clients we decided to

* set the client's priority to `-128` to prevent our client from getting messages which are not relevant for the gameplay
* send all game relevant messages directly to the resource, not just the JID - sending it for example to `john@example.com/myGameClient` instead of `john@example.com` to make sure our gameclient gets the messages and not the client with the highest priority
* using `type="normal"` instead of `type="message"` in our `<message/>`-stanza, because the game-state-exchange is no conversation

## Facebook's XMPP is no XMPP

After we wrote down some specs, we wanted to test our XML stanzas. So we added two facebook accounts to Pidgin, opened a XMPP console and had some fun.

### Surprise! Pidgin can connect to Facebook!

Yeah, it's true. You can really use Pidgin's XMPP plugin to connect to the Facebook Chat. The username is just your Facebook username, the server is `chat.facebook.com` and the password is your usual Facebook password - Facebook authenticates using some customized SASL authentication.

### Chatting works.

Let's take a look what Facebook is sending:

```xml
<message from="john@chat.facebook.com" type="chat" to="jane@chat.facebook.com">
  <body>Hello you Facebook contact!</body>
</message>
```

That looks pretty much like XMPP. That's cool. Now let's try to

### Change the type from "chat" to "normal"

As I wrote above we wanted to use `type="normal"` instead of `type="chat"` for our messages. So we tried to send

```xml
<message type="normal" to="jane@chat.facebook.com">
  <body>Hello you Facebook contact!</body>
</message>
```

Fine. That actually works - the message was sent, we got no error and the other client showed us a notification for incoming messages. That's what we got:

```xml
<message from="john@chat.facebook.com" type="chat" to="jane@chat.facebook.com">
  <body>Hello you Facebook contact!</body>
</message>
```

Huh? We sent the message using `type="normal"` and got back a `type="chat"`. Wow, seems like Facebook just reads the `<body/>` part and kills the rest, huh? Okay, that's no big deal for us, we could deal with `type="chat"`. It's more important to send the messages exclusively to the game client so let's try

### Sending a message to a XMPP resource

Again, we sent a message using the XMPP console:

```xml
<message type="normal" to="jane@chat.facebook.com/testpidgin">
  <body>Hello you Facebook contact!</body>
</message>
```

As you see, we defined a resource the message should be sent to, `testpidgin` in this example. We clicked "send" and Pidgin beeped. But surprisingly, the webchat beeped, too and the smartphone connected to that Facebook account made some vibrations. Yuck. What are they doing? It just doesn't matter which resource you specify, every message will be sent to every device, no matter if the priority is low or not. It's broadcasting everything. But okay, let's try

### Sending custom data

That's the most important point as we need to send some data for our gamestate. So we sent

```xml
<message type="normal" to="jane@chat.facebook.com">
  <body>Hello you Facebook contact!</body>
  <mygame xmlns="http://example.com/my/namespace">
    <action>fire</action>
    <target x="13" y="20" />
  </mygame>
</message>
```

Guess what we received?

```xml
<message from="john@chat.facebook.com" type="chat" to="jane@chat.facebook.com">
  <body>Hello you Facebook contact!</body>
</message>
```

Wheeeee. No data, just the `<body/>` part. That's horrifying.

### Federation

Not much to say about that point. Facebook just kills any server-to-server communication, so you cannot add non-Facebook contacts and it's not possible to chat with Facebook contacts using a non-Facebook account.

### Result

So, Facebook's XMPP is unusable for us. We are not really sad about this as we all have real XMPP accounts, but it could be more fun if we could use Facebook. Too bad they have no full XMPP support, I'm sure they would make some users happy with that.

## Google Talk

It's funny. Google offers XMPP, too, it's called Google Talk and is well integrated in GMail, Android and some other stuff. Guess what? It just works. Google supports different chat-types, resources, custom data/namespaces and even server2server.

You can authenticate with your Google Mail address and your Google password, you can manage the Roster (XMPPs contact list) using the usual `<iq/>`-stanzas, talk to people on other servers and send custom data. Yay. So our "game" will have Google Talk support. :-)

[fb-chat-doc]: http://developers.facebook.com/docs/chat/
[xmpp-introduction-blog]: /blog/2011/09/24/xmpp-a-little-introduction.html
