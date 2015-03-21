# TweakStatus
Simple status checker script for your mobile substrate tweaks hosted on BigBoss repo.
This utility will send an user notification everytime one of your tweaks dowload number increases by 10 (you can obviously change that number in the code).

![alt tag](https://raw.github.com/H3xept/TweakStatus/master/img/notification.png)

#Installation
###Mac OSx
WARNING - You will have to manually install one of the dependencies, since auto-installing it creates issues.

Run <code>sudo ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future gem install nokogiri </code>

If you don't have `bundler` you'll also have to run `sudo gem install bundler`.

Finally execute `bundle install` in TweakStatus path.

#Usage 
Simply run it with `ruby TweakStats.rb`.

#More
This project is mostly a test, it will never be a big project, nor i will update it frequently.
I'm just learning Ruby and this is part of my training.
