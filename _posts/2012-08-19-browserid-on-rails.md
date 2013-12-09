---
layout: post
title: "BrowserID on Rails"
date: 2012-08-19 00:00:00
tags:
  - browserid
  - ruby
---

While working on a larger Rails application we thought about enabling BrowserID/Persona authentication. [Here][persona-mdn] you can find some more information about what Persona is.

As we are building our application using Rails and doing the authentication stuff using [Devise][devise], I was looking for a way to enable BrowserID in Devise. I found some solutions to authenticate a user using the email-address returned by BrowserID but they all failed if the user was not in the database. So the user had to sign up using the Rails application first to be able to use Persona authentication.

I wanted to allow even "first time users" using BrowserID so the Warden strategy has to create the user if it's not there. We are not using any kind of username, just the email-address and a password. The email address we get from BrowserID is a verified one so we don't have to bother about invalid addresses.

So I built a little warden strategy to sign in a user of create a new one if the email address is not known yet. That strategy also creates a password for that user account so the user could theoretically also use the "Reset password" function and sign in with email address/password and BrowserID simultaneous. That also works the other way round, so a user who signed up using his email address and a password could use BrowserID if he adds the email address to his Persona account.

Together with some other small stuff I published the Warden strategy in a Gem called `devise_browserid_authenticatable` and you can find the code [at Github][github]. If you have any feedback, I would be happy to hear it.

[devise]: https://github.com/plataformatec/devise
[github]: https://github.com/denschub/devise_browserid_authenticatable
[persona-mdn]: https://developer.mozilla.org/en-US/docs/Persona
