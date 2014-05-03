---
layout: post
title: "Curiosity"
date: 2014-05-03 02:14:00
tags:
  - personal
  - technologies
---

As some of you might now, I am into computers. I cannot tell you when exactly I started playing around with computers, but it happened around the turn of the millennium. It was quite an interesting machine and I wondered what I could do with this, so I started exploring the possibilities of the hard- and software I had. Of course, I was not able to do real programming back then, but I really enjoyed playing around with the stuff I had. I got into using command prompts, applications like the Norton Commander and I had fun writing little programs doing very important tasks like increasing a counter whenever I hit my enter key. I really enjoyed the fact I can tell this machine what it should do, and that was the point I stared digging deeper.

My first real application was a tool I used for calculating something. I cannot remember what that was, but I know my father was impressed by it. Some months after that, I had a nice birthday party and my uncle (he is a software developer, too!) bought me a book. It was a book about the Object Pascal IDE Delphi and it was called "Delphi for Kids". It came with a CD shipping Delphi 3 (released in 1997) and Delphi 7 (2002). The first betas of Delphi "DiamondBack" 2005 were out on that birthday, so I started programming in 2004. I was 11 years old.

It was fun. I did a lot of stuff nobody cared about, but I enjoyed it. Delphi 3 contained an impressive amount of cool visual control elements, like a toggle switch which looked exactly like a real switch! I was in love with this button, and I really placed it everywhere. I created some settings dialogs looking like a huge cockpit of a modern airliner. Toggle buttons. Everywhere. I still enjoyed the fact the computer did exactly what I told it to do.

I continued my path on getting better at software development. I signed up to a [German online community about Delphi][dp] and shared some of my crazy stuff out there. Imagine a 13 year old kiddie doing nonsense applications and uploading them to a professional community and asking for feedback. Yep, that was me. (Hey, you guys at Delphi-PRAXiS: I am not doing Delphi development anymore, but I did not forget about you!)

Anyway... That was a way too long introduction. Sorry for that. I wanted to talk about the fact **it all started with curiosity**.

Before I got sentimental talking about how I got into computers, I wanted to write about *why* I started learning about computers. I did not intend to get a professional software engineer. I get paid for developing software, so I am a "professional" now, but that was not my intention. I was curious. I wanted to know how things work and I wanted to explore what I can do with that.

And I still am curious. I spend a lot of my free time reverse engineering protocols, listening to radio transmitted data I do not yet understand, reading documentations, trying out stuff. In fact, that is how I learned almost everything I know today. "Why am I out of memory? Why does this application need so much memory? How does memory management actually work? - Oh! Cool!"

Doing such explorations made me really love the very tiny parts our whole world is based on. Learning about IP, TCP, UDP and related technologies made me acknowledge what it takes to provide access to a [video of a red panda playing in the snow][panda] uploaded by someone in Japan. It made me acknowledge what it takes to read my mail on my smartphone. It made me acknowledge what it takes to chat with friends far away. And, even more important: It made me want to improve and spread these technologies and it made me want to share the knowledge.

Last week, I talked to a guy who is doing .NET development for a living and he is doing his job very well. However, I realized he does not really care about the things going on below the surface of the framework (I am going to use him as an example, but I know a lot of people like this). When doing a SOAP request, he does not think about the HTTP over TCP over IP over Ethernet. When doing a filesystem operation, he does not think about the filesystem, the Kernel and even the hardware. When doing a Skype call to an American friend on his smartphone while driving at 100 km/h on the highway, he does not think about the stuff needed to make this possible.

I totally understand this. Why should one care? This stuff is there, it works, so we do not have to change it, so why should taking it for granted be bad?

By just taking technologies for granted, you will forget about it. If there is an error in these layers, you would not be able to find it because you are unable to debug these layers. You will never have one of those very cool "oh gosh! I understand it!" moments when reading the binary transcript of an HTTP request. And you will never feel how awesome it is to get 90ms ping response times to a server located on the other end of the world.

And while more and more people start ignoring these "core technologies", they are still there. Accessing your friends photos on Facebook still requires your browser to talk to the web server. Via HTTP over TCP over IP over Ethernet (and some more even deeper stuff). Sending a text message to a friend still requires your mobile phone to send binary chunks of data to a nearby radio station, which is going to send your message to a server which will then continue the chain until the message is on your friend's phone.

These little details are huge. Look at them. Learn how they work. It is awesome.

[dp]: http://www.delphipraxis.net/
[panda]: https://www.youtube.com/watch?v=y6GaPkkGZGw
