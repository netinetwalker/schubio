---
layout: post
title: "Apple may collect your contacts"
date: 2014-10-24 01:53:00
tags:
  - privacy
---

Some people read my [blog post about Apples Spotlight
search][spotlight-blog-post] and I received mails from people telling me they
are shocked about the private information shared with Apple. I was quite
surprised by the amount of shocked mails because I thought people already
assumed Apple knows almost everything...

{% img bordered float-right /cfiles/blog/20141024/dummy_contact.png %}

There is another thing you should know. The problem I am going to write about
[is nothing new][imessage-privacy] and is part of Apples iMessage, but it
affects you if you are not using Apples Messaging stuff at all.

Imagine you use `Contacts.app` to manage your contacts. You have disabled all
iCloud sync options you found and you do not use any kind of remote contact
synchronizing. You did not set up `Messages.app` to chat with your friends and
you have no iPhone paired to your computer. So your contact data is pretty safe,
huh?

Well, no. Sorry.

I created an example contact called Jane Doe with two telephone numbers and two
email addresses. Most contacts will look like this. I have not set up my
`Messages.app` nor am I using FaceTime (I actually disabled the account in
FaceTimes preferences) and you might have done the same. As you can see, you
will see a Facetime and a voice calling button. These buttons will turn green if
the contact is available on FaceTime.

Can you guess how Apple checks the online/offline status of your contacts?
Well. Let's have a look at the network traffic when accessing this contact in
`Contacts.app`:

(These are four independent requests, but I extracted the first URL part and I
decoded the encoded chars in the address to make it more readable.)

```
GET https://service1.ess.apple.com/WebObjects/QueryService.woa/wa/query
    ?uri=tel:+00012345678900&weight=light
    ?uri=tel:+00012345678911&weight=light
    ?uri=mailto:jane.doe@example.com&weight=light
    ?uri=mailto:jane.doe.at.work@example.com&weight=light
```

And there is a personalized header in those requests:

```
x-id-self-uri: mailto:[the email address you used in your Apple account]
```

I do not claim that Apple will collect the email addresses and telephone
numbers, but obviously they *could* do that. And, as far as I can tell, there is
no way to disable the query for a contact's online status.

[imessage-privacy]: http://blog.quarkslab.com/imessage-privacy.html
[spotlight-blog-post]: /blog/2014/10/22/spotlight-and-its-temporary-ids.html
