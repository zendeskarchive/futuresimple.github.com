---
kind: "article"
created_at: 2012-03-16 11:00:00
title: "Is it time to fold on iOS4 and go all-in on iOS5?"
author: "Błażej Biesiada"
identifier: "ios4-vs-ios5"
---

Most iOS developers occasionally ask themselves whether it's time to ditch iOS(n-1) and only support the latest and greatest iOS(n). This seems to be a common dilemma since Apple releases on average one major version of its mobile operating system per year.

EXCERPT

### Why would you want to stop supporting old iOS versions anyway?

First of all - new language features: [_blocks_](https://developer.apple.com/library/ios/#documentation/cocoa/Conceptual/Blocks/Articles/00_Introduction.html) in iOS4 or [_Automatic Reference Counting_](http://clang.llvm.org/docs/AutomaticReferenceCounting.html) in iOS5 (ARC works under iOS4 but it's crippled there). Objective-C evolves rapidly, but sometimes a new runtime is required to utilize its the latest features.

Next up, new and updated APIs. Here are some cherry picks from iOS5:

* _iCloud_ - a huge thing, but do you have any apps on your phone that actually utilize it (except for Apple's apps)? Probably not, or not many, that's because it would be difficult (if not impossible in some cases) to support iOS4 and still build an app on top of the iCloud service.
* _Core Image_ - a great framework known from OS X, did you know that you can do [face recognition](http://maniacdev.com/2011/11/tutorial-easy-face-detection-with-core-image-in-ios-5/) with it? Great! Now do you want to enable it for iOS5 users only and make the iOS4 users suffer?
* then there are many improvements like a clean way to move a row in `UITableView` in iOS5 with `-moveRowAtIndexPath:toIndexPath:` (under iOS4 you would have to first remove and than add a row - more code and worse animation)
* also, there are seemingly small things that actually matter _a lot_, ex.: `-addChildViewController:` found in `UIViewController`. It enables [UIViewController containment](https://developer.apple.com/videos/wwdc/2011/?id=102) and finally cuts the need to [abuse iOS view controllers](http://blog.carbonfive.com/2011/03/09/abusing-uiviewcontrollers/). This is most useful on iPad, where the screen is big and it really makes sense to use multiple view controllers at once, but on the iPhone it also can be very handy. (Just look at the new Path/Facebook/Sparrow [slide navigation interfaces](https://github.com/edgecase/ECSlidingViewController))

Obviously the list could go on and on, but my conclusion is that using the new/improved stuff will save you time (both during development and later during maintenance) and make your apps better. On the other hand, supporting an old version of iOS and utilizing the new APIs at the same time is troublesome. Especially if you're trying to replicate the new API features under the old system version. I'm not saying you shouldn't do it, it's a noble thing to do, I do it (sometimes :), but maybe it's just high time to stop doing it for iOS4?

### What you should consider 

#### Your time

Do you want to slave yourself to death by maintaining multiple sets of code that let you use the newest and greatest features while not breaking your app for users on old devices? Such an approach produces more less maintainable and more bug prone code. 

#### Your app's statistics

You should always look at your user-base and check [how many iOS(n-1) users you have](http://code.google.com/apis/analytics/docs/mobile/ios.html). It might be different than the market average. There is no good answer to what percentage is low enough to ditch an old iOS version. The big issue here: App Store keeps only the newest version of your app. Once an iOS(n-1) user removes your app after you go iOS(n)-only than he will not be able to reinstall. (Even if it's a paid app!)

#### Global adoption rate

One of the great things about the iOS platform is that it has a very high adoption rate for new system versions, especially with Over The Air updates introduced in iOS5. Apple gives us about one new major iOS version per year. The infamous App Store review process can easily take up to two weeks, add to that another two weeks of delay in your development process (or more ;) and suddenly the statistics that you were trying to base your decision on are at least one month old! Well, like [Emmet "Doc" Brown](http://en.wikipedia.org/wiki/Emmett_Brown) used to say&hellip; "You've got to think in four dimensions!". I recently came across [a great article](http://pxldot.com/post/18754186750/ios-ebb-and-flow) that will help you to estimate what the adoption rate could be in a few weeks. 

#### How many people are you going to abandon?

At the end of the day, the way I look at it, is how many users will be left with nothing if my app will go iOS(n)-only. These would be the users who are unable to upgrade to iOS(n) because of hardware limitations, for iOS5 it doesn't seem to be a big number. Here's why:

* all iPads can run iOS5,
* iPhones above 3G can run it,
* and finally iPods above 2nd generation will handle it as well.

The system upgrade is free and painless, unless one have a jailbroken device, which nowadays is a popular tool of software piracy on iOS (thus developers shouldn't care much about jailbroken devices). From my point of view the only problem here is that dropping support for old devices that can't be upgraded to iOS5, might mean that they will end up in garbage (or hopefully rather at recycling centers). The key device here is iPhone 3G, which can't run iOS5 and runs iOS4 slowly, but it's almost 4 years old now and in the smartphone world it's a long time, so it's pretty much just dead anyway. Don't get me wrong, I really care about the natural environment and would love to see Apple supporting its devices longer (without compromising on new features of course ;).

### The final message

It's always a difficult decision whether it's time to drop support for old hardware/software, but I think it's high time to ditch iOS4! Lately, I wanted to install [Mint's](https://www.mint.com/) app on my iPad, and it turned out I had to update to iOS5 first, so I did. Gladly and finally! Also, it didn't hurt ;) These guys (Mint devs) pushed me into doing it and I'm really grateful for that - iCloud synchronization works great on iPad which I didn't use to sync much before! Fellow developers, let's push the ecosystem forward and focus on innovation over legacy code!
