$(function(){
  var technologies = $('.welcome div');
  var index = Math.floor((Math.random() * technologies.length - 1 ));
  $(technologies.get(index)).removeClass('hidden');

  $('span.content')
     .filter(function() {
        var self = $(this);
        if(self.text().indexOf('Base CRM') != -1) {
          return self;
        }
     })
     .each(function(){
       var self = $(this);
       var html = self.html();
       html = html.replace('Base CRM', '<a href="http://futuresimple.com/base">Base CRM</a>');
       html = html.replace('QuoteBase', '<a href="http://futuresimple.com/quotes">QuoteBase</a>');
       self.html(html);
     });

})
