---
kind: 'article'
created_at: '2012-02-24 12:00:00'
title: 'Gracefully exiting from console program'
author: "Marcin Bunsch"
---

###### Marcin Bunsch
Imagine you write a CLI program or a Rake task which loops through some data performing some work on it. You run it and then you remembered something. You'd love to kill the process with ctrl-c, but that will raise an exception somewhere in the loop. What you want is for the iteration to complete and then you want the program to quit.

You could handle the `Interrupt` exception or add some conditions. But how about a cleaner and reusable way?

No problem - you can trap signals, which means we can trap the ctrl-c (which is an INT signal). Servers, like unicorn, use signals for graceful restarts.

How it works - you can use the [trap method](http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-trap) which accepts the name of the signal and a block to which replaces the system's default handler.

    #!ruby
    trap "INT" {
      # You can do your own stuff here
      #
      # Remember, the signal dies here - if you don't raise an exception or exit the process, nothing will happen
    }

Here's a simple example where I wrapped this pattern in a singleton class:

    #!ruby
    require "singleton"

    class GracefulQuit
      include Singleton

      attr_accessor :breaker

      def initialize
        self.breaker = false
      end

      def self.enable
        trap('INT') {
          yield if block_given?
          self.instance.breaker = true
        }
      end

      def self.check(message = "Quitting")
        if self.instance.breaker
          yield if block_given?
          puts message
          exit
        end
      end

    end

So now how to use it? First, enable it before the loop using `GracefulQuit.enable` and then somewhere within the loop call `GracefulQuit.check`. Like in this example:

    #!ruby
    GracefulQuit.enable
    some_collection.each do |item|
      heavy_duty_work_on item
      GracefulQuit.check
    end

And that's it - when you press ctrl-c, an exception will not be raised but the program will quit when you want it to. You can even add your own handler for this event.

    #!ruby
    GracefulQuit.enable
    some_collection.each do |item|
      heavy_duty_work_on item
      GracefulQuit.check do
        cleanup
      end
    end

Of course, this doesn't solve other problems, like picking up when you left off, but allows to have better control over console programs or Rake tasks.
