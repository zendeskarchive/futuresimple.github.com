require "rubygems"
require "bundler/setup"

require "nanoc"
require "nanoc/cli"

desc "Run a webserver watching for changes"
task :server do
  Nanoc::CLI.run ["autocompile"]
end

desc "Build source"
task :build do
  Nanoc::CLI.run ["compile"]
end

desc "Generate github json data"
task :github do
  require "octokit"
  require 'yajl'
  data = []
  Octokit.repositories("futuresimple").each do |repo|
    data.push({
      :name => repo.name,
      :description => repo.description,
      :language => repo.language,
      :forks => repo.forks,
      :watchers => repo.watchers,
      :url => repo.html_url,
      :updated_at => repo.updated_at
    })
  end
  json = Yajl::Encoder.encode(data)
  File.open('data/github.json', 'w') do |f| f.write(json) end
end

task :default => :build
