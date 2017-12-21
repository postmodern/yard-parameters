require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:development, :doc)
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "yard-parameters"
  gem.license = 'MIT'
  gem.summary = %Q{A plugin for YARD for parsing parameters.}
  gem.description = %Q{yard-parameters is a plugin for YARD for parsing parameters.}
  gem.email = "postmodern.mod3@gmail.com"
  gem.homepage = "http://github.com/postmodern/yard-parameters"
  gem.authors = ["postmodern"]
  gem.add_dependency 'yard', '>= 0.4.0'
  gem.has_rdoc = 'yard'
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs += ['lib', 'spec']
  spec.spec_files = FileList['spec/**/*_spec.rb']
  spec.spec_opts = ['--options', '.specopts']
end

task :test => :spec
task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
