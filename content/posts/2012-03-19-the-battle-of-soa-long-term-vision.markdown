---
kind: "article"
created_at: 2012-03-19 14:00:00
title: " The battle of SOA - Long term vision"
author: "Paweł Niżnik"
identifier: "the-battle-of-soa-long-term-vision"
---

Recently there is a lot of buzz on the Internet about SOA, actually one of the inspirations for that article was a note by Steve Yegge - Google Platforms Rant, which accidentally was made public - thanks Steve for keeping it this way! 

I try to keep up with it, but there is just too much stuff. Sometimes reading more about it makes you more confused then educated :). When this happens to me I try to step back a little bit to get a nice distant view. It's like with the Golden Gate Bridge. It looks beautiful from the right perspective, but once you start approaching it, the bridge loses its thing - don't get me wrong it's still exciting - but different :).

EXCERPT
 
The actual problem that we are all trying constantly to understand is whether SOA is the right approach? I think this question can't be asked without knowing what we want to use Service Oriented Architecture for. What's the context for that? Unfortunately I see arguments happening without asking that very question whatsoever.
 
I believe that if you want to build a very scalable business that will have a huge impact on the market, SOA is the way to go. In this post I'm going to focus mostly on the Long term vision.

## **Theory**
 
The fact is that all big systems tend to be highly distributed. Let's look at the web world: Amazon, Apple, Microsoft, Twitter… Why? It's much easier to get a grip on such systems both tech and organizational wise. The whole idea is to encapsulate business logic / functionality into smaller, reusable, more manageable parts, that are similar to each other. Parts that work in the same manner and obey certain rules from the ecosystem they are in.
 
I like to look at SOA from Super String Theory perspective :). Services for me are like small strings. They randomly vibrate - act differently and they interact with each other. Together they create something bigger that they are even not aware of. They can create different things too depending of the mixture of the right strings. It all feels really coherent.
 
By the way, we do exactly the same thing in our code. We encapsulate parts of the logic and put it in one place.
 
## **Development**
 
Let's focus on development for a while as this is the essential part. Once again, I want to stress the importance of the scale you business wants to achieve. I want to contcentrate on growing as big as it is possible.
 
In terms of development speed with SOA, you need to think long term. Short term it's an investment, though I believe that once you reach a certain point of how big your business is and how fast it grows then you will be able to develop stuff really really fast. Why?
 
First of all you are going to be able to build stuff on top of services that are already out there. You don't repeat yourself along the way. This will save you time in the long run. Obviously you need to design your services in a good way - but that's the point too. Imaging extracting authentication and authorization into separate services. Once you have it up & running you can easily hook up new services to it without a need of duplicating most of your code in different locations.
 
If you organize your development in the right way - teams own services. Then it's pretty easy to understand what everyone is doing and who is responsible for what. It's easy to identify people who know how to help you. It's much harder to do that with one code set, blaming is not the most efficient way. Often it will point you to a part of the code that was written by a number of people - each line a different person.
 
Every part of the system is very similar. You don't waste time figuring out how a certain thing works, or what's the best way to get data from this service, or even how to deploy. For instance if teams change ownership of services (which is a good practice), then they(we) already know the new environment.

## **Design**
 
SOA design is a tricky thing. There are certain rules of the architecture itself like: services should be isolated, they need to be designed for failure and they should not duplicate functionality. That’s a pretty easy set of rules. The tricky part, which I'm talking about, is how to design services from the business logic perspective - here there are no firm rules. You need to understand your data and the product you are building. If you get it wrong your road is gonna be really bumpy :). It will really affect development.
 
## **Prototyping**
 
You want to get something out and fast, validate your idea, pivot and so on. SOA doesn’t seem like the best choice for that. Actually Ruby on Rails is great for that. So let say you start off with good neat prototype built with Rails. The important question here is, if you want to go big, when is the right time to switch to SOA? And obviously there is no easy answer to that. Let's look at the Twitter example. After some time they needed to change the architecture to a more distributed one. Was that good timing? How many resources did they waste on that? Would they waste less if they had started thinking about SOA earlier? Could they start off with SOA?
 
There is also the Amazon lesson that we should look at. They did rewrite everything to SOA. They didn't have a clue that this would have such a huge impact. They created AWS out of it. "You wouldn't really think that an online bookstore needs to be an extensible, programmable platform. Would you?" (from Steve Yegge note) :).
 
I believe it's just a matter of the right tools and accessibility of knowledge. Imagine if there were good tools for SOA development with a prototyping twist? If communities would educate about SOA, so that SOA would be as easy to understand as web application development is?
 
I think good tools will soon pop out and people will share even more. That's the way to go!
 
## **Data & Interfaces**
 
I think the core of our products are the DATA - I can't stress enough (with capital letters) how important it is to think about the data all the time. Web applications are just interfaces (and they are addressed to users, not other programs) to access that data. I think many people confuse that.
 
From our 'development childhood' times we learn a craft of building Web Applications. There is one thing that I just can't get - how did that happen in the web world (even historically I would love to understand it) that in so many tools we coupled interfaces with backend processing and data. We ended up working on client side stuff in the backend - e.g. ruby generating html & javascript on the server side and then just sending it to the client.

For me it looks like this. We took client side technologies that are meant to build user interfaces, server side technologies, and data; mixed up all of those things in one code base and called it web application. Interfaces & Data coupled together.

SOA just makes you focus on data. That's it. If it could speak it would say that there is data, there are interfaces - for users and programs, and there is a communication happening constantly between them. Depending on whether the communication occurs in a browser, phone or program, different protocol for communication might be used. I love it, it's simple and it emphasizes the most important parts drawing a visible line in between them. Period.

## **Summary**

So what's the takeaway from all of that? Actually I love that there's a lot happening in the tech world around SOA. It means that people care in one sense or another. All in all it makes people think and come up with their own arguments. I think we should remember to think about the most important question, what's the context for SOA in my case.
 
As for me I truly believe that building a huge scalable business requires good organization and SOA is the organization system in the end, pretty well thought trough as it turns out.

I would love to hear you feedback about the Long term SOA in context building very big businesses. Short Term & Transition time article is coming up next. Stay Tuned!

* [Steve Yegge - Google Platforms Rant](https://plus.google.com/112678702228711889851/posts/eVeouesvaVX);


