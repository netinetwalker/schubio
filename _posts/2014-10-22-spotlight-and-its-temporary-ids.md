---
layout: post
title: "Spotlight and its temporary IDs"
date: 2014-10-22 03:35:00
tags:
  - privacy
---

After upgrading to 10.10 this weekend, I did the usual Man-in-the-Middle to my
system to check what components share information about me or my machines and
Spotlight was one of them. Spotlight was one of the components and I did some
basic research about the data sent to Apple servers. What I found was no
surprise since they added a little note to the Spotlight preferences:

{% img bordered center /cfiles/blog/20141022/spotlight-privacy-terms.png %}

So I avoided ranting about that. However, I just read the [statement Apple
made][apple-theverge] regarding the privacy on Spotlights "Suggestions"
including their "temporary":

> Apple devices only use a temporary anonymous session ID for a 15-minute period
> before the ID is discarded.

I cannot agree with that statement. I did a Spotlight search for - obviously -
"nuclear bomb" and I saw three requests to `api.smoot.apple.com`. The first
request was a simple GET request:

```
https://api.smoot.apple.com/search?q=nuclear+bomb&locale=en-US&time_zone=Europe/Berlin&calendar=gregorian&key=andromeda
```

Nothing fancy in the request header, nothing unique. The response, however, was
interesting:

```json
[
  {
    "completion_score": 129999.00000069685,
      "fbq": "eyJ1IjoiIiwicCI6Im51Y2xlYXIgYm9tYiIsInEiOiJudWNsZWFyIGJvbWIiLCJ0cyI6MTQxMzkzNzQ2NywiZyI6ImRlL2JhZGVud3VydHRlbWJlcmcva2FybHNydWhlIiwiYSI6InNwb3RsaWdodCIsImQiOiJtYWMiLCJsIjoiZW5fVVMiLCJpIjoiMTQzNDQxLTEsMjEiLCJjIjoiNDguNzUsOC4yNSIsImVjdiI6MCwiY2N2IjowfQ==",
      "prefix": "nuclear bomb",
      "query": "nuclear bomb",
      "results": [
        "skipped because it just contained a wikipedia article"
      ],
      "status": "OK"
  }
]
```

That `fbq` parameter made me curios. It is a base64 encoded JSON:

```json
{
  "u": "",
  "p": "nuclear bomb",
  "q": "nuclear bomb",
  "ts": 1413937467,
  "g": "de/badenwurttemberg/karlsruhe",
  "a": "spotlight",
  "d": "mac",
  "l": "en_US",
  "i": "143441-1,21",
  "c": "48.75,8.25",
  "ecv": 0,
  "ccv": 0
}
```

Uh! A geo location in the server's response! However, it is incredibly far out,
so I'm fine with that. Nothing interesting there. So, I got bored and pressed
ESC to close spotlight and suddenly, two more requests got executed. The first
one was a POST to `https://api.smoot.apple.com/fb?key=andromeda` and I was
surprised by the amount of data in the request body. It is way too much to quote
in this post, but I [uploaded the full version][response-0224-body] so you can
have a look. It seems like this request is some kind of... telemetry information
for apple.

This is interesting because I disabled the system telemetry system. However,
nothing private in there except the data already known to apple. It also
contains some of the other search requests I did in this test ("foo" and
"dasdasdas") and some request/response-header logs. Weird.

The second request was even more interesting:

```
GET https://api.smoot.apple.com/user_guid?key=andromeda
```

Boring request header. Response:

```json
{
  "guid": "26178650-7b17-4d2a-5e55-01f099dd2618",
  "timeout": 900
}
```

Ah. That is the ID Apple is talking about. Looks like a [RFC 4122][rfc4122]
UUID and apparently it got a 900 seconds timeout. Interesting. I did another
search for "nuclear bomb" and I got almost the same traffic, except for an
additional request header:

```
X-Apple-UserGuid: 26178650-7b17-4d2a-5e55-01f099dd2618
```

Yep. That is the tracking id. Allright. The telemetry POST got the same header
so I guess this GUID is appended to all requests. 38 minutes later, I did
another search query and I guess some federal agency will visit me tomorrow
because of the huge amount of search queries for nuclear bombs. Let's take a
look at the header of that search request:

```
X-Apple-UserGuid: 26178650-7b17-4d2a-5e55-01f099dd2618
```

Huh? It has been 38 minutes, folks! This ID got expired 23 minutes ago! What is
happening here? Again, the telemetry POST happened again, of course with the
same old GUID. And, quite surprising, there was another GET to `/user_guid` and
I received a new ID:

```json
{
  "guid": "91635da6-7ea8-4549-6238-8b628517d9e6",
  "timeout": 900
}
```

This behaviour is reproducible. After 15 minutes, I get a new ID, but only
**after** I fired another search query. Even if I got a new IP during that 15+
minutes, I did a search request with the new IP and the old GUID, so that is
perfectly trackable.

Even worse: Why request a UUID from a remote server? UUIDs are 128 bits of data
with some timestamp related parts and some random parts. It is almost
impossible to have a duplicate UUID generated. And, in fact, there is a
[NSUUID][nsuuid] class in Foundation Framework so generation code is already
available.

To summarize: Sessions can (and will) live longer than 15 minutes. They could
even survive a few days because as far as I can tell, the UUID only gets renewed
after a search request with an expired UUID. Plus, UUIDs are generated by an
application running on an Apple server although this is absolutely not
necessary. Nobody is able to prove if the generated UUIDs are truly random and
not related to each other.

Apple, this is not how privacy works.

$ 0.02.

[apple-theverge]: http://www.theverge.com/2014/10/20/7022881/apple-yosemite-spotlight-privacy-concerns
[nsuuid]: https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSUUID_Class/index.html
[response-0224-body]: /cfiles/blog/20141022/spotlight_20141022_0224_body.json
[rfc4122]: http://tools.ietf.org/html/rfc4122
