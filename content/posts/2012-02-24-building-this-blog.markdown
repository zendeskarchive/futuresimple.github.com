---
kind: "article"
created_at: 2012-02-24 11:00:00
title: "Building this blog"
author: "Michał Bugno"
identifier: "building-this-blog"
---

Remember the classic "build a blog in 10 minutes" Rails tutorial? Back then, it blew our minds. Nowadays parts of
*the Web* are moving towards static content. Plain old <abbr title="Hyper-Text Markup Language">HTML</abbr> with
<abbr title="Cascading Style Sheets">CSS</abbr> suit the needs of many, many people. Being bulletproof, easy and almost free,
this combination has many advantages over complicated, backend-driven sites.

This blog is an example of such a static site, take a look how it was created. You can certainly set it up in 10 minutes
(the design doesn't count, right?).

EXCERPT

We came up with the idea of a blog couple of days ago. As programmers we were excited to code it ourselves, that's why we
didn't use an online blogging engine like [tumblr](http://www.tumblr.com/) or [wordpress.com](http://wordpress.com).
Instead we wanted to make it a static site with a JavaScript commenting system. We were browsing through Ruby--powered
generators as it is our favourite language. There were plenty of possibilities on
[ruby-toolbox.com](https://www.ruby-toolbox.com/categories/static_website_generation):

1. We already had some experience with [Jekyll](http://jekyllrb.com/), but it is too simple in our opinion. It suits GitHub
   pages well, but we wanted to have something more powerful.
2. I tried [Middleman](http://middlemanapp.com/) once, but it failed somewhere between encoding and
   template--loading.
3. [@marcinbunsch](https://twitter.com/marcinbunsch) had some experience with [Stasis](http://stasis.me/).
4. I was working with [nanoc](http://nanoc.stoneship.org/)

We gave nanoc a try. It was my call, I did a lot of stuff with it and felt it is quite flexible which was one of our
requirements.

From now on, there are some default steps every Ruby developer does when starting a new project: first `git init` the
repository, then do some `bundle`ing and finally don't forget to `rvm` all this. The latest Ruby `1.9.3-p125` was already
out when we started this so why not use it?

[Bootstrap project](http://twitter.github.com/bootstrap/) lays out the blog for us. It's amazing how these guys got it
all figured out. Just link the stylesheets in your site, assign a class to a list and boom - a fancy menu appears. Also
the naming convention forces you to stick to it, you don't have to come up with class names, just override the existing
ones and you're good to go.

Creating a blog itself was quite easy. Nanoc tries to keep it in two simple steps: first compile, then route. It means
that first it takes all the files, finds a compilation rule which matches every file and processes it. Then the file is
routed, which basically means it is assigned a path. Everything is configured within `Rules` file. This is how a simple
`Rules` file might look:

    #!ruby
    compile '*' do
      if item.binary?
        # don’t filter binary items
      else
        filter :haml
        layout 'default.html'
      end
    end

    route '*' do
      if item.binary?
        # Write item with identifier /foo/ to /foo.ext
        item.identifier.chop + '.' + item[:extension]
      else
        # write item with identifier /site/ to /site/index.html
        item.identifier + 'index.html'
      end
    end

We fought a little bit with files with the same name but different extensions. We like naming files with their original
extensions and then adding the extensions of preprocessor which is used to generate them, for example `index.html.haml`.
Nanoc treats skips all extensions by default, which generates errors for `index.html.haml` and `index.xml.haml`. We had
to tweak `config.yml` to skip only last extension: `allow_periods_in_identifiers: true`.

Paginating articles is described in [one of the official guides](http://nanoc.stoneship.org/docs/6-guides/#paginating-articles).

One disadvantage of static sites is that... they're static, so you cannot have comments on your blog. Or can you?
[Disqus](http://disqus.com/) provides a neat solution to this problem allowing you to have comments by using JavaScript.
They are actually a production-ready solution, already providing the functionality to multiple sites. Setting up a blog
requires two things: posting comments and displaying number of comments on index page under each entry. Simple JavaScript
code and HTML tweaking:

    #!html
    <a href="/your/article#disqus_thread"
       data-disqus-identifier="unique-disqus-identifier">Comments</a>

Important stuff: the `#disqus_thread` anchor at the end of `href` and `data-disqus-identifier` which you should provide
to uniquely identify your articles across the whole blog.

You can see all the work [on our github page](https://github.com/futuresimple/futuresimple.github.com). It's amazing how
easy it is to create such a blog. Everything you need is free out there, waiting for you to use it. Thank you, Open Source!
