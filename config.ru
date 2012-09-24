require 'rubygems'
require 'bundler'

Bundler.require

require './app'

# Sprockets config
map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  run environment
end

map '/' do
  run MyApp
end