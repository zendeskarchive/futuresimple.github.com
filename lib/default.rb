# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::HTMLEscape


require File.expand_path(File.join(File.dirname(__FILE__), "kramdown_with_coloring.rb"))