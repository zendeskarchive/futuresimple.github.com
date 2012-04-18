---
kind: "article"
created_at: 2012-04-18 11:00:00
title: "RailsBerry API Bakeoff with Tropo and Future Simple"
author: "Antek Piechnik and Bart Kiszala"
identifier: "railsberry-api-bakeoff-wuth-tropo-and-futuresimple"
---

With the [RailsBerry](http://www.railsberry.com) conference right around the
corner, we teamed up with [Tropo](http://www.tropo.com) and the people behind
the event to organize an API Bakeoff. The event was [announced on
Monday](http://blog.railsberry.com/index.php/2012/04/15/railsberry-hackathon/)
and almost immediately after the ticket sale started, all the spots were taken.

EXCERPT

So once everyone gets here, we will announce the topics but we would like you
to know what we want to focus on during the hackathon. We want to focus on
building cool stuff using the Tropo and Futuresimple's Base APIs. Here is some
info to get you started: 

Tropo
-----

Tropo is a powerful yet simple API that adds Voice, SMS, Twitter, and IM
support to the programming languages we know. With tropo you can call people,
transcript voice, send IMs as well as text messages.

You can get to know their documentation along with some instructions on their
[Documentation Page](https://www.tropo.com/docs/), and once you skim through
those, we have prepared this to get you up and running:

    #!ruby
    require 'rubygems'
    require 'tropo-provisioning'
    require 'rest-client'

    tp = TropoProvisioning.new(ENV['TROPO_USERNAME'], ENV['TROPO_PASSWORD'])

    app_id = tp.create_application({ :name => 'final-attempt',
                                  :voiceUrl     => 'http://pastebin.com/raw.php?i=dLCjebGy',
                                  :partition    => 'staging',
                                  :platform     => 'scripting' })

    tp.addresses(app_id.application_id)

    response = RestClient.get 'http://api.tropo.com/1.0/sessions', {
      :params => {
        :action => 'create',
        :token => '10ba9462ca280641bdd4be1a84b4a5462145b0ad837efe78143c7f363b8b5a679cde5ee91a3a36763c331b1b',
      }
    }


Base
----

Base is a powerful CRM solution for small businesses that allows you to track
your sales as well as your contacts. Thousands of people use it everyday to
manage their businesses.

Base offers a JSON-based API, documentation to which can be found at
[dev.futuresimple.com](http://dev.futuresimple.com/) page, but it might be
easier to use a Ruby Gem to communicate with the API. You can find the gem [on
GitHub](https://github.com/pipejump/pipejump)

To get started with the API using the gem, check this out:

    #!ruby
    # gem install pipejump
    require 'rubygems'
    require 'pipejump'

    fs = Pipejump::Session.new(:email => "your.email@example.com", :password => "your.pass")
    # ... if you have authentication token already
    # fs = Pipejump::Session.new(:token => "token")

    # show your account info
    account = fs.account

    # first 40 contacts
    contacts = fs.contacts.all(:per_page => 40, :page => 1)

    # create a contact
    contact = fs.contacts.create(:name => "Foo Barsky")

    # add a note to this contact
    note = contact.notes.create(:content => "My first note")

    # show all won deals
    won_deals = fs.deals.all(:stage => "won")

    # create a won deal with specifict contact_id set
    deal = fs.deals.create(:name => "I'm rich!", :scope => 120000, :stage => "won", :client_id => contact.id)


So what now ?
-------------

Once you're set, you can check out one of the topics suggested by us during the
event or let your imagination and creativity lead you and come up with either
some app that integrates Tropo with Base or any of them on their own. Have fun!
