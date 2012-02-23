require "rubygems"
require "bundler/setup"

require "nanoc"
require "nanoc/cli"

task :server do
  Nanoc::CLI.run ["autocompile"]
end

task :build do
  Nanoc::CLI.run ["compile"]
end
