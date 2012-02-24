def paginate_articles
  articles_to_paginate = sorted_articles
  article_groups = []
  until articles_to_paginate.empty?
    article_groups << articles_to_paginate.slice!(0..@config[:page_size]-1)
  end

  new_items = []
  article_groups.each_with_index do |subarticles, i|
    attrs = {
      :title => "Page #{i}",
      :articles => subarticles,
    }
    new_items << Nanoc::Item.new("Articles #{i}", attrs, "/page/#{i+1}/", {:binary => false})
  end

  new_items.each_with_index do |item, i|
    item[:next] = new_items[i + 1]
    item[:prev] = i == 0 ? nil : new_items[i - 1]
  end

  new_items.each do |item|
    @items << item
  end

  root = @items.find { |e| e.identifier =~ /index.html/ }
  root[:articles] = article_groups[0]
  root[:next] = new_items[1]
end
