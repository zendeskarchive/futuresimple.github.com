    #!ruby
    class BaseLab < Blog::Awesome
      topics :technology, :coding
      authors :devs => 'Makers of Base CRM'
    end
    BaseLab.new.publish!
