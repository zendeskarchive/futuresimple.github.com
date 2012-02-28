# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::HTMLEscape

require "yajl"

def article_content(content)
  content.gsub("<p>EXCERPT</p>", "")
end

def article_excerpt(content)
  content.split("<p>EXCERPT</p>")[0]
end

def date_display(value)
  attribute_to_time(value).strftime("%Y-%m-%d")
end
