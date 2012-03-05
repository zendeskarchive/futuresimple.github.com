---
kind: "article"
created_at: 2012-03-04 17:00:00
title: "CSRF Attack using JavaScript"
author: "Bart Kiszala"
identifier: "csrf-attack-using-javascript"
---

Most of you are aware of the [CSRF attack](http://pl.wikipedia.org/wiki/Cross-site_request_forgery). I use JS on a daily basis but I actually never thought that the code I develop could be CSRF-prone.

You saw that coming -  I was wrong and I want to share that harsh lesson.

Let's assume you're developing a web app called omg-app.com (obviously because it's so good it will make everyone say OMG!). The app is getting bigger, lots of people use it, new features are being added on a weekly basis. At some point you conclude it would be nice to inform users about some recently added features.

EXCERPT

How do you do that? The most common solution would be to display a banner for users who logged in describing the newly released stuff.

Banner can be saying sth like:

    Hello bart@futuresimple.com! Great news - new file upload has just been released!

However, the code that will embed the banner is coming from a separate application - the banner app. A great, asynchronous way is to make the omg-app embed a javascript file, so that the banner app can inject the banner into the page.

It's simple and designed for failure. If it doesn't load, nothing bad happens and it is easy to embed in other future applications.

The embed will look like this:

    #!html
    <script type="text/javascript" src="/banner.js"></script>

Now, the banner app will respond to /banner.js with rendering of javascript code prepopulated with appropriate content, like this:

    #!javascript
    // This is how banner.js.erb looks like inside
    $('body').append("<div class='banner'/>");
    $('.banner').html('Hello <%= current_user.email %>! Great news - new file upload has just been released!');" }

Now if a user is logged in and she hasn't seen the new upload yet - the following script will be loaded to the page:
(I assume jQuery is available)

    #!javascript
    $('body').append("<div class='banner'/>");
    $('.banner').html('Hello bart@futuresimple.com! Great news - new file upload has just been released!');

Great! Problem solved, time to play some office ping-pong… Not so fast dude.

As it happens omg-app.com is super popular and many people are logged in at all times. Authentication information for omg-app is
being kept in browsers' cookie. What is the problem?

Lets assume that my good pal Mike is logged in. At the same time he clicked on a link which leads to the site with funny cats
(what a lovely site it is …) in other tab of his browser.  Not only is the kitten site unbearably cute, it is also a malicious site which
loads exactly the same script as omg-app.com:

    #!html
    <script type="text/javascript" src="http://omg-app.com/banner.js"></script>

Since Mike is logged in to omg-app and the authentication cookie is present - the kitten site gets the same response - meaning:

    "Hello bart@futuresimple.com - new file upload was just released".

Now all the attacker needs to do is read the content of the div with the class "banner". Boom - email stolen.

How can it be fixed then?

My first idea was to verify if a script was loaded from omg-app.com domain on the server-side:

    #!ruby
    def banner
       return "" unless request.referrer.match( /^http:\/\/omg-app.com/)
       ...
    end

That solution isn't really good for the following reasons:

 * in Rails specifically you can't always get the request referrer of the page where script was loaded. This applies to requests coming from the script tag.

 * if the user has a plugin which blocks the referrer from being sent, your app will never get the referrer url

How about adding a check to the code returned by the banner app to verify the location and only then embedding the html.

Seems like a great idea ... Now the code responsible for the banner would look something like this:

    #!javascript
    $(function(){
     var regex = /\.omg-app\.com$/
      if (regex.test(window.location.host)) {
        $('body').append("<div class='banner'/>");
        $('.banner').html('Hello  bart@futuresimple.com!  Great news - new file upload has just been released!');
      }
    });

We wrap the code in a function to make the regex a private variable.

Bad news - this is not safe at all.

Even if the malicious site would include the whole code above, RegExp.prototype.test method can be easily overwitten (welcome to JS world...) to always return true.

    #!javascript
    RegExp.prototype.test = function() { return true }

With this tiny bit of code, the condition will be always true and we're back to the initial problem.

Ok - so now I can pull out the big guns and include the banner information in iframe on each page. This starts to be really complicated and I'm not a big fan of iframes.

The solution I decided to go for is to load the banner after getting its content via an AJAX request.

My Rails action looks sth like:

    #!ruby
    class BannerController < ApplicationController
      def show
        respond_to do |format|
          if current_user.saw_new_upload?
            format.json {
              render :json => {:message => "Hello #{current_user.email} - new file upload was just released"  } }
          else
            format.json { render :json => {} }
          end
          end
      end
    end

Now in omg-app, I simply implement a client to pick up this information.

    #!javascript
    (function() {
      var methods = {
        display_html: function(message) {
          $('body').append($("<div class='banner'/>"));
          $('.banner').append(message);
        }
      }
      $.get('/banner.json', function(data) {
        display_html(data.message)
      })
    }());


Why is this solution safe? (is it?!)
Because of [same origin policy](http://en.wikipedia.org/wiki/Same_origin_policy). In nutshell - only scripts (e.x. ajax requests) originating from the same site (omg-app.com) can access banner action in your web app.

That means that browser blocks any ajax requests originated on kitty site to access your application hence CSRF attack described earlier is not a problem any more.

So far so good. There surely are some pitfalls (e.g. subdomains) of this approach, but that's the best one I came up with so far.
If you have any suggestions, share them in the comments!
