---
title: dcf77webreceiver
notable: true
infolink: https://github.com/denschub/dcf77webreceiver/blob/master/README.md
sourcelink: https://github.com/denschub/dcf77webreceiver
---

The dcf77webreceiver is a  web application to receive and decode [DCF77][dcf77]
time information from inside the browser via an antenna connected to a
Raspberry Pi.  It all started as a very small proof-of-concept but it turned
out people actually like it, so I improved the web interface and made the
source public.

The project contains three components: The client, running on the Raspberry Pi
and detecting high/low-edge changes and transmitting them to the server. The
server is just a small application that proxies all data from the client into a
websocket. The web-ui will receive and decode all the information and will
display the current time and some nerd information using an HTML5 canvas, given
you have enough reception on the client.

Both the client and server run on Node.js, the web application is made using
vanilla JavaScript and Socket.io.

[dcf77]: https://en.wikipedia.org/wiki/DCF77
