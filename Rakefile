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
      :url => repo.url,
      :updated_at => repo.updated_at
    })
  end
  json = Yajl::Encoder.encode(data)
  File.open('data/github.json', 'w') do |f| f.write(json) end
end

task :default => :build
