---
kind: "article"
created_at: 2012-02-29 17:00:00
title: "Reinventing tools for developers, let's start with unix terminal."
author: "Paweł Niżnik"
identifier: "reinventing-tools-for-developers-lets-start-with-unix-terminal"
---

A big chunk of our day-to-day work concentrates around unix terminal. We all know the usual flow, opening our loved text editors, running scripts, consoles, profilers, running tests, ack’ing, logging into servers, shipping code to production etc. Actually if I were about to pick the most important development tool (except programming language), I would have hard times choosing between a text editor and a terminal.

EXCERPT

I feel that working with the terminal is not really that efficient. We do the same stuff over and over again; we repeat ourselves:
 
    #!shell
    $ cd;
    $ cd ~/;
    $ git status;
    $ rm -rf / (just kidding);
    $ vim;
    $ mate .;

… and so on - every single day.
 
We write code in text editors but when we want to do something else we need to switch context to terminal - how much time is wasted on continuous context change and ‘miss clicking’ terminal / text editor / other icons?
 
We operate on data in plain text mode - no friendly and quick data visualization.
 
Finally there is no easy way to edit text that we enter in the terminal. Going to the end/beginning of the line depending which place it’s closer to the point you want to edit, and then moving your cursor over one character at a time to get to the destination - sound familiar? I was so frustrated with that, that I made a habit to enter all the commands in text editor then copy & paste to the terminal window!
 
Recently, I realized that the terminal that we all use to build the most sophisticated products, cutting edge technologies (AWS, Facebook, Google, even Airplanes) was invented a long time ago. Is it already 20 years old, or even more? How crazy is that?
 
Since then so many things changed in our world, we learned so much in context of human computer interaction, we came up with user experience, we design easy, simple products (iPhone, and recently the Windows Phone popped out, which seems to be amazingly designed), yet the terminal remained the same. How productive and effective could we be if the terminal was also up to date?
 
**No more ranting! What can be done about it?**
 
I think that there are some key assumptions that terminal needs to meet in present times:
 
  * Intelligent automation - no more repetition;
  
  * Seamless integration into working environment - no need for a context switch;
  
  * Friendly way to visualize data;
  
  * Ease of text edition;
 
I believe that this will change our lives - for better obviously!
 
I played around for a while with Automator on Mac and managed to bring shell & programming languages runtimes to a text editor. You can find the output of my work -> [http://cziko.github.com/yoke](http://cziko.github.com/yoke).

It’s neat; you simply can use all shell commands and for instance ruby in a text editor. You need to install both extensions (ruby and a shell one) and hot key both of them. Then you just select text in you editor of choice, press adequate shortcut and magic happens. Recently I even managed to make it stateful - meaning that there is a shared memory in between the commands execution. That can be used to store e.g. a current working directory. I use it on a daily basis, especially for testing parts of my ruby code.
 
**I hope more people will identify the terminal problem. Maybe some good designers will pick it up too and we can kill it 2gether!**
 
Related interesting stuff:

1. [Ivo - Terminal, reimagined](http://lubutu.com/idea/ivo);
2. [TermKit](https://github.com/unconed/TermKit);

If you have any questions or you are enthusiastic about the idea please drop me an email at [pawel@futuresimple.com](mailto:pawel@futuresimple.com).