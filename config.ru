require 'rubygems'
require 'bundler'

Bundler.require

require './app'

use Rack::Cache, verbose: false

# Sprockets config
map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'vendor/javascripts'
  environment.append_path File.join(File.dirname(Compass::Frameworks['bootstrap'].stylesheets_directory), 'javascripts')

  Sprockets::Helpers.configure do |config|
    config.environment = environment
    config.digest      = false
  end

  run environment
end

map '/' do
  run MyApp
end