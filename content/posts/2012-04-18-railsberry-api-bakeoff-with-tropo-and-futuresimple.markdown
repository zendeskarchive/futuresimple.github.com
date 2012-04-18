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
those, we have prepared this to get you up and running ([gist
link](https://gist.github.com/2413019)):

    #!ruby
    # In order to connect with Tropo you need to provide your username and password - if you do not
    # want to store it in the code you can export it to the environment variables:

    # export TROPO_USERNAME=<tropo-username>
    # export TROPO_PASSWORD=<tropo-pass>


    # Script you will be running contains of two steps:

    # Firstly you can create a tropo application by using  Tropo Provisioning API.
    # github repo https://github.com/tropo/tropo-provisioning 
    # documentation - https://www.tropo.com/docs/rest/rest_tutorials.htm#prov_tutorials


    require 'tropo-provisioning'
    require 'rest-client'

    # Creates a session like object - once base_uri is not passed - it connects to "http://api.tropo.com/v1/" by default

    tp = TropoProvisioning.new(ENV['TROPO_USERNAME'], ENV['TROPO_PASSWORD'], :base_uri => "http://api.tropo.com/v1/")

    # => #<TropoProvisioning:0x007f87498e4d38 @tropo_client=#<TropoClient:0x007f8749acb020 @base_uri="http://api.tropo.com/v1/", @username="kiszal", @password="living.peryton62", @headers={"Content-Type"=>"application/json"}, @proxy=nil, @http=#<Net::HTTP api.tropo.com:80 open=false>>, @user_data=#<Hashie::Mash email="bart+tropo@futuresimple.com" firstName="Bart" href="http://api.tropo.com/v1/users/kiszal" id="138100" joinDate="2012-04-18T11:05:40.507+0000" lastName="Kiszala" marketingOptIn=true phoneNumber="1234567890" status="active" username="kiszal">>
    #creates a new application in Tropo


    app_id = tp.create_application({ :name => 'tropo-example-app',
                                  :voiceUrl     => 'http://dl.dropbox.com/u/7486597/coference.rb',
                                  :partition    => 'staging',
                                  :platform     => 'scripting' })

    # => #<Hashie::Mash application_id="345196" href="http://api.tropo.com/v1/applications/345196">


    # http://dl.dropbox.com/u/7486597/coference.rb - url address for a ruby script userd by the tropo application  - you
    # can host the file either in tropo cloud, or whatever other publicly available location - it has to be available
    # under HTTP (https is no good - sadly github does not work for storing the scripting file :( )
    # The simplest tropo app script can look sth like this (u can see it http://dl.dropbox.com/u/7486597/coference.rb ).
    # It creates a conference call.

    say "Welcome to the conference!"
    conference "1525"

    # Docs for Tropo Scripting API are available => https://www.tropo.com/docs/scripting/overview.htm

    # Now fetch the skype number assigned to the application.

    app_info = tp.addresses(app_id.application_id)

    # => [#<Hashie::Mash address="9996193488@sip.tropo.com" application="http://api.tropo.com/v1/applications/345196" href="http://api.tropo.com/v1/applications/345196/addresses/sip/9996193488@sip.tropo.com" type="sip">, #<Hashie::Mash application="http://api.tropo.com/v1/applications/345196" href="http://api.tropo.com/v1/applications/345196/addresses/skype/+990009369996193488" number="+990009369996193488" type="skype">]

    skype_number = app_info.select{|e| e.type == 'skype'}[0].number


    # Secondly once you have your application ready and you want to run it programmatically (ex to initiates the call) 
    # you have to retrieve API token for that application. The only way I managed to get one is by going to tropo application 
    # (in the web interface) and  generate voice outbound token (I could not find  API access for a token). 
    # Once you generate one you have to launch it - also in the web interface. 
    # It takes up to couple of minutes for token to propagate.

    # export TROPO_API_TOKEN=<tropo-api-token>

    # After your api token is set up - you are able to run an application assigned to a token:

    response = RestClient.get 'http://api.tropo.com/1.0/sessions', {
      :params => {
        :action => 'create',
        :token => ENV['TROPO_API_TOKEN']
      }
    }

    # Example conference caller application is here - http://blog.tropo.com/2012/02/24/ruby-on-rails-conference-caller/

Base
----

Base is a powerful CRM solution for small businesses that allows you to track
your sales as well as your contacts. Thousands of people use it everyday to
manage their businesses.

Base offers a JSON-based API, documentation to which can be found at
[dev.futuresimple.com](http://dev.futuresimple.com/) page, but it might be
easier to use a Ruby Gem to communicate with the API. You can find the gem [on
GitHub](https://github.com/pipejump/pipejump)

To get started with the API using the gem, check this out (also [available as a
gist](https://gist.github.com/2401158):

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
